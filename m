Return-Path: <linux-i2c+bounces-8342-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5209E4BCE
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 02:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4596E16AAEF
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 01:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DEAB14F9D9;
	Thu,  5 Dec 2024 01:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFmHgBTn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AA584E0A;
	Thu,  5 Dec 2024 01:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733361852; cv=none; b=Dv14q3VuSQrY+WTTD51D3K7YuIxSROSwpPhQalcD407FiHRvf7M2YdlepIhDmAlCTqygAANtABedwR5ojI8tvOy9UTCC2uiutJgo16ziQ9Yi728Z3dAuQUO4jQdBbc2rc/z1b5fi1m4XxiHuGXfBW8dhC0WOu0xVQ51DNHBbYlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733361852; c=relaxed/simple;
	bh=vXMAX9oMuT/ZpTbfNgZ3t32jSx6wr3ZGizmW3Wqmktg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B45qYakJwEqKCUbUmJqTOHXvelEnvPAX/NO5h9AjumWAtHnOmfwzOdn5z9zF1e3JsoGZ9ZeLJeht7WPZt0K7napDKL1LoHIps0O/woutUGloZvTO1t/6v0xpPKXWWITbyPGLL3IAVCWBoItp6TmwuvqL84k9oIkrsj3hn9oslyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFmHgBTn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733361851; x=1764897851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vXMAX9oMuT/ZpTbfNgZ3t32jSx6wr3ZGizmW3Wqmktg=;
  b=YFmHgBTndUz7FYIKsAjf731pbzLN1Z2p/1KR6klmfww009zsalzygCoh
   bpyVa2ibVZo2VrIAqb3vi13IM7eULqu1Fns80eeiIez3g1/yixx3FpQEs
   acDoJSYCh3ZdXBgKyZOxs8nYb3smWQx8MalzepQj18UK4YsoCulQQP6ON
   YMqsQU5atc+H3cMOtKKY7AteRpb4//FQCHlZM/EFkf8SAsVGbQmZ2ytk/
   C6qdf9h8vPnRdYpp5qRSqXc3tSoEeAQFr5TUQd54dZDeMDoM8EtKkZAJn
   7X+W9eYZjUlN9afOZ/8Lnu0q7QJB6am6izOMJ8mfcONMAAMm2zdEV7eTG
   A==;
X-CSE-ConnectionGUID: +6JAY/tOSI+F3v7myNhoGA==
X-CSE-MsgGUID: Nd1lci/CSNW93+Mad4YyHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="59061270"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="59061270"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 17:24:11 -0800
X-CSE-ConnectionGUID: yEnKRKbeSGeTdB0cPbgXxQ==
X-CSE-MsgGUID: gdqRvoNBQ7OoGZn2WA8IBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94125496"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 04 Dec 2024 17:24:05 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ0b5-0003eD-0K;
	Thu, 05 Dec 2024 01:24:03 +0000
Date: Thu, 5 Dec 2024 09:23:04 +0800
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
Message-ID: <202412050806.0jxlVq68-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20241205/202412050806.0jxlVq68-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050806.0jxlVq68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050806.0jxlVq68-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/qcom/qcom-geni-se.c:19:
>> include/linux/soc/qcom/qup-fw-load.h:148:9: warning: "out_be32" redefined
     148 | #define out_be32(a, v) writel_relaxed(v, a)
         |         ^~~~~~~~
   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:8,
                    from drivers/soc/qcom/qcom-geni-se.c:11:
   arch/m68k/include/asm/raw_io.h:32:9: note: this is the location of the previous definition
      32 | #define out_be32(addr,l) (void)((*(__force volatile u32 *) (unsigned long)(addr)) = (l))
         |         ^~~~~~~~
>> include/linux/soc/qcom/qup-fw-load.h:149:9: warning: "in_be32" redefined
     149 | #define in_be32(a) readl_relaxed(a)
         |         ^~~~~~~
   arch/m68k/include/asm/raw_io.h:23:9: note: this is the location of the previous definition
      23 | #define in_be32(addr) \
         |         ^~~~~~~
   drivers/soc/qcom/qcom-geni-se.c: In function 'read_elf':
   drivers/soc/qcom/qcom-geni-se.c:975:23: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     975 |                 *phdr = &phdrs[i];
         |                       ^
   drivers/soc/qcom/qcom-geni-se.c: At top level:
   drivers/soc/qcom/qcom-geni-se.c:1268:5: warning: no previous prototype for 'qup_fw_load' [-Wmissing-prototypes]
    1268 | int qup_fw_load(struct qup_se_rsc *rsc)
         |     ^~~~~~~~~~~


vim +/out_be32 +148 include/linux/soc/qcom/qup-fw-load.h

   147	
 > 148	#define out_be32(a, v) writel_relaxed(v, a)
 > 149	#define in_be32(a) readl_relaxed(a)
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

