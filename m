Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2BF3976AB
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 17:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234066AbhFAPcQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 11:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhFAPcP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 11:32:15 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 552D6C061574;
        Tue,  1 Jun 2021 08:30:33 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 29so10969224pgu.11;
        Tue, 01 Jun 2021 08:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VnnHRqo8lMttVmccO6dDOJIhxdSoTbCnFNxdSa23m9k=;
        b=dCR8//k4wzUAjpi9CXrOlOGW78AqYU0DLmcuoADpnt6kuTWB3oHKuR7kWGoNKjZBWk
         nT2Rf2kG8xA+4s/ch+027w4gMNPGw3+66LOETR1sDmkPj13R9fBSUETXyVbtPHnJmd2f
         PtRDXAvsYeiT1cxgUfYXZU/y5+zuGe/Opz4rCqFp/5LtqBof6Bnvbj4TaNNIQgRmUT1V
         vkqcROBf8OhtXQRbH8HFfDOmQhmYOhvAX6+Xa9jMjKsAjQAMQtGUc3zmcIcM1V9L1kng
         q1S0R6oPQ4sZ++iRBLt9EPk/m8nJfrg5NtQwx0y+zEwCui0MWljDKvYaUznGYqpngATq
         dXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VnnHRqo8lMttVmccO6dDOJIhxdSoTbCnFNxdSa23m9k=;
        b=EwstsPO6AVLP9OhUR57dF6alYONy/DgvOXCdCisJilYNPto/Fb6LCPzTj++ACLxxrd
         LDngHKpKKUhamdaKWEeQ+zkqGdgpq12EzKITHowD5GdSbtx+YNi4zUUhR4Hs436qDyjV
         Rr7AZGNj0vOHqZRz/A3KWYiG+Jwtq2aYQQyZMftL4CBKCpGzcmh+6pDYTmc92u7mqY+b
         DsW/4mKYHn4vPO77S2knBFP/0Pa22LpTIzu9U0M869uHQix7P/szL1MN65qCIgjjXirX
         s6Sa9N0KDoWPRZC2HOptfJYmRTTLJmc+WDRegOmmAtWvwnQT3S5j/IXOmpFsecSGj3zY
         DFHA==
X-Gm-Message-State: AOAM533sGhJqRe0YY3A5roXLl6Yy4NTFvuOC0je29J6X673eiEOs3GN5
        5AFFYA25c+K7Jovojqr2jQT+JNSN+kmLj/pru2Y=
X-Google-Smtp-Source: ABdhPJz+uV9kcio77l5lJR0eVJQmCv5st7BUfAlx30tj1gMMnCl7/JZQhPRxzzwqf3GGtFQ+rGQJPv07o5D52t1a9FY=
X-Received: by 2002:a63:4145:: with SMTP id o66mr28745022pga.4.1622561432782;
 Tue, 01 Jun 2021 08:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622560799.git.geert+renesas@glider.be> <5236cf71d467bec862c4fa7849705caac195b23a.1622560799.git.geert+renesas@glider.be>
In-Reply-To: <5236cf71d467bec862c4fa7849705caac195b23a.1622560799.git.geert+renesas@glider.be>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 1 Jun 2021 18:30:17 +0300
Message-ID: <CAHp75VerXNJdecZKLUU1uex6-J9TC+9+yLkZqxc5UFtnZcT5mA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] x86: ce4100: Replace "ti,pcf8575" by "nxp,pcf8575"
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 1, 2021 at 6:26 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The TI part is equivalent to the NXP part, and its compatible value is
> not documented in the DT bindings.
>
> Note that while the Linux driver DT match table does not contain the
> compatible value of the TI part, it could still match to this part, as
> i2c_device_id-based matching ignores the vendor part of the compatible
> value.

LGTM!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Maybe at some point I will find the time to resurrect the CE4100 based
device that collects dirt on my desk...

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - New.
> ---
>  arch/x86/platform/ce4100/falconfalls.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/platform/ce4100/falconfalls.dts b/arch/x86/platform/ce4100/falconfalls.dts
> index 0ac3d43571361112..65fa3d866226ce97 100644
> --- a/arch/x86/platform/ce4100/falconfalls.dts
> +++ b/arch/x86/platform/ce4100/falconfalls.dts
> @@ -249,7 +249,7 @@ i2c@1 {
>
>                                                 gpio@26 {
>                                                         #gpio-cells = <2>;
> -                                                       compatible = "ti,pcf8575";
> +                                                       compatible = "nxp,pcf8575";
>                                                         reg = <0x26>;
>                                                         gpio-controller;
>                                                 };
> @@ -263,7 +263,7 @@ i2c@2 {
>
>                                                 gpio@26 {
>                                                         #gpio-cells = <2>;
> -                                                       compatible = "ti,pcf8575";
> +                                                       compatible = "nxp,pcf8575";
>                                                         reg = <0x26>;
>                                                         gpio-controller;
>                                                 };
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
