{include file="frontend/components/header.tpl" isFullWidth=true}

<main class="main_page min-h-screen">
    {* Hero Section dengan Pencarian *}
    <section class="hero-gradient pt-40 pb-32 text-white relative overflow-hidden">
        <div class="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-10"></div>
        <div class="max-w-4xl mx-auto px-6 text-center relative z-10 animate-fade-in">
            <h2 class="text-6xl font-black mb-6 tracking-tighter drop-shadow-2xl">E-Jurnal IAIN Parepare</h2>
            <p class="text-xl text-sky-100 mb-10 font-medium leading-relaxed opacity-90">
                Portal resmi publikasi ilmiah hasil riset dosen dan mahasiswa Institut Agama Islam Negeri Parepare.
            </p>
            
            {* Search Bar Modern *}
            <form class="relative group max-w-2xl mx-auto" action="{url page="search"}" method="post">
                <input type="text" name="query" 
                       placeholder="Cari artikel, penulis, atau kata kunci..." 
                       class="w-full pl-14 pr-32 py-6 rounded-3xl bg-white text-slate-900 shadow-2xl focus:ring-8 focus:ring-sky-400/20 outline-none transition-all text-lg font-medium placeholder:text-slate-400">
                <div class="absolute left-6 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within:text-sky-600 transition-colors">
                    <i data-lucide="search" class="w-7 h-7"></i>
                </div>
                <button type="submit" class="absolute right-3 top-1/2 -translate-y-1/2 bg-sky-600 text-white px-10 py-4 rounded-2xl font-black uppercase tracking-widest hover:bg-sky-700 transition-all shadow-lg active:scale-95">
                    Cari
                </button>
            </form>
        </div>
    </section>

    {* Stats Cards - Floating Effect *}
    <div class="stats-container max-w-7xl mx-auto px-6 grid grid-cols-2 lg:grid-cols-4 gap-6 animate-fade-in" style="animation-delay: 0.2s">
        {foreach from=[
            ['count' => '43', 'label' => 'JURNAL AKTIF', 'icon' => 'book-open'],
            ['count' => 'S2', 'label' => 'AKREDITASI TERTINGGI', 'icon' => 'award'],
            ['count' => '100%', 'label' => 'OPEN ACCESS', 'icon' => 'unlock'],
            ['count' => 'OJS 3', 'label' => 'SISTEM TERUPDATE', 'icon' => 'zap']
        ] item=stat}
        <div class="bg-white p-8 rounded-[2.5rem] shadow-2xl shadow-sky-900/10 border border-white flex flex-col items-center group hover:-translate-y-3 transition-all duration-500">
            <div class="w-14 h-14 bg-sky-50 rounded-2xl text-sky-600 mb-4 flex items-center justify-center group-hover:bg-sky-600 group-hover:text-white transition-all duration-500 shadow-inner">
                <i data-lucide="{$stat.icon}" class="w-7 h-7"></i>
            </div>
            <div class="text-3xl font-black text-slate-900 tracking-tighter">{$stat.count}</div>
            <div class="text-[10px] font-bold text-slate-400 tracking-[0.2em] mt-1 uppercase">{$stat.label}</div>
        </div>
        {/foreach}
    </div>

    {* Section Artikel Terbaru & Ranking Penulis *}
    <section class="py-24 bg-slate-50 relative z-20 animate-fade-in" style="animation-delay: 0.4s">
        <div class="max-w-7xl mx-auto px-6 grid grid-cols-1 lg:grid-cols-3 gap-16">
            
            {* Kolom Artikel Terbaru (2/3) *}
            <div class="lg:col-span-2">
                <div class="flex items-center gap-4 mb-10">
                    <div class="bg-sky-600 text-white p-3 rounded-2xl shadow-lg shadow-sky-200">
                        <i data-lucide="sparkles" class="w-6 h-6"></i>
                    </div>
                    <div>
                        <h3 class="text-3xl font-black text-slate-900 tracking-tight">Artikel Terbaru</h3>
                        <p class="text-slate-500 text-sm font-medium">Temukan 5 riset terkini di portal kami.</p>
                    </div>
                </div>

                <div class="space-y-4">
                    {foreach from=$recentArticles item=article}
                    <div class="bg-white p-6 rounded-3xl border border-slate-100 shadow-sm hover:shadow-xl transition-all group relative z-30 flex items-center gap-6">
                        <div class="hidden sm:flex w-14 h-14 bg-slate-50 rounded-2xl items-center justify-center flex-shrink-0 group-hover:bg-sky-50 transition-colors text-slate-300 group-hover:text-sky-600">
                            <i data-lucide="file-text" class="w-6 h-6"></i>
                        </div>
                        <div class="flex-grow">
                            <div class="inline-block bg-sky-50 text-sky-700 text-[9px] font-black px-3 py-1 rounded-full mb-2 uppercase tracking-wider">
                                {$article.journalName|truncate:50}
                            </div>
                            <h4 class="text-base font-bold text-slate-900 mb-2 line-clamp-1 leading-snug group-hover:text-sky-600 transition-colors">
                                <a href="{url journal=$article.journalPath page="article" op="view" path=$article.id}" class="after:absolute after:inset-0 z-40">
                                    {$article.title|escape}
                                </a>
                            </h4>
                            <div class="flex items-center gap-4 text-slate-400 text-[10px] font-bold">
                                <div class="flex items-center gap-1.5">
                                    <i data-lucide="users" class="w-3 h-3"></i>
                                    <span class="truncate max-w-[200px]">{$article.author|escape}</span>
                                </div>
                                <div class="flex items-center gap-1.5">
                                    <i data-lucide="calendar" class="w-3 h-3"></i>
                                    <span>{$article.date}</span>
                                </div>
                            </div>
                        </div>
                        <div class="text-slate-200 group-hover:text-sky-400 transition-all transform group-hover:translate-x-1">
                            <i data-lucide="chevron-right" class="w-6 h-6"></i>
                        </div>
                    </div>
                    {/foreach}
                </div>
            </div>

            {* Kolom Ranking Penulis (1/3) - Height Matched *}
            <div class="lg:col-span-1 flex flex-col">
                <div class="flex items-center gap-4 mb-10">
                    <div class="bg-amber-500 text-white p-3 rounded-2xl shadow-lg shadow-amber-100">
                        <i data-lucide="trophy" class="w-6 h-6"></i>
                    </div>
                    <div>
                        <h3 class="text-3xl font-black text-slate-900 tracking-tight">Top Author</h3>
                        <p class="text-slate-500 text-sm font-medium">5 Penulis terproduktif.</p>
                    </div>
                </div>

                <div class="bg-white rounded-[2.5rem] border border-slate-100 shadow-2xl shadow-slate-200/50 overflow-hidden relative z-30 flex-grow flex flex-col">
                    <div class="divide-y divide-slate-50 flex-grow flex flex-col">
                        {foreach from=$topAuthors item=author name=ranking}
                        <a href="{url page="search" query=$author->name}" class="flex items-center gap-4 px-6 py-6 hover:bg-slate-50 transition-colors group relative z-40 flex-grow">
                            <div class="w-12 h-12 rounded-2xl flex items-center justify-center text-sm font-black 
                                {if $smarty.foreach.ranking.iteration == 1}bg-amber-100 text-amber-600 shadow-inner
                                {elseif $smarty.foreach.ranking.iteration == 2}bg-slate-100 text-slate-600
                                {elseif $smarty.foreach.ranking.iteration == 3}bg-orange-50 text-orange-600
                                {else}bg-slate-50 text-slate-400{/if}">
                                {$smarty.foreach.ranking.iteration}
                            </div>
                            <div class="flex-grow">
                                <div class="text-sm font-bold text-slate-900 group-hover:text-sky-600 transition-colors">{$author->name|escape}</div>
                                <div class="text-[10px] font-black text-slate-400 uppercase tracking-widest mt-1">{$author->count} Publikasi</div>
                            </div>
                            <div class="text-slate-200 group-hover:text-sky-400 transition-all transform group-hover:translate-x-1">
                                <i data-lucide="chevron-right" class="w-5 h-5"></i>
                            </div>
                        </a>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    </section>

    {* Daftar Jurnal Section *}
    <section id="journals-list" class="py-24 bg-white relative z-20 animate-fade-in" style="animation-delay: 0.6s">
        <div class="max-w-7xl mx-auto px-6">
            <div class="flex flex-col md:flex-row md:items-end justify-between mb-16 border-l-8 border-sky-600 pl-8">
                <div>
                    <h3 class="text-5xl font-black text-slate-900 tracking-tighter">Koleksi Jurnal</h3>
                    <p class="text-slate-500 mt-3 text-lg font-medium">Jelajahi disiplin ilmu melalui publikasi kami.</p>
                </div>
                <div class="hidden md:block">
                    <a href="{url page="index" router=$smarty.const.ROUTE_PAGE}" class="bg-slate-50 text-sky-600 px-8 py-4 rounded-2xl font-black text-sm uppercase tracking-widest hover:bg-sky-50 transition-all flex items-center gap-3">
                        Lihat Semua Jurnal <i data-lucide="arrow-right" class="w-5 h-5"></i>
                    </a>
                </div>
            </div>

            {* A-Z Filter Bar *}
            <div class="mb-16 flex flex-wrap gap-3 justify-center bg-slate-50 p-6 rounded-[2rem] border border-slate-200/50 shadow-inner">
                <button onclick="filterJournals('ALL')" class="az-filter-btn active px-6 py-3 rounded-xl text-xs font-black uppercase tracking-widest transition-all bg-sky-600 text-white shadow-xl shadow-sky-200" data-letter="ALL">ALL</button>
                {foreach from="ABCDEFGHIJKLMNOPQRSTUVWXYZ"|str_split item=letter}
                    <button onclick="filterJournals('{$letter}')" class="az-filter-btn px-4 py-3 rounded-xl text-xs font-bold text-slate-500 hover:bg-white hover:text-sky-600 hover:shadow-lg transition-all border border-transparent hover:border-slate-200" data-letter="{$letter}">{$letter}</button>
                {/foreach}
            </div>

            {* Grid Jurnal *}
            <div id="journal-grid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-12">
                {foreach from=$journals item=journal}
                {assign var="displayTitle" value=$journal->getLocalizedName()}
                <div class="journal-card bg-white rounded-[3rem] border border-slate-100 shadow-sm hover:shadow-2xl transition-all duration-700 overflow-hidden flex flex-col group relative z-30" 
                     data-title="{$displayTitle|escape|upper}">
                    
                    {* Thumbnail Area *}
                    <div class="h-72 relative overflow-hidden bg-slate-100">
                        {if $journal->getLocalizedData('journalThumbnail')}
                            {assign var="thumbnail" value=$journal->getLocalizedData('journalThumbnail')}
                            <img src="{$journalFilesPath}{$journal->getId()}/{$thumbnail.uploadName|escape:"url"}" 
                                 class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-1000" 
                                 alt="{$displayTitle|escape}">
                        {else}
                            <div class="w-full h-full flex items-center justify-center bg-gradient-to-br from-slate-100 to-slate-200">
                                <i data-lucide="image" class="w-16 h-16 text-slate-300"></i>
                            </div>
                        {/if}
                        
                        <div class="absolute inset-0 bg-gradient-to-t from-slate-900/60 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>
                        
                        <div class="absolute top-6 left-6">
                            <span class="bg-white/95 backdrop-blur px-5 py-2 rounded-full text-[10px] font-black text-sky-700 shadow-xl uppercase tracking-[0.2em] border border-white">
                                ID: {$journal->getId()}
                            </span>
                        </div>
                    </div>

                    {* Info Area *}
                    <div class="p-10 flex-grow flex flex-col">
                        <h4 class="text-2xl font-black text-slate-900 mb-4 line-clamp-2 leading-tight group-hover:text-sky-600 transition-colors">
                            {$displayTitle|escape}
                        </h4>
                        <div class="text-slate-500 text-sm mb-10 line-clamp-3 leading-relaxed font-medium">
                            {$journal->getLocalizedDescription()|strip_tags|truncate:150}
                        </div>
                        
                        <div class="mt-auto space-y-4">
                            <a href="{url journal=$journal->getPath()}" 
                               class="w-full block bg-sky-600 text-white text-center py-4 rounded-2xl font-black uppercase tracking-widest text-xs flex items-center justify-center gap-3 hover:bg-sky-700 shadow-xl shadow-sky-100 transition-all active:scale-[0.98] relative z-40">
                                Beranda Jurnal <i data-lucide="arrow-right" class="w-5 h-5"></i>
                            </a>
                            <a href="{url journal=$journal->getPath() page="issue" op="current"}" 
                               class="w-full block bg-slate-50 text-slate-600 text-center py-4 rounded-2xl font-black uppercase tracking-widest text-xs hover:bg-slate-100 transition-all border border-slate-100 relative z-40">
                                Terbitan Terbaru
                            </a>
                        </div>
                    </div>
                </div>
                {/foreach}
            </div>

            {* Empty State *}
            <div id="no-results" class="hidden py-32 text-center">
                <div class="bg-slate-50 w-24 h-24 rounded-[2rem] flex items-center justify-center mx-auto mb-8 shadow-inner">
                    <i data-lucide="search-x" class="w-12 h-12 text-slate-300"></i>
                </div>
                <h5 class="text-2xl font-black text-slate-900">Jurnal tidak ditemukan</h5>
                <p class="text-slate-500 mt-3 text-lg">Maaf, tidak ada jurnal yang dimulai dengan huruf tersebut.</p>
                <button onclick="filterJournals('ALL')" class="mt-8 text-sky-600 font-black uppercase tracking-widest text-sm hover:underline">Tampilkan semua jurnal</button>
            </div>
        </div>
    </section>
</main>

<script>
function filterJournals(letter) {
    const cards = document.querySelectorAll('.journal-card');
    const buttons = document.querySelectorAll('.az-filter-btn');
    const noResults = document.getElementById('no-results');
    const grid = document.getElementById('journal-grid');
    let found = 0;

    buttons.forEach(btn => {
        if (btn.getAttribute('data-letter') === letter) {
            btn.classList.add('bg-sky-600', 'text-white', 'shadow-xl', 'shadow-sky-200');
            btn.classList.remove('text-slate-500', 'hover:bg-white');
        } else {
            btn.classList.remove('bg-sky-600', 'text-white', 'shadow-xl', 'shadow-sky-200');
            btn.classList.add('text-slate-500', 'hover:bg-white');
        }
    });

    cards.forEach(card => {
        const title = card.getAttribute('data-title').trim();
        if (letter === 'ALL' || title.startsWith(letter)) {
            card.style.display = 'flex';
            found++;
        } else {
            card.style.display = 'none';
        }
    });

    if (found === 0) {
        grid.classList.add('hidden');
        noResults.classList.remove('hidden');
    } else {
        grid.classList.remove('hidden');
        noResults.classList.add('hidden');
    }

    document.getElementById('journals-list').scrollIntoView({ behavior: 'smooth' });
}

document.addEventListener('DOMContentLoaded', () => {
    if (typeof lucide !== 'undefined') lucide.createIcons();
});
</script>

{include file="frontend/components/footer.tpl"}