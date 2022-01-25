Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9FD49BA9F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 18:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235347AbiAYRxL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 12:53:11 -0500
Received: from mail-yb1-f171.google.com ([209.85.219.171]:43911 "EHLO
        mail-yb1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243629AbiAYRwr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 12:52:47 -0500
Received: by mail-yb1-f171.google.com with SMTP id g81so63955733ybg.10;
        Tue, 25 Jan 2022 09:52:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+j1GpCpGfNY2lH8frLrkCg4vSgaS4ibnLkUccs79nQA=;
        b=RzcIeeIMikSwVSQ9Yza37NYqsfFrm0hOqPP/KK8YyAjiRunShioLLHtBjsimPmUmi3
         Eopc3HhOpeMnQKM7ym9MJAt/wDGuoj3yoD/HDh4cT5oB16sis6auVObMBy8oZ1Y77B7N
         6+Vriqme2ChbJepG2DAlOXPssIElDlFtA8pm9ea/B7qpCV9+r1vKxcewScZ4y742RbeC
         i5UCoNv3F6jq9cZC6QSlI/fF8FWVjt6/lkdARhb54JHGhDtbfy2Hj+wes4rEw6QbCwBb
         5NiIu98aWjOUnuO7m6gzKdqEam6ZYvdwSXoHROeg+I/fU6WYB9Is+2SeCgNayW2Xeh8a
         qAvw==
X-Gm-Message-State: AOAM5320hUWHXk2MI3tUMmNmGvH2JkzUnGWajZnkOnSfYnUIUp5za9s5
        f2JofaoVdVi/RNpBUrYbK3YvQQVyphL9lKran8g=
X-Google-Smtp-Source: ABdhPJyojknnzuIYMmZbjfeJ+s2pzRiKVKx+zefsCZtajgkwxnDKmiqfjgFEq1JOZLL4BipPUObjdUys5vQ1JNLbLZs=
X-Received: by 2002:a25:bb93:: with SMTP id y19mr30844335ybg.466.1643133165102;
 Tue, 25 Jan 2022 09:52:45 -0800 (PST)
MIME-Version: 1.0
References: <1642851166-27096-1-git-send-email-akhilrajeev@nvidia.com> <1642851166-27096-2-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1642851166-27096-2-git-send-email-akhilrajeev@nvidia.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 25 Jan 2022 18:52:34 +0100
Message-ID: <CAJZ5v0hCREQczOczW6+UGv3UDxskYLRP06qpyQkyXEC1YA3nOw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] device property: Add fwnode_irq_get_byname
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jan 22, 2022 at 12:33 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Add fwnode_irq_get_byname() to get an interrupt by name from either
> ACPI table or Device Tree, whichever is used for enumeration.
>
> In the ACPI case, this allow us to use 'interrupt-names' in
> _DSD which can be mapped to Interrupt() resource by index.
> The implementation is similar to 'interrupt-names' in the
> Device Tree.
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  drivers/base/property.c  | 29 +++++++++++++++++++++++++++++
>  include/linux/property.h |  1 +
>  2 files changed, 30 insertions(+)
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index e6497f6..fc59e0f 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -936,6 +936,35 @@ void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index)
>  EXPORT_SYMBOL(fwnode_iomap);
>
>  /**
> + * fwnode_irq_get_byname - Get IRQ from a fwnode using its name
> + * @fwnode:    Pointer to the firmware node
> + * @name:      IRQ name
> + *
> + * Description:
> + * Find a match to the string @name in the 'interrupt-names' string array
> + * in _DSD for ACPI, or of_node for Device Tree. Then get the Linux IRQ
> + * number of the IRQ resource corresponding to the index of the matched
> + * string.
> + *
> + * Return:
> + * Linux IRQ number on success, or negative errno otherwise.
> + */
> +int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
> +{
> +       int index;
> +
> +       if (!name)
> +               return -EINVAL;
> +
> +       index = fwnode_property_match_string(fwnode, "interrupt-names",  name);
> +       if (index < 0)
> +               return index;
> +
> +       return fwnode_irq_get(fwnode, index);
> +}
> +EXPORT_SYMBOL(fwnode_irq_get_byname);
> +
> +/**
>   * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
>   * @fwnode: Pointer to the parent firmware node
>   * @prev: Previous endpoint node or %NULL to get the first
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 7399a0b..95d56a5 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -121,6 +121,7 @@ struct fwnode_handle *fwnode_handle_get(struct fwnode_handle *fwnode);
>  void fwnode_handle_put(struct fwnode_handle *fwnode);
>
>  int fwnode_irq_get(const struct fwnode_handle *fwnode, unsigned int index);
> +int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name);
>
>  void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
>
> --
> 2.7.4
>
