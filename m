Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC82648C7AF
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jan 2022 16:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354849AbiALPzj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jan 2022 10:55:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354850AbiALPze (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jan 2022 10:55:34 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 425FBC061748;
        Wed, 12 Jan 2022 07:55:34 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id q25so11813843edb.2;
        Wed, 12 Jan 2022 07:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7sr5SESFFMB446XWLFZjyV/pitsS2bsWKxu5hETTxNM=;
        b=Z2DtGmZd15CFngreVTZS0S8eF7cgf7qNpMDbsRgyUrblkJjHI85j+s6mkaq75JZm5o
         wEHEL2I0wXsvGpLtxUUV3rqwVXnDb9feupL/z2lSXJsWxcZChRN/j/W939f9yB725iag
         qwklSKX1aENX/c5ItiOJhEtnVOmv+ZUs847RBU4EICM221XSsQ3t3XhFirGFoFl6TQbN
         TCPPw7eTuOSJ22n3HaBTIAhTJFOURowETCLAj3qkYfN6YBf3S8zSBpj2BXJ3DvOXUxWZ
         DRwAEny9Wdzxhgu3ndh5BcOqPEmvCa78a6+JiO7U/ZskfFkwVW4k9gxFhducOkDqRLwH
         1jUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7sr5SESFFMB446XWLFZjyV/pitsS2bsWKxu5hETTxNM=;
        b=CBApm3Yb4z6wThdpfKHk4VlQhPo1Abhrcy/hzHu//qHjFaBijfQGsZV7XYtckNvIId
         YFfBYNtyzJ5eOpFzKbNPgMiOi7pR9nb4HvzxTQKa6aUrk618Wm6NBqFVu4juOPzGhVLP
         OqGqTVDf10NYR0pCJzrDzx/kAXRg+/2gVKqBgbQgXGA3UplchEUSCyu7rstzmZlOam8i
         APLaosKmoeWZCj6AzxelIqV5fa8e5lndtvLp5ocOjMYFZgnoA0VpxM4Jl7NGeJZAbIIg
         3I8QcvWBVSW+v/LS/jIBuIEb+9Wmrwkrr81tJkn8/NmYhD2i0THsjXL3N+zUCm9Zxg3P
         O9Cg==
X-Gm-Message-State: AOAM5330Afd96KBXUwp4yAFUfNxUcCtlipqnFfQuqFnWhYxYJlDxeEAE
        K23tysQ82SPEJqkat+eSt53rhtBSQlfuY6m+8Ow=
X-Google-Smtp-Source: ABdhPJzJXO9xzC/S0TQ24Y7YhDy0ls0vhKKyoj7GKS7LG+kDSY0DZTNtnzQnsn3WgzH7kNxAQFLNTr838SaKfW72fS4=
X-Received: by 2002:a05:6402:2696:: with SMTP id w22mr270559edd.296.1642002932831;
 Wed, 12 Jan 2022 07:55:32 -0800 (PST)
MIME-Version: 1.0
References: <1641996862-26960-1-git-send-email-akhilrajeev@nvidia.com> <1641996862-26960-2-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1641996862-26960-2-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 12 Jan 2022 17:53:45 +0200
Message-ID: <CAHp75Vc+uN8MTM4cSMQ5gk7GvgkZwJ7aoKwnFiNjQVM4QTqPVg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] device property: Add device_irq_get_byname
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Christian Koenig <christian.koenig@amd.com>,
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

On Wed, Jan 12, 2022 at 4:14 PM Akhil R <akhilrajeev@nvidia.com> wrote:

In the subject line: device_irq_get_byname()

> Get interrupt by name from ACPI table as well.

an interrupt
the ACPI

> Add option to use 'interrupt-names' in _DSD which can map to interrupt by

can be mapped
Interrupt() resource

(The last one is very important to point out this is only about
Interrupt() resources for now).

> index. The implementation is similar to 'interrupt-names' in devicetree.

the Device Tree

> Also add a common routine to get irq by name from devicetree and ACPI

IRQ
Device Tree

> table.

...

>  /**
> + * fwnode_irq_get_byname - Get IRQ from a fwnode using its name
> + * @fwnode:    Pointer to the firmware node
> + * @name:      IRQ name in interrupt-names property in fwnode
> + *
> + * Returns Linux IRQ number on success, errno otherwise.

negative errno

> + */
> +int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
> +{
> +       int index;

> +       if (unlikely(!name))

Don't use unlikely() here.

> +               return -EINVAL;
> +
> +       index = fwnode_property_match_string(fwnode, "interrupt-names",  name);
> +       if (index < 0)
> +               return index;
> +
> +       return fwnode_irq_get(fwnode, index);
> +}

-- 
With Best Regards,
Andy Shevchenko
