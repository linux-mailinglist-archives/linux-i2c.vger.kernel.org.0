Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0674258E8
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Oct 2021 19:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243041AbhJGRJZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Oct 2021 13:09:25 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:35441 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242368AbhJGRJY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Oct 2021 13:09:24 -0400
Received: by mail-ot1-f54.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so8372352otj.2;
        Thu, 07 Oct 2021 10:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IefJA9LBUD7adbLBoj6lhBu/BQqC/aTFaIOQ0tDZ+DQ=;
        b=5VMHO66+Ciwq244nC8uszX8d4UYVKucH5RRnVQNiAfFQW28/z10912Zr0kWyoAwh6U
         3H7MqcK5KCYeUJCMVYtPH1+wV7j7y0b4pZjM4csUW03tyi7+s1Nrh/zewvK5Zi6B+Eys
         JRtsGyoZgD5HFhbx9xentsSmuopJNul4p5tEiiANdx1gxHOFk92YXYEc62HDEU9/9Dle
         xfy6MIZUtuLoRzuMOzf1wph3l27u/2/mWul4XoGX+mLlS1icrL7I7hAMzQZSArIqPegw
         VG9QPZXLxYNonWy0c9zFX+0gAD6sDw0PFKr36hOdVBdwbSpXzXRtuLkinBqtwnaDTMy8
         mx6w==
X-Gm-Message-State: AOAM531fLD+hi7pYWWy64U8L4pEYHDCMeA63Jvclx7BIavaAmVG7lnPX
        No2PzqCAq4oBANc5sY9e0BjNjwKPdiOF0ZoJNDE=
X-Google-Smtp-Source: ABdhPJzrrsgi8uz8zu+MUoSiFl5pa9fUsEyroZv6f/hs128KFBk/gp7uP9JpenjMSxRdtp+uu9Z2//YAVV7FkeHQ274=
X-Received: by 2002:a9d:2f24:: with SMTP id h33mr4756669otb.254.1633626449857;
 Thu, 07 Oct 2021 10:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211006173125.84423-1-andriy.shevchenko@linux.intel.com>
 <20211006173125.84423-3-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0iN+28gccy00_Ces9bYsLCNJaHaTZGMUwRrPA6TpY3H8A@mail.gmail.com> <YV8oAThCe2dR6K1n@smile.fi.intel.com>
In-Reply-To: <YV8oAThCe2dR6K1n@smile.fi.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 7 Oct 2021 19:07:19 +0200
Message-ID: <CAJZ5v0hTqUnvvhEN4O-Boi-_RBFvT5mNKBn+fVdo4XWz0-XJ_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpiolib: acpi: Replace custom code with device_match_acpi_handle()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 7, 2021 at 7:02 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 07, 2021 at 06:50:46PM +0200, Rafael J. Wysocki wrote:
> > On Wed, Oct 6, 2021 at 7:31 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > +       return gc->parent ? device_match_acpi_handle(gc->parent, data) : false;
> >
> > return gc->parent && device_match_acpi_handle(gc->parent, data);
> >
> > would work too if I'm not mistaken.
>
> Seems so.
>
> Thanks for review, I will update for v3.
> Any other comments to the series?

Not really.  Patch [2/3] is correct AFAICS.
