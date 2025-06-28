Return-Path: <linux-i2c+bounces-11679-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EFEAEC4B0
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jun 2025 05:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C58F17B1FC3
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jun 2025 03:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951B121C18C;
	Sat, 28 Jun 2025 03:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDrCaphj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1D221B8F5;
	Sat, 28 Jun 2025 03:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751082143; cv=none; b=mH4Arz+Wy2X9hfxPkr7EE1aC7juMSnUbR0zxkG3H4sO1Rg592krurQBuOBiQC1+E5vuepbtXTlPE/GXoipjKz5U+gL6vd/YF56ac0wwK0BY7Jc1Tf6LZ1nKI+bGy87GvMe+K2MsTzTXY8g2oFx7bhkTbSV9Rcej5vXEkDTwHsss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751082143; c=relaxed/simple;
	bh=ZuMiblNDBB3gmfKlgVRSbs1ULWOfBMWR7pyd2OHXVaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aemz21msjyl8oCsYTWY7HRY4ewZJSLpe2ur5Qmc/YEnPf0BkYW1XraNDUY+qUOHZNL7YPo9UxrtLjNi3o2lVWJ2ZLQWKrJT+Lof+Nzm7XV+KFGzCJzUGI0I6rzhzmTPeUqfBkR+1XKVpkKNKHBXtiKi+l27xddX+v5KVTH08Fbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDrCaphj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751082142; x=1782618142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZuMiblNDBB3gmfKlgVRSbs1ULWOfBMWR7pyd2OHXVaU=;
  b=QDrCaphjxC9UGBgEUthXMqb0SW0+PSZc2C/xMqEUYs/uXTsB68WqvTuV
   oXmS1JqDclc321XOvNmeP/Wpaf7maA/qKK90yg4Q9bdOkWnO/KzqEFbEt
   Cl0Ulju217S3ttp93et1r9mWgoPEXHNFD6QCskLQiU78wlgNHg1+azG5Z
   d8Zn0ncMRwB4JvEHQ7gNLkcQo2iev42awESFaqxiIPVYYiuxwiCCdKX+D
   OEsLzzKFtOQtvP3+dN+7BHfi2VApkEEjfk37Y+UJp+DDtjIYmvi+2acCp
   ll8RBcJ3T3d+XHc8kzDxuwObo2LAPxrmSREfngVDHJtzWH4ji2479oXNQ
   g==;
X-CSE-ConnectionGUID: WqehKLAxROK0MHtnuB82Jw==
X-CSE-MsgGUID: +yLArHpaRJehm8zwJYhd8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="63993603"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="63993603"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 20:42:21 -0700
X-CSE-ConnectionGUID: SOLbyImkRwSKKMMTn9L0QA==
X-CSE-MsgGUID: rpWeOH2QRN2oLZyU1oViXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="176644191"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jun 2025 20:42:16 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVMSD-000Wks-3B;
	Sat, 28 Jun 2025 03:42:13 +0000
Date: Sat, 28 Jun 2025 11:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mukesh.savaliya@oss.qualcomm.com,
	quic_anupkulk@quicinc.com,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/5] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
Message-ID: <202506281152.eY0YQpxs-lkp@intel.com>
References: <20250624095102.1587580-3-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624095102.1587580-3-viken.dadhaniya@oss.qualcomm.com>

Hi Viken,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on tty/tty-testing tty/tty-next tty/tty-linus broonie-spi/for-next linus/master v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viken-Dadhaniya/dt-bindings-qcom-se-common-Add-QUP-Peripheral-specific-properties-for-I2C-SPI-and-SERIAL-bus/20250624-175308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250624095102.1587580-3-viken.dadhaniya%40oss.qualcomm.com
patch subject: [PATCH v5 2/5] soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem
config: alpha-randconfig-r122-20250628 (https://download.01.org/0day-ci/archive/20250628/202506281152.eY0YQpxs-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250628/202506281152.eY0YQpxs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506281152.eY0YQpxs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/qcom-geni-se.c:941:21: sparse: sparse: cast from restricted __le32
>> drivers/soc/qcom/qcom-geni-se.c:941:21: sparse: sparse: restricted __le32 degrades to integer

vim +941 drivers/soc/qcom/qcom-geni-se.c

   891	
   892	/**
   893	 * geni_read_elf() - Read an ELF file.
   894	 * @se: Pointer to the SE resources structure.
   895	 * @fw: Pointer to the firmware buffer.
   896	 * @pelfseg: Pointer to the SE-specific ELF header.
   897	 *
   898	 * Read the ELF file and output a pointer to the header data, which
   899	 * contains the firmware data and any other details.
   900	 *
   901	 * Return: 0 if successful, otherwise return an error value.
   902	 */
   903	static int geni_read_elf(struct geni_se *se, const struct firmware *fw, struct se_fw_hdr **pelfseg)
   904	{
   905		const struct elf32_hdr *ehdr;
   906		struct elf32_phdr *phdrs, *phdr;
   907		const struct se_fw_hdr *elfseg;
   908		const u8 *addr;
   909		int i;
   910	
   911		if (!fw || fw->size < sizeof(struct elf32_hdr))
   912			return -EINVAL;
   913	
   914		ehdr = (struct elf32_hdr *)fw->data;
   915		phdrs = (struct elf32_phdr *)(ehdr + 1);
   916	
   917		if (ehdr->e_phnum < 2)
   918			return -EINVAL;
   919	
   920		for (i = 0; i < ehdr->e_phnum; i++) {
   921			phdr = &phdrs[i];
   922	
   923			if (fw->size < phdr->p_offset + phdr->p_filesz)
   924				return -EINVAL;
   925	
   926			if (phdr->p_type != PT_LOAD || !phdr->p_memsz)
   927				continue;
   928	
   929			if (MI_PBT_PAGE_MODE_VALUE(phdr->p_flags) != MI_PBT_NON_PAGED_SEGMENT ||
   930			    MI_PBT_SEGMENT_TYPE_VALUE(phdr->p_flags) == MI_PBT_HASH_SEGMENT ||
   931			    MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) == MI_PBT_NOTUSED_SEGMENT ||
   932			    MI_PBT_ACCESS_TYPE_VALUE(phdr->p_flags) == MI_PBT_SHARED_SEGMENT)
   933				continue;
   934	
   935			if (phdr->p_filesz < sizeof(struct se_fw_hdr))
   936				continue;
   937	
   938			addr = fw->data + phdr->p_offset;
   939			elfseg = (const struct se_fw_hdr *)addr;
   940	
 > 941			if (cpu_to_le32(elfseg->magic) != MAGIC_NUM_SE || elfseg->version != 1)
   942				continue;
   943	
   944			if (phdr->p_filesz < elfseg->fw_offset +
   945					     elfseg->fw_size_in_items * sizeof(u32) ||
   946			    phdr->p_filesz < elfseg->cfg_idx_offset +
   947					     elfseg->cfg_size_in_items * sizeof(u8) ||
   948			    phdr->p_filesz < elfseg->cfg_val_offset +
   949					     elfseg->cfg_size_in_items * sizeof(u32))
   950				continue;
   951	
   952			if (elfseg->serial_protocol != se->protocol)
   953				continue;
   954	
   955			*pelfseg = (struct se_fw_hdr *)addr;
   956			return 0;
   957		}
   958		return -EINVAL;
   959	}
   960	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

