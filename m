Return-Path: <linux-i2c+bounces-12389-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 431DAB32697
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Aug 2025 05:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC587B62B08
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Aug 2025 03:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378A7221FC8;
	Sat, 23 Aug 2025 03:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LP9f496j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B13A1F5838;
	Sat, 23 Aug 2025 03:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755918724; cv=none; b=V16qI0VQWZcRS4Gr3KkfdLTsLqcKeN6bJn0VxokBCJOMqlYDOpbvZAotIPIxKfk7LfCXLTjgC7L22PPn9h9GPQUTtGd0JRMrNYkjP/G52qtRUlwtoSJDgo8LyrdwwZzTPgWlNPP4b+YrT9w2oGDxSsQn6ZzPlevcZeZLxF1xavI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755918724; c=relaxed/simple;
	bh=Pj9gg4Dzoo7TunFCad7QgQinH/EGNIKEdOOe4IPIAL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUL4GCeJEBx8DUUehqi7UXDk1yTnpHXffDtFt5Vo8Q2H4260koOrzSHRZjEOlDYoTyq858AV1Rw5G4DWdt9ZbYmqYOjqybgOvKnvPMheLQT/IKQngY1GkduOa8ZeD6/vJdi28CuN3TEC8r+RKJ+ANa/hYSMgMVQTFv6n40YAZXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LP9f496j; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755918723; x=1787454723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pj9gg4Dzoo7TunFCad7QgQinH/EGNIKEdOOe4IPIAL8=;
  b=LP9f496j7wPxQi2Xh232E/YyR2kAyQovmpYk7zoWwF4QGzW3WanT3a3e
   EcalPHzwWEDVkwmioEJHUYZmTHok5+C/R7zgLoVmk2MUe/BFqUyKEUZ/u
   DvIx1eIhwQPcqC+GFBTp0ZtDmCUSqRLE/j0Aw0mApp1eCKgWdQWZTKzRJ
   UKlE52JbXrXDKopKhTKhUT/z8O3rZK1VE5TtgwkE6IewJakqNGORkqoQr
   Nv4/yINJVJaTMcD1uTdxPgYXfgpETFdB1JqMGLm56mWWe6SxIqn/hIRpS
   hPtoyjjnH8nX5gMGSo7e6rXpOT8QojcFceI2ZuOlMFc1ocTWuIloPlZY8
   w==;
X-CSE-ConnectionGUID: ehS5VDeISTG8v1QF4FqshQ==
X-CSE-MsgGUID: 8rcU76MiR/eQKbSFuwRCXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69326108"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69326108"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 20:12:02 -0700
X-CSE-ConnectionGUID: eibmkJ0DQxOHz0YJzzxx+Q==
X-CSE-MsgGUID: 5IUeMJAqTIexkxFl0E01Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="174155745"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Aug 2025 20:11:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upefV-000M31-1z;
	Sat, 23 Aug 2025 03:11:50 +0000
Date: Sat, 23 Aug 2025 11:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	broonie@kernel.org, johan+linaro@kernel.org, dianders@chromium.org,
	agross@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mukesh.savaliya@oss.qualcomm.com,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/6] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
Message-ID: <202508231007.Lp8v1Xdl-lkp@intel.com>
References: <20250822072651.510027-4-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822072651.510027-4-viken.dadhaniya@oss.qualcomm.com>

Hi Viken,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on tty/tty-testing tty/tty-next tty/tty-linus broonie-spi/for-next linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viken-Dadhaniya/dt-bindings-qcom-se-common-Add-QUP-Peripheral-specific-properties-for-I2C-SPI-and-SERIAL-bus/20250822-153051
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250822072651.510027-4-viken.dadhaniya%40oss.qualcomm.com
patch subject: [PATCH v6 3/6] soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem
config: sparc64-randconfig-r133-20250823 (https://download.01.org/0day-ci/archive/20250823/202508231007.Lp8v1Xdl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250823/202508231007.Lp8v1Xdl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231007.Lp8v1Xdl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/soc/qcom/qcom-geni-se.c:1053:21: sparse: sparse: cast to restricted __le32
   drivers/soc/qcom/qcom-geni-se.c:1053:21: sparse: sparse: cast from restricted __le16
   drivers/soc/qcom/qcom-geni-se.c:1053:21: sparse: sparse: cast to restricted __le32
   drivers/soc/qcom/qcom-geni-se.c:1053:21: sparse: sparse: cast from restricted __le16
   drivers/soc/qcom/qcom-geni-se.c:1053:21: sparse: sparse: cast to restricted __le32
   drivers/soc/qcom/qcom-geni-se.c:1053:21: sparse: sparse: cast from restricted __le16
   drivers/soc/qcom/qcom-geni-se.c:1053:21: sparse: sparse: cast to restricted __le32
   drivers/soc/qcom/qcom-geni-se.c:1053:21: sparse: sparse: cast from restricted __le16
   drivers/soc/qcom/qcom-geni-se.c:1053:21: sparse: sparse: cast to restricted __le32
   drivers/soc/qcom/qcom-geni-se.c:1053:21: sparse: sparse: cast from restricted __le16
   drivers/soc/qcom/qcom-geni-se.c:1053:21: sparse: sparse: cast to restricted __le32
   drivers/soc/qcom/qcom-geni-se.c:1053:21: sparse: sparse: cast from restricted __le16
   drivers/soc/qcom/qcom-geni-se.c:1056:25: sparse: sparse: restricted __le16 degrades to integer
   drivers/soc/qcom/qcom-geni-se.c:1057:47: sparse: sparse: restricted __le16 degrades to integer
   drivers/soc/qcom/qcom-geni-se.c:1059:25: sparse: sparse: restricted __le16 degrades to integer
   drivers/soc/qcom/qcom-geni-se.c:1065:43: sparse: sparse: restricted __le16 degrades to integer
   drivers/soc/qcom/qcom-geni-se.c:1065:25: sparse: sparse: restricted __le16 degrades to integer
   drivers/soc/qcom/qcom-geni-se.c:1066:48: sparse: sparse: restricted __le16 degrades to integer
   drivers/soc/qcom/qcom-geni-se.c:1066:25: sparse: sparse: restricted __le16 degrades to integer
   drivers/soc/qcom/qcom-geni-se.c:1067:48: sparse: sparse: restricted __le16 degrades to integer
   drivers/soc/qcom/qcom-geni-se.c:1067:25: sparse: sparse: restricted __le16 degrades to integer
>> drivers/soc/qcom/qcom-geni-se.c:1238:19: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] l @@     got restricted __le16 [usertype] cfg_version @@
   drivers/soc/qcom/qcom-geni-se.c:1238:19: sparse:     expected unsigned int [usertype] l
   drivers/soc/qcom/qcom-geni-se.c:1238:19: sparse:     got restricted __le16 [usertype] cfg_version
   drivers/soc/qcom/qcom-geni-se.c:1239:19: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] l @@     got restricted __le16 [usertype] cfg_version @@
   drivers/soc/qcom/qcom-geni-se.c:1239:19: sparse:     expected unsigned int [usertype] l
   drivers/soc/qcom/qcom-geni-se.c:1239:19: sparse:     got restricted __le16 [usertype] cfg_version

vim +1238 drivers/soc/qcom/qcom-geni-se.c

  1165	
  1166	/**
  1167	 * geni_load_se_fw() - Load Serial Engine specific firmware.
  1168	 * @se: Pointer to the concerned serial engine.
  1169	 * @fw: Pointer to the firmware structure.
  1170	 * @mode: SE data transfer mode.
  1171	 * @protocol: Protocol type to be used with the SE (e.g., UART, SPI, I2C).
  1172	 *
  1173	 * Load the protocol firmware into the IRAM of the Serial Engine.
  1174	 *
  1175	 * Return: 0 if successful, otherwise return an error value.
  1176	 */
  1177	static int geni_load_se_fw(struct geni_se *se, const struct firmware *fw,
  1178				   enum geni_se_xfer_mode mode, enum geni_se_protocol_type protocol)
  1179	{
  1180		const u32 *fw_data, *cfg_val_arr;
  1181		const u8 *cfg_idx_arr;
  1182		u32 i, reg_value;
  1183		int ret;
  1184		struct se_fw_hdr *hdr;
  1185	
  1186		hdr = geni_find_protocol_fw(se->dev, fw, protocol);
  1187		if (!hdr)
  1188			return -EINVAL;
  1189	
  1190		fw_data = (const u32 *)((u8 *)hdr + le16_to_cpu(hdr->fw_offset));
  1191		cfg_idx_arr = (const u8 *)hdr + le16_to_cpu(hdr->cfg_idx_offset);
  1192		cfg_val_arr = (const u32 *)((u8 *)hdr + le16_to_cpu(hdr->cfg_val_offset));
  1193	
  1194		ret = geni_icc_set_bw(se);
  1195		if (ret)
  1196			return ret;
  1197	
  1198		ret = geni_icc_enable(se);
  1199		if (ret)
  1200			return ret;
  1201	
  1202		ret = geni_se_resources_on(se);
  1203		if (ret)
  1204			goto out_icc_disable;
  1205	
  1206		/*
  1207		 * Disable high-priority interrupts until all currently executing
  1208		 * low-priority interrupts have been fully handled.
  1209		 */
  1210		geni_setbits32(se->wrapper->base + QUPV3_COMMON_CFG, FAST_SWITCH_TO_HIGH_DISABLE);
  1211	
  1212		/* Set AHB_M_CLK_CGC_ON to indicate hardware controls se-wrapper cgc clock. */
  1213		geni_setbits32(se->wrapper->base + QUPV3_SE_AHB_M_CFG, AHB_M_CLK_CGC_ON);
  1214	
  1215		/* Let hardware to control common cgc. */
  1216		geni_setbits32(se->wrapper->base + QUPV3_COMMON_CGC_CTRL, COMMON_CSR_SLV_CLK_CGC_ON);
  1217	
  1218		/*
  1219		 * Setting individual bits in GENI_OUTPUT_CTRL activates corresponding output lines,
  1220		 * allowing the hardware to drive data as configured.
  1221		 */
  1222		writel(0x0, se->base + GENI_OUTPUT_CTRL);
  1223	
  1224		/* Set SCLK and HCLK to program RAM */
  1225		geni_setbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
  1226		writel(0x0, se->base + SE_GENI_CLK_CTRL);
  1227		geni_clrbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
  1228	
  1229		/* Enable required clocks for DMA CSR, TX and RX. */
  1230		reg_value = AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CLK_CGC_ON |
  1231			    DMA_TX_CLK_CGC_ON | DMA_RX_CLK_CGC_ON;
  1232		geni_setbits32(se->base + SE_DMA_GENERAL_CFG, reg_value);
  1233	
  1234		/* Let hardware control CGC by default. */
  1235		writel(DEFAULT_CGC_EN, se->base + SE_GENI_CGC_CTRL);
  1236	
  1237		/* Set version of the configuration register part of firmware. */
> 1238		writel(hdr->cfg_version, se->base + SE_GENI_INIT_CFG_REVISION);
  1239		writel(hdr->cfg_version, se->base + SE_GENI_S_INIT_CFG_REVISION);
  1240	
  1241		/* Configure GENI primitive table. */
  1242		for (i = 0; i < le16_to_cpu(hdr->cfg_size_in_items); i++)
  1243			writel(cfg_val_arr[i],
  1244			       se->base + SE_GENI_CFG_REG0 + (cfg_idx_arr[i] * sizeof(u32)));
  1245	
  1246		/* Configure condition for assertion of RX_RFR_WATERMARK condition. */
  1247		reg_value = geni_se_get_rx_fifo_depth(se);
  1248		writel(reg_value - 2, se->base + SE_GENI_RX_RFR_WATERMARK_REG);
  1249	
  1250		/* Let hardware control CGC */
  1251		geni_setbits32(se->base + GENI_OUTPUT_CTRL, DEFAULT_IO_OUTPUT_CTRL_MSK);
  1252	
  1253		ret = geni_configure_xfer_mode(se, mode);
  1254		if (ret)
  1255			goto out_resources_off;
  1256	
  1257		geni_enable_interrupts(se);
  1258	
  1259		geni_write_fw_revision(se, le16_to_cpu(hdr->serial_protocol), le16_to_cpu(hdr->fw_version));
  1260	
  1261		/* Program RAM address space. */
  1262		memcpy_toio(se->base + SE_GENI_CFG_RAMN, fw_data,
  1263			    le16_to_cpu(hdr->fw_size_in_items) * sizeof(u32));
  1264	
  1265		/* Put default values on GENI's output pads. */
  1266		writel_relaxed(0x1, se->base + GENI_FORCE_DEFAULT_REG);
  1267	
  1268		/* Toggle SCLK/HCLK from high to low to finalize RAM programming and apply config. */
  1269		geni_setbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
  1270		geni_setbits32(se->base + SE_GENI_CLK_CTRL, SER_CLK_SEL);
  1271		geni_clrbits32(se->base + SE_GENI_CGC_CTRL, PROG_RAM_SCLK_OFF | PROG_RAM_HCLK_OFF);
  1272	
  1273		/* Serial engine DMA interface is enabled. */
  1274		geni_setbits32(se->base + SE_DMA_IF_EN, DMA_IF_EN);
  1275	
  1276		/* Enable or disable FIFO interface of the serial engine. */
  1277		if (mode == GENI_SE_FIFO)
  1278			geni_clrbits32(se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
  1279		else
  1280			geni_setbits32(se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
  1281	
  1282	out_resources_off:
  1283		geni_se_resources_off(se);
  1284	
  1285	out_icc_disable:
  1286		geni_icc_disable(se);
  1287		return ret;
  1288	}
  1289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

