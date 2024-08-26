Return-Path: <linux-i2c+bounces-5807-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9C495F2C4
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 15:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFA471C21C17
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 13:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A8E188586;
	Mon, 26 Aug 2024 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDdlMTYS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C275A185931;
	Mon, 26 Aug 2024 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724678412; cv=none; b=EymA3MTgApelYrxPP0qUp2aXE4KO6OspAkC0UG38MgD7L2szZoFcodx1K1AIqJa2wYpE2bQBOBc5dC6xW2QjFPiZ0FLktoXdwbdoXGHBkQGkZWwsw2MSKlQL2UPHmx46n2jyKJIIvtMKjl7ZkeXllZrHuNuy7F/J/6NLRk0CHL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724678412; c=relaxed/simple;
	bh=E3jqWk0quNbd2DIIwzH2hsPPy6kfLMiKIT4k5BaQN9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gx4iFsDeeYbXaoxqJKlkiH+HUQLbN7a+MYsMo0dscPOWXi2wH8HQExRblaActPyTXmLEg0yqrQ3XKypwrZ6LTdvyUBwQHFBNfQ5SnTEPkE+8WDRm2NRI+4UYOUWy2mAaMXIPbSjPu7La4zu5Om+74VcF06SPKHQvA+cCiyfT4Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDdlMTYS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724678411; x=1756214411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E3jqWk0quNbd2DIIwzH2hsPPy6kfLMiKIT4k5BaQN9I=;
  b=BDdlMTYSrbAdSIAZbPrLYbKe29DYXKM7yhNL1zqzak1+yKQ6f55caLU0
   1wDrLtdtjDFJ8QX18QDd6RLzUvFsaoSqWwMjXgaLoTnIlAEGxJvEkBJGh
   ZhllLEdFeyzvmI9aoJd3Ct2A7Tgdwa4QOZo8Qj7IiLHWYxY02NrPn0LT1
   1giLXaksqM3ry4trM202DlxxIIWomMtEMT94ID7I186Toa3MJHOXOVrLW
   wuaIf0CuMz8SFSUNDBAAV8j9Bg9KuajdSSnaZtcyw+aQiJ3Qg55Ks+Rsz
   6sBp1D/tddxeV4uReZOQVS7/NKpzKlGPXlQAKWpL6bh13i0wk4HGv51kJ
   A==;
X-CSE-ConnectionGUID: ph89QIMgQjiPmUs+r8nZ+Q==
X-CSE-MsgGUID: 6fXFDkHDQBCp94/VqLlGpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23266504"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="23266504"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 06:20:10 -0700
X-CSE-ConnectionGUID: pEF2z3PSSqO4UPPXQmj/yQ==
X-CSE-MsgGUID: J7nWDYN7R/mm5vWIQnhyiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93233605"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 06:20:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siZdb-000H6x-0H;
	Mon, 26 Aug 2024 13:20:03 +0000
Date: Mon, 26 Aug 2024 21:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <202408262013.YYc4obi2-lkp@intel.com>
References: <20240822092006.3134096-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-3-wenst@chromium.org>

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on robh/for-next wsa/i2c/for-next linus/master v6.11-rc5 next-20240826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/of-dynamic-Add-of_changeset_update_prop_string/20240826-105737
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20240822092006.3134096-3-wenst%40chromium.org
patch subject: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup code to of_regulator.c
config: i386-buildonly-randconfig-003-20240826 (https://download.01.org/0day-ci/archive/20240826/202408262013.YYc4obi2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408262013.YYc4obi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408262013.YYc4obi2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/regulator/devres.c:15:
>> drivers/regulator/internal.h:87:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct regulator_dev *' [-Wint-conversion]
      87 |         return -ENODEV;
         |                ^~~~~~~
   1 error generated.


vim +87 drivers/regulator/internal.h

    82	
    83	#else
    84	static inline struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
    85								    const char *supply)
    86	{
  > 87		return -ENODEV;
    88	}
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

