Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3466A4774D1
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 15:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234853AbhLPOkZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 09:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232369AbhLPOkX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Dec 2021 09:40:23 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD372C061574;
        Thu, 16 Dec 2021 06:40:22 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id t5so87596520edd.0;
        Thu, 16 Dec 2021 06:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Os6s1NmcWdadYy3WvTCfCU61qwcymHUj3Z04MGXTuI=;
        b=pG4QU7yUyjNjGbkDkh3nNMBIJ9HxblK1cY6w8XvnM0K5G9YQDDoE/GmVJhMj/tuIoE
         qfW1M802ZWevHAbYukyZShAQ4cPR77ymBiVIBF3pTtJplKVrksmLSHpky6k/HfgjRt32
         f+lEhsE0SYeaG8eu2TSspGc/aKhM5E8xpMYP8qITvfZUBLTSSKlOKxHwRpU0GJ3zzcD0
         wviUvHIo7PQiltZDqOMqTg9vHlliptxBinki7S1o6xlyf4u/jHd4CN27bzAKEkWtBBx1
         o3R7drIHOrGJcCvLUgtcmreRLp4lHVP34TiAVHXetGKw2Kk6xkYU+Ev2bQqU9qHFfvQg
         1Zaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Os6s1NmcWdadYy3WvTCfCU61qwcymHUj3Z04MGXTuI=;
        b=gj9t04FRJGk47CxlVsfeMLOxcCIXlqQ4vGR4jC3AsngJN1/Qv4J+RTFJIcpvaSLim/
         43AExQuYNX/htnF4wj92uFkmbLwsvNb95868o3aGNgMltBMaqpu3whqkDFot6RviT+ZE
         Hnsf0DkI655gR8u7bXR5T332osi2H/sPbU6JHuhkfMDHHSoLnEj65yQN7Ljq4wdr3tmq
         7oD71pP1z1/cBiUQOKKdn4KgTYbm/kwYheE9EANZ1LEh+a32Z0v8DnZXk4jZDJMSUDyp
         dllQyJspsiS/4LrNrHb2xBdl+84uWtioGvcnVU6R9aoZAxzbWAM08qPNBznrlAv1GG3D
         /YYg==
X-Gm-Message-State: AOAM531XysvT3GP2wrSq9i12fE70j8Lp7HfLRgfO/bembkN7rpmPgc8K
        2EhH5tEGeX9VokXZ6Ni3mjwordQpXdlBks4ZGsI=
X-Google-Smtp-Source: ABdhPJwdDpS+ipR7n6OxR+8cz83068lG1xJWRu+5XbSn01J69xOCeONv5WDOGDbgkPCyc+YILRfBNJa3fhRNy8xxVS8=
X-Received: by 2002:a05:6402:270c:: with SMTP id y12mr20762654edd.258.1639665621353;
 Thu, 16 Dec 2021 06:40:21 -0800 (PST)
MIME-Version: 1.0
References: <1639660402-31207-1-git-send-email-akhilrajeev@nvidia.com> <1639660402-31207-2-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1639660402-31207-2-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 16 Dec 2021 16:38:52 +0200
Message-ID: <CAHp75VdXw_XvDN=T3fOmNOWsdfQ_xm2090z9uAq77oADPRcMzw@mail.gmail.com>
Subject: Re: [PATCH 1/2] device property: Add device_irq_get_byname
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 16, 2021 at 3:14 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Get interrupt by name from ACPI table as well.

the interrupt resource

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
> index cbe4fa2..7acf4fc 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -920,6 +920,41 @@ int fwnode_irq_get(const struct fwnode_handle *fwnode, unsigned int index)
>  EXPORT_SYMBOL(fwnode_irq_get);
>
>  /**
> + * fwnode_irq_get_byname - Get IRQ from a fwnode using its name
> + * @fwnode:    Pointer to the firmware node
> + * @index:     IRQ name
> + *

Needs a description to explain how the name is described.

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

This property ise needs to be described in the ACPI documentation:
https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html

Perhaps after the DMA section.

> +       return fwnode_irq_get(fwnode, index);
> +}

-- 
With Best Regards,
Andy Shevchenko
