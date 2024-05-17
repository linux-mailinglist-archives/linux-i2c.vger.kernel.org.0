Return-Path: <linux-i2c+bounces-3574-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFAC8C8998
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 17:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A3332896F2
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 15:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F9212F591;
	Fri, 17 May 2024 15:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7AioeaS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747923FBBF;
	Fri, 17 May 2024 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715960964; cv=none; b=N/tk1dmgEyU908sa0MqLrwvqZOFKNGLcfjMlUifaIZUm7us4I0K4LucgvlPM5gCQaH2LcrNy1XQ3wUn+/xelDms8UVCz1qm33Osmlq3ilUt+0cuYucDordrah3xfnNclmxTUBidwQv7/HyoEdvGKbTWOOh4F78RYYSR/UnFmuQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715960964; c=relaxed/simple;
	bh=nYaui3EVpbCs7z9n+UR9+uF/xT8dwlB3DJdTf8Aj4oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGZqkjb+ofo4GxT6HFnBmtoXBTdlPhxuLI7kiS6WiYHytwXDK0MtrnyIsW65hBEcPeylF8zQFlFR6/NjScjjAn1ZjA/8QPCdv95M/cqd2e+D5tpnT/5w0xVxQT3SqW9Cyw4cRRVgbpbo+H6o3UR/9ffk6iLWCyk5EhzMnAIaX6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7AioeaS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715960963; x=1747496963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nYaui3EVpbCs7z9n+UR9+uF/xT8dwlB3DJdTf8Aj4oc=;
  b=h7AioeaS+zbT//bmxNFqq6HaAGJei6ewif7RxAZQMw/+KUtnxR5U1CNU
   tpIvMucbMxEuJqlukgj10TnG4Lk3l83rO+CuBd4msUqEazVZOUVtsqxED
   wut+OhgM1yskvMpqpzIsni5PPtBBngj9sm+bjIOIE/saDJmgugCCFdbwU
   yAv7jdTS188IGTFVMtqO3nkM+ftfaHF+NqGbbVpSzyjam0EXbuCk1icm2
   Hi78kGwvTuCO9A/HgECm6P9w3eaWgKdz1fVdrVkVweOxxDl2chDnA1G1t
   fcyN2QQWG6LlhxCpQJDfDrSMjGEoHZFarFEUhTSbdCz9HyokdX1tNZwfm
   g==;
X-CSE-ConnectionGUID: Bz3J2bQpTBOXUd1NVBFXQg==
X-CSE-MsgGUID: geZwmPhdSKGDT7QuVCA92g==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12256641"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="12256641"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 08:49:22 -0700
X-CSE-ConnectionGUID: gdfmtDVsSuSm4Pk+sKEWcA==
X-CSE-MsgGUID: bJpcJ3KdQRypXWaRp5ZLeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="55053761"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 17 May 2024 08:49:19 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7zpY-0000rx-22;
	Fri, 17 May 2024 15:49:13 +0000
Date: Fri, 17 May 2024 23:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
	alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
	linux-aspeed@lists.ozlabs.org, eajames@linux.ibm.com
Subject: Re: [PATCH v3 37/40] fsi: core: Add different types of CFAM
Message-ID: <202405172346.olJbkgod-lkp@intel.com>
References: <20240516181907.3468796-38-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516181907.3468796-38-eajames@linux.ibm.com>

Hi Eddie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.9 next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/fsi-hub-Set-master-index-to-link-number-plus-one/20240517-023205
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240516181907.3468796-38-eajames%40linux.ibm.com
patch subject: [PATCH v3 37/40] fsi: core: Add different types of CFAM
config: x86_64-randconfig-122-20240517 (https://download.01.org/0day-ci/archive/20240517/202405172346.olJbkgod-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405172346.olJbkgod-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405172346.olJbkgod-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/fsi/fsi-core.c:1113:26: sparse: sparse: symbol 'fsi_get_cfam_type' was not declared. Should it be static?

vim +/fsi_get_cfam_type +1113 drivers/fsi/fsi-core.c

  1112	
> 1113	const struct device_type *fsi_get_cfam_type(u32 id)
  1114	{
  1115		u32 major = (id & 0xf00) >> 8;
  1116		u32 minor = (id & 0xf0) >> 4;
  1117	
  1118		switch (major) {
  1119		case 0x9:
  1120			return &cfam_s_type;
  1121		case 0xc:
  1122			if (minor == 0)
  1123				return &cfam_ody_type;
  1124			fallthrough;
  1125		case 0xd:
  1126		default:
  1127			return &cfam_type;
  1128		}
  1129	}
  1130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

