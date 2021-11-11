Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20B6244DCCF
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 21:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbhKKVCY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 16:02:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhKKVCY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 16:02:24 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99165C061766;
        Thu, 11 Nov 2021 12:59:34 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id m14so29428845edd.0;
        Thu, 11 Nov 2021 12:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l7xU4r16mNqYSwLiBhq59xwqrndd8tElpUs78xQoNfY=;
        b=Y5Wh/quoDdSzXOp1QwKilOeNatuqhK2jVQzq+OHsdsrxKALvoJJenLe8+/1ZzufxvC
         x1pVCYNfow/klqPf4v6OSTU63HGKAoCL3h+gpD/Eb1SlJ8eAGCzUG6M4jXAYzYQfir9M
         jr7dwAaDzAJTeoCwg5qOE+lj9oRsfp05Up7XqCwIyG5sCOJdNFMu9grM+x0zdw1DadO7
         SOFxedz2hBIXFibtVMDorooAPRDiLwEBnqXqBqzXU1kooTXx+5e7eq+fc4c+Uue/Xy9A
         VaYKK7A64zhYQciUDaNsJQYn6M2qfmpJQLa/nZWYNFWMhAprua+WtMrhAX6QMZpqAFVt
         bt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l7xU4r16mNqYSwLiBhq59xwqrndd8tElpUs78xQoNfY=;
        b=YuhuvhTD/PS2So3khrIXUnDMfHFstBCIPyZHq84p1z0EyWdIho84vhk8NHLq00GD6e
         VPTiUUsbdAPYfgt2VUQbbhQTzk5j4YEj0dW5Dp/qIDOVvDFNKc+7Ahf/KPbS24fr8HcL
         rvs7C2F9edks7qeuS5xOFsXhQgP24Hki55y5XVzxYUj3FvjuP9K10jVXNsfy+evzQ1qV
         oGcRbC4fNRC6RhmwbDhra0MdoS39nnyhUCx8iA5YOyCd4OyI7yA07qvBBhi3KsRUCRZB
         Hd++UXnYpKl77FG3pkfIlEa+jQgUMiKJnVup2X2glbgKYDuoS1QpGSNTNrOM1IOhcHOi
         aHDA==
X-Gm-Message-State: AOAM532t/geJP9APN/Hwoj+JN4DsJOogsHpCureMVUavw9SmUmcG/jbU
        w9BB8g48f9762tbX/aRw2dWAk3jHNpnVF5SHQVY=
X-Google-Smtp-Source: ABdhPJxfw04bxiB/Ltdsn2yLtxNU6DGsobO4UtbbnhfyGdmEiLv4iLfcDgZWsbENb4r8beRtf8IWwFUKnfV3Jpw+5v4=
X-Received: by 2002:a17:906:bccc:: with SMTP id lw12mr12554296ejb.128.1636664372540;
 Thu, 11 Nov 2021 12:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20211018220504.8301-1-shreeya.patel@collabora.com>
In-Reply-To: <20211018220504.8301-1-shreeya.patel@collabora.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 11 Nov 2021 22:58:48 +0200
Message-ID: <CAHp75Ve9Dw=JDfUQrLuOwujLMMZ-eyxXUZP7ZGy4jb9D6drn1A@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Return EPROBE_DEFER if gc->to_irq is NULL
To:     Shreeya Patel <shreeya.patel@collabora.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, krisman@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 19, 2021 at 1:07 AM Shreeya Patel
<shreeya.patel@collabora.com> wrote:
>
> We are racing the registering of .to_irq when probing the
> i2c driver. This results in random failure of touchscreen
> devices.
>
> Following errors could be seen in dmesg logs when gc->to_irq is NULL
>
> [2.101857] i2c_hid i2c-FTS3528:00: HID over i2c has not been provided an Int IRQ
> [2.101953] i2c_hid: probe of i2c-FTS3528:00 failed with error -22
>
> To avoid this situation, defer probing until to_irq is registered.
>
> This issue has been reported many times in past and people have been
> using workarounds like changing the pinctrl_amd to built-in instead
> of loading it as a module or by adding a softdep for pinctrl_amd into
> the config file.

> References :-
> https://bugzilla.kernel.org/show_bug.cgi?id=209413
> https://github.com/Syniurge/i2c-amd-mp2/issues/3

Please, convert them to BugLink: tags.

> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>

...

> +       if (gc->irq.chip) {
> +               /* avoid race condition with other code, which tries to lookup
> +                * an IRQ before the irqchip has been properly registered
> +                * (i.e. while gpiochip is still being brought up).
> +                */

/*
 * The style of multi-line comments should be
 * like this. Pay attention to the grammar.
 * In your comment the parentheses can be replaced
 * by a simple ',' (comma without quotes).
 */

> +               return -EPROBE_DEFER;
> +       }


With above (including kbuildbot thingy) addressed
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
