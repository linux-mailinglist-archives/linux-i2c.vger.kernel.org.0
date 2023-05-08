Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6E16FB038
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 14:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234233AbjEHMiR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 08:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233885AbjEHMiQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 08:38:16 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 620F938F2A;
        Mon,  8 May 2023 05:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683549490; x=1715085490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TGcBs2WMT86YIl2FW8BGGb2rDomhZlvsCn9sqxbnMAI=;
  b=ZBoJT4slsjhYJpnFDUZvd41ehz1Md5wkogKECTZ2xKyotvfyjWz008a3
   1lk04J1bpMzAjvqpbTj1LOV2R54o7SePQlI8H46ULcPyvueRgoSeCdbPk
   NVhMETH3U/E64K97EhpcNLrDREgcGDV+JcOIskl4jVzG5ey56uAG9BBzc
   4WftOKdYORR+e8A/r7zjZrVYXEGcEN8cenKnxabIjm417JjkOeD9hNrYe
   8jUUFW9EOk4T1/dVia0fjdWHaDr8xrUfjAqeBjCiVUpbPiltkFvwW5E8q
   kk7By/NsR5tQwWvmzSZ9VlnFoFpRYZJL/MTnn/M7ssbQlpH+rNYYodkZe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="377724348"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="377724348"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 05:38:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="822653340"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="822653340"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 08 May 2023 05:38:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pw07t-00ArL0-0V;
        Mon, 08 May 2023 15:38:01 +0300
Date:   Mon, 8 May 2023 15:38:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ryan Chen <ryan_chen@aspeedtech.com>
Cc:     "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
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
Subject: Re: [PATCH v11 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Message-ID: <ZFjtKNtR3zveNIvY@smile.fi.intel.com>
References: <20230430041712.3247998-1-ryan_chen@aspeedtech.com>
 <20230430041712.3247998-3-ryan_chen@aspeedtech.com>
 <ZFFzRL/+73Ftix4Q@smile.fi.intel.com>
 <SEZPR06MB526906C3DAFFE0A8FA924AA7F2709@SEZPR06MB5269.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR06MB526906C3DAFFE0A8FA924AA7F2709@SEZPR06MB5269.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, May 07, 2023 at 02:21:10AM +0000, Ryan Chen wrote:
> > On Sun, Apr 30, 2023 at 12:17:12PM +0800, Ryan Chen wrote:

...

> > > +#define AST2600_GLOBAL_INIT				\
> > > +			(AST2600_I2CG_CTRL_NEW_REG |	\
> > > +			AST2600_I2CG_CTRL_NEW_CLK_DIV)
> > 
> > Make just a one TAB and put the last two lines on the single one.
> 
> Update by following. 
> 
> #define AST2600_GLOBAL_INIT		\
> 	(AST2600_I2CG_CTRL_NEW_REG |	\
> 	 AST2600_I2CG_CTRL_NEW_CLK_DIV)

As I mentioned the last two can occupy a single line.

...

> > > +	/* send start */
> > > +	dev_dbg(i2c_bus->dev, "[%d] %sing %d byte%s %s 0x%02x\n",
> > > +		i2c_bus->msgs_index, msg->flags & I2C_M_RD ? "read" : "write",
> > 
> > str_read_write() ?
> Sorry do you mean there have a function call str_read_write?
> Can you point me where it is for refer?

string_helpers.h.

> > > +		msg->len, msg->len > 1 ? "s" : "",
> > > +		msg->flags & I2C_M_RD ? "from" : "to", msg->addr);

...

> > > +				if (--i % 4 != 3)
> > > +					writel(*(u32 *)wbuf, i2c_bus->buf_base + i - (i % 4));
> > 
> > The above code is ugly. Can you think about it and write in a better way?
> Sorry, that is because the register only support for 4 byte align write.
> That the reason I need put for byte write to 4 byte align write.

Yes, that's fine. The problem is in _how_ the driver does it. We have a lot of
helpers in the kernel to access unaligned data.

...

> > > +	return ast2600_i2c_master_irq(i2c_bus) ? IRQ_HANDLED : IRQ_NONE;
> > 
> > IRQ_RETVAL() ?
> Sorry, most return is handled or not handled.
> Do you mean replace it just " return IRQ_RETVAL(ret);"

Have you had a chance to look in the implementation of IRQ_RETVAL() ?
I believe if you do, you will find the answer to your question.

...

> > > +	if (i2c_bus->mode == BUFF_MODE) {
> > > +		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > +		if (res && resource_size(res) >= 2) {
> > > +			i2c_bus->buf_base = devm_ioremap_resource(dev, res);
> > > +
> > > +			if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > +				i2c_bus->buf_size = resource_size(res) / 2;
> > > +		} else {
> > > +			i2c_bus->mode = BYTE_MODE;
> > > +		}
> > > +	}
> > 
> > Can be done without additional checks and with a simple call to
> > devm_platform_ioremap_resource(). No?
> > 
> Sorry, I can't catch your point, can you guide me more about it?

	if (BUFF_MODE) {
		void __iomem buf_base;

		buf_base = devm_platform_ioremap_and_get_resource(pdev, 1, &res);
		if (IS_ERR(buf_base))
			mode = BYTE_MODE;
		else {
			->buf_base = buf_base;
			->buf_size = ...
		}
	}

...

> > > +	ret = of_property_read_u32(dev->of_node, "clock-frequency",
> > &i2c_bus->bus_frequency);
> > > +	if (ret < 0) {
> > > +		dev_warn(dev, "Could not read clock-frequency property\n");
> > > +		i2c_bus->bus_frequency = 100000;
> > > +	}
> > 
> > There are macro for standard speeds. Moreover, there is a function to parse
> > properties, no need to open code.
> > 
> Will update
> ret = of_property_read_u32(dev->of_node, "clock-frequency", &bus_freq);
> if (ret < 0) {
>     dev_warn(dev, "Could not read clock-frequency property\n");
>     i2c_bus->bus_frequency = I2C_SPEED_STANDARD;
> } else {
>     i2c_bus->bus_frequency = bus_freq;
> }

No, just use the I2C core API to fill this property in the specific i2c_timings
structure.

-- 
With Best Regards,
Andy Shevchenko


