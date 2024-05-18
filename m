Return-Path: <linux-i2c+bounces-3581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6388C917C
	for <lists+linux-i2c@lfdr.de>; Sat, 18 May 2024 17:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77243282248
	for <lists+linux-i2c@lfdr.de>; Sat, 18 May 2024 15:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D28F45028;
	Sat, 18 May 2024 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDERuJWT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141A33B1AB;
	Sat, 18 May 2024 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716044586; cv=none; b=u5fL42RrSXphUlMPy/hz1OpdmPZ9GARa5D8BezghxbgCx2DDsk75dMXsWySwgGV0H12p68xyDSUkRgPDOGqJ/A8umDjJ0Z0iyc4sO1nPIg68qGWk9lO6TkizB3Psnbjet8DXlKJa1YVt5MrsGsKYkClqp7fk7/DHOj7w/kFUCPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716044586; c=relaxed/simple;
	bh=T++rJxpdtYlVGykuO7HeCju3qfjYFKNtMtwqzSPJQAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAoEjVgDZtTCbJjpWLvJmnWge7uyyxJ83Hj6hCFrqiVyjkc62Q50dT7/IiEtHsG5cF1LbgmBwXfjnePBiBwG9ZfExvqsFWc4fsN/u679MPegDW2QU5nhxQPqg3Rp03gZbiCs+SkZlV+5FSV2QfEFHRzIVRJVBn4eJxS8+BOUMBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDERuJWT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716044584; x=1747580584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T++rJxpdtYlVGykuO7HeCju3qfjYFKNtMtwqzSPJQAY=;
  b=GDERuJWTNdXLeWge/7/RfFmA5V+0SbcYwbT9JykdW4OyfYSHNlCV2lD6
   1muaObtggnr/j5KWHfo+V37V9VnZLfyZtPuCqPooDOLUYqxHjuW9+UWij
   /1ojoS8Cl+dWuU6b0Am99YfIF9PYmRTx+nN2YUscbqTPOxoLEW3Hc0VAj
   T0vpg90ZxTl++6aJUD4TOHu6RMIRpOXUdOGOM5Y5I+G5Fb/gyhUcHmoAx
   ppdzamqQ0nRS+KmnpO/pi0JP+ZBG3xorvkq0ESkyUUjnTpqrlLz6R8zHO
   6fklMZ+leHEjwNl5F+BcDGi29BOMnbcN5FCEKjCBsaU7k9HIHc09DVQ/f
   Q==;
X-CSE-ConnectionGUID: A9nSvUokSXWkGk3ou97Pww==
X-CSE-MsgGUID: 14ZAwKj5TN2C5MVLH9inFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12437514"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="12437514"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 08:03:03 -0700
X-CSE-ConnectionGUID: DLeP4KshTZ+MuSy65M+qZg==
X-CSE-MsgGUID: FRKinAjcQD2OloZYfV2sGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="32658105"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 May 2024 08:02:58 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8LaI-0002J8-2e;
	Sat, 18 May 2024 15:02:54 +0000
Date: Sat, 18 May 2024 23:02:10 +0800
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
Subject: Re: [PATCH 04/13] a2b: add AD24xx I2C interface driver
Message-ID: <202405182210.oMSzcs2I-lkp@intel.com>
References: <20240517-a2b-v1-4-b8647554c67b@bang-olufsen.dk>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517-a2b-v1-4-b8647554c67b@bang-olufsen.dk>

Hi Alvin,

kernel test robot noticed the following build errors:

[auto build test ERROR on c75962170e49f24399141276ae119e6a879f36dc]

url:    https://github.com/intel-lab-lkp/linux/commits/Alvin-ipraga/a2b-add-A2B-driver-core/20240517-211849
base:   c75962170e49f24399141276ae119e6a879f36dc
patch link:    https://lore.kernel.org/r/20240517-a2b-v1-4-b8647554c67b%40bang-olufsen.dk
patch subject: [PATCH 04/13] a2b: add AD24xx I2C interface driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240518/202405182210.oMSzcs2I-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182210.oMSzcs2I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182210.oMSzcs2I-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/a2b/ad24xx-i2c.c: In function 'ad24xx_i2c_irq_handler':
>> drivers/a2b/ad24xx-i2c.c:272:17: error: implicit declaration of function 'handle_nested_irq' [-Werror=implicit-function-declaration]
     272 |                 handle_nested_irq(virq);
         |                 ^~~~~~~~~~~~~~~~~
   drivers/a2b/ad24xx-i2c.c: In function 'ad24xx_i2c_irq_enable':
>> drivers/a2b/ad24xx-i2c.c:281:33: error: implicit declaration of function 'irq_data_get_irq_chip_data'; did you mean 'irq_domain_get_irq_data'? [-Werror=implicit-function-declaration]
     281 |         struct ad24xx_i2c *ad = irq_data_get_irq_chip_data(irq_data);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 irq_domain_get_irq_data
>> drivers/a2b/ad24xx-i2c.c:281:33: warning: initialization of 'struct ad24xx_i2c *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> drivers/a2b/ad24xx-i2c.c:282:41: error: invalid use of undefined type 'struct irq_data'
     282 |         irq_hw_number_t hwirq = irq_data->hwirq;
         |                                         ^~
   drivers/a2b/ad24xx-i2c.c: In function 'ad24xx_i2c_irq_disable':
   drivers/a2b/ad24xx-i2c.c:289:33: warning: initialization of 'struct ad24xx_i2c *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     289 |         struct ad24xx_i2c *ad = irq_data_get_irq_chip_data(irq_data);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/a2b/ad24xx-i2c.c:290:41: error: invalid use of undefined type 'struct irq_data'
     290 |         irq_hw_number_t hwirq = irq_data->hwirq;
         |                                         ^~
   drivers/a2b/ad24xx-i2c.c: At top level:
>> drivers/a2b/ad24xx-i2c.c:295:21: error: variable 'ad24xx_i2c_irq_chip' has initializer but incomplete type
     295 | static const struct irq_chip ad24xx_i2c_irq_chip = {
         |                     ^~~~~~~~
>> drivers/a2b/ad24xx-i2c.c:296:10: error: 'const struct irq_chip' has no member named 'name'
     296 |         .name = "ad24xx-i2c",
         |          ^~~~
>> drivers/a2b/ad24xx-i2c.c:296:17: warning: excess elements in struct initializer
     296 |         .name = "ad24xx-i2c",
         |                 ^~~~~~~~~~~~
   drivers/a2b/ad24xx-i2c.c:296:17: note: (near initialization for 'ad24xx_i2c_irq_chip')
>> drivers/a2b/ad24xx-i2c.c:297:10: error: 'const struct irq_chip' has no member named 'irq_enable'
     297 |         .irq_enable = ad24xx_i2c_irq_enable,
         |          ^~~~~~~~~~
   drivers/a2b/ad24xx-i2c.c:297:23: warning: excess elements in struct initializer
     297 |         .irq_enable = ad24xx_i2c_irq_enable,
         |                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/a2b/ad24xx-i2c.c:297:23: note: (near initialization for 'ad24xx_i2c_irq_chip')
>> drivers/a2b/ad24xx-i2c.c:298:10: error: 'const struct irq_chip' has no member named 'irq_disable'
     298 |         .irq_disable = ad24xx_i2c_irq_disable,
         |          ^~~~~~~~~~~
   drivers/a2b/ad24xx-i2c.c:298:24: warning: excess elements in struct initializer
     298 |         .irq_disable = ad24xx_i2c_irq_disable,
         |                        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/a2b/ad24xx-i2c.c:298:24: note: (near initialization for 'ad24xx_i2c_irq_chip')
   drivers/a2b/ad24xx-i2c.c: In function 'ad24xx_i2c_irqdomain_map':
>> drivers/a2b/ad24xx-i2c.c:304:9: error: implicit declaration of function 'irq_set_chip_data' [-Werror=implicit-function-declaration]
     304 |         irq_set_chip_data(irq, irqdomain->host_data);
         |         ^~~~~~~~~~~~~~~~~
>> drivers/a2b/ad24xx-i2c.c:305:9: error: implicit declaration of function 'irq_set_chip_and_handler' [-Werror=implicit-function-declaration]
     305 |         irq_set_chip_and_handler(irq, &ad24xx_i2c_irq_chip, handle_simple_irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/a2b/ad24xx-i2c.c:305:61: error: 'handle_simple_irq' undeclared (first use in this function)
     305 |         irq_set_chip_and_handler(irq, &ad24xx_i2c_irq_chip, handle_simple_irq);
         |                                                             ^~~~~~~~~~~~~~~~~
   drivers/a2b/ad24xx-i2c.c:305:61: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/a2b/ad24xx-i2c.c:306:9: error: implicit declaration of function 'irq_set_nested_thread' [-Werror=implicit-function-declaration]
     306 |         irq_set_nested_thread(irq, 1);
         |         ^~~~~~~~~~~~~~~~~~~~~
>> drivers/a2b/ad24xx-i2c.c:307:9: error: implicit declaration of function 'irq_set_noprobe' [-Werror=implicit-function-declaration]
     307 |         irq_set_noprobe(irq);
         |         ^~~~~~~~~~~~~~~
   drivers/a2b/ad24xx-i2c.c: At top level:
>> drivers/a2b/ad24xx-i2c.c:295:30: error: storage size of 'ad24xx_i2c_irq_chip' isn't known
     295 | static const struct irq_chip ad24xx_i2c_irq_chip = {
         |                              ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/handle_nested_irq +272 drivers/a2b/ad24xx-i2c.c

   218	
   219	static irqreturn_t ad24xx_i2c_irq_handler(int irq, void *data)
   220	{
   221		struct ad24xx_i2c *ad = data;
   222		bool handled = false;
   223		unsigned long hwirq;
   224		unsigned int val;
   225		unsigned int virq;
   226		int ret;
   227	
   228		/*
   229		 * The transceiver asserts the IRQ line as long as there are pending
   230		 * interrupts. Process them all here so that the interrupt can be
   231		 * configured with an edge trigger.
   232		 */
   233		while (true) {
   234			mutex_lock(&ad->mutex);
   235			ret = regmap_read(ad->base_regmap, A2B_INTSRC, &val);
   236			mutex_unlock(&ad->mutex);
   237			if (ret) {
   238				dev_err_ratelimited(
   239					ad->dev,
   240					"failed to read interrupt source: %d\n", ret);
   241				break;
   242			}
   243	
   244			if (val & A2B_INTSRC_MSTINT_MASK)
   245				hwirq = 0;
   246			else if (val & A2B_INTSRC_SLVINT_MASK)
   247				hwirq = (val & A2B_INTSRC_INODE_MASK) + 1;
   248			else
   249				break;
   250	
   251			/*
   252			 * Pending interrupts are only cleared when reading the
   253			 * interrupt type. Normally this is done in the corresponding
   254			 * node's interrupt handler, but in case the interrupt is
   255			 * disabled, it has to be read here.
   256			 */
   257			if (!(BIT(hwirq) & ad->irqs_enabled)) {
   258				ret = ad24xx_i2c_get_inttype(&ad->a2b_bus, &val);
   259				if (ret)
   260					dev_err_ratelimited(
   261						ad->dev,
   262						"failed to read interrupt type: %d\n",
   263						ret);
   264				handled = true;
   265				continue;
   266			}
   267	
   268			virq = irq_find_mapping(ad->irqdomain, hwirq);
   269			if (!virq)
   270				break;
   271	
 > 272			handle_nested_irq(virq);
   273			handled = true;
   274		}
   275	
   276		return handled ? IRQ_HANDLED : IRQ_NONE;
   277	}
   278	
   279	static void ad24xx_i2c_irq_enable(struct irq_data *irq_data)
   280	{
 > 281		struct ad24xx_i2c *ad = irq_data_get_irq_chip_data(irq_data);
 > 282		irq_hw_number_t hwirq = irq_data->hwirq;
   283	
   284		ad->irqs_enabled |= BIT(hwirq);
   285	}
   286	
   287	static void ad24xx_i2c_irq_disable(struct irq_data *irq_data)
   288	{
   289		struct ad24xx_i2c *ad = irq_data_get_irq_chip_data(irq_data);
   290		irq_hw_number_t hwirq = irq_data->hwirq;
   291	
   292		ad->irqs_enabled &= ~BIT(hwirq);
   293	}
   294	
 > 295	static const struct irq_chip ad24xx_i2c_irq_chip = {
 > 296		.name = "ad24xx-i2c",
 > 297		.irq_enable = ad24xx_i2c_irq_enable,
 > 298		.irq_disable = ad24xx_i2c_irq_disable,
   299	};
   300	
   301	static int ad24xx_i2c_irqdomain_map(struct irq_domain *irqdomain,
   302					    unsigned int irq, irq_hw_number_t hwirq)
   303	{
 > 304		irq_set_chip_data(irq, irqdomain->host_data);
 > 305		irq_set_chip_and_handler(irq, &ad24xx_i2c_irq_chip, handle_simple_irq);
 > 306		irq_set_nested_thread(irq, 1);
 > 307		irq_set_noprobe(irq);
   308	
   309		return 0;
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

