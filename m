Return-Path: <linux-i2c+bounces-8339-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E10C9E468C
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 22:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21A6E168395
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 21:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F06191F92;
	Wed,  4 Dec 2024 21:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsAOUROv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F5A190696;
	Wed,  4 Dec 2024 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733347428; cv=none; b=CiBokvckQ5bGU5v5ucOjHQGoeItYvKBL5UiA2O21vt/7wBb9Ln/M2wHpRl6zeMe0g9hbrDpNY3ALa0xyN5lAoaF/9V7DfmtNt/0/s4OLJdXGgQxOchsyZqnqYbGWTXZSDF2uVmMZsTazU3eaX3AWyzPOmBHsQFNh66p+Ek12HVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733347428; c=relaxed/simple;
	bh=SYresexVuihEbtFpKspS20LpBlURd+mfZxrEx78+LYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k91dpjaTFxiWGk/8btwHSgytgYX/7Cn+QdGyHcFwfWMEy6yRupAiRy/kfgeHvNpQCKKWtZNgdmFNi6DypffC51jCk4+ecfSPmPSBa53tlw14I/1O+O6VhYLvAkbzeBqtrUmpz4V0F5xaoTSgdRS1g4SRVdcUNZDM6/27fvvm22M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsAOUROv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733347427; x=1764883427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SYresexVuihEbtFpKspS20LpBlURd+mfZxrEx78+LYw=;
  b=KsAOUROvA2XltG8pAJo9MkZEuvjakffRL6HpUZKSZ+mZCx29HyXD/PF1
   hHQbZqR9CiC5YpCLNn8jWXhb6P/LK76CCem0wm2jCW0mxJ1jWOPK6/76i
   4jhL2WmBCMTlD4WwRI4138UEh09nAgEk7WH7XXOO/TCzSFeQN6X8MY8Yv
   LBmNA4lCsJH/Fwa1DcR5ZF8Q1u2yN9+9UyXtQvjAeEjkOfK6SOgVVcGMq
   1TkfPI5wW0sN+B5YMHxvHTyKjgt0/uHbK8XsaScNF6WH/9XHKuoe+EMyb
   /ZkeuUWMnpZP6eq5PiNNFgyz6Pc60zL7L85rSlwvU+htRt1Ao93zh7O/g
   Q==;
X-CSE-ConnectionGUID: zLbDmcKuTA+7np2WNFjWDg==
X-CSE-MsgGUID: lMFSsmScTp2XWj0syw+KBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="36480157"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="36480157"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 13:23:45 -0800
X-CSE-ConnectionGUID: I5msKDoLTuiUgPkb0enNRw==
X-CSE-MsgGUID: +kYhVszvTda+p8e150Savg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="93783615"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Dec 2024 13:23:39 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIwqJ-0003Vq-1m;
	Wed, 04 Dec 2024 21:23:32 +0000
Date: Thu, 5 Dec 2024 05:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
	andersson@kernel.org, konradybcio@kernel.org,
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	=quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v1 4/7] soc: qcom: geni-se:: Add support to load QUP SE
 Firmware via Linux subsystem
Message-ID: <202412050408.rTlLBe7e-lkp@intel.com>
References: <20241204150326.1470749-5-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204150326.1470749-5-quic_vdadhani@quicinc.com>

Hi Viken,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on tty/tty-testing tty/tty-next tty/tty-linus broonie-spi/for-next linus/master v6.13-rc1 next-20241204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viken-Dadhaniya/dt-bindings-i2c-qcom-i2c-geni-Document-DT-properties-for-QUP-firmware-loading/20241204-230736
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20241204150326.1470749-5-quic_vdadhani%40quicinc.com
patch subject: [PATCH v1 4/7] soc: qcom: geni-se:: Add support to load QUP SE Firmware via Linux subsystem
config: x86_64-buildonly-randconfig-003-20241205 (https://download.01.org/0day-ci/archive/20241205/202412050408.rTlLBe7e-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050408.rTlLBe7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050408.rTlLBe7e-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/soc/qcom/qcom-geni-se.c:11:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/soc/qcom/qcom-geni-se.c:975:9: error: assigning to 'struct elf32_phdr *' from 'const struct elf32_phdr *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     975 |                 *phdr = &phdrs[i];
         |                       ^ ~~~~~~~~~
>> drivers/soc/qcom/qcom-geni-se.c:1182:2: warning: variable 'reg_value' is uninitialized when used here [-Wuninitialized]
    1182 |         reg_value |= DMA_GENERAL_CFG_AHB_SEC_SLV_CLK_CGC_ON_BMSK |
         |         ^~~~~~~~~
   drivers/soc/qcom/qcom-geni-se.c:1136:18: note: initialize the variable 'reg_value' to silence this warning
    1136 |         u32 i, reg_value, mask, ramn_cnt;
         |                         ^
         |                          = 0
   drivers/soc/qcom/qcom-geni-se.c:1268:5: warning: no previous prototype for function 'qup_fw_load' [-Wmissing-prototypes]
    1268 | int qup_fw_load(struct qup_se_rsc *rsc)
         |     ^
   drivers/soc/qcom/qcom-geni-se.c:1268:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1268 | int qup_fw_load(struct qup_se_rsc *rsc)
         | ^
         | static 
   3 warnings and 1 error generated.


vim +975 drivers/soc/qcom/qcom-geni-se.c

   946	
   947	/**
   948	 * read_elf: Function to read elf file.
   949	 * @rsc: A pointer to SE resources structure.
   950	 * @fw: A pointer to the fw buffer.
   951	 * @pelfseg: A pointer to SE specific elf header.
   952	 * @phdr: pointer to one of the valid headers from list from fw buffer.
   953	 *
   954	 * This function reads the ELF file and outputs the pointer to header
   955	 * data which contains the FW data and any other details.
   956	 *
   957	 * return: Return 0 if no error, else return error value.
   958	 */
   959	static int read_elf(struct qup_se_rsc *rsc, const struct firmware *fw,
   960			    struct elf_se_hdr **pelfseg, struct elf32_phdr **phdr)
   961	{
   962		const struct elf32_phdr *phdrs;
   963		const struct elf32_hdr *ehdr;
   964		const u8 *addr;
   965		int i;
   966	
   967		ehdr = (struct elf32_hdr *)fw->data;
   968	
   969		if (ehdr->e_phnum < 2)
   970			return -EINVAL;
   971	
   972		phdrs = (struct elf32_phdr *)(ehdr + 1);
   973	
   974		for (i = 0; i < ehdr->e_phnum; i++) {
 > 975			*phdr = &phdrs[i];
   976			if (!elf_phdr_valid(*phdr))
   977				continue;
   978	
   979			if ((*phdr)->p_filesz >= sizeof(struct elf_se_hdr)) {
   980				addr =  fw->data + (*phdr)->p_offset;
   981				*pelfseg = (struct elf_se_hdr *)addr;
   982	
   983				if ((*pelfseg)->magic == MAGIC_NUM_SE &&
   984				    (*pelfseg)->version == 1 &&
   985				    valid_seg_size(*pelfseg, (*phdr)->p_filesz))
   986					if ((*pelfseg)->serial_protocol == rsc->protocol &&
   987					    (*pelfseg)->serial_protocol != GENI_SE_NONE)
   988						return 0;
   989			}
   990		}
   991		return -EINVAL;
   992	}
   993	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

