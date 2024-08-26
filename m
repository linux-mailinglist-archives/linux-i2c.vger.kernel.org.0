Return-Path: <linux-i2c+bounces-5802-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2538B95F0E3
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 14:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C427C1F24B69
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 12:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7594B185931;
	Mon, 26 Aug 2024 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5qdoPn+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5973817CA19;
	Mon, 26 Aug 2024 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724674047; cv=none; b=PxQMSIZRHG9XqmdZF7ZUanGiPeUM+8KVSlH0+DqlfMry3lQlMFZz/5uyqX0vemmJt0WsIEuZFfcEG/mZ28GUuHfUrT4hRJvoop7iHi+KQoo+sXv+Alv+vdIB/Jx2EiuiibW6q5qOLzcRRDvGahLQYGy5sStiscnvfCpHWVeI1oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724674047; c=relaxed/simple;
	bh=Q6zAaais8yQO7/lj2YLHErYNNLiGQAdftv65IYjCPsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omhIGpvz+BHKSCjZJxfNKEuw60/OTjXG1r4Bod8oYpM36/vzT0n9wFg0aEPIHjRipSUTLTgh0XldbmQMg1xwwM0OsEvw8uXjEgCG0fV+EGZ4VOXOKYgQlnS0FrMANUz3YF3ySySGCh3ixPaUWU7/5j+OCClj2xap5mDrQJ4djsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5qdoPn+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724674045; x=1756210045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q6zAaais8yQO7/lj2YLHErYNNLiGQAdftv65IYjCPsw=;
  b=d5qdoPn+Q94cRCE5oAadHP8SujJL0IAgAxtiodUlmUooNRQ9vby7y80W
   MCNZqdgkhzTZEI1jKHAlwjJK9newP9E+1CRbeurjuBkf209L9sLzatU3m
   ep/otGtv6MD9Y/p4eyx+0KOHFQ5gH2kuUD2Oh1QvljIiDo5ONMwu5toUy
   rysf+TGJ3Qb+jKG2tGOVTkxMWr0v7xG0biR9GhnLYARiQToMYiljAVks1
   y0J7AIERsMARBrgv1/E4894ZcyKE/XzsJ9s5BncnEmZhvh5ujQHDO0MsD
   gTRv1dG9ZeKwkOz8BlX0H4XQZmnwibfBCFYwR0dEi1v6DVczWikVBYA7l
   w==;
X-CSE-ConnectionGUID: 3KmSvIr3R+SGQ97I+0vbWg==
X-CSE-MsgGUID: 6s7eMsitSkKO2j4sNh5BcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33754873"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="33754873"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 05:07:05 -0700
X-CSE-ConnectionGUID: Yra7qN0AQKaieBzWERPjtA==
X-CSE-MsgGUID: WsjGkh2XSXCcq71a+8i8ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="63010400"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Aug 2024 05:07:01 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siYUs-000H0x-0n;
	Mon, 26 Aug 2024 12:06:58 +0000
Date: Mon, 26 Aug 2024 20:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <202408261956.PHxQEruO-lkp@intel.com>
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
[also build test ERROR on robh/for-next wsa/i2c/for-next linus/master v6.11-rc5 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/of-dynamic-Add-of_changeset_update_prop_string/20240826-105737
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20240822092006.3134096-3-wenst%40chromium.org
patch subject: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup code to of_regulator.c
config: parisc-randconfig-002-20240826 (https://download.01.org/0day-ci/archive/20240826/202408261956.PHxQEruO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408261956.PHxQEruO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408261956.PHxQEruO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/regulator/helpers.c:17:
   drivers/regulator/internal.h: In function 'of_regulator_dev_lookup':
>> drivers/regulator/internal.h:87:16: error: returning 'int' from a function with return type 'struct regulator_dev *' makes pointer from integer without a cast [-Wint-conversion]
      87 |         return -ENODEV;
         |                ^


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

