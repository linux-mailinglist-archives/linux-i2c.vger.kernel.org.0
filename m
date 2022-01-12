Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F195148C7FF
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 17:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354948AbiALQOH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 11:14:07 -0500
Received: from mail-qv1-f51.google.com ([209.85.219.51]:35567 "EHLO
        mail-qv1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240511AbiALQOF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jan 2022 11:14:05 -0500
Received: by mail-qv1-f51.google.com with SMTP id a8so3459751qvx.2;
        Wed, 12 Jan 2022 08:14:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o7MEgpOOxGt54/hkpy3yNzHIxHgqeMXzxGl0QBEiqQ8=;
        b=r/WgqwG1Jmawy6A9MQxbp5uWEL+1VzIUGyWlr+jJu7zm8hnrzUsiyXeuqwK7jECOd6
         Q9ZogepWUIft+4mfZ3stJ4Bj6wyP5/66jOnp0wqK0jOlfb7jkUR0/ElymJG8nZ4RXlyb
         vHG3JERoO2KyhktCMd8pCWe/9+WWHhj54mrqTHuRXkb0w6sStv0uMUZega01DsdIU3wt
         bBgcCZDV5iz/C4wFZDrWPnU1P3GoGKzoPlpWzX4bQR6446uQIfn+aYiJOFpjs38FkWkm
         sacJx2O5RPWaO3i6XfkxVWpiirjjEFwtrKoG72bOGfIKTpmt1rX5r5O8rIy4DqWX9uCw
         E37w==
X-Gm-Message-State: AOAM533lB3gfDKrzEYyQ3zIKzRCNDioHNItdqTt5BIMQ+UNMwjJtszi6
        NE9AWitmKYv+Q2o+Eub2p2WCeX0c1AO1e0L0v+o=
X-Google-Smtp-Source: ABdhPJyS2AnOwxzgQuWUygWNfan4PYFTyozxvPlJyBn/aWQsWTeqWLf8F7Jto6lKEcKdepyZTrOWftVBmhSNLmLn9d4=
X-Received: by 2002:ad4:5c41:: with SMTP id a1mr425140qva.130.1642004044858;
 Wed, 12 Jan 2022 08:14:04 -0800 (PST)
MIME-Version: 1.0
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com> <1641996862-26960-2-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1641996862-26960-2-git-send-email-akhilrajeev@nvidia.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 12 Jan 2022 17:13:53 +0100
Message-ID: <CAJZ5v0hW-i8+hqkQtHG2H3X7zotABEx_bKei9OFkjBuFbL6JKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] device property: Add device_irq_get_byname
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 12, 2022 at 3:14 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Get interrupt by name from ACPI table as well.
>
> Add option to use 'interrupt-names' in _DSD which can map to interrupt by
> index. The implementation is similar to 'interrupt-names' in devicetree.
> Also add a common routine to get irq by name from devicetree and ACPI
> table.
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/base/property.c  | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/property.h |  3 +++
>  2 files changed, 38 insertions(+)
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index cbe4fa2..414c316 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -920,6 +920,41 @@ int fwnode_irq_get(const struct fwnode_handle *fwnode, unsigned int index)
>  EXPORT_SYMBOL(fwnode_irq_get);
>
>  /**
> + * fwnode_irq_get_byname - Get IRQ from a fwnode using its name
> + * @fwnode:    Pointer to the firmware node
> + * @name:      IRQ name in interrupt-names property in fwnode
> + *
> + * Returns Linux IRQ number on success, errno otherwise.
> + */
> +int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
> +{
> +       int index;
> +
> +       if (unlikely(!name))
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
> + * device_irq_get_byname - Get IRQ of a device using interrupt name
> + * @dev:       Device to get the interrupt
> + * @name:      IRQ name in interrupt-names property in fwnode

Which fwnode?

> + *
> + * Returns Linux IRQ number on success, errno otherwise.
> + */
> +int device_irq_get_byname(struct device *dev, const char *name)
> +{
> +       return fwnode_irq_get_byname(dev_fwnode(dev), name);
> +}
> +EXPORT_SYMBOL_GPL(device_irq_get_byname);

This can be confusing, because it pretends to be super-generic and in
fact it depends on an fwnode to be there.

I guess I'd rather not have it at all, or use a more precise name for it.

> +
> +/**
>   * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
>   * @fwnode: Pointer to the parent firmware node
>   * @prev: Previous endpoint node or %NULL to get the first
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 16f736c..bc49350 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -121,6 +121,9 @@ struct fwnode_handle *fwnode_handle_get(struct fwnode_handle *fwnode);
>  void fwnode_handle_put(struct fwnode_handle *fwnode);
>
>  int fwnode_irq_get(const struct fwnode_handle *fwnode, unsigned int index);
> +int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name);
> +
> +int device_irq_get_byname(struct device *dev, const char *name);
>
>  unsigned int device_get_child_node_count(struct device *dev);
>
> --
> 2.7.4
>
