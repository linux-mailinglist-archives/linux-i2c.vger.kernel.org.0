Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE64863A964
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 14:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbiK1NYL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 08:24:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbiK1NYK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 08:24:10 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D2A1DA74;
        Mon, 28 Nov 2022 05:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669641848; x=1701177848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HrvXiW8VRRZHHMb6cjfiebSM09+Ck0M/oKO7nbe2WBs=;
  b=HofSxsuGEKxVPtE6SwBCESQ+8aBxXtiOIjKeofAlZ2paQ52/baspKzZD
   3kZ49SJ76+0ly7tmjeTso9hEVaqW1ZxfaiGaHC2i8D5dlu7tAUQIDbbRy
   +TepvYxVQExerClQ6PZ6chqcndUttfjCtsOdhv/+sHtih4TPNuh9leQBY
   1zoxE483JB5OLgpJUYL6Ou3kEg1tkm9Xa+sSTaPqZUZpIF+aAwuhXeC1D
   AazwnvSfwako9wIuLLwG/jD+UnjKFEWhW+mvtn+YjRF8XKYxQNuMCFUgx
   YgsE85LIzJ8QkBFeUhCIi4PeOFVH6Fnyn6IOZ19zBaym52bWqcEeMRd6f
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="295212367"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="295212367"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 05:24:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="711962061"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="711962061"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 28 Nov 2022 05:24:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oze78-0019LN-2P;
        Mon, 28 Nov 2022 15:24:02 +0200
Date:   Mon, 28 Nov 2022 15:24:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V3 4/5] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y4S2cnlAm3YYvZ8E@smile.fi.intel.com>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <822356908305580d601e5b3e424371ed7f220b85.1669359515.git.zhoubinbin@loongson.cn>
 <Y4Cb19PM97M9HaiB@smile.fi.intel.com>
 <8b0e2e61-2e54-127e-7cb8-9e1068dbc390@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b0e2e61-2e54-127e-7cb8-9e1068dbc390@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 28, 2022 at 08:03:40PM +0800, Binbin Zhou wrote:
> 在 2022/11/25 18:41, Andy Shevchenko 写道:
> > On Fri, Nov 25, 2022 at 04:55:20PM +0800, Binbin Zhou wrote:

...

> > Missing bits.h.
> 
> Is it needed? I found it already included in I2c.h.

The rule of thumb is to include headers we are the direct user of.
Exceptions are the headers that are guaranteed to be included by
others. i2c.h doesn't guarantee this and many other inclusions
while using them for itself or simply included them wrongly.

...

> > > +struct ls2x_i2c_dev {
> > > +	struct device		*dev;
> > > +	void __iomem		*base;
> > > +	int			irq;
> > > +	u32			bus_clk_rate;
> > > +	struct completion	cmd_complete;
> > > +	struct i2c_adapter	adapter;
> > Check if moving this to be the first field makes code generation better
> > (bloat-o-meter is your friend).
> 
> vmlinux.old: original order
> 
> vmlinux:  adapter to be the first field
> 
> [zhoubinbin@kernelserver github]$ scripts/bloat-o-meter vmlinux.old vmlinux
> add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-8 (-8)
> Function                                     old     new   delta
> ls2x_i2c_remove                               36      32      -4
> ls2x_i2c_probe                               424     420      -4
> 
> Total: Before=19302026, After=19302018, chg -0.00%

Good, up to you (personally I find usually better to have embedded structures,
which are parent objects in terms of OOP, to be first members).

> > > +	unsigned int		suspended:1;
> > > +};
> > > +	return ls2x_i2c_send_byte(adap, LS2X_CR_STOP);
> > > +}

...

> > > +static int ls2x_i2c_start(struct i2c_adapter *adap, struct i2c_msg *msgs)
> > > +{
> > > +	struct ls2x_i2c_dev *dev = i2c_get_adapdata(adap);
> > > +	unsigned char addr = i2c_8bit_addr_from_msg(msgs);
> > > +
> > > +	reinit_completion(&dev->cmd_complete);
> > > +	addr |= (msgs->flags & I2C_M_RD) ? 1 : 0;
> > Why is this needed?
> In the ls2x I2C controller, the bit 0 of TXR indicates the read/write status
> when transferring the address.

Yes, I understand this. I don't understand why do you need this twice.

> > > +	writeb(addr, dev->base + I2C_LS2X_TXR);
> > > +
> > > +	return ls2x_i2c_send_byte(adap, (LS2X_CR_START | LS2X_CR_WRITE));
> > > +}

...

> > > +	for (retry = 0; retry < adap->retries; retry++) {
> > > +
> > Unneeded blank line.
> > 
> > > +		ret = ls2x_i2c_doxfer(adap, msgs, num);
> > > +		if (ret != -EAGAIN)
> > > +			return ret;
> > > +
> > > +		dev_dbg(dev->dev, "Retrying transmission (%d)\n", retry);
> > > +		udelay(100);
> > > +	}
> > Can something from iopoll.h be utilized here?
> I think udelay() should be suitable because it is just the time interval
> between two retry.

Read again my comment. Also thanks for pointing out that this is atomic. Is
this really needs to be atomic?

...

> > > +	/*
> > > +	 * The I2C controller has a fixed I2C bus frequency by default, but to
> > > +	 * be compatible with more client devices, we can obtain the set I2C
> > > +	 * bus frequency from ACPI or FDT.
> > > +	 */
> > > +	dev->bus_clk_rate = i2c_acpi_find_bus_speed(&pdev->dev);
> > > +	if (!dev->bus_clk_rate)
> > > +		device_property_read_u32(&pdev->dev, "clock-frequency",
> > > +					&dev->bus_clk_rate);
> > This should be done via

> >          i2c_parse_fw_timings(&pdev->dev, ...);

> > no?
> 
> Yes, I get it，and the i2c_ls2x_adjust_bus_speed() function will be
> introduced to calculate i2c bus_freq_hz.

Yep, depends on your needs. It might be that some of the drivers are using
the code that you may reuse (by moving to i2c-core-acpi.c).

-- 
With Best Regards,
Andy Shevchenko


