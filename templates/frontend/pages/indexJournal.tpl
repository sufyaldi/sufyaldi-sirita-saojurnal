{include file="frontend/components/header.tpl" isFullWidth=true}

<main class="main_page min-h-screen">
    {* Hero Section dengan Pencarian *}
    <section class="hero-gradient pt-40 pb-24 text-white relative overflow-hidden">
        <div class="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-10"></div>
        <div class="max-w-4xl mx-auto px-6 text-center relative z-10">
            <h2 class="text-5xl font-black mb-6 tracking-tighter drop-shadow-lg">E-Jurnal IAIN Parepare</h2>
            <p class="text-xl text-sky-100 mb-10 font-medium leading-relaxed">
                Portal resmi publikasi ilmiah hasil riset dosen dan mahasiswa Institut Agama Islam Negeri Parepare.
            </p>
            
            {* Search Bar Modern *}
            <form class="relative group max-w-2xl mx-auto" action="{url page="search"}" method="post">
                <input type="text" name="query" 
                       placeholder="Cari artikel, penulis, atau kata kunci..." 
                       class="w-full pl-14 pr-32 py-5 rounded-2xl bg-white text-slate-900 shadow-2xl focus:ring-4 focus:ring-sky-400/50 outline-none transition-all text-lg font-medium placeholder:text-slate-400">
                <div class="absolute left-5 top-1/2 -translate-y-1/2 text-slate-400 group-focus-within:text-sky-600 transition-colors">
                    <i data-lucide="search" class="w-6 h-6"></i>
                </div>
                <button type="submit" class="absolute right-3 top-1/2 -translate-y-1/2 bg-sky-600 text-white px-8 py-3 rounded-xl font-bold hover:bg-sky-700 transition-all shadow-lg active:scale-95">
                    Cari
                </button>
            </form>
        </div>
        
        {* Stats Cards *}
        <div class="max-w-7xl mx-auto px-6 mt-16 grid grid-cols-2 lg:grid-cols-4 gap-6 relative z-10">
            {foreach from=[
                ['count' => '43', 'label' => 'JURNAL AKTIF', 'icon' => 'book-open'],
                ['count' => 'S2', 'label' => 'AKREDITASI TERTINGGI', 'icon' => 'award'],
                ['count' => '100%', 'label' => 'OPEN ACCESS', 'icon' => 'unlock'],
                ['count' => 'OJS 3', 'label' => 'SISTEM TERUPDATE', 'icon' => 'zap']
            ] item=stat}
            <div class="bg-white/95 backdrop-blur-md p-8 rounded-3xl shadow-xl border border-white/20 text-center hover:-translate-y-2 transition-all duration-300 group">
                <div class="text-sky-600 mb-3 flex justify-center group-hover:scale-110 transition-transform">
                    <i data-lucide="{$stat.icon}" class="w-8 h-8"></i>
                </div>
                <div class="text-3xl font-black text-slate-900">{$stat.count}</div>
                <div class="text-[10px] font-bold text-slate-400 tracking-widest mt-1">{$stat.label}</div>
            </div>
            {/foreach}
        </div>
    </section>

    {* Daftar Jurnal Section *}
    <section id="journals-list" class="py-24 bg-white">
        <div class="max-w-7xl mx-auto px-6">
            <div class="flex flex-col md:flex-row md:items-end justify-between mb-12 border-l-4 border-sky-600 pl-6">
                <div>
                    <h3 class="text-4xl font-black text-slate-900 tracking-tight">Koleksi Jurnal</h3>
                    <p class="text-slate-500 mt-2 font-medium">Jelajahi berbagai disiplin ilmu melalui publikasi kami.</p>
                </div>
                <div class="hidden md:block">
                    <a href="{url page="index" router=$smarty.const.ROUTE_PAGE}" class="text-sky-600 font-bold flex items-center gap-2 hover:underline">
                        Lihat Semua Jurnal <i data-lucide="chevron-right" class="w-4 h-4"></i>
                    </a>
                </div>
            </div>

            {* A-Z Filter Bar *}
            <div class="mb-10 flex flex-wrap gap-2 justify-center bg-slate-50 p-4 rounded-2xl border border-slate-200">
                <button onclick="filterJournals('ALL')" class="az-filter-btn active px-4 py-2 rounded-lg text-xs font-black uppercase tracking-widest transition-all bg-sky-600 text-white shadow-md shadow-sky-200" data-letter="ALL">ALL</button>
                {foreach from="ABCDEFGHIJKLMNOPQRSTUVWXYZ"|str_split item=letter}
                    <button onclick="filterJournals('{$letter}')" class="az-filter-btn px-3 py-2 rounded-lg text-xs font-bold text-slate-500 hover:bg-white hover:text-sky-600 hover:shadow-sm transition-all border border-transparent hover:border-slate-200" data-letter="{$letter}">{$letter}</button>
                {/foreach}
            </div>

            {* Grid Jurnal *}
            <div id="journal-grid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-10">
                {foreach from=$journals item=journal}
                {assign var="displayTitle" value=$journal->getLocalizedName()}
                <div class="journal-card bg-white rounded-[2rem] border border-slate-100 shadow-sm hover:shadow-2xl transition-all duration-500 overflow-hidden flex flex-col group" 
                     data-title="{$displayTitle|escape|upper}">
                    
                    {* Thumbnail Area *}
                    <div class="h-64 relative overflow-hidden bg-slate-100">
                        {if $journal->getLocalizedData('journalThumbnail')}
                            {assign var="thumbnail" value=$journal->getLocalizedData('journalThumbnail')}
                            <img src="{$journalFilesPath}{$journal->getId()}/{$thumbnail.uploadName|escape:"url"}" 
                                 class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700" 
                                 alt="{$displayTitle|escape}">
                        {else}
                            <div class="w-full h-full flex items-center justify-center bg-gradient-to-br from-slate-100 to-slate-200">
                                <i data-lucide="image" class="w-12 h-12 text-slate-300"></i>
                            </div>
                        {/if}
                        
                        {* Journal ID Overlay *}
                        <div class="absolute top-4 left-4">
                            <span class="bg-white/90 backdrop-blur px-4 py-1.5 rounded-full text-[10px] font-black text-sky-700 shadow-lg uppercase tracking-widest border border-white">
                                Journal ID: {$journal->getId()}
                            </span>
                        </div>
                    </div>

                    {* Info Area *}
                    <div class="p-8 flex-grow flex flex-col">
                        <h4 class="text-xl font-black text-slate-900 mb-4 line-clamp-2 leading-tight group-hover:text-sky-600 transition-colors">
                            {$displayTitle|escape}
                        </h4>
                        <div class="text-slate-500 text-sm mb-8 line-clamp-3 leading-relaxed font-medium">
                            {$journal->getLocalizedDescription()|strip_tags|truncate:150}
                        </div>
                        
                        <div class="mt-auto space-y-3">
                            <a href="{url journal=$journal->getPath()}" 
                               class="w-full bg-sky-600 text-white text-center py-3.5 rounded-xl font-bold flex items-center justify-center gap-2 hover:bg-sky-700 shadow-lg shadow-sky-100 transition-all active:scale-[0.98]">
                                Beranda Jurnal <i data-lucide="arrow-right" class="w-4 h-4"></i>
                            </a>
                            <a href="{url journal=$journal->getPath() page="issue" op="current"}" 
                               class="w-full bg-slate-50 text-slate-600 text-center py-3.5 rounded-xl font-bold hover:bg-slate-100 transition-all border border-slate-100">
                                Terbitan Terbaru
                            </a>
                        </div>
                    </div>
                </div>
                {/foreach}
            </div>

            {* Empty State *}
            <div id="no-results" class="hidden py-20 text-center">
                <div class="bg-slate-50 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-6">
                    <i data-lucide="search-x" class="w-10 h-10 text-slate-300"></i>
                </div>
                <h5 class="text-xl font-bold text-slate-900">Jurnal tidak ditemukan</h5>
                <p class="text-slate-500 mt-2">Maaf, tidak ada jurnal yang dimulai dengan huruf tersebut.</p>
                <button onclick="filterJournals('ALL')" class="mt-6 text-sky-600 font-bold hover:underline">Tampilkan semua jurnal</button>
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

    // Update Button UI
    buttons.forEach(btn => {
        if (btn.getAttribute('data-letter') === letter) {
            btn.classList.add('bg-sky-600', 'text-white', 'shadow-md', 'shadow-sky-200');
            btn.classList.remove('text-slate-500', 'hover:bg-white');
        } else {
            btn.classList.remove('bg-sky-600', 'text-white', 'shadow-md', 'shadow-sky-200');
            btn.classList.add('text-slate-500', 'hover:bg-white');
        }
    });

    // Filter Logic
    cards.forEach(card => {
        const title = card.getAttribute('data-title').trim();
        if (letter === 'ALL' || title.startsWith(letter)) {
            card.style.display = 'flex';
            found++;
        } else {
            card.style.display = 'none';
        }
    });

    // Show/Hide Empty State
    if (found === 0) {
        grid.classList.add('hidden');
        noResults.classList.remove('hidden');
    } else {
        grid.classList.remove('hidden');
        noResults.classList.add('hidden');
    }

    // Scroll to list
    document.getElementById('journals-list').scrollIntoView({ behavior: 'smooth' });
}

// Initial Lucide check for dynamically changed elements
document.addEventListener('DOMContentLoaded', () => {
    if (typeof lucide !== 'undefined') lucide.createIcons();
});
</script>

{include file="frontend/components/footer.tpl"}