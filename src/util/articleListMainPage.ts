import { Dump } from '../Dump';
import { encodeArticleIdForZimHtmlUrl, shouldConvertImageFilenameToWebp } from '../util';

export function makeArticleListItem(dump: Dump, articleEntry: any) {
    return `<li><a href="${encodeArticleIdForZimHtmlUrl('./' + articleEntry.title.replace(/ /g, '_'))}">${articleEntry.title.replace(/_/g, ' ')}<a></li>\n`;
}

export function makeArticleImageTile(dump: Dump, articleEntry: ArticleDetail, webp: boolean) {
    return `<a class="item" href="${'./' + encodeArticleIdForZimHtmlUrl(articleEntry.title.replace(/ /g, '_') || '')}">
            <figure><img loading="lazy" src="${articleEntry.internalThumbnailUrl +
            (shouldConvertImageFilenameToWebp(articleEntry.internalThumbnailUrl, webp) ? '.webp' : '')}" />
            <figcaption>${(articleEntry.title || '').replace(/_/g, ' ')}</figcaption></figure></a>\n`;
}
