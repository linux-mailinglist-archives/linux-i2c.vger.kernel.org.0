Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EADB03176E
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2019 01:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfEaXIi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 19:08:38 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40289 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726450AbfEaXIi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 19:08:38 -0400
Received: by mail-ot1-f65.google.com with SMTP id u11so10824967otq.7
        for <linux-i2c@vger.kernel.org>; Fri, 31 May 2019 16:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mPJruI3sVh/C3kPTQ57kdvVswWnu9O3bSK4nOiQszE4=;
        b=SYsrL6+5Ax7l8lavuka/1cXsKZe8LU6nG+G4ptHdU2AhqKohzP11kNA9vuzerXV+Lt
         kD1R/IG7z7xxB1uQc8lpKbJDE5Ffx6YjDPl74G1N52hikEopCwm13TI1lilgEdb0GxTR
         x2YuBEff5nMGYg49Q9o9xaYENQReKAaYmgxbEgWN30ALrtB7ZEsHpDDaYNHxaAU3EGea
         dHx0yGal/SDwPbCntsoEIRVQ0Am6D+dk2plqP3/6Q47Hz/uWfKMXBz0QYLJKacFOWaJq
         OxL9urtWF0pulEvClm5A+VXVd4WLwU49eXIqqigPra4vNiLbUtq1JlgZlurNcRTIKIsX
         Q+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mPJruI3sVh/C3kPTQ57kdvVswWnu9O3bSK4nOiQszE4=;
        b=ftGDtiAwA7ZgFWCT+gNyhKujD4E0xeVsROlXTsYzuhpaod4obXQVKbV+dNrc4RHIsD
         8skVYlT4HmjZQA+SmY4sxHZ9bGS+isKbErXLPockU8fmPOfNhgExqVvXxdixrl0jX2Tw
         fN75mtujJu4I3RdznPPZyHiQXEe9/hJPERMZDv90LltkOgNc29xi8kvIrmzVPGiewHc3
         UGvte0A/N0H2/bgBHQSxQbV5Hf+44wjVBy1x8ZpCXJzOoCO8zXswZ3x90+bcPPwzeGFh
         bYuoI3SoMNkGdAdcdc8E/OF0Fqc0K9o6MEOySwil8oKq527M0ZSkWTa0mZeEWhIm/L7f
         rI2A==
X-Gm-Message-State: APjAAAVA0dsWTny/RKEzHVVRozGKcpmMcIR2h+ILMaaS1KmZhMHO6Gbv
        VQveLGY+hVOSc/YJQIVJ4d0mHEMSVcUVlHyLV5CEeQ==
X-Google-Smtp-Source: APXvYqy6mWrUKjLVT1GF7ndHMHzwMoXT7eDYhNj3Ovr1P1euY+wI4/HpxG26P7XvcI8JOL6xC2ZBESwH5kVKBnpEvHE=
X-Received: by 2002:a9d:7a8b:: with SMTP id l11mr3507407otn.247.1559344117447;
 Fri, 31 May 2019 16:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190531223756.1861-1-linus.walleij@linaro.org>
In-Reply-To: <20190531223756.1861-1-linus.walleij@linaro.org>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 31 May 2019 16:08:26 -0700
Message-ID: <CAPcyv4hhMW+H8wQ+RV+oR1KteH_Jpqcy2tEnuEcGND0bkbZyjg@mail.gmail.com>
Subject: Re: [PATCH] i2c: iop: Use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        arm@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 31, 2019 at 3:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The IOP3xx has some elaborate code to directly slam the
> GPIO lines multiplexed with I2C down low before enablement,
> apparently a workaround for a hardware bug found in the
> early chips.
>
> After consulting the developer documentation for IOP80321
> and IOP80331 I can clearly see that this may be useful for
> IOP80321 family (mach-iop32x) but it is highly dubious for
> any 80331 series or later chip: in these chips the lines
> are not multiplexed for UARTs.
>
> We convert the code to pass optional GPIO descriptors
> and register these only on the 80321-based boards where
> it makes sense, optionally obtain them in the driver and
> use the gpiod_set_raw_value() to ascertain the line gets
> driven low when needed.
>
> The GPIO driver does not give the GPIO chip a reasonable
> label so the patch also adds that so that these machine
> descriptor tables can be used.
>
> Cc: arm@kernel.org
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ARM SoC mainatiners: looking for a handshake ACK on this
> so Wolfram can merge it into the I2C subsystem.
>
> Dan Williams: I have seen that you were patching IOP3xx code
> in 2007, so maybe you remember something about this.

I vaguely recall the need for this on iop32x and not needing it on
iop33x. So you can take that as a tepid Acked-by from me.
