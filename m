Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186A323296F
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jul 2020 03:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgG3BUS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 21:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgG3BUS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 21:20:18 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8926C061794;
        Wed, 29 Jul 2020 18:20:17 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id a14so1782109edx.7;
        Wed, 29 Jul 2020 18:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Bhtuo7eKFb6UmOlkz+jeD15e4iDeG8/eFQgGG8WWgU=;
        b=aywt8rE/ZAqOwGwPJc4gPfNm/d+AoJ2HHscoaKrZ+7qvH3e6ge6QilD5Yvz20qz8kZ
         tzsK2PITt1tLk1xEi7pV7QFmt6K8eKXRVQZ2XuVhMJZMhUnDIiOa1vEGEbB7d5PW2T3G
         mu6odELvaLuwv3hVVRdqJ2URLL1mpzNXg8bP3OV/q6Gj2bkled6QzcZI46QqPa3HNoGS
         LFQJeYy8YUT9dCnnpsIfYM0bMZU5GYPIuK4lFzTNQjI0o0PTKrchMlkI5o5lr8RigXx1
         i3IS+ptC25L67GII1z4p80m/FFrctGS7C/ASXDgQjOfJC9eMkgKTdQUF2k4i9j5FV/1/
         Hpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Bhtuo7eKFb6UmOlkz+jeD15e4iDeG8/eFQgGG8WWgU=;
        b=R+9VAlFyzSOV1uaCZnm7MNGVegMh06fHVOlczbV3ENteetcNFctn6cBBI2H6ztacHU
         bQWd+bZzjxwcsoJ+Y60POcB/93HtfGr0tBczBILk1v+KKJAbsiWeFkAOSIpm+Q8jxpQJ
         YWb4gAW46hWBtIYz2JbJbZvTqt7jcBKYTfOS4di4LXqJakkQrZgd0bcWV+O3Ylhf61s+
         GhLCrWaBaveE1RHCWj7A0q6jo/eO3+vax9I02Psnka132Hw8GjKaerdRlerkua0XP6Ri
         W/YVQPnl5iqafdc3JMwOGVKDgHx/bhn0/2c3OuBqJjJ958W6TuYAbJXaLozLEOKY7jp6
         HiHA==
X-Gm-Message-State: AOAM531vohaCGlOpNm3ZQRA7BO4rcji/lp4M953L74J7hhbZo9kOkQ9V
        O+uXBv11gZECg6WFWLSu2AalDcBXwQCf2R/W2Rk=
X-Google-Smtp-Source: ABdhPJxv4UXtB8XlalMXyzX+Y8TaYgSNcz3eswdocM8l2y2uEcmDNuY9lZ6do5sTxRtW9c/xiAt8+ZikHMKfJWNB//g=
X-Received: by 2002:aa7:d6cc:: with SMTP id x12mr485098edr.354.1596072016482;
 Wed, 29 Jul 2020 18:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595572867.git.frank@allwinnertech.com>
In-Reply-To: <cover.1595572867.git.frank@allwinnertech.com>
From:   Frank Lee <tiny.windzz@gmail.com>
Date:   Thu, 30 Jul 2020 09:20:05 +0800
Message-ID: <CAEExFWsvScMgi_Dftfq06HZiF8CFAmym8Z_tgQoHHAfiGxWt0g@mail.gmail.com>
Subject: Re: [PATCH v5 00/16] Allwinner A100 Initial support
To:     Frank Lee <frank@allwinnertech.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, gregory.clement@bootlin.com,
        Thomas Gleixner <tglx@linutronix.de>, jason@lakedaemon.net,
        Marc Zyngier <maz@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Lee Jones <lee.jones@linaro.org>,
        "p.zabel" <p.zabel@pengutronix.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>,
        clabbe@baylibre.com, bage@linutronix.de,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, linux-i2c@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

HI Maxime,

Any comments on thermal and other patches?
I hope these patches can be integrated into the mainline as soon as possible.

Thx,
Yangtao
