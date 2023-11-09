Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47A6A7E7291
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 21:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbjKIUEo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 15:04:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjKIUEn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 15:04:43 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B9BC44AC
        for <linux-i2c@vger.kernel.org>; Thu,  9 Nov 2023 12:04:41 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3b2ec9a79bdso828781b6e.3
        for <linux-i2c@vger.kernel.org>; Thu, 09 Nov 2023 12:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699560281; x=1700165081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gurrzsyi3h6rH42vsqVDKvAofCXnzICRIL3vNDe+fus=;
        b=DHqWPCaDgxRHEPAIQo9ae5SKeIlzAvw9gDSgpcV960oV6azlyJU3Ro63mFo4fSRG7C
         qo7GuJtFCzWyjSLA9crF7VQBcHIy3D9+nhitTRflu7W/qgDHRDtO43CpOgLNxhJRYMtv
         Xj+Tr/lDd2CW9nkaSmLX2Y/c3vFcEbzjvumFp+WbfNxOeKCzxcUkIQbmPTQfsg0ZcaYN
         ev35qVNnHei+7ctE/O98snPR479g6AJv1d7kmvPRLVag+HhHYLHLlJNTyFOWPm2DXwcf
         gdRfzhIyiq9ovGTfMxHnO0vFe5Mc+DdzGKmLGMk01Wz6CK7S8ouPqLqHjEaCECZmBdJu
         jI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699560281; x=1700165081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gurrzsyi3h6rH42vsqVDKvAofCXnzICRIL3vNDe+fus=;
        b=vuK99uwMTDPRy+8f0nL25sYRSIZ1Cj//qOVrxNJl8DiA/xA6kFq1SIS4YHjVu0He8R
         NdLBFO1gwbtnIaPmPDSq9SdxbBWTQQ0FJGxoLFNv1hZUQrS9BfQieIuYo4IgQzqLIGRY
         4qgktXYOp1qiN87NP48je9xiYMYvuSeogBiQKqe79Kdv8Aj6HqOqn+XsZoCFv/TQ72wn
         dHN7pbbyZqYJkS5pO0JnIA+ZJlfwrEQifUvJUNZjIS3Qzy7PjgNvhFxpfo9mL81hdk7H
         VRjwgVjn8C30+cFYcA3Wzpim2MryWbre4VnTZavLQwhT3+/DXa2LzqCi9lkGQe2+9qak
         tHUA==
X-Gm-Message-State: AOJu0YzLKOPcB3ZsL48l6krKjtdbgixQCTpX2RCwssTcc3Jcv05CxhXy
        oZuYzXV/ajCykSL/oVavi7BDRVvMFhGoF5E95AbT64fa5EDgbT+4SrA=
X-Google-Smtp-Source: AGHT+IETIUVwHq1zIY4M+aVZCbZgANNdHNAAgIMW1KsS5AXkkWpfo5TSLmh9VnLznLVTgog16/0MxGU20DyDEga0gsM=
X-Received: by 2002:a05:6358:8a8:b0:168:d12b:a166 with SMTP id
 m40-20020a05635808a800b00168d12ba166mr6735541rwj.17.1699560280709; Thu, 09
 Nov 2023 12:04:40 -0800 (PST)
MIME-Version: 1.0
References: <20230926160255.330417-1-robert.marko@sartura.hr>
 <CACRpkdZem9Gtd==gQM4EQ9R8MN2ZQ0JCyMCoTjg0kqCNDjuFMA@mail.gmail.com> <CA+HBbNFeVmc2CJeo+u9jbZrzsrDTOttW_4+aeLJFcOjDJ8DwyQ@mail.gmail.com>
In-Reply-To: <CA+HBbNFeVmc2CJeo+u9jbZrzsrDTOttW_4+aeLJFcOjDJ8DwyQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Nov 2023 21:04:29 +0100
Message-ID: <CACRpkdYUW-mO6vhh-zkZAuqQOHpwMeJsNw=jSLzbgoEtoCTtNQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: core: dont change pinmux state to GPIO during
 recovery setup
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     wsa@kernel.org, codrin.ciubotariu@microchip.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@armlinux.org.uk, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Robert!

Thanks for getting back on this issue.

On Thu, Nov 9, 2023 at 8:10=E2=80=AFPM Robert Marko <robert.marko@sartura.h=
r> wrote:

> Yes, I2C recovery is required on this board as otherwise the I2C bus will
> get stuck after a certain number of SFP module plug/unplug events or
> sometimes even just randomly, I2C recovery allows the bus to recover
> and continue working.

OK makes sense.

> Maybe my commit message was confusing, so I will try and explain further.
> I2C recovery did work on Armada 3720 just fine until the driver was conve=
rted
> to use the generic I2C recovery which is now part of the I2C core.
>
> After it was converted to it, the I2C bus completely stopped working
> on Armada 3720
> if I2C recovery is enabled by making the recovery pinctrl available in DT=
S.

Shouldn't we just revert that patch until we can figure this out then?

> I then spent quite a while trying to bisect the exact change that
> causes this issue
> in the conversion as code is almost identical to what the driver was
> doing previously,
> and have bisected it down to pinctrl_select_state(bri->pinctrl,
> bri->pins_gpio) being
> called before SDA and SCL pins are obtained via devm_gpiod_get().
>
> Then I thought that maybe there was a HW bug in the Armada 3720 as the
> pin function
> was being set to GPIO twice via register write so I made sure the
> register was being
> written to only if the desired value is different than the current one
> but that did not help
> at all.
> For whatever reason calling pinctrl_select_state(bri->pinctrl,
> bri->pins_gpio) causes
> the pins to basically lock up, but the weird thing is that calling
> devm_gpiod_get() will
> also end up with the kernel changing the pin function to GPIO and this
> works, hence
> this patch.

That sounds like a race condition... such as if the pin control block is
not clocked when the first pinctrl_select_state() comes in.

Or maybe the i2c hardware needs to be initialized/clocked before
touching it's mux? (Weird but could happen.)

One thing that makes me a bit suspicious is this:
i2c/busses/i2c-pxa.c:
subsys_initcall(i2c_adap_pxa_init);

While:
pinctrl/mvebu/pinctrl-armada-37xx.c
builtin_platform_driver_probe(armada_37xx_pinctrl_driver,
                              armada_37xx_pinctrl_probe);

If there is no probe reordering then the i2c driver will probe before
pin control.

What happens if you move the i2c_adap_pxa_init() call to
module_init() instead of subsys_initcall()?

Yours,
Linus Walleij
