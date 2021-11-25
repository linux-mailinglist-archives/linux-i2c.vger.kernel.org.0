Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDEA045DFCF
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 18:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348860AbhKYRgk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 12:36:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348947AbhKYRej (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Nov 2021 12:34:39 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD389C0619DB;
        Thu, 25 Nov 2021 09:22:54 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id w1so28515292edc.6;
        Thu, 25 Nov 2021 09:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CeTt+lZ3NtZ7WbMSRJw3X+ea0cwH/6HmZ09E6WWPuRc=;
        b=cMWL0pgR5NOYORdbNpHMMbTNtSL2eR/M5o1k01s9tvdrr2xZYy0AYbY5dZ53ofu2KF
         UXtiuVYVtzNxAKn/7+uEIteZUqzIC7DHqumsEglGjQV8Xf+VuiHIh0huGItNsTpGrpeA
         gzK/rUmvoH+amV8ept364s5LHai1NF2mwyd4uwBVpekJOUmo6BjlDREZFl4wyL8PU4QP
         NuJPPD8nXtM8Z33WEO2xqhohX3gXjEr/G+98PHeslUTwLoxX3cbI5HwQB2TuuwQU4nnk
         zqGWOuJ6AEqNoO9oJTtvKNQ3uPlHCnN7tWXJ4I24J/I7aLFi8HfkpsaMH9Tw/ysKZfQa
         Q0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CeTt+lZ3NtZ7WbMSRJw3X+ea0cwH/6HmZ09E6WWPuRc=;
        b=ns2uUP4GlURqMwcMK/7GoxjGLP6uJl4lKPnpEmJSndwP58TaH6gsiZefcM3lYHI9ad
         6VXRzOb2laIdXUB9h1PwBN6mESeb6WOo33rNLAi8EtYlzcKBtgDqivqDuBVBXpwo9iYi
         KaNE7vAHe/bfbhrXZWio7RthZDYM4pffYKZYe5d6jrilCbdlyBZc79YptjzB62ndOQ+z
         okw4vYMOpYR1REOXYp/FWZvnmgQ/PgXdcS1i27WCVZG5gXjz8WsY3wouUkaOojTEDqiI
         8ariky4eEaPQYI8gsV8GCYRBSO5Sx41zQahMpERKj6VvOi2Sett+UITadr0VyGxyMxC0
         d6Uw==
X-Gm-Message-State: AOAM532fanpRPj7ZPkT7h5Y2UhV6vBfvmSZc2uV3yZRt8D7Jpf8echRO
        q5LNRbiQb7JXVKInCf0cUm8fmzqsLuIMSg2I4rw=
X-Google-Smtp-Source: ABdhPJw+gnMB2U6mq9HU0eAzyUrTKWNPtnYpCXiAHUb55ZRPMW14tsVKlJZfoCEHCSjHliSNcdJZYhnEF4fpn1yI0ss=
X-Received: by 2002:a05:6402:4394:: with SMTP id o20mr40808523edc.342.1637860973272;
 Thu, 25 Nov 2021 09:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20211125165412.535063-1-hdegoede@redhat.com> <20211125165412.535063-4-hdegoede@redhat.com>
In-Reply-To: <20211125165412.535063-4-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Nov 2021 19:22:17 +0200
Message-ID: <CAHp75VdBf-xNfx5a70LWnP7-qJpjB9gWSVQExqCz3emrgrT7Zw@mail.gmail.com>
Subject: Re: [PATCH v6 03/15] i2c: acpi: Add i2c_acpi_new_device_by_fwnode() function
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

On Thu, Nov 25, 2021 at 6:54 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Change i2c_acpi_new_device() into i2c_acpi_new_device_by_fwnode() and
> add a static inline wrapper providing the old i2c_acpi_new_device()
> behavior.
>
> This is necessary because in some cases we may only have access
> to the fwnode / acpi_device and not to the matching physical-node
> struct device *.

One nit-pick below.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Thanks!

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v6:
> - New patch in v6 of this patch series
> ---
>  drivers/i2c/i2c-core-acpi.c | 18 ++++++++++++------
>  include/linux/i2c.h         | 17 +++++++++++++----
>  2 files changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index 04338cbd08a9..1db3cc5fc47f 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -476,8 +476,9 @@ struct notifier_block i2c_acpi_notifier = {
>  };
>
>  /**
> - * i2c_acpi_new_device - Create i2c-client for the Nth I2cSerialBus resource
> - * @dev:     Device owning the ACPI resources to get the client from

> + * i2c_acpi_new_device_by_fwnode - Create i2c-client for the Nth I2cSerialBus
> + * resource

Can be on one line.

> + * @fwnode:  fwnode with the ACPI resources to get the client from
>   * @index:   Index of ACPI resource to get
>   * @info:    describes the I2C device; note this is modified (addr gets set)
>   * Context: can sleep
> @@ -493,15 +494,20 @@ struct notifier_block i2c_acpi_notifier = {
>   * Returns a pointer to the new i2c-client, or error pointer in case of failure.
>   * Specifically, -EPROBE_DEFER is returned if the adapter is not found.
>   */
> -struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
> -                                      struct i2c_board_info *info)
> +struct i2c_client *i2c_acpi_new_device_by_fwnode(struct fwnode_handle *fwnode,
> +                                                int index,
> +                                                struct i2c_board_info *info)
>  {
> -       struct acpi_device *adev = ACPI_COMPANION(dev);
>         struct i2c_acpi_lookup lookup;
>         struct i2c_adapter *adapter;
> +       struct acpi_device *adev;
>         LIST_HEAD(resource_list);
>         int ret;
>
> +       adev = to_acpi_device_node(fwnode);
> +       if (!adev)
> +               return ERR_PTR(-ENODEV);
> +
>         memset(&lookup, 0, sizeof(lookup));
>         lookup.info = info;
>         lookup.device_handle = acpi_device_handle(adev);
> @@ -523,7 +529,7 @@ struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
>
>         return i2c_new_client_device(adapter, info);
>  }
> -EXPORT_SYMBOL_GPL(i2c_acpi_new_device);
> +EXPORT_SYMBOL_GPL(i2c_acpi_new_device_by_fwnode);
>
>  bool i2c_acpi_waive_d0_probe(struct device *dev)
>  {
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 16119ac1aa97..7d4f52ceb7b5 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -1025,8 +1025,9 @@ bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
>                                struct acpi_resource_i2c_serialbus **i2c);
>  int i2c_acpi_client_count(struct acpi_device *adev);
>  u32 i2c_acpi_find_bus_speed(struct device *dev);
> -struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
> -                                      struct i2c_board_info *info);
> +struct i2c_client *i2c_acpi_new_device_by_fwnode(struct fwnode_handle *fwnode,
> +                                                int index,
> +                                                struct i2c_board_info *info);
>  struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle);
>  bool i2c_acpi_waive_d0_probe(struct device *dev);
>  #else
> @@ -1043,8 +1044,9 @@ static inline u32 i2c_acpi_find_bus_speed(struct device *dev)
>  {
>         return 0;
>  }
> -static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
> -                                       int index, struct i2c_board_info *info)
> +static inline struct i2c_client *i2c_acpi_new_device_by_fwnode(
> +                                       struct fwnode_handle *fwnode, int index,
> +                                       struct i2c_board_info *info)
>  {
>         return ERR_PTR(-ENODEV);
>  }
> @@ -1058,4 +1060,11 @@ static inline bool i2c_acpi_waive_d0_probe(struct device *dev)
>  }
>  #endif /* CONFIG_ACPI */
>
> +static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
> +                                                    int index,
> +                                                    struct i2c_board_info *info)
> +{
> +       return i2c_acpi_new_device_by_fwnode(dev_fwnode(dev), index, info);
> +}
> +
>  #endif /* _LINUX_I2C_H */
> --
> 2.33.1
>


-- 
With Best Regards,
Andy Shevchenko
