Return-Path: <linux-i2c+bounces-9002-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A40CA07585
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 13:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2817E163A65
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 12:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D69217641;
	Thu,  9 Jan 2025 12:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeWL2GVb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F49216609;
	Thu,  9 Jan 2025 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736425107; cv=none; b=bvQhXBdD1x98jm1u7+QaksCvHYl8pLoPyEvI8sbAh6Zhs19ab5fDrMK7D+FKt/uR1+zvL9DpdVFSKdjrgY8z2BF3M8j8HPYNFjIXgm5yKhbJ65k29qgLonj0WhL1z1E+a/8OeP9cNcUqPUT7WWzzRgqw2j/6xFuzBqlHPtAg5P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736425107; c=relaxed/simple;
	bh=dmaV9slOaRND/qAmh/zyG6K+AudsGb57DWZ6BYQzA8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IopMYlOPzZERrum6QavswJH9I6kq1X1M9vDMNrm+IyMx90u679+pvosaX5LcqmO64vZlDUsO63WbXuVuDrexxRzFXTotP5sBOHYY5A9nKwjFwUeGNOFTbiFL/Hf5gieWEgShAv3mu+nPTBUn9r/g+LoqP17hBmF9E1NN9dGloI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeWL2GVb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736425105; x=1767961105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dmaV9slOaRND/qAmh/zyG6K+AudsGb57DWZ6BYQzA8g=;
  b=HeWL2GVbbsB4BnkiQtoAlMlFTQvpZi72iBtl3zWMWjkBgFP9SR7BaKVx
   a57bghjEd5evaJP2FNHuNpA7o382k3w1a+78ArblT8RiLABS3usbe1D77
   58TcUwJIHoj/+R0BYB5isU09AIOXE9UmRuXO0z8lwBrAo9eyMARK2IJiH
   e0HVgPD24LinIrG5aOytOScmVqHGgzIMaCh9E/1W6EbmgpbrKuzsoDjCI
   lrs2tltzwycDn2lfvhtmM/xpyko1nza5/bWPQMHS5MWz6Uz6FYZ6xxumA
   PdJhorYAB/QU2S9ZWZT6VJwveLCr3soM156QvJTVZP36/ScVYwyosX0Fs
   Q==;
X-CSE-ConnectionGUID: EVzXM6HMTWODuCDFMjlP1g==
X-CSE-MsgGUID: jacZE6DYRNionU+tINa46A==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36845644"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36845644"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:18:25 -0800
X-CSE-ConnectionGUID: KZozZ3fITpy81/ukdLaiDw==
X-CSE-MsgGUID: i5k5Ov0WTTmBEWwVoOKSJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107430195"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jan 2025 04:18:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVrUR-000HUx-1W;
	Thu, 09 Jan 2025 12:18:19 +0000
Date: Thu, 9 Jan 2025 20:18:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	ldewangan@nvidia.com, digetx@gmail.com, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/5] i2c: tegra: Add HS mode support
Message-ID: <202501091951.yESb0LaA-lkp@intel.com>
References: <20250108110620.86900-2-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108110620.86900-2-kkartik@nvidia.com>

Hi Kartik,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on andi-shyti/i2c/i2c-host robh/for-next linus/master v6.13-rc6 next-20250109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kartik-Rajput/i2c-tegra-Add-HS-mode-support/20250108-190816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20250108110620.86900-2-kkartik%40nvidia.com
patch subject: [PATCH 1/5] i2c: tegra: Add HS mode support
config: arm-randconfig-001-20250109 (https://download.01.org/0day-ci/archive/20250109/202501091951.yESb0LaA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501091951.yESb0LaA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501091951.yESb0LaA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-tegra.c:231: warning: Function parameter or struct member 'tlow_hs_mode' not described in 'tegra_i2c_hw_feature'
>> drivers/i2c/busses/i2c-tegra.c:231: warning: Function parameter or struct member 'thigh_hs_mode' not described in 'tegra_i2c_hw_feature'
>> drivers/i2c/busses/i2c-tegra.c:231: warning: Function parameter or struct member 'has_hs_mode_support' not described in 'tegra_i2c_hw_feature'
   drivers/i2c/busses/i2c-tegra.c:301: warning: Function parameter or struct member 'dma_dev' not described in 'tegra_i2c_dev'


vim +231 drivers/i2c/busses/i2c-tegra.c

db811ca0f48578 Colin Cross         2011-02-20  163  
6ad068ed63100f Laxman Dewangan     2012-08-19  164  /**
94a5573f0719cf Dmitry Osipenko     2020-09-30  165   * struct tegra_i2c_hw_feature : per hardware generation features
94a5573f0719cf Dmitry Osipenko     2020-09-30  166   * @has_continue_xfer_support: continue-transfer supported
2a2897bab2d3d5 Laxman Dewangan     2013-01-05  167   * @has_per_pkt_xfer_complete_irq: Has enable/disable capability for transfer
94a5573f0719cf Dmitry Osipenko     2020-09-30  168   *		completion interrupt on per packet basis.
6f4664b2e2c2cf Laxman Dewangan     2015-06-30  169   * @has_config_load_reg: Has the config load register to load the new
6f4664b2e2c2cf Laxman Dewangan     2015-06-30  170   *		configuration.
2a2897bab2d3d5 Laxman Dewangan     2013-01-05  171   * @clk_divisor_hs_mode: Clock divisor in HS mode.
0940d24912e925 Sowjanya Komatineni 2019-02-12  172   * @clk_divisor_std_mode: Clock divisor in standard mode. It is
0940d24912e925 Sowjanya Komatineni 2019-02-12  173   *		applicable if there is no fast clock source i.e. single clock
0940d24912e925 Sowjanya Komatineni 2019-02-12  174   *		source.
0940d24912e925 Sowjanya Komatineni 2019-02-12  175   * @clk_divisor_fast_mode: Clock divisor in fast mode. It is
2a2897bab2d3d5 Laxman Dewangan     2013-01-05  176   *		applicable if there is no fast clock source i.e. single clock
2a2897bab2d3d5 Laxman Dewangan     2013-01-05  177   *		source.
0604ee4aefa20f Thierry Reding      2018-12-17  178   * @clk_divisor_fast_plus_mode: Clock divisor in fast mode plus. It is
0604ee4aefa20f Thierry Reding      2018-12-17  179   *		applicable if there is no fast clock source (i.e. single
0604ee4aefa20f Thierry Reding      2018-12-17  180   *		clock source).
0604ee4aefa20f Thierry Reding      2018-12-17  181   * @has_multi_master_mode: The I2C controller supports running in single-master
0604ee4aefa20f Thierry Reding      2018-12-17  182   *		or multi-master mode.
0604ee4aefa20f Thierry Reding      2018-12-17  183   * @has_slcg_override_reg: The I2C controller supports a register that
0604ee4aefa20f Thierry Reding      2018-12-17  184   *		overrides the second level clock gating.
0604ee4aefa20f Thierry Reding      2018-12-17  185   * @has_mst_fifo: The I2C controller contains the new MST FIFO interface that
0604ee4aefa20f Thierry Reding      2018-12-17  186   *		provides additional features and allows for longer messages to
0604ee4aefa20f Thierry Reding      2018-12-17  187   *		be transferred in one go.
94a5573f0719cf Dmitry Osipenko     2020-09-30  188   * @quirks: I2C adapter quirks for limiting write/read transfer size and not
b67d4530cdade7 Sowjanya Komatineni 2019-01-08  189   *		allowing 0 length transfers.
ce9562424501de Sowjanya Komatineni 2019-02-12  190   * @supports_bus_clear: Bus Clear support to recover from bus hang during
ce9562424501de Sowjanya Komatineni 2019-02-12  191   *		SDA stuck low from device for some unknown reasons.
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  192   * @has_apb_dma: Support of APBDMA on corresponding Tegra chip.
0940d24912e925 Sowjanya Komatineni 2019-02-12  193   * @tlow_std_mode: Low period of the clock in standard mode.
0940d24912e925 Sowjanya Komatineni 2019-02-12  194   * @thigh_std_mode: High period of the clock in standard mode.
0940d24912e925 Sowjanya Komatineni 2019-02-12  195   * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
0940d24912e925 Sowjanya Komatineni 2019-02-12  196   * @thigh_fast_fastplus_mode: High period of the clock in fast/fast-plus modes.
0940d24912e925 Sowjanya Komatineni 2019-02-12  197   * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
0940d24912e925 Sowjanya Komatineni 2019-02-12  198   *		in standard mode.
0940d24912e925 Sowjanya Komatineni 2019-02-12  199   * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for start and stop
0940d24912e925 Sowjanya Komatineni 2019-02-12  200   *		conditions in fast/fast-plus modes.
0940d24912e925 Sowjanya Komatineni 2019-02-12  201   * @setup_hold_time_hs_mode: Setup and hold time for start and stop conditions
0940d24912e925 Sowjanya Komatineni 2019-02-12  202   *		in HS mode.
0940d24912e925 Sowjanya Komatineni 2019-02-12  203   * @has_interface_timing_reg: Has interface timing register to program the tuned
0940d24912e925 Sowjanya Komatineni 2019-02-12  204   *		timing settings.
6ad068ed63100f Laxman Dewangan     2012-08-19  205   */
6ad068ed63100f Laxman Dewangan     2012-08-19  206  struct tegra_i2c_hw_feature {
6ad068ed63100f Laxman Dewangan     2012-08-19  207  	bool has_continue_xfer_support;
2a2897bab2d3d5 Laxman Dewangan     2013-01-05  208  	bool has_per_pkt_xfer_complete_irq;
6f4664b2e2c2cf Laxman Dewangan     2015-06-30  209  	bool has_config_load_reg;
f1c2ff98065dce Dmitry Osipenko     2020-09-30  210  	u32 clk_divisor_hs_mode;
f1c2ff98065dce Dmitry Osipenko     2020-09-30  211  	u32 clk_divisor_std_mode;
f1c2ff98065dce Dmitry Osipenko     2020-09-30  212  	u32 clk_divisor_fast_mode;
f1c2ff98065dce Dmitry Osipenko     2020-09-30  213  	u32 clk_divisor_fast_plus_mode;
497fbe24987bd2 Shardar Shariff Md  2016-03-14  214  	bool has_multi_master_mode;
497fbe24987bd2 Shardar Shariff Md  2016-03-14  215  	bool has_slcg_override_reg;
c5907c6b96f187 Thierry Reding      2018-06-19  216  	bool has_mst_fifo;
b67d4530cdade7 Sowjanya Komatineni 2019-01-08  217  	const struct i2c_adapter_quirks *quirks;
ce9562424501de Sowjanya Komatineni 2019-02-12  218  	bool supports_bus_clear;
86c92b9965ff17 Sowjanya Komatineni 2019-02-12  219  	bool has_apb_dma;
f1c2ff98065dce Dmitry Osipenko     2020-09-30  220  	u32 tlow_std_mode;
f1c2ff98065dce Dmitry Osipenko     2020-09-30  221  	u32 thigh_std_mode;
f1c2ff98065dce Dmitry Osipenko     2020-09-30  222  	u32 tlow_fast_fastplus_mode;
f1c2ff98065dce Dmitry Osipenko     2020-09-30  223  	u32 thigh_fast_fastplus_mode;
19a765ab587022 Akhil R             2025-01-08  224  	u32 tlow_hs_mode;
19a765ab587022 Akhil R             2025-01-08  225  	u32 thigh_hs_mode;
0940d24912e925 Sowjanya Komatineni 2019-02-12  226  	u32 setup_hold_time_std_mode;
0940d24912e925 Sowjanya Komatineni 2019-02-12  227  	u32 setup_hold_time_fast_fast_plus_mode;
0940d24912e925 Sowjanya Komatineni 2019-02-12  228  	u32 setup_hold_time_hs_mode;
0940d24912e925 Sowjanya Komatineni 2019-02-12  229  	bool has_interface_timing_reg;
19a765ab587022 Akhil R             2025-01-08  230  	bool has_hs_mode_support;
6ad068ed63100f Laxman Dewangan     2012-08-19 @231  };
6ad068ed63100f Laxman Dewangan     2012-08-19  232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

