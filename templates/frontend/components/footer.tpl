{**
 * plugins/themes/sao-iain-pare/templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2024 LP2M IAIN Parepare
 *
 * @brief Footer kustom untuk Sao Jurnal dengan desain modern Tailwind.
 *}
			</main> {* Close main *}
		</div> {* Close flex-grow wrapper *}

		<footer class="bg-slate-900 text-white py-20">
			<div class="max-w-7xl mx-auto px-6">
				<div class="grid grid-cols-1 md:grid-cols-4 gap-12 border-b border-white/10 pb-16">
					
					{* Kolom 1: Tentang *}
					<div class="col-span-1 md:col-span-1">
						<h5 class="text-xl font-black mb-6 uppercase tracking-tighter">Sao Jurnal</h5>
						<p class="text-slate-400 text-sm leading-relaxed mb-6">
							Platform publikasi ilmiah IAIN Parepare yang berkomitmen pada keterbukaan akses dan kualitas penelitian yang berkelanjutan.
						</p>
						<div class="flex gap-4">
							<a href="#" class="w-10 h-10 bg-white/5 rounded-lg flex items-center justify-center hover:bg-sky-600 transition-colors">
								<i data-lucide="facebook" class="w-5 h-5"></i>
							</a>
							<a href="#" class="w-10 h-10 bg-white/5 rounded-lg flex items-center justify-center hover:bg-sky-600 transition-colors">
								<i data-lucide="instagram" class="w-5 h-5"></i>
							</a>
							<a href="#" class="w-10 h-10 bg-white/5 rounded-lg flex items-center justify-center hover:bg-sky-600 transition-colors">
								<i data-lucide="twitter" class="w-5 h-5"></i>
							</a>
						</div>
					</div>

					{* Kolom 2: Navigasi *}
					<div>
						<h5 class="text-sm font-bold mb-6 text-sky-400 uppercase tracking-widest">Navigasi</h5>
						<ul class="space-y-4 text-slate-400 text-sm font-medium">
							<li><a href="{url page="index"}" class="hover:text-white transition-colors">Beranda</a></li>
							<li><a href="{url page="about" op="contact"}" class="hover:text-white transition-colors">Kontak Kami</a></li>
							<li><a href="{url page="about" op="submissions"}" class="hover:text-white transition-colors">Kirim Naskah</a></li>
						</ul>
					</div>

					{* Kolom 3: Kebijakan *}
					<div>
						<h5 class="text-sm font-bold mb-6 text-sky-400 uppercase tracking-widest">Kebijakan</h5>
						<ul class="space-y-4 text-slate-400 text-sm font-medium">
							<li><a href="{url page="about" op="privacy"}" class="hover:text-white transition-colors">Privasi & Data</a></li>
							<li><a href="{url page="about" op="editorialPolicies"}" class="hover:text-white transition-colors">Kebijakan Editorial</a></li>
							<li><a href="{url page="about" op="aboutThisPublishingSystem"}" class="hover:text-white transition-colors">Tentang OJS</a></li>
						</ul>
					</div>

					{* Kolom 4: Alamat *}
					<div>
						<h5 class="text-sm font-bold mb-6 text-sky-400 uppercase tracking-widest">Alamat</h5>
						<address class="not-italic text-slate-400 text-sm leading-relaxed">
							Kampus IAIN Parepare<br>
							Jl. Amal Bakti No. 8, Soreang<br>
							Parepare, Sulawesi Selatan<br>
							Indonesia
						</address>
					</div>
				</div>

				<div class="pt-8 flex flex-col md:flex-row justify-between items-center gap-6">
					<p class="text-slate-500 text-xs font-bold">
						&copy; {$smarty.now|date_format:"%Y"} LP2M IAIN Parepare. All rights reserved.
					</p>
					<div class="flex items-center gap-6">
						<img src="{$baseUrl}/{$brandImage}" alt="OJS PKP" class="h-8 opacity-40 hover:opacity-100 transition-opacity">
						<div class="text-[10px] text-slate-600 font-black uppercase tracking-[0.2em]">
							Powered by OJS 3.3.0
						</div>
					</div>
				</div>
			</div>
		</footer>

	</div> {* Close pkp_structure_page or main container *}

	{load_script context="frontend"}
	{call_hook name="Templates::Common::Footer::PageFooter"}

	<script>
		/**
		 * Re-inisialisasi Lucide di Footer
		 */
		document.addEventListener('DOMContentLoaded', function() {
			if (typeof lucide !== 'undefined') lucide.createIcons();
		});
	</script>
</body>
</html>
