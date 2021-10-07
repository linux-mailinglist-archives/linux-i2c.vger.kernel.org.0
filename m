Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF07042586E
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Oct 2021 18:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235396AbhJGQww (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Oct 2021 12:52:52 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:45584 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbhJGQwv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Oct 2021 12:52:51 -0400
Received: by mail-ot1-f43.google.com with SMTP id g15-20020a9d128f000000b0054e3d55dd81so3118775otg.12;
        Thu, 07 Oct 2021 09:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aQITjc9EkelfmrMblmNfFJUe60PWwUG8kF/gKJHNbBc=;
        b=Bt/vlGbBj6PsGhgxH84G7Cx1PPHFg/FL0IjwoYSmOoJtjj/YbjisB2UmFXDvakIwa1
         /+kd/Kyo214vY0mJnbMAOL+Jmb/BB/bi43lKfqLP9V+cBTHINpFuJO330wlJiy5IaaZC
         UbDDvDyDCIEmoDy2+d8Sv5cdKPNb/gvq2UUP2rGQt2IholhX8fcyh0D2Izo92Vr5zjig
         5PanzghM+4P8NAre2Uy2IXjsIN+In8Br/P2NFE9AvNXGuQpgzDexZCNOA7WmapANiuHO
         Jxlf9bfmvWNqZvQi/CXnRL3FgY6Eov+qjJMPmHMpJtUWDWs2uEB0LnxQrggsEMdf+WZo
         1LAg==
X-Gm-Message-State: AOAM530KmRQWdS8dp2VkRm/ppGYZ2/nTvLBEEGrWHVXcM6xrxeg59qf0
        ufICzw/g1/M3M0mWyHKsdFPBMRxBGWlunlIsTLc=
X-Google-Smtp-Source: ABdhPJxkjmzjRmeA6qfA9L5v1U4is/YhJfMjAJ5Dp0rAk60j7IrwbvPf+wzuD0LRsGALgVrNNm8Wh2hn7IhCG/VmVtk=
X-Received: by 2002:a9d:2f24:: with SMTP id h33mr4678062otb.254.1633625457450;
 Thu, 07 Oct 2021 09:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211006173125.84423-1-andriy.shevchenko@linux.intel.com> <20211006173125.84423-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211006173125.84423-3-andriy.shevchenko@linux.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 7 Oct 2021 18:50:46 +0200
Message-ID: <CAJZ5v0iN+28gccy00_Ces9bYsLCNJaHaTZGMUwRrPA6TpY3H8A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpiolib: acpi: Replace custom code with device_match_acpi_handle()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 6, 2021 at 7:31 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Since driver core provides a generic device_match_acpi_handle()
> we may replace the custom code with it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: no changes
>  drivers/gpio/gpiolib-acpi.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index 47712b6903b5..32f1f720b94b 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -95,10 +95,7 @@ static bool acpi_gpio_deferred_req_irqs_done;
>
>  static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
>  {
> -       if (!gc->parent)
> -               return false;
> -
> -       return ACPI_HANDLE(gc->parent) == data;
> +       return gc->parent ? device_match_acpi_handle(gc->parent, data) : false;

return gc->parent && device_match_acpi_handle(gc->parent, data);

would work too if I'm not mistaken.

>  }
>
>  /**
> --
