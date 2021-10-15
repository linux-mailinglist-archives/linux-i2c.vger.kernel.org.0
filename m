Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9553842EFDF
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Oct 2021 13:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238481AbhJOLo4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Oct 2021 07:44:56 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:46020 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233893AbhJOLoz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Oct 2021 07:44:55 -0400
Received: by mail-ot1-f46.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so12357964otq.12;
        Fri, 15 Oct 2021 04:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JfZm3iz53zBbmZ+VZQc8KEVHhrHKIZCNO2+vdUYexZQ=;
        b=K9khiOGXuhLa3d+bYUFZUTD3HNSebX0cfXxrkpZWfPYIyfKsk9lDnVzyxKVAwmHJS9
         f8VzXSYQ2LadJHmoQyRHhupPrpxcOQCbx0r0GwCizfXCbaotvPKoRe0eLamd2mzf2RNd
         G+1LyqUXWQlrY0b3CxFhopa8FjzGm8NGjhBDEI0SI7ggKs7dVDWLplTkODUXYFNyOZid
         iGgHAGYmLtJOEb6P3EKVJwJHovFWukfilwqM/CXh1mQdXIfSQ37Dc81dW4yaETbInbH4
         yuiRJibQ2NikutinjLi/hiB4iMd8rVxhNYbkxwDllF8b5lZujiWPuUP2Vm5PDhTpSw2T
         6PGQ==
X-Gm-Message-State: AOAM533IlFTr64RSEDgSwSW8e+b2veVD9DfsbcTpI8UCYisoC4m219PR
        tvTlQxx78GF61fIcTKEpDySZ1DxlROTBpKY7vuM=
X-Google-Smtp-Source: ABdhPJyoEJdEus2DquPhhvMi/xTGqQhpdGRCjogsE1cGs4H+xC9389P/c68uhtDj1mE7Yxm1bxzEaLCJvcMT4JIVlNM=
X-Received: by 2002:a05:6830:90b:: with SMTP id v11mr6395998ott.254.1634298169233;
 Fri, 15 Oct 2021 04:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211014134756.39092-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211014134756.39092-1-andriy.shevchenko@linux.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Fri, 15 Oct 2021 13:42:37 +0200
Message-ID: <CAJZ5v0jqXqhV1FSyuoVwbgwhte7Q4KUQMozggcxCHGPf+Mfw=A@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] driver core: Provide device_match_acpi_handle() helper
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

On Thu, Oct 14, 2021 at 3:48 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> We have a couple of users of this helper, make it available for them.
>
> The prototype for the helper is specifically crafted in order to be
> easily used with bus_find_device() call. That's why its location is
> in the driver core rather than ACPI.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

OK, please feel free to add

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

to all of the patches in this series.

> ---
> v4: amended changelog to clarify implementation details (Rafael)
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
