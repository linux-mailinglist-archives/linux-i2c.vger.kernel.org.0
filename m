Return-Path: <linux-i2c+bounces-9703-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DA6A4D224
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 04:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83BD216D4A5
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 03:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BCC1EE021;
	Tue,  4 Mar 2025 03:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMM6BozC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECE0165F1A;
	Tue,  4 Mar 2025 03:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741059991; cv=none; b=Y6bHFW3ajZqfgri2h7phi8pK0OsqDEcttTWINn/lqW2XDI1cA/dfkIfjIoME9u8WWB9Y5qsWkVdM5TjogYi+/jyhjIfTaYDLjmO9A2ht2kfeE2acnavux9C99S7iBMzm5JtL7VOwM6XBHp3LbDuUi9hbQTL51bK2i5Gbuld7yio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741059991; c=relaxed/simple;
	bh=/0M1+eq6BwinwoNP8fsnYGIUNIVIlGYP9vwLA7kdWQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qy4pm12l6n/lJwdPg4ey+hPBijCbMLlHQCYjjnxoLRNkexiCfABzjc+op2Al356UU321kSTRNV9vWlRpYPmWW5hvVCWDU2Cdr+IkW6Kes2ivI6f9pceVNxNNC0jBqqynhxECE2jfWPX+1DT8Y9brIlqvjQOPiRdVq6y0BUekGSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMM6BozC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741059990; x=1772595990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/0M1+eq6BwinwoNP8fsnYGIUNIVIlGYP9vwLA7kdWQ4=;
  b=aMM6BozC+R4XTscYyk6n0Lx08Z81/DTPVD+1ig53pn2z9ffM5WRFeXhX
   p2NdM4nYTyykvJVfZmpDVrN4o8XAIiJrzDZLzIxxAZ1Y4DwiGZ8DmeYJ2
   9bH7FVF8U0ianPfAaqGuCx2Noauc7OIxVaTzWztvTCT3G8aFgZEH+kvVk
   iMmMvqWQjrsi6P23yGG46L2FJqeH4VqjrwK8mlF36q3pZrWZpoFsIgsKI
   AKJ8GXyWtuHSmNWMNgcDef305bvot1TDTZUYEZIfbJgHEuG+xUGb5V5fb
   Yti6QXzETXGvjUz+nxJp8NPa3xAuvLy/PqIvl67Ua3yG3HYshRlsBGsQP
   g==;
X-CSE-ConnectionGUID: gDXf1lR9Sw67mrUGZ8GFPQ==
X-CSE-MsgGUID: 2V5P3R0SQTamyi/gtaFpCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41205070"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="41205070"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 19:46:29 -0800
X-CSE-ConnectionGUID: 6QCd+HrMRvKZOhlrSbn+2w==
X-CSE-MsgGUID: xgOsL+4uRX+OBjbNPymTzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118728131"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2025 19:46:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpJEb-000JEg-2Z;
	Tue, 04 Mar 2025 03:46:21 +0000
Date: Tue, 4 Mar 2025 11:46:03 +0800
From: kernel test robot <lkp@intel.com>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
	andersson@kernel.org, konradybcio@kernel.org,
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_msavaliy@quicinc.com,
	quic_anupkulk@quicinc.com,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: Re: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
Message-ID: <202503041123.JpkvIp44-lkp@intel.com>
References: <20250303124349.3474185-7-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303124349.3474185-7-quic_vdadhani@quicinc.com>

Hi Viken,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on robh/for-next tty/tty-testing tty/tty-next tty/tty-linus linus/master v6.14-rc5 next-20250303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viken-Dadhaniya/dt-bindings-qcom-geni-se-Add-firmware-name-property-for-firmware-loading/20250303-204936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250303124349.3474185-7-quic_vdadhani%40quicinc.com
patch subject: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem
config: x86_64-buildonly-randconfig-002-20250304 (https://download.01.org/0day-ci/archive/20250304/202503041123.JpkvIp44-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503041123.JpkvIp44-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503041123.JpkvIp44-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/qcom/qcom-geni-se.c:1056: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * geni_enable_interrupts() Enable interrupts.
>> drivers/soc/qcom/qcom-geni-se.c:1255: warning: Function parameter or struct member 'fw_name' not described in 'qup_fw_load'


vim +1056 drivers/soc/qcom/qcom-geni-se.c

  1054	
  1055	/**
> 1056	 * geni_enable_interrupts() Enable interrupts.
  1057	 * @rsc: Pointer to a structure representing SE-related resources.
  1058	 *
  1059	 * Enable the required interrupts during the firmware load process.
  1060	 *
  1061	 * Return: None.
  1062	 */
  1063	static void geni_enable_interrupts(struct qup_se_rsc *rsc)
  1064	{
  1065		u32 reg_value;
  1066	
  1067		/* Enable required interrupts. */
  1068		writel_relaxed(M_COMMON_GENI_M_IRQ_EN, rsc->se->base + GENI_M_IRQ_ENABLE);
  1069	
  1070		reg_value = S_CMD_OVERRUN_EN | S_ILLEGAL_CMD_EN |
  1071					S_CMD_CANCEL_EN | S_CMD_ABORT_EN |
  1072					S_GP_IRQ_0_EN | S_GP_IRQ_1_EN |
  1073					S_GP_IRQ_2_EN | S_GP_IRQ_3_EN |
  1074					S_RX_FIFO_WR_ERR_EN | S_RX_FIFO_RD_ERR_EN;
  1075		writel_relaxed(reg_value, rsc->se->base + GENI_S_IRQ_ENABLE);
  1076	
  1077		/* DMA mode configuration. */
  1078		reg_value = DMA_TX_IRQ_EN_SET_RESET_DONE_EN_SET_BMSK |
  1079			    DMA_TX_IRQ_EN_SET_SBE_EN_SET_BMSK |
  1080			    DMA_TX_IRQ_EN_SET_DMA_DONE_EN_SET_BMSK;
  1081		writel_relaxed(reg_value, rsc->se->base + DMA_TX_IRQ_EN_SET);
  1082		reg_value = DMA_RX_IRQ_EN_SET_FLUSH_DONE_EN_SET_BMSK |
  1083			    DMA_RX_IRQ_EN_SET_RESET_DONE_EN_SET_BMSK |
  1084			    DMA_RX_IRQ_EN_SET_SBE_EN_SET_BMSK |
  1085			    DMA_RX_IRQ_EN_SET_DMA_DONE_EN_SET_BMSK;
  1086		writel_relaxed(reg_value, rsc->se->base + DMA_RX_IRQ_EN_SET);
  1087	}
  1088	
  1089	/**
  1090	 * geni_flash_fw_revision() - Flash the firmware revision.
  1091	 * @rsc: Pointer to a structure representing SE-related resources.
  1092	 * @hdr: Pointer to the ELF header of the Serial Engine.
  1093	 *
  1094	 * Flash the firmware revision and protocol into the respective register.
  1095	 *
  1096	 * Return: None.
  1097	 */
  1098	static void geni_flash_fw_revision(struct qup_se_rsc *rsc, struct elf_se_hdr *hdr)
  1099	{
  1100		u32 reg_value;
  1101	
  1102		/* Flash firmware revision register. */
  1103		reg_value = (hdr->serial_protocol << FW_REV_PROTOCOL_SHFT) |
  1104			    (hdr->fw_version & 0xFF << FW_REV_VERSION_SHFT);
  1105		writel_relaxed(reg_value, rsc->se->base + SE_GENI_FW_REVISION);
  1106	
  1107		reg_value = (hdr->serial_protocol << FW_REV_PROTOCOL_SHFT) |
  1108			    (hdr->fw_version & 0xFF << FW_REV_VERSION_SHFT);
  1109	
  1110		writel_relaxed(reg_value, rsc->se->base + SE_S_FW_REVISION);
  1111	}
  1112	
  1113	/**
  1114	 * geni_load_se_fw() - Load Serial Engine specific firmware.
  1115	 * @rsc: Pointer to a structure representing SE-related resources.
  1116	 * @fw: Pointer to the firmware structure.
  1117	 *
  1118	 * Load the protocol firmware into the IRAM of the Serial Engine.
  1119	 *
  1120	 * Return: 0 if successful, otherwise return an error value.
  1121	 */
  1122	static int geni_load_se_fw(struct qup_se_rsc *rsc, const struct firmware *fw)
  1123	{
  1124		const u32 *fw_val_arr, *cfg_val_arr;
  1125		const u8 *cfg_idx_arr;
  1126		u32 i, reg_value, mask, ramn_cnt;
  1127		int ret;
  1128		struct elf_se_hdr *hdr;
  1129		struct elf32_phdr *phdr;
  1130	
  1131		ret = geni_icc_set_bw(rsc->se);
  1132		if (ret) {
  1133			dev_err(rsc->se->dev, "%s: Failed to set ICC BW %d\n", __func__, ret);
  1134			return ret;
  1135		}
  1136	
  1137		ret = geni_icc_enable(rsc->se);
  1138		if (ret) {
  1139			dev_err(rsc->se->dev, "%s: Failed to enable ICC %d\n", __func__, ret);
  1140			return ret;
  1141		}
  1142	
  1143		ret = geni_se_resources_on(rsc->se);
  1144		if (ret) {
  1145			dev_err(rsc->se->dev, "%s: Failed to enable common clocks %d\n", __func__, ret);
  1146			goto err;
  1147		}
  1148	
  1149		ret = read_elf(rsc, fw, &hdr, &phdr);
  1150		if (ret) {
  1151			dev_err(rsc->se->dev, "%s: ELF parsing failed ret: %d\n", __func__, ret);
  1152			goto err;
  1153		}
  1154	
  1155		fw_val_arr = (const u32 *)((u8 *)hdr + hdr->fw_offset);
  1156		cfg_idx_arr = (const u8 *)hdr + hdr->cfg_idx_offset;
  1157		cfg_val_arr = (const u32 *)((u8 *)hdr + hdr->cfg_val_offset);
  1158	
  1159		geni_config_common_control(rsc);
  1160	
  1161		/* Allows to drive corresponding data according to hardware value. */
  1162		writel_relaxed(0x0, rsc->se->base + GENI_OUTPUT_CTRL);
  1163	
  1164		/* Set SCLK and HCLK to program RAM */
  1165		setbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK |
  1166				GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
  1167		writel_relaxed(0x0, rsc->se->base + SE_GENI_CLK_CTRL);
  1168		clrbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK |
  1169				GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
  1170	
  1171		/* Enable required clocks for DMA CSR, TX and RX. */
  1172		reg_value = DMA_GENERAL_CFG_AHB_SEC_SLV_CLK_CGC_ON_BMSK |
  1173			DMA_GENERAL_CFG_DMA_AHB_SLV_CLK_CGC_ON_BMSK |
  1174			DMA_GENERAL_CFG_DMA_TX_CLK_CGC_ON_BMSK |
  1175			DMA_GENERAL_CFG_DMA_RX_CLK_CGC_ON_BMSK;
  1176	
  1177		setbits32(rsc->se->base + DMA_GENERAL_CFG, reg_value);
  1178	
  1179		/* Let hardware control CGC by default. */
  1180		writel_relaxed(DEFAULT_CGC_EN, rsc->se->base + GENI_CGC_CTRL);
  1181	
  1182		/* Set version of the configuration register part of firmware. */
  1183		writel_relaxed(hdr->cfg_version, rsc->se->base + GENI_INIT_CFG_REVISION);
  1184		writel_relaxed(hdr->cfg_version, rsc->se->base + GENI_S_INIT_CFG_REVISION);
  1185	
  1186		/* Configure GENI primitive table. */
  1187		for (i = 0; i < hdr->cfg_size_in_items; i++)
  1188			writel_relaxed(cfg_val_arr[i],
  1189				       rsc->se->base + GENI_CFG_REG0 + (cfg_idx_arr[i] * sizeof(u32)));
  1190	
  1191		/* Configure condition for assertion of RX_RFR_WATERMARK condition. */
  1192		reg_value = readl_relaxed(rsc->se->base + QUPV3_SE_HW_PARAM_1);
  1193		mask = (reg_value >> RX_FIFO_WIDTH_BIT) & RX_FIFO_WIDTH_MASK;
  1194		writel_relaxed(mask - 2, rsc->se->base + GENI_RX_RFR_WATERMARK_REG);
  1195	
  1196		/* Let hardware control CGC */
  1197		setbits32(rsc->se->base + GENI_OUTPUT_CTRL, DEFAULT_IO_OUTPUT_CTRL_MSK);
  1198	
  1199		ret = geni_configure_xfer_mode(rsc);
  1200		if (ret)
  1201			goto err_resource;
  1202	
  1203		geni_enable_interrupts(rsc);
  1204	
  1205		geni_flash_fw_revision(rsc, hdr);
  1206	
  1207		ramn_cnt = hdr->fw_size_in_items;
  1208		if (hdr->fw_size_in_items % 2 != 0)
  1209			ramn_cnt++;
  1210	
  1211		if (ramn_cnt >= MAX_GENI_CFG_RAMn_CNT)
  1212			goto err_resource;
  1213	
  1214		/* Program RAM address space. */
  1215		memcpy((void *)(rsc->se->base + SE_GENI_CFG_RAMN), fw_val_arr, ramn_cnt * sizeof(u32));
  1216	
  1217		/* Put default values on GENI's output pads. */
  1218		writel_relaxed(0x1, rsc->se->base + GENI_FORCE_DEFAULT_REG);
  1219	
  1220		/* High to low SCLK and HCLK to finish RAM. */
  1221		setbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK |
  1222				GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
  1223		setbits32(rsc->se->base + SE_GENI_CLK_CTRL, GENI_CLK_CTRL_SER_CLK_SEL_BMSK);
  1224		clrbits32(rsc->se->base + GENI_CGC_CTRL, GENI_CGC_CTRL_PROG_RAM_SCLK_OFF_BMSK |
  1225				GENI_CGC_CTRL_PROG_RAM_HCLK_OFF_BMSK);
  1226	
  1227		/* Serial engine DMA interface is enabled. */
  1228		setbits32(rsc->se->base + SE_DMA_IF_EN, DMA_IF_EN_DMA_IF_EN_BMSK);
  1229	
  1230		/* Enable or disable FIFO interface of the serial engine. */
  1231		if (rsc->mode == GENI_SE_FIFO)
  1232			clrbits32(rsc->se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
  1233		else
  1234			setbits32(rsc->se->base + SE_FIFO_IF_DISABLE, FIFO_IF_DISABLE);
  1235	
  1236	err_resource:
  1237		geni_se_resources_off(rsc->se);
  1238	err:
  1239		geni_icc_disable(rsc->se);
  1240		return ret;
  1241	}
  1242	
  1243	/**
  1244	 * qup_fw_load() - Initiate firmware load.
  1245	 * @rsc: Pointer to a structure representing SE-related resources.
  1246	 *
  1247	 * Load the firmware into a specific SE. Read the associated ELF file,
  1248	 * copy the data into a buffer in kernel space using the request_firmware API, write the
  1249	 * data into the SE's IRAM register, and then free the buffers. Handle firmware loading
  1250	 * and parsing for a specific protocol.
  1251	 *
  1252	 * Return: 0 if successful, otherwise return an error value.
  1253	 */
  1254	static int qup_fw_load(struct qup_se_rsc *rsc, const char *fw_name)
> 1255	{
  1256		int ret;
  1257		const struct firmware *fw;
  1258		struct device *dev = rsc->se->dev;
  1259	
  1260		ret = request_firmware(&fw, fw_name, dev);
  1261		if (ret) {
  1262			dev_err(dev, "request_firmware failed for %d: %d\n", rsc->protocol, ret);
  1263			return ret;
  1264		}
  1265	
  1266		ret = geni_load_se_fw(rsc, fw);
  1267	
  1268		release_firmware(fw);
  1269	
  1270		return ret;
  1271	}
  1272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

