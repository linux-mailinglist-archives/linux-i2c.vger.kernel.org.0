Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C959642C7F9
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 19:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238761AbhJMRuh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 13:50:37 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:43908 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238371AbhJMRtv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 13:49:51 -0400
Received: by mail-ot1-f41.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so4702005otb.10;
        Wed, 13 Oct 2021 10:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WTHqC3FWhyaKU41OGOFIZ7uSJVO0v438/lsYbbFL0IU=;
        b=E+1jLqRhTK4zSTb6S9+M3JxmApkyh6bIVR2oHkynWAMNY2O4IwCGen5FCcFixVslsK
         dxCDw1qzvfTP178+WjuoQb5pEvdZlWWA746ZOAGn6KhJi/JnyM5tN6ejLcgYbDn24Ygi
         zJGKtadWsT+EFVOqK7MfSmElq7B936hdunsZ+rZ9Tc7eRsb/3nI5vjtzQn5GIvLBD55p
         AaqWALGOB75c5W39VtKbi+yBHC9pJNqJ1w8nsbriTaEgDlU3xVVakmm3o/Ne10KGmVcN
         3hBhkkOwDUVb52bOPH9GiusaYWaYJFPqY1DhQl7q4sC88CgCwSyL3HKw2ITsADzc4WqY
         Cl6w==
X-Gm-Message-State: AOAM532TvQALqLjSJc78/X9synEMjheU7DDatuolzhpWAIKwHNmLCwBG
        yhkacVMSXvreO9GLMmKx4RFt8mkhzxrq96wlI1M=
X-Google-Smtp-Source: ABdhPJwc3dzDhDDHNfOsfvgbzy52hc6jkruTyKOXhn6JzdndOAOtta7h15sFXR3l2JuBieViSG0V3BoVQTw+ay/5Dio=
X-Received: by 2002:a9d:65c1:: with SMTP id z1mr499089oth.198.1634147267828;
 Wed, 13 Oct 2021 10:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211007171815.28336-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211007171815.28336-1-andriy.shevchenko@linux.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 13 Oct 2021 19:47:37 +0200
Message-ID: <CAJZ5v0h2=LZ8YX9MP6_dcyyybRQC6rii-r1Lc_Ss1XFFBUiSGQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] driver core: Provide device_match_acpi_handle() helper
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

On Thu, Oct 7, 2021 at 7:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> We have couple of users of this helper, make it available for them.

"a couple"?

>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v3: no changes
>  drivers/base/core.c        | 6 ++++++
>  include/linux/device/bus.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index b67ebe6a323c..fd034d742447 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -4838,6 +4838,12 @@ int device_match_acpi_dev(struct device *dev, const void *adev)
>  }
>  EXPORT_SYMBOL(device_match_acpi_dev);
>
> +int device_match_acpi_handle(struct device *dev, const void *handle)

Hmmm.  Should the second arg be of type acpi_handle?

And doesn't this function belong to the ACPI core?  It is related to
acpi_bus_get_device() and such which are located there.

> +{
> +       return ACPI_HANDLE(dev) == handle;
> +}
> +EXPORT_SYMBOL(device_match_acpi_handle);
> +
>  int device_match_any(struct device *dev, const void *unused)
>  {
>         return 1;
> diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
> index 062777a45a74..a039ab809753 100644
> --- a/include/linux/device/bus.h
> +++ b/include/linux/device/bus.h
> @@ -143,6 +143,7 @@ int device_match_of_node(struct device *dev, const void *np);
>  int device_match_fwnode(struct device *dev, const void *fwnode);
>  int device_match_devt(struct device *dev, const void *pdevt);
>  int device_match_acpi_dev(struct device *dev, const void *adev);
> +int device_match_acpi_handle(struct device *dev, const void *handle);
>  int device_match_any(struct device *dev, const void *unused);
>
>  /* iterator helpers for buses */
> --
> 2.33.0
>
