Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96504411203
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Sep 2021 11:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhITJoP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Sep 2021 05:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhITJoP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Sep 2021 05:44:15 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7608AC061574;
        Mon, 20 Sep 2021 02:42:48 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id c21so58518362edj.0;
        Mon, 20 Sep 2021 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kl1VU0zRLlhATjtOqHh4dNuhgNcCkoiGS/lAs7oTLvU=;
        b=pJHEIw/3Aols345ofvSNb9nqeUAjtdaFpibPAMCSV9xD7ES4fs/Q0DCm/OPh8VtBZN
         FbRdW7q79uuYJn5J1dnFfldRXofUgOiFGhGrqMjEXPkQnh5PVYDWW8n+/NFTu1jD88sy
         X8yn6JcSajfWtoSC7nbJ8svfraJmgA/VczFSutHxcBlQK9vxyE3iOYtsVik36AljsNZ8
         WYEhXWe8Ojj489Z3iILuSUbC16fzdrlSbt6J8+xMprGHQQwyWnVRKq+03RbMNFnjKfj3
         olMZBSTDMswzHa46dUD/ci8AZkR4YzH3uPLJ6VEnAhebgiDQ0UgG0xuNkyvaCGGTl8gf
         dfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kl1VU0zRLlhATjtOqHh4dNuhgNcCkoiGS/lAs7oTLvU=;
        b=vkdBbCuZa5G8lHO1Cn2mEyjo35jfyCpHJXnFVgoaTr9AKJ7rhFF+xgtT3HRj2t3/aC
         GSzijVXZCEMOW3Q9/LQjrHxXCrn9gzyRkOJseGJzZJiILkmhxkJB0iK3//q8qw6EwpLW
         qXSO3XePTIZc50psU/VeuKZeCP0/NOLk958tukMNkzVyjWn4kLlAGTEP1Crf5DPd3h1S
         yyXhJqmptB9LsXF0LXUy776Jv5qgRCZ/akfe7wcVavE3t8r5fuEO+fGzDhq3QKbuLko7
         m7JkYwYCFGv+L59enwIkQUQMOJJSzO3OQtVuPx2tZOQycQ23kt0Su6+2Qfhk62v4RSMP
         fSxw==
X-Gm-Message-State: AOAM533ug9ZLLbf+HIF4IE54gX55gwCg0mtyBtAwT/rBrglhvOh3YeTo
        x0jqNml6LDWOMD9cmLOIFYw7SCRr9y18oKgWPMw=
X-Google-Smtp-Source: ABdhPJzbZsHXV8lOIKmBtGsaOFLdXQvNAjFjyKHCnf+uEF/84qWL7wIWSVbqat5RLcyu+PbZ/ep9t4mODqvY1x15mZY=
X-Received: by 2002:a50:d80a:: with SMTP id o10mr16450578edj.359.1632130966917;
 Mon, 20 Sep 2021 02:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210920072842.30889-1-brgl@bgdev.pl>
In-Reply-To: <20210920072842.30889-1-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Sep 2021 12:42:07 +0300
Message-ID: <CAHp75Vc0ytt4gWqaEWVOLSwu8J15t92JXg790jvjtGJqMo5_6A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update my email address
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 20, 2021 at 12:31 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> My professional situation changes soon. Update my email address.

I'm wondering if @kernel.org address would be a better choice. In such
a case you don't need to send a patch whenever your situation changes.

Either way, with hope that you will be still active here,
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  MAINTAINERS | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eeb4c70b3d5b..6bebe6168922 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2962,7 +2962,7 @@ F:        crypto/async_tx/
>  F:     include/linux/async_tx.h
>
>  AT24 EEPROM DRIVER
> -M:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +M:     Bartosz Golaszewski <brgl@bgdev.pl>
>  L:     linux-i2c@vger.kernel.org
>  S:     Maintained
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
> @@ -7986,7 +7986,7 @@ F:        include/linux/gpio/regmap.h
>
>  GPIO SUBSYSTEM
>  M:     Linus Walleij <linus.walleij@linaro.org>
> -M:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +M:     Bartosz Golaszewski <brgl@bgdev.pl>
>  L:     linux-gpio@vger.kernel.org
>  S:     Maintained
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
> @@ -11367,7 +11367,7 @@ F:      Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
>  F:     drivers/iio/proximity/mb1232.c
>
>  MAXIM MAX77650 PMIC MFD DRIVER
> -M:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +M:     Bartosz Golaszewski <brgl@bgdev.pl>
>  L:     linux-kernel@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/*/*max77650.yaml
> @@ -18689,7 +18689,7 @@ F:      include/linux/clk/ti.h
>
>  TI DAVINCI MACHINE SUPPORT
>  M:     Sekhar Nori <nsekhar@ti.com>
> -R:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +R:     Bartosz Golaszewski <brgl@bgdev.pl>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:     Supported
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/nsekhar/linux-davinci.git
> --
> 2.30.1
>


-- 
With Best Regards,
Andy Shevchenko
