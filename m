Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE016443091
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 15:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbhKBOkm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Nov 2021 10:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbhKBOkl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Nov 2021 10:40:41 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63BB3C061714;
        Tue,  2 Nov 2021 07:38:06 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g10so76466997edj.1;
        Tue, 02 Nov 2021 07:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0I7ubj1Ldo3Nk5KDl6c4JTG3GlivIn7ejVsprdJKiXY=;
        b=JlJTn17qKYIhLmMbFUjqYTIi9H4FR8PTJE4FBsZLnl//slB0e20M00TFsPqunDzHxF
         PbVznl4+bNrhhrtQwo3TbA+AFWCj8dxNsVeARjRpvwrlPO/qNVg9XntE2Tu72oEVqqlA
         sI8ekdXZEX/jKSwoYaUCE52G+M8UskIwpShUEhDHge3BU1vfPfmEbTteuy2S9VGbAcz8
         wNpgwpdWvlRmGYogKzxaHPHsNJsB0OKzJoCOClqei2uOF26HK0U4vETsulOx8uc+tbHn
         /qgXz45mYp7zYmffuPj5cj5poU8tkZIB8CYsEsClP67R0h32k7QURMbdUHQ+C9YWiutM
         pjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0I7ubj1Ldo3Nk5KDl6c4JTG3GlivIn7ejVsprdJKiXY=;
        b=g6FUfqFS/A5kily7HeyTA/8QhqwxASxlWI8r1/3Q4f+LPOOXzif7wFVEeuJWKEroKC
         wVFnByCBSOwaud1+c9eSTEUBMbTZbHWz7SiT1sAGZtwe5OVzgycic9ONfG10l/rCxbLc
         uTyhTJpD+pd7j2ttBl3mOLU4Ba/gcjlTiDZbkKIaNO0/DoSIqUGxuUhYdmF4S7NS/LUW
         6Z300phn0vr+ypmG+boon0noPJglX1Vq/JGKOPh5p3bwYdgeHJ2CwlnuZEQCixs7BgIo
         ymb+qiegzLDmVEMMyiMiYWxzE6a3pGnLuH0P7QaMdvNlYkpiMiUDGqpVuWbRQJbHIt95
         F35Q==
X-Gm-Message-State: AOAM532QFuaQ3pXTtFQGdb0pxVzZOHFi6fwh/iMu+CLgvmbjnds+5R+0
        vDEzto0HFY2Da/Vg6M5ObNs58O1ov3pKdrLKJwI=
X-Google-Smtp-Source: ABdhPJz78G9S+IwBiHwzwtrFf9Ws1srJp3v1MBNrdOcNp2jvAQsLpSlPPk6MqY0r4sswsy4EnwvJEpp19zeqpea2M7Q=
X-Received: by 2002:a17:906:6a0a:: with SMTP id qw10mr18550055ejc.141.1635863882143;
 Tue, 02 Nov 2021 07:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211102094907.31271-1-hdegoede@redhat.com>
In-Reply-To: <20211102094907.31271-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Nov 2021 16:37:13 +0200
Message-ID: <CAHp75VfHo1XRo8SPy2PtW8JyJ4K6AtZhwGotuCu3Fw5-FFpK0g@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] Add support for X86/ACPI camera sensor/PMIC
 setup with clk and regulator platform data
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 2, 2021 at 11:49 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Here is v5 of my patch-set adding support for camera sensor connected to a
> TPS68470 PMIC on x86/ACPI devices.

No showstoppers observed, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> I'm quite happy with how this works now, so from my pov this is the final
> version of the device-instantiation deferral code / approach.
>
> ###
>
> The clk and regulator frameworks expect clk/regulator consumer-devices
> to have info about the consumed clks/regulators described in the device's
> fw_node, but on ACPI this info is missing.
>
> This series worksaround this by providing platform_data with the info to
> the TPS68470 clk/regulator MFD cells.
>
> Patches 1 - 2 deal with a probe-ordering problem this introduces,
> since the lookups are only registered when the provider-driver binds,
> trying to get these clks/regulators before then results in a -ENOENT
> error for clks and a dummy regulator for regulators. See the patches
> for more details.
>
> Patch 3 adds a header file which adds tps68470_clk_platform_data and
> tps68470_regulator_platform_data structs. The futher patches depend on
> this new header file.
>
> Patch 4 + 5 add the TPS68470 clk and regulator drivers
>
> Patches 6 - 11 Modify the INT3472 driver which instantiates the MFD cells to
> provide the necessary platform-data.


-- 
With Best Regards,
Andy Shevchenko
