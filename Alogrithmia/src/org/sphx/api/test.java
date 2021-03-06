/*
* $Id: test.java 2055 2009-11-06 23:09:58Z shodan $
*/

package org.sphx.api;

import java.util.Date;

import org.sphx.api.SphinxClient;
import org.sphx.api.SphinxException;
import org.sphx.api.SphinxMatch;
import org.sphx.api.SphinxResult;
import org.sphx.api.SphinxWordInfo;

/**
* Test class for sphinx API
*/
public class test
{
    public static void main ( String[] argv ) throws SphinxException
    {


        StringBuffer q = new StringBuffer();
        String host = "192.168.0.110";
        int port = 9312;
        int mode = SphinxClient.SPH_MATCH_ALL;
        String index = "*";
        int offset = 0;
        int limit = 20;
        int sortMode = SphinxClient.SPH_SORT_RELEVANCE;
        String sortClause = "";
        String groupBy = "";
        String groupSort = "";

        SphinxClient cl = new SphinxClient();
    
        q.append("发");
        cl.SetServer ( host, port );
        cl.SetWeights ( new int[] { 100, 1 } );
        cl.SetMatchMode ( mode );
        cl.SetLimits ( offset, limit );
        cl.SetSortMode ( sortMode, sortClause );
        if ( groupBy.length()>0 )
            cl.SetGroupBy ( groupBy, SphinxClient.SPH_GROUPBY_ATTR, groupSort );

        SphinxResult res = cl.Query(q.toString(), index);
        if ( res==null )
        {
            System.err.println ( "Error: " + cl.GetLastError() );
            System.exit ( 1 );
        }
        if ( cl.GetLastWarning()!=null && cl.GetLastWarning().length()>0 )
            System.out.println ( "WARNING: " + cl.GetLastWarning() + "\n" );

        /* print me out */
        System.out.println ( "Query '" + q + "' retrieved " + res.total + " of " + res.totalFound + " matches in " + res.time + " sec." );
        System.out.println ( "Query stats:" );
        for ( int i=0; i<res.words.length; i++ )
        {
            SphinxWordInfo wordInfo = res.words[i];
            System.out.println ( "\t'" + wordInfo.word + "' found " + wordInfo.hits + " times in " + wordInfo.docs + " documents" );
        }

        System.out.println ( "\nMatches:" );
        for ( int i=0; i<res.matches.length; i++ )
        {
            SphinxMatch info = res.matches[i];
            System.out.print ( (i+1) + ". id=" + info.docId + ", weight=" + info.weight );

            if ( res.attrNames==null || res.attrTypes==null )
                continue;

            for ( int a=0; a<res.attrNames.length; a++ )
            {
                System.out.print ( ", " + res.attrNames[a] + "=" );

                if ( ( res.attrTypes[a] & SphinxClient.SPH_ATTR_MULTI )!=0 )
                {
                    System.out.print ( "(" );
                    long[] attrM = (long[]) info.attrValues.get(a);
                    if ( attrM!=null )
                        for ( int j=0; j<attrM.length; j++ )
                    {
                        if ( j!=0 )
                            System.out.print ( "," );
                        System.out.print ( attrM[j] );
                    }
                    System.out.print ( ")" );

                } else
                {
                    switch ( res.attrTypes[a] )
                    {
                        case SphinxClient.SPH_ATTR_INTEGER:
                        case SphinxClient.SPH_ATTR_ORDINAL:
                        case SphinxClient.SPH_ATTR_FLOAT:
                        case SphinxClient.SPH_ATTR_BIGINT:
                            /* longs or floats; print as is */
                            System.out.print ( info.attrValues.get(a) );
                            break;

                        case SphinxClient.SPH_ATTR_TIMESTAMP:
                            Long iStamp = (Long) info.attrValues.get(a);
                            Date date = new Date ( iStamp.longValue()*1000 );
                            System.out.print ( date.toString() );
                            break;

                        default:
                            System.out.print ( "(unknown-attr-type=" + res.attrTypes[a] + ")" );
                    }
                }
            }

            System.out.println();
        }
    }
}

/*
* $Id: test.java 2055 2009-11-06 23:09:58Z shodan $
*/