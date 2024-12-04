Return-Path: <linux-i2c+bounces-8338-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EC49E462D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 21:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BF63B3D7CD
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 20:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A12E1F540A;
	Wed,  4 Dec 2024 20:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8lm2Enu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961A21F1316;
	Wed,  4 Dec 2024 20:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733343617; cv=none; b=M8a3wKHxnvP81mTGOx5hcVBRi1iFdDh2hQrIhn40S4aj919wOmq6p1/EgtRWqCn5aO2DwuJhyVVru2BHuy+IY5MgcX8JfRKnAzC6j9PXSejtl9VKGXcJBkOTv+/PNbm1eFMbdLZs3XOqXQhtlBDwPly519XKARpORUrTiOoiFSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733343617; c=relaxed/simple;
	bh=2DwAxXKr5OmgZNqp/rw57rkElXZOOYwlLMtsGH2s168=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UD68N60d+sJbWJd50e3Xd33ApvWkVMqAnwapFo8fz/bALE8xYJqRc7G6SvqsgoFHWI0nOewfPdPRq7Itmq0WIOBAHjFYsENsGCxaDNlJjHZkmksFyF974dNVKIv1I0P7a2eREeQz+WUnpss9CKeWBSbfC2YfLwhnoXIuA9FciNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8lm2Enu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733343616; x=1764879616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2DwAxXKr5OmgZNqp/rw57rkElXZOOYwlLMtsGH2s168=;
  b=M8lm2EnuJ0A1mAPggTtULvCr0HyMm8n5UMxEj1yZuzhfzAbkQQPjHo3v
   yiF7Qsl2a9USGG2xcEv3PirZIW5klCmMmrVoLM8MMeRQBcCBTe1hn4EW+
   0nlIiGtWUO/I7JKtRbUsITLkxRM7lPb0TTXVWSs/ZYXnTrquxB9c8NtgW
   XGw7Xp8tYThoVzhkiWYrh3APMfxpgtsazlVNrByxouKkrx0X3YdaMwnTO
   s0cXaeZkauDM1uHqtsF76gECj+cIbjyVYH5Q3HxaTh/jxnZ7Oerf3dk9B
   7JkaJr45J88t1fMQjRPWMFVxfXFC9FOgXrD88R25CIWXCZZwSr0vX7yaQ
   w==;
X-CSE-ConnectionGUID: D333gxziSWa6AoiQmKwpAw==
X-CSE-MsgGUID: SoWwH3IQRXy/m68ZNPLIKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44664944"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="44664944"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 12:20:15 -0800
X-CSE-ConnectionGUID: IU3ZpTEuTOejbQP8wEFewg==
X-CSE-MsgGUID: bE2DErQ6T+qJMIn+xvSW/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="93773478"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Dec 2024 12:20:09 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIvqs-0003SH-1D;
	Wed, 04 Dec 2024 20:20:02 +0000
Date: Thu, 5 Dec 2024 04:19:25 +0800
From: kernel test robot <lkp@intel.com>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
	andersson@kernel.org, konradybcio@kernel.org,
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, =quic_msavaliy@quicinc.com,
	quic_anupkulk@quicinc.com,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v1 4/7] soc: qcom: geni-se:: Add support to load QUP SE
 Firmware via Linux subsystem
Message-ID: <202412050429.SJvNsU2f-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on tty/tty-testing tty/tty-next tty/tty-linus broonie-spi/for-next linus/master v6.13-rc1 next-20241204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viken-Dadhaniya/dt-bindings-i2c-qcom-i2c-geni-Document-DT-properties-for-QUP-firmware-loading/20241204-230736
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20241204150326.1470749-5-quic_vdadhani%40quicinc.com
patch subject: [PATCH v1 4/7] soc: qcom: geni-se:: Add support to load QUP SE Firmware via Linux subsystem
config: arm-randconfig-002 (https://download.01.org/0day-ci/archive/20241205/202412050429.SJvNsU2f-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050429.SJvNsU2f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050429.SJvNsU2f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/qcom/qcom-geni-se.c: In function 'read_elf':
>> drivers/soc/qcom/qcom-geni-se.c:975:23: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     975 |                 *phdr = &phdrs[i];
         |                       ^
   drivers/soc/qcom/qcom-geni-se.c: At top level:
   drivers/soc/qcom/qcom-geni-se.c:1268:5: warning: no previous prototype for 'qup_fw_load' [-Wmissing-prototypes]
    1268 | int qup_fw_load(struct qup_se_rsc *rsc)
         |     ^~~~~~~~~~~


vim +/const +975 drivers/soc/qcom/qcom-geni-se.c

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

