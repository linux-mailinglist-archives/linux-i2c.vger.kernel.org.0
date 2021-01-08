Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84422EF254
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jan 2021 13:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbhAHMRu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jan 2021 07:17:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbhAHMRn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jan 2021 07:17:43 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B17C0612FA;
        Fri,  8 Jan 2021 04:17:01 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id z12so3552078pjn.1;
        Fri, 08 Jan 2021 04:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QJpmPSXBMkDyRpOAie8nEtiKxW2diZukk9pipJ57ovs=;
        b=APSTOjBSR9NIMt2G+tAKvfWj2tZ4hY4e3e1aiF7JekWmZUQuDSiZ5IbRXu1/KhIooQ
         J/HcWQyXi3KQ8+D3KlBShkw+3DV6P4O1wxDFt0b6FOjSvZOjWafWoGAE5gPV76cBRJEm
         Trby4n2kGLMcOmuVcRt+XtceGuTyFfThWFR/vn0PxK22wx1n4JN5HZUiXRxrbyd94B1R
         vwNFtlu1wjAJNAzTBHWOysPbZxTNUDeohmI4FYAlxbyEXEsJR4qwQI7U+VJiK8rIce49
         UCcCgQVlofROPknaFgODvIv6KE0B/8oLY3ZGWbI6odx41TeD/9kCPg7pBagojBWs0pX9
         gmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QJpmPSXBMkDyRpOAie8nEtiKxW2diZukk9pipJ57ovs=;
        b=kzWJdXbWtSVdYF6un2pC2l5x5uFmu+iPWhmo4sNz5Ad5uIB7syYNEMUVHno8CSedOQ
         s5Re3PrCE2EXBrz+vl8Mvq7v5+iPL23Ilx4BXYhaMzSHQZVTxErhaHsYO2eE/93ATJQe
         JLWkKnodJ8HWtqW1AToeCE66JfK2mGGYQXslo/cO7NDKCfxxS8SETU1obiEtY06/iZhX
         2fQB4bfNaa7iwHpyUa3Be7Cmz2SIRgJC8xYPVJjx1OxMZiP1GfQR10NYs2lKx7ZQiEHA
         XgzM8UT0edGCs+aIsn4YC5SVb5ucidiLKTvwUnJ9BqTLQz9W/H6ZQ1pIxgeqDvSJzAEl
         ZYZA==
X-Gm-Message-State: AOAM531yOEuXnIZwoycRCf0pjkNvWPzX+lXiQPOyUTXSUBQ+3M0eQtUv
        HC4ZhwlTMDqxJRnzf6XuRRRlz2cEUJbJf0odauw=
X-Google-Smtp-Source: ABdhPJyldR1piNAeKj9uIZ1Le/5wxh9TOr537qIrpxGvyxjo1onN4F4oe8SR/CXSTDkdvSzMQ7bZigw9hkKUqlRE4vo=
X-Received: by 2002:a17:90a:c592:: with SMTP id l18mr3486365pjt.228.1610108221001;
 Fri, 08 Jan 2021 04:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20201130133129.1024662-1-djrscally@gmail.com> <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com> <778f23fc-b99c-33a2-642d-ca0e47fd4ed5@gmail.com>
In-Reply-To: <778f23fc-b99c-33a2-642d-ca0e47fd4ed5@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jan 2021 14:17:49 +0200
Message-ID: <CAHp75VeYOqJt9iKaGPA4=dkb2kYUbqUV4PGTn8uSsnUt_kSGSw@mail.gmail.com>
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devel@acpica.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        kieran.bingham+renesas@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jordan Hand <jorhand@linux.microsoft.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 8, 2021 at 1:56 AM Daniel Scally <djrscally@gmail.com> wrote:
> On 30/11/2020 20:07, Andy Shevchenko wrote:
> > On Mon, Nov 30, 2020 at 01:31:29PM +0000, Daniel Scally wrote:

...

> > It's solely Windows driver design...
> > Luckily I found some information and can clarify above table:
> >
> > 0x00 Reset
> > 0x01 Power down
> > 0x0b Power enable
> > 0x0c Clock enable
> > 0x0d LED (active high)
> >
> > The above text perhaps should go somewhere under Documentation.
>
> Coming back to this; there's a bit of an anomaly with the 0x01 Power
> Down pin for at least one platform.  As listed above, the OV2680 on one
> of my platforms has 3 GPIOs defined, and the table above gives them as
> type Reset, Power down and Clock enable. I'd assumed from this table
> that "power down" meant a powerdown GPIO (I.E. the one usually called
> PWDNB in Omnivision datasheets and "powerdown" in drivers), but the
> datasheet for the OV2680 doesn't list a separate reset and powerdown
> pin, but rather a single pin that performs both functions.

All of them are GPIOs, the question here is how they are actually
connected on PCB level and I have no answer to that. You have to find
schematics somewhere.

> Am I wrong to treat that as something that ought to be mapped as a
> powerdown GPIO to the sensors? Or do you know of any other way to
> reconcile that discrepancy?

The GPIOs can go directly to the sensors or be a control pin for
separate discrete power gates.
So, we can do one of the following:
 a) present PD GPIO as fixed regulator;
 b) present PD & Reset GPIOs as regulator;
 c) provide them as is to the sensor and sensor driver must do what it
considers right.

Since we don't have schematics (yet?) and we have plenty of variations
of sensors, I would go to c) and update the driver of the affected
sensor as needed. Because even if you have separate discrete PD for
one sensor on one platform there is no guarantee that it will be the
same on another. Providing a "virtual" PD in a sensor that doesn't
support it is the best choice I think. Let's hear what Sakari and
other experienced camera sensor developers say.

My vision is purely based on electrical engineering background,
experience with existing (not exactly camera) sensor drivers and
generic cases.

> Failing that; the only way I can think to handle this is to register
> proxy GPIO pins assigned to the sensors as you suggested previously, and
> have them toggle the GPIO's assigned to the INT3472 based on platform
> specific mapping data (I.E. we register a pin called "reset", which on
> most platforms just toggles the 0x00 pin, but on this specific platform
> would drive both 0x00 and 0x01 together. We're already heading that way
> for the regulator consumer supplies so it's sort of nothing new, but I'd
> still rather not if it can be avoided.


-- 
With Best Regards,
Andy Shevchenko
