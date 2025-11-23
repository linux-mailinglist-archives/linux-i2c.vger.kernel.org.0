Return-Path: <linux-i2c+bounces-14237-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE1EC7DF6C
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Nov 2025 11:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 14DB334D058
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Nov 2025 10:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0D82C3261;
	Sun, 23 Nov 2025 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1YJhYT9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A3F299928;
	Sun, 23 Nov 2025 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763893466; cv=none; b=RS0KHFT0x+Vrg3tyIWfHNGwoHb6wmTw+ty18yIVj8aFyhzsLYMBqApk1rJCzy0p7mINC3mwyn2risbfWqkv06eNo/eAtazC9QZpudPhdQAoqnVSFvaYIBBHEu1Hgtf6ONI3P6xUVPB2TuxNG6HHS4SM0oiVR5QSrsHV7YpzHJuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763893466; c=relaxed/simple;
	bh=MqXY389cFH5UMcUPlSXH9uPa/8KZTxgMoJ1/hoC4agI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7xhbgfXxH4QqWqXmnyj3wwzFjeuh0K3FgvBCfVrvEPhV50Kc0M0VHmuZ6TPO2oqQ+1XAkdrnWaJIcnFS4TikxMVpORYAAqPcLCxEsiuSWKVQvc8N8UjfAmAv9ggQtM3g8KVt74fgao3/GP0tr1qSKeaORHmE6Dse225ITxKWsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1YJhYT9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763893464; x=1795429464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MqXY389cFH5UMcUPlSXH9uPa/8KZTxgMoJ1/hoC4agI=;
  b=Q1YJhYT9qlD4IjyzC8q1xaxszM40u+nYMXxyvm8D5YOyeKkP0klmCRWY
   tXDKk1U95nkeqWGaRZW5ho19SbXVnV4JvYXzVaJNiLxreLsR8MgV08KqO
   JYPd+YOCx1U2sFVqoj5LSCMDPLUdCCi1H1a8G3TEMjTKRwVGSL37nG7kh
   yeB8ifU04x0Id0r9gteyq4AMH8DWczPBy1SZ1MhZFXC3kpDoq3kGrhWy3
   fYWP6klGQBTDgnc7n1vNjp4zQTAmRxGouYHq0KKPiGk+KLDok5XJ8lWm8
   a2gucZlyrchrpft1eoOnDa2fxWl7swASRxkwcKgVj4zzzEDYtjPF6Cc84
   Q==;
X-CSE-ConnectionGUID: mz2ovoYBTd6Rb4bd/hcmeA==
X-CSE-MsgGUID: Y3dFu+nLSEiYx+PFWYNt9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="69539478"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="69539478"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 02:24:23 -0800
X-CSE-ConnectionGUID: IOlcPXmdTe2zhrKUUd+6tA==
X-CSE-MsgGUID: wiT+jHJwSv6BnQBDmtjWvA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Nov 2025 02:24:19 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN7GS-0008D1-1r;
	Sun, 23 Nov 2025 10:24:16 +0000
Date: Sun, 23 Nov 2025 18:23:47 +0800
From: kernel test robot <lkp@intel.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
	quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
	quic_shazhuss@quicinc.com
Subject: Re: [PATCH v1 03/12] soc: qcom: geni-se: Introduce helper API for
 resource initialization
Message-ID: <202511231819.jiLYo6Fl-lkp@intel.com>
References: <20251122050018.283669-4-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122050018.283669-4-praveen.talari@oss.qualcomm.com>

Hi Praveen,

kernel test robot noticed the following build errors:

[auto build test ERROR on d724c6f85e80a23ed46b7ebc6e38b527c09d64f5]

url:    https://github.com/intel-lab-lkp/linux/commits/Praveen-Talari/soc-qcom-geni-se-Refactor-geni_icc_get-and-make-qup-memory-ICC-path-optional/20251122-130449
base:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
patch link:    https://lore.kernel.org/r/20251122050018.283669-4-praveen.talari%40oss.qualcomm.com
patch subject: [PATCH v1 03/12] soc: qcom: geni-se: Introduce helper API for resource initialization
config: loongarch-randconfig-002-20251123 (https://download.01.org/0day-ci/archive/20251123/202511231819.jiLYo6Fl-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231819.jiLYo6Fl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231819.jiLYo6Fl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/qcom-geni-se.c:1046:10: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
    1046 |                 return ERR_PTR(ret);
         |                        ^~~~~~~~~~~~
   1 error generated.


vim +1046 drivers/soc/qcom/qcom-geni-se.c

  1015	
  1016	/**
  1017	 * geni_se_resources_init() - Initialize resources for a GENI SE device.
  1018	 * @se: Pointer to the geni_se structure representing the GENI SE device.
  1019	 *
  1020	 * This function initializes various resources required by the GENI Serial Engine
  1021	 * (SE) device, including clock resources (core and SE clocks), interconnect
  1022	 * paths for communication.
  1023	 * It retrieves optional and mandatory clock resources, adds an OF-based
  1024	 * operating performance point (OPP) table, and sets up interconnect paths
  1025	 * with default bandwidths. The function also sets a flag (`has_opp`) to
  1026	 * indicate whether OPP support is available for the device.
  1027	 *
  1028	 * Return: 0 on success, or a negative errno on failure.
  1029	 */
  1030	int geni_se_resources_init(struct geni_se *se)
  1031	{
  1032		int ret;
  1033	
  1034		se->core_clk = devm_clk_get_optional(se->dev, "core");
  1035		if (IS_ERR(se->core_clk))
  1036			return dev_err_probe(se->dev, PTR_ERR(se->core_clk),
  1037					     "Failed to get optional core clk\n");
  1038	
  1039		se->clk = devm_clk_get(se->dev, "se");
  1040		if (IS_ERR(se->clk) && !has_acpi_companion(se->dev))
  1041			return dev_err_probe(se->dev, PTR_ERR(se->clk),
  1042					     "Failed to get SE clk\n");
  1043	
  1044		ret = devm_pm_opp_set_clkname(se->dev, "se");
  1045		if (ret)
> 1046			return ERR_PTR(ret);
  1047	
  1048		ret = devm_pm_opp_of_add_table(se->dev);
  1049		if (ret && ret != -ENODEV)
  1050			return dev_err_probe(se->dev, ret, "Failed to add OPP table\n");
  1051	
  1052		se->has_opp = (ret == 0);
  1053	
  1054		ret = geni_icc_get(se, "qup-memory");
  1055		if (ret)
  1056			return ret;
  1057	
  1058		return geni_icc_set_bw_ab(se, GENI_DEFAULT_BW, GENI_DEFAULT_BW, GENI_DEFAULT_BW);
  1059	}
  1060	EXPORT_SYMBOL_GPL(geni_se_resources_init);
  1061	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

