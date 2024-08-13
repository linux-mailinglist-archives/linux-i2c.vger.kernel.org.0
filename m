Return-Path: <linux-i2c+bounces-5337-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C339504E0
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 14:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E867E1C2264F
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 12:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403C619925A;
	Tue, 13 Aug 2024 12:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YeCcWTm1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75669199392;
	Tue, 13 Aug 2024 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551987; cv=none; b=u/SPdZ79eWzsVY4aCQb4dC6GIjQWZoyfDyNmbBASkJhLyAAREe5xf/KsDCnvJaH/sGU4M1BI9CGMrBTbC9He8xLjDJNUwE6EGKdVuXX2VWGWZ9ZyxbsyhP27ieeDx50Q7RGVvEChwODCiNwWvJhpgRG+jghd6k2bccNkJeWh4Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551987; c=relaxed/simple;
	bh=YXHc5SzykAx8a1KtG2hCaleuHDVdHXz2VYjDHlSrEN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1AF+Q8h9r5klZ5OtMmWTRbQZlTHOJbP3AtKmfEehCnk7l64q2og7HG4AVmM9OpRrPgNoYm11ucWjSIO+RcP+ErU/eo/C83e7wzVN+Qa5Ja4a8ubeV2tjqRgU0mt/vKw+56MIKW0KtQ9sRGjYz7QnBGmKHQdIiBkdxuU1cnzMF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YeCcWTm1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723551985; x=1755087985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YXHc5SzykAx8a1KtG2hCaleuHDVdHXz2VYjDHlSrEN8=;
  b=YeCcWTm1N4TU4cbmI3NrlB37ywFLGLJrYaYhxWIY4EBOGJ/fv0aZpf4s
   iQ4tS3a1Gyy85aX6JyXKTj7fQ7lNrP8ZzahCbvVlj/Z3OepaInDSFZ5P+
   KJeR2wnLwjn+V6W7aw8cs6vTIthsCLuSqnXtTL7rF3bSbzWuP8y7bvi57
   jF89bV1s89n0h1lnTaIvVcOLvfeQZwIErM4JIT7WKAwK+Dg32VkbY2o8r
   53yAxYV19g/4RswNwNHsTEbTuIBdDo2sRfw90TTfRiSgUP5pQima9Y9e5
   wKqMuxKjHUZoC96rXaE5xBc2vE+aB6SBGSlTVPB7UadoYtn33LfogIXA+
   w==;
X-CSE-ConnectionGUID: 1jIjnAjDSJuqxY9d1rp8tA==
X-CSE-MsgGUID: 7elgkRCqRzC7YY3OZJXhXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="12983818"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="12983818"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 05:26:25 -0700
X-CSE-ConnectionGUID: Wcax+Og4QXq7o3AHRGi8JQ==
X-CSE-MsgGUID: 14gOFjAMSM+bvmBEuUUe4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58594331"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Aug 2024 05:26:22 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdqbT-0000P0-1L;
	Tue, 13 Aug 2024 12:26:19 +0000
Date: Tue, 13 Aug 2024 20:26:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	urezki@gmail.com, hch@infradead.org, linux-mm@kvack.org,
	lee@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de, christian.gmeiner@gmail.com,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: Re: [PATCH v3 1/2] x86: Add basic support for the Congatec CGEB BIOS
 interface
Message-ID: <202408132055.GF2IYZIB-lkp@intel.com>
References: <20240808183527.3950120-2-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808183527.3950120-2-mstrodl@csh.rit.edu>

Hi Mary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes andi-shyti/i2c/i2c-host akpm-mm/mm-everything linus/master v6.11-rc3 next-20240813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Strodl/x86-Add-basic-support-for-the-Congatec-CGEB-BIOS-interface/20240809-075405
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20240808183527.3950120-2-mstrodl%40csh.rit.edu
patch subject: [PATCH v3 1/2] x86: Add basic support for the Congatec CGEB BIOS interface
config: i386-randconfig-r111-20240813 (https://download.01.org/0day-ci/archive/20240813/202408132055.GF2IYZIB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408132055.GF2IYZIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408132055.GF2IYZIB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/congatec-cgeb.c:906:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mfd/congatec-cgeb.c:931:27: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +906 drivers/mfd/congatec-cgeb.c

   888	
   889	static struct cgeb_board_data *cgeb_open(resource_size_t base, u32 len)
   890	{
   891		u32 dw;
   892		struct cgeb_boardinfo pbi;
   893		struct cgeb_low_desc *low_desc;
   894		struct cgeb_high_desc *high_desc = NULL;
   895		u32 high_desc_phys;
   896		u32 high_desc_len;
   897		void *pcur, *high_desc_virt;
   898		int ret;
   899	
   900		struct cgeb_board_data *board;
   901	
   902		board = kzalloc(sizeof(*board), GFP_KERNEL);
   903		if (!board)
   904			return NULL;
   905	
 > 906		pcur = (void *) ioremap_cache(base, len);
   907		if (!pcur)
   908			goto err_kfree;
   909	
   910		/* look for the CGEB descriptor */
   911		low_desc = cgeb_find_magic(pcur, len, CGEB_LD_MAGIC);
   912		if (!low_desc)
   913			goto err_kfree;
   914	
   915		pr_debug("CGEB: Found CGEB_LD_MAGIC\n");
   916	
   917		if (low_desc->size < sizeof(struct cgeb_low_desc) - sizeof(long))
   918			goto err_kfree;
   919	
   920		if (low_desc->size >= sizeof(struct cgeb_low_desc)
   921				&& low_desc->hi_desc_phys_addr)
   922			high_desc_phys = low_desc->hi_desc_phys_addr;
   923		else
   924			high_desc_phys = 0xfff00000;
   925	
   926		high_desc_len = (unsigned int) -(int)high_desc_phys;
   927	
   928		pr_debug("CGEB: Looking for CGEB hi desc between phys 0x%x and 0x%x\n",
   929			high_desc_phys, -1);
   930	
   931		high_desc_virt = (void *) ioremap_cache(high_desc_phys, high_desc_len);
   932		if (!high_desc_virt)
   933			goto err_kfree;
   934	
   935		pr_debug("CGEB: Looking for CGEB hi desc between virt 0x%p and 0x%p\n",
   936			high_desc_virt, high_desc_virt + high_desc_len - 1);
   937	
   938		high_desc = cgeb_find_magic(high_desc_virt, high_desc_len,
   939						CGEB_HD_MAGIC);
   940		if (!high_desc)
   941			goto err_iounmap;
   942	
   943		pr_debug("CGEB: Found CGEB_HD_MAGIC\n");
   944	
   945		if (high_desc->size < sizeof(struct cgeb_high_desc))
   946			goto err_iounmap;
   947	
   948		pr_debug("CGEB: data_size %u, code_size %u, entry_rel %u\n",
   949			high_desc->data_size, high_desc->code_size, high_desc->entry_rel);
   950	
   951		ret = cgeb_upload_code(high_desc, board);
   952		if (ret) {
   953			pr_err("CGEB: Couldn't upload code to helper: %d\n", ret);
   954			goto err_munmap;
   955		}
   956	
   957		board->ds = get_data_segment();
   958	
   959		ret = cgeb_call_simple(board, CgebGetCgebVersion, 0, NULL, 0, &dw);
   960		if (ret)
   961			goto err_munmap;
   962	
   963		if (CGEB_GET_VERSION_MAJOR(dw) != CGEB_VERSION_MAJOR)
   964			goto err_munmap;
   965	
   966		pr_debug("CGEB: BIOS interface revision: %d.%d\n",
   967				dw >> 16, dw & 0xffff);
   968	
   969		if (high_desc->data_size)
   970			dw = high_desc->data_size;
   971		else
   972			ret = cgeb_call_simple(board, CgebGetDataSize, 0, NULL, 0, &dw);
   973	
   974		if (!ret && dw) {
   975			board->data = cgeb_user_alloc(high_desc->data_size);
   976			if (!board->data)
   977				goto err_munmap;
   978		}
   979	
   980		ret = cgeb_call_simple(board, CgebOpen, 0, NULL, 0, NULL);
   981		if (ret)
   982			goto err_free_data;
   983	
   984		pr_debug("CGEB: Mapping memory\n");
   985		ret = cgeb_map_memory(board);
   986		if (ret)
   987			goto err_free_map;
   988		pr_debug("CGEB: Memory is mapped, getting board info\n");
   989	
   990		ret = cgeb_call_simple(board, CgebBoardGetInfo, 0, &pbi,
   991				       sizeof(pbi), NULL);
   992		if (ret)
   993			goto err_free_map;
   994	
   995		pr_info("CGEB: Board name: %c%c%c%c\n",
   996				pbi.board[0], pbi.board[1],
   997				pbi.board[2], pbi.board[3]);
   998	
   999		iounmap((void __iomem *) high_desc_virt);
  1000	
  1001		return board;
  1002	
  1003	err_free_map:
  1004		cgeb_unmap_memory(board);
  1005	err_free_data:
  1006		cgeb_user_free(board->data);
  1007	err_munmap:
  1008		cgeb_munmap(board->code, board->code_size);
  1009	err_iounmap:
  1010		iounmap((void __iomem *) high_desc_virt);
  1011	err_kfree:
  1012		kfree(board);
  1013		return NULL;
  1014	}
  1015	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

