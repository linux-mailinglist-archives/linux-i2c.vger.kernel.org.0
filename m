Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DD646201F
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 20:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352008AbhK2TTm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 14:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345426AbhK2TRk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 14:17:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5EBC0613E1;
        Mon, 29 Nov 2021 07:35:46 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 553C92A5;
        Mon, 29 Nov 2021 16:35:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638200144;
        bh=vQkTcVeubQtyPEvZTfPpWgr0xCoUlM+OeJ2wAvY6uCE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oe4PxyJ7rOJ6yNLwvZq0rwzDfKO/ZpsZplSPR/6rbcSz8KScSUcJ0sw74veOAAPjO
         ch3/3pIXPkuEq9U2GunOyYN4O52w4iSSmKvnQ6vxxKxiKhhFYf8jYSYLTAcCEBLcjw
         VUeAOCZFVl5N4nOZrvU3h5xf4e8THuPM1K5Y9mls=
Date:   Mon, 29 Nov 2021 17:35:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 05/15] regulator: Introduce tps68470-regulator driver
Message-ID: <YaTzOA7uV5TzHDDR@pendragon.ideasonboard.com>
References: <20211125165412.535063-1-hdegoede@redhat.com>
 <20211125165412.535063-6-hdegoede@redhat.com>
 <YaAdIG+2MZPsdI+F@pendragon.ideasonboard.com>
 <19aeff06-d397-5f88-6d07-f76a2073b682@redhat.com>
 <YaLBeq0+0A6R2FZG@pendragon.ideasonboard.com>
 <YaTCpgYaPDssQp+N@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YaTCpgYaPDssQp+N@sirena.org.uk>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mark,

On Mon, Nov 29, 2021 at 12:08:06PM +0000, Mark Brown wrote:
> On Sun, Nov 28, 2021 at 01:38:34AM +0200, Laurent Pinchart wrote:
> > On Fri, Nov 26, 2021 at 12:22:35PM +0100, Hans de Goede wrote:
> > > On 11/26/21 00:32, Laurent Pinchart wrote:
> > > > On Thu, Nov 25, 2021 at 05:54:02PM +0100, Hans de Goede wrote:
> > > >> The TPS68470 PMIC provides Clocks, GPIOs and Regulators. At present in
> > > >> the kernel the Regulators and Clocks are controlled by an OpRegion
> > > >> driver designed to work with power control methods defined in ACPI, but
> 
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.

I have mixed feelings about that, someones the context is indeed not
needed, but I've found myself more often than not replying deep in a
mail thread and wishing the context hadn't been deleted, because it
ended up being relevant.

> > > >> + * (1) This regulator must have the same voltage as VIO if S_IO LDO is used to
> > > >> + *     power a sensor/VCM which I2C is daisy chained behind the PMIC.
> > > >> + * (2) If there is no I2C daisy chain it can be set freely.
> > > >> + */
> 
> > > > Do we need safety checks for this ?
> 
> > > There really is no way to deal this condition needs to matches inside the driver,
> > > this should be enforced by setting proper constraints on the 2 regulators where
> > > the PMIC is used with a sensor I2C daisy chained behind it.
> 
> > Right. I tend to be cautious here, as incorrect settings can destroy the
> > hardware. We should err on the side of too many safety checks rather
> > than too few. I was thinking that the cio2-bridge driver could set a
> > daisy-chaining flag, which could trigger additional checks here, but it
> > wouldn't protect against someone experimenting to support a new device
> > and setting different voltages without the daisy-chaining flag.
> 
> > My biggest worry is that someone with an unsupported machine may start
> > by copying and pasting an existing configuration to try it out, and fry
> > their hardware.
> 
> There's really nothing you can do that prevents this, especially in the
> cut'n'paste scenario.  Overrides tend to get copied along with the rest
> of the configuration, or checks hacked out if people think they're
> getting in the way without realising what they're there for.

Maybe a big fat warning comment in the code ? Apart from that, I agree,
I don't think we can do much.

-- 
Regards,

Laurent Pinchart
