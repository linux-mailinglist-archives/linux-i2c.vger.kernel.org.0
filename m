Return-Path: <linux-i2c+bounces-3580-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCE78C913E
	for <lists+linux-i2c@lfdr.de>; Sat, 18 May 2024 14:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDE531C20EE4
	for <lists+linux-i2c@lfdr.de>; Sat, 18 May 2024 12:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871913AC36;
	Sat, 18 May 2024 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7C0JjLS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F41F32C60;
	Sat, 18 May 2024 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716037042; cv=none; b=Xn6dvnAqX5dLahatmW7T9vZr7CDnZ92T2/oGEAqTD2E9jnIMSe1lGEZSLi5dbk+abyAnrn/iQlwIp9DT0OMWd+7oGb2dTaKAmBxknN1ipktKqtHKsJBzblf3dMLVfpy0woiN55fZLSeZ8Vqg3MH8HKM3QJUtnKDqHhvelenGxMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716037042; c=relaxed/simple;
	bh=amiiGJ5NNqNjkmnkE0K+NtLuWVQeOhrXthlSQRlSaks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AevIszVA3q8xtu2X7pRebwWXRUZp2rCKO46k5+r665P6talP+szb0tJiMaozdG4MvoxFL5NJw7pDyqh6C0ar9d6SOUPEy/wWGY/RsIJ3DbBgh7UK7sJQtqXKChKrXk6Moym/dmZlnHAz1pJMEJMjdzIdo9B5/zhtscw5tnLWVyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7C0JjLS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716037041; x=1747573041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=amiiGJ5NNqNjkmnkE0K+NtLuWVQeOhrXthlSQRlSaks=;
  b=D7C0JjLS0j2jtcnHhnv7HC0gDxcSeDqNZM+P7WOfB3y49rcNTaR+0sR7
   aT0Hwnhy1n1sArU6NFhik5LQ3/1FKzuzcTB7yFGg9lqAxZyU8w8Dye5B4
   e7ktp780H4mNS2Rp5SZfFzVfpk8vqv2CrFOJmZF/2AosZW+vTkCxuZ6X5
   tqOO+IF4di1lrZqrki5tqC8Z8a0RpOxFkLYpo/6iOQai/dH6y34A7IX4N
   dSHSGiYThkLEdpd6kD4qtryEG8k/FEgZQyrqs7q4SQf5L7vJdUjYYKo9B
   SyPDa6gQAyZcsigm4Ay/VUzA75KALMzpY5xi2zKb9LLxa80bL3m3GTKFW
   A==;
X-CSE-ConnectionGUID: sPXFANx3S5+AzKai8KlY6g==
X-CSE-MsgGUID: aYnKSi47QUGhamG7cZ2E/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12327820"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="12327820"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 05:57:21 -0700
X-CSE-ConnectionGUID: sAqm9aeATFOOK+cy2MS03w==
X-CSE-MsgGUID: Ms4cj+XzQRaW+DbmkSUwKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="36878887"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 May 2024 05:57:13 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8Jcc-0002Dc-0Y;
	Sat, 18 May 2024 12:57:10 +0000
Date: Sat, 18 May 2024 20:56:30 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH 04/13] a2b: add AD24xx I2C interface driver
Message-ID: <202405182015.49MmB9gp-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240518/202405182015.49MmB9gp-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182015.49MmB9gp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182015.49MmB9gp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/a2b/ad24xx-i2c.c:272:3: error: call to undeclared function 'handle_nested_irq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     272 |                 handle_nested_irq(virq);
         |                 ^
>> drivers/a2b/ad24xx-i2c.c:281:26: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     281 |         struct ad24xx_i2c *ad = irq_data_get_irq_chip_data(irq_data);
         |                                 ^
>> drivers/a2b/ad24xx-i2c.c:281:21: error: incompatible integer to pointer conversion initializing 'struct ad24xx_i2c *' with an expression of type 'int' [-Wint-conversion]
     281 |         struct ad24xx_i2c *ad = irq_data_get_irq_chip_data(irq_data);
         |                            ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/a2b/ad24xx-i2c.c:282:34: error: incomplete definition of type 'struct irq_data'
     282 |         irq_hw_number_t hwirq = irq_data->hwirq;
         |                                 ~~~~~~~~^
   include/linux/irqdomain.h:44:8: note: forward declaration of 'struct irq_data'
      44 | struct irq_data;
         |        ^
   drivers/a2b/ad24xx-i2c.c:289:26: error: call to undeclared function 'irq_data_get_irq_chip_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     289 |         struct ad24xx_i2c *ad = irq_data_get_irq_chip_data(irq_data);
         |                                 ^
   drivers/a2b/ad24xx-i2c.c:289:21: error: incompatible integer to pointer conversion initializing 'struct ad24xx_i2c *' with an expression of type 'int' [-Wint-conversion]
     289 |         struct ad24xx_i2c *ad = irq_data_get_irq_chip_data(irq_data);
         |                            ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/a2b/ad24xx-i2c.c:290:34: error: incomplete definition of type 'struct irq_data'
     290 |         irq_hw_number_t hwirq = irq_data->hwirq;
         |                                 ~~~~~~~~^
   include/linux/irqdomain.h:44:8: note: forward declaration of 'struct irq_data'
      44 | struct irq_data;
         |        ^
>> drivers/a2b/ad24xx-i2c.c:295:30: error: variable has incomplete type 'const struct irq_chip'
     295 | static const struct irq_chip ad24xx_i2c_irq_chip = {
         |                              ^
   include/linux/irqdomain.h:43:8: note: forward declaration of 'struct irq_chip'
      43 | struct irq_chip;
         |        ^
>> drivers/a2b/ad24xx-i2c.c:304:2: error: call to undeclared function 'irq_set_chip_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     304 |         irq_set_chip_data(irq, irqdomain->host_data);
         |         ^
>> drivers/a2b/ad24xx-i2c.c:305:2: error: call to undeclared function 'irq_set_chip_and_handler'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     305 |         irq_set_chip_and_handler(irq, &ad24xx_i2c_irq_chip, handle_simple_irq);
         |         ^
>> drivers/a2b/ad24xx-i2c.c:305:54: error: use of undeclared identifier 'handle_simple_irq'
     305 |         irq_set_chip_and_handler(irq, &ad24xx_i2c_irq_chip, handle_simple_irq);
         |                                                             ^
>> drivers/a2b/ad24xx-i2c.c:306:2: error: call to undeclared function 'irq_set_nested_thread'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     306 |         irq_set_nested_thread(irq, 1);
         |         ^
>> drivers/a2b/ad24xx-i2c.c:307:2: error: call to undeclared function 'irq_set_noprobe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     307 |         irq_set_noprobe(irq);
         |         ^
   drivers/a2b/ad24xx-i2c.c:315:2: error: call to undeclared function 'irq_set_nested_thread'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     315 |         irq_set_nested_thread(irq, 0);
         |         ^
   drivers/a2b/ad24xx-i2c.c:316:2: error: call to undeclared function 'irq_set_chip_and_handler'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     316 |         irq_set_chip_and_handler(irq, NULL, NULL);
         |         ^
   drivers/a2b/ad24xx-i2c.c:317:2: error: call to undeclared function 'irq_set_chip_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     317 |         irq_set_chip_data(irq, NULL);
         |         ^
   16 errors generated.


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
   296		.name = "ad24xx-i2c",
   297		.irq_enable = ad24xx_i2c_irq_enable,
   298		.irq_disable = ad24xx_i2c_irq_disable,
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

