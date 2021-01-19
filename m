Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B382FB1AA
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 07:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730110AbhASGia (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 01:38:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbhASGWY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jan 2021 01:22:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68CCAC0613C1;
        Mon, 18 Jan 2021 22:21:43 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 891F74FB;
        Tue, 19 Jan 2021 07:21:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611037299;
        bh=oycY286DBGm4St4onQa1c4S5+VXtXeEA4g/WsCAkTEA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KyKTq0F10qKo6fweXrR1GW+OuWxqk8Sk9CM7gySc/0/ditqB/bQSDemuttmg9d8Pg
         H9N0VvOjym4NyA68xBgPZ+LEkrKuZj5VO7QgfT0xnGD4KQq3RytMxpK9C8o4JBlgQR
         6/teXyPqNlCiE152MSPR8cgKBHqNuu6zoA3heuS4=
Date:   Tue, 19 Jan 2021 08:21:23 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
Message-ID: <YAZ6Y1QDyWwPGE69@pendragon.ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <1053125f-7cb2-8aa0-3204-24df62986184@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1053125f-7cb2-8aa0-3204-24df62986184@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

On Tue, Jan 19, 2021 at 12:11:40AM +0000, Daniel Scally wrote:
> On 18/01/2021 21:19, Daniel Scally wrote:
> >>>> +static const struct clk_ops skl_int3472_clock_ops = {
> >>>> +	.prepare = skl_int3472_clk_prepare,
> >>>> +	.unprepare = skl_int3472_clk_unprepare,
> >>>> +	.enable = skl_int3472_clk_enable,
> >>>> +	.disable = skl_int3472_clk_disable,
> >>>> +};
> >>
> >> Yeah, sounds like reinventing clk-gpio.c.
> >>
> >> static const struct clk_ops clk_gpio_gate_ops = {
> >> 	.enable = clk_gpio_gate_enable,
> >> 	.disable = clk_gpio_gate_disable,
> >> 	.is_enabled = clk_gpio_gate_is_enabled,
> >> };
> >>
> >> (Or is it mux? It has support there as well.
> >>
> > Hmm, yeah, this looks like it would work actually. So I think I'd need to:
> >
> > 1. Make enabling INTEL_SKL_INT3472 also enable the clk-gpio driver
> >
> > 2. Register a platform device to bind to the clk-gpio driver
> >
> > 3. Register a gpio lookup table so that the clk-gpio driver can find the
> > gpio in question using gpiod_get()
> >
> > And that looks like it will work; I'll try it.
> 
> I'm more and more confident that this will work, but it has some
> knock-on effects:
> 
> The both clk and regulator gpio driver expects to be able to fetch the
> GPIO using devm_gpiod_get(&pdev->dev, "enable", ...). That won't work of
> course, so we need to add another GPIO lookup table so those drivers can
> see the GPIOs. For that, we need to know what dev_name(&pdev->dev) will
> be so we can set the .dev_id member of a gpiod_lookup_table to that
> value, but that isn't set until _after_ the pdev is registered (because
> it has to figure out the id, we can't manually set the IDs because there
> could be more than one instance of int3472-discrete bound to multiple
> PMIC devices, and we don't know which id the current one should have).
> Finally, we can't wait until the device is registered because it
> immediately probes, can't find the GPIO and then fails probe.
> 
> It's similar problem that causes us to need the i2c-acpi name format
> macros, but complicated by the dynamic ID part of dev_name(&pdev->dev)
> 
> Solving it is a bit of a sticky one; perhaps something like moving the
> dev_set_name() part of platform_device_add() [1] to its own function,
> that's called in both platform_device_alloc() and
> platform_device_register(). That way it would be available before the
> device itself was registered, meaning we could create the lookup table
> before it probes the driver.
> 
> (also, Laurent, if we did it this way we wouldn't be able to also handle
> the led-indicator GPIO here without some fairly major rework)

Given the additional complexity I don't think it's worth it, your
implementation is fine and code duplication with clk-gpio is minimal.

> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L563

-- 
Regards,

Laurent Pinchart
