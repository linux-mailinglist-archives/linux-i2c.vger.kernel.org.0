Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96BF37535C8
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jul 2023 10:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235197AbjGNI42 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jul 2023 04:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234861AbjGNI40 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jul 2023 04:56:26 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC30B198A;
        Fri, 14 Jul 2023 01:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689324985; x=1720860985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ok5m9S9tNiYpBtTdVzy+cagOjCRMaR8lCAXYGVKxQfg=;
  b=YP63YYr0K5F9k00vpm8BnP3GAftxSB2jhJgp1VeImO6hBYV9b7jr0CRE
   SOPhnE8bjI6l51L1lRbVZx2j7W8fDpklMqj/uOuDsQgENu8bfGtP9zuZ7
   4E/Gq4sxekglxun/niZiLrCsDpwKtv+Agbg79SC7KpOan6TBMFe4fG7iv
   GccKiq1RDuqACYWafOdt1vfpEIJfLNICLyYx7Qm8JobBT+wWqcN/Q1UVb
   vUxB1l0RG1S7MUfdB7FYzz6p2aqm9OqJWdxg1QRbDjHCjEH11cmXr/aOx
   9QNcu8F2Q86L1udHvx9mhuY/1Pl62dVJ8Xco/GIYCROEovJyu96zTWVmq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451792678"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="451792678"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 01:56:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="716272281"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="716272281"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 14 Jul 2023 01:56:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qKEaz-002bnE-0k;
        Fri, 14 Jul 2023 11:56:13 +0300
Date:   Fri, 14 Jul 2023 11:56:12 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ryan Chen <ryan_chen@aspeedtech.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "=linux-kernel@vger.kernel.org" <=linux-kernel@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Message-ID: <ZLENrPhQZe5NN1E4@smile.fi.intel.com>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <eda7789d-a603-d565-c9da-edfe9493a05d@linaro.org>
 <SEZPR06MB5269EB586319B3333CD96010F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR06MB5269EB586319B3333CD96010F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 14, 2023 at 08:08:48AM +0000, Ryan Chen wrote:
> On 14/07/2023 09:45, Ryan Chen wrote:

...

> > +	ret = devm_i2c_add_adapter(dev, &i2c_bus->adap);
> > +	if (ret)
> > +		return ret;

...

> > +	i2c_del_adapter(&i2c_bus->adap);
> 
> > I have doubts that you tested this. I think you have here double free/del of the adapter.
> Sorry, i can't catch your point for double free the adapter.
> It should use i2c_del_adapter in driver remove function.
> All the driver doing this 
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7xx.c#L2373
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-altera.c#L473
> 
> Do you mean it is not necessary? 

I'm wondering if you understand what you are doing...

-- 
With Best Regards,
Andy Shevchenko


