Return-Path: <linux-i2c+bounces-3579-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFC88C9133
	for <lists+linux-i2c@lfdr.de>; Sat, 18 May 2024 14:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD7072814CD
	for <lists+linux-i2c@lfdr.de>; Sat, 18 May 2024 12:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDFD3F8E2;
	Sat, 18 May 2024 12:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f892wXxQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E558D3AC2B;
	Sat, 18 May 2024 12:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716036439; cv=none; b=Bsb3+1nLCIOR8qtI6b8LtNNPR+fxpOSUtdYzO8jH96KFGvM6/5g2WHiYYHMagG1DRqLPaYaY5dglxrMykl+3w3w8CunqS9kXuL0IN2pFhiSic9tw4wKQ3RQtumA/rPa9OWtDmJ64oqNIrj7q0mYJYqs4aFqZ6uak59ZUWuHwuVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716036439; c=relaxed/simple;
	bh=XX9dAoIEEtVahs7jrjX3M3GFmseeMUdvSbn5U3vwvgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jsrc3b2EVWU2XIoqnkXI34U2pMQ9voHk8DC63u4YKjpL7rLylT20z2FkHEZz8J9t7OCWv7saFA0jfdveGEv5Mdydz4G07eTVn1FuXRbkFykcNi6IPg1HzHOe+4zsFnC4bAK5P+cOVb5xSWXE8ACnWAgpqiLjXzy7BO2QU6rO8iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f892wXxQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716036438; x=1747572438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XX9dAoIEEtVahs7jrjX3M3GFmseeMUdvSbn5U3vwvgk=;
  b=f892wXxQNae2+OOhYzU7HY/+MvWeaMMTr5xbEFXJxljUHUoAFqhj2/8n
   5N1hRy7U3tj/OL0fgj6uZxv1hQmdDTl3jBRWUK6zUoPQ+tHW/m8EaUZg9
   csRVxZl1tlFs7ll/Pfsfw+V+elecE4EOgfNWzFVdmLSmKzsLOzLA3+Tog
   RMuo8B9IW8kMLTZf87jri2FJm4pBGrBnnSOk6ghGxQCPC3Mnth7iPO9Fg
   6jw49eTLLzvhvjLoeSzxTfp/7TWXuPJJSgTrndWPTtI48hNfKNr4SeuL1
   2lvj6g447KyFSCgCha5ejAzhUyuPToyaW2wTOfizQyYlc9BSuB9Tmd0b6
   Q==;
X-CSE-ConnectionGUID: mIQQ6loUSvWPQeAlGHqkag==
X-CSE-MsgGUID: Qmp6sqfTTOOzKd1YEjd2Pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12327501"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="12327501"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 05:47:17 -0700
X-CSE-ConnectionGUID: 6v6MMXvNR/WRLeM4tPVn7g==
X-CSE-MsgGUID: F9la2JkXQsyzcukD209rTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="36978444"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 May 2024 05:47:10 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8JSu-0002CW-0P;
	Sat, 18 May 2024 12:47:08 +0000
Date: Sat, 18 May 2024 20:46:13 +0800
From: kernel test robot <lkp@intel.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Emil Svendsen <emas@bang-olufsen.dk>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH 01/13] a2b: add A2B driver core
Message-ID: <202405182008.zWMVYQ6g-lkp@intel.com>
References: <20240517-a2b-v1-1-b8647554c67b@bang-olufsen.dk>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517-a2b-v1-1-b8647554c67b@bang-olufsen.dk>

Hi Alvin,

kernel test robot noticed the following build errors:

[auto build test ERROR on c75962170e49f24399141276ae119e6a879f36dc]

url:    https://github.com/intel-lab-lkp/linux/commits/Alvin-ipraga/a2b-add-A2B-driver-core/20240517-211849
base:   c75962170e49f24399141276ae119e6a879f36dc
patch link:    https://lore.kernel.org/r/20240517-a2b-v1-1-b8647554c67b%40bang-olufsen.dk
patch subject: [PATCH 01/13] a2b: add A2B driver core
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240518/202405182008.zWMVYQ6g-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182008.zWMVYQ6g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182008.zWMVYQ6g-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/a2b/a2b.c: In function 'a2b_bus_of_add_node':
>> drivers/a2b/a2b.c:463:16: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     463 |         node = kzalloc(sizeof(*node), GFP_KERNEL);
         |                ^~~~~~~
>> drivers/a2b/a2b.c:463:14: warning: assignment to 'struct a2b_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     463 |         node = kzalloc(sizeof(*node), GFP_KERNEL);
         |              ^
   drivers/a2b/a2b.c: In function 'a2b_node_of_add_func':
>> drivers/a2b/a2b.c:1017:14: warning: assignment to 'struct a2b_func *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1017 |         func = kzalloc(sizeof(*func), GFP_KERNEL);
         |              ^
   drivers/a2b/a2b.c: In function 'a2b_node_release':
>> drivers/a2b/a2b.c:1112:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
    1112 |         kfree(node);
         |         ^~~~~
   cc1: some warnings being treated as errors


vim +/kzalloc +463 drivers/a2b/a2b.c

   444	
   445	static int a2b_bus_of_add_node(struct a2b_bus *bus, struct device_node *np,
   446				       unsigned int addr)
   447	{
   448		struct a2b_node *node;
   449		int ret = 0;
   450	
   451		if (!bus || !np)
   452			return -EINVAL;
   453	
   454		if (addr >= A2B_MAX_NODES)
   455			return -EINVAL;
   456	
   457		if (!of_device_is_available(np))
   458			return -ENODEV;
   459	
   460		if (of_node_test_and_set_flag(np, OF_POPULATED))
   461			return -EBUSY;
   462	
 > 463		node = kzalloc(sizeof(*node), GFP_KERNEL);
   464		if (IS_ERR(node))
   465			return -ENOMEM;
   466	
   467		node->dev.bus = &a2b_bus;
   468		node->dev.type = &a2b_node_type;
   469		node->dev.parent = &bus->dev;
   470		node->dev.of_node = np;
   471		node->dev.fwnode = of_fwnode_handle(np);
   472		dev_set_name(&node->dev, "a2b-%d.%d", bus->id, addr);
   473	
   474		node->bus = bus;
   475		node->addr = addr;
   476	
   477		/*
   478		 * Register the node device. Note that due to asynchronous probing,
   479		 * there is no guarantee that the node driver's probe function has been
   480		 * called just yet. The synchronization point is a2b_register_node(),
   481		 * which should be called unconditionally by node drivers.
   482		 */
   483		ret = device_register(&node->dev);
   484		if (ret)
   485			goto err_put_device;
   486	
   487		return 0;
   488	
   489	err_put_device:
   490		put_device(&node->dev);
   491	
   492		return ret;
   493	}
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

