Return-Path: <linux-i2c+bounces-10770-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A552AA94C3
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 15:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 808393A4D72
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 13:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841D1259C80;
	Mon,  5 May 2025 13:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkvTsU8G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6795B2561AA;
	Mon,  5 May 2025 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746452697; cv=none; b=QG8rAoTyR+jOLL0HFeV9hvOOM7amA+8Y4qYxJpIKclacpuHwooxwHfxPsBzcEYizHW3uebwVRPf2pGUQpASrdyzP17cqS7OXjQL+YQOQh0Q/hrARuWsESfOTunN4skTk22nwXyNV8YucD2atTokYwNusi1tpOZJ+yftudizP0nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746452697; c=relaxed/simple;
	bh=tvXmTrMlbV/uyUl//wrOaAloL94MOBt9zGN5gBgIYs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbiVlB/ovZcq+zYe0ELsnNxx7uGiLP6YSVd0iSQ/FNGLbOc7RbyYJx/Q/CA/uFgwsvx1hFOziHxPoE8EbIRf2pvxQVnHdWZIeHOXHrh1S//2c3JftEQL13Ki9V3nvlwY0IwAes4y9plRMNK+3hPxdvdRw5HSR2b1nBRVVdJqAKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkvTsU8G; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746452696; x=1777988696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tvXmTrMlbV/uyUl//wrOaAloL94MOBt9zGN5gBgIYs4=;
  b=hkvTsU8GMfkN4Vi4LfDqBYoudNALrfd1G7P5m2vNanlbJmY4QDazIimK
   kiHo8rD16lVo/IdHkWLI0mD3kqVTiHXJlGQlLsMKSxp10k0041iQzFmss
   0bG+27U02qbMArowgm09xfeWqiGwpkEQlQn69MJX/WRLTHYiyLFLV8t+H
   WZnaw64vPgNWCwBnlDCA0vEwYAOzG3iloZFdsric5T4tLGN2BSvfvDa9c
   wX55WCeY5sP13ZbpI4TKtNnqXNecno9m5IX3mnwC+WRqa8gzov+EMHdYw
   Tjk9v9xgPrWB3gzsy/3e8M9QJq43cy2huf/ysNZXgEkEIKahnQOa4fbjs
   A==;
X-CSE-ConnectionGUID: TnExC6r2T7OuiuCUKg7jTA==
X-CSE-MsgGUID: 7FN84kZqSyODCr6yTiFcxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="59452994"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="59452994"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:44:55 -0700
X-CSE-ConnectionGUID: VF7NT8weTueZ2L9N2tgJAg==
X-CSE-MsgGUID: PKzhnYjiSreTpmlerRUWgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="140246991"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 May 2025 06:44:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBw7h-0005lZ-22;
	Mon, 05 May 2025 13:44:45 +0000
Date: Mon, 5 May 2025 21:43:55 +0800
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
Subject: Re: [PATCH v4 2/5] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
Message-ID: <202505052109.5N8caeeW-lkp@intel.com>
References: <20250503111029.3583807-3-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503111029.3583807-3-quic_vdadhani@quicinc.com>

Hi Viken,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on tty/tty-testing tty/tty-next tty/tty-linus broonie-spi/for-next linus/master v6.15-rc5 next-20250505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viken-Dadhaniya/dt-bindings-qcom-se-common-Add-QUP-Peripheral-specific-properties-for-I2C-SPI-and-SERIAL-bus/20250503-191235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250503111029.3583807-3-quic_vdadhani%40quicinc.com
patch subject: [PATCH v4 2/5] soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem
config: sparc64-randconfig-002-20250505 (https://download.01.org/0day-ci/archive/20250505/202505052109.5N8caeeW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250505/202505052109.5N8caeeW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505052109.5N8caeeW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tty/serial/qcom_geni_serial.c:18:
   include/linux/soc/qcom/geni-se.h: In function 'geni_se_read_proto':
>> include/linux/soc/qcom/geni-se.h:351:16: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     351 |         return FIELD_GET(FW_REV_PROTOCOL_MSK, val);
         |                ^~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/soc/qcom/qcom-geni-se.c:21:
   include/linux/soc/qcom/geni-se.h: In function 'geni_se_read_proto':
>> include/linux/soc/qcom/geni-se.h:351:16: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     351 |         return FIELD_GET(FW_REV_PROTOCOL_MSK, val);
         |                ^~~~~~~~~
   drivers/soc/qcom/qcom-geni-se.c: In function 'geni_write_fw_revision':
>> drivers/soc/qcom/qcom-geni-se.c:1042:21: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
    1042 |         reg_value = FIELD_PREP(FW_REV_PROTOCOL_MSK, serial_protocol);
         |                     ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +351 include/linux/soc/qcom/geni-se.h

   338	
   339	/**
   340	 * geni_se_read_proto() - Read the protocol configured for a serial engine
   341	 * @se:		Pointer to the concerned serial engine.
   342	 *
   343	 * Return: Protocol value as configured in the serial engine.
   344	 */
   345	static inline u32 geni_se_read_proto(struct geni_se *se)
   346	{
   347		u32 val;
   348	
   349		val = readl_relaxed(se->base + SE_GENI_FW_REVISION_RO);
   350	
 > 351		return FIELD_GET(FW_REV_PROTOCOL_MSK, val);
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

