Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF5167477D4
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jul 2023 19:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbjGDRdF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 4 Jul 2023 13:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjGDRdA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jul 2023 13:33:00 -0400
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4709CDA;
        Tue,  4 Jul 2023 10:32:56 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-98e2865e2f2so160154466b.0;
        Tue, 04 Jul 2023 10:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688491975; x=1691083975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lW4LJlumzva12+IQ3BLk1PuvUZFdkFvStFm2FTeBlDo=;
        b=JoNfASlzzObF5scHE8HLjRklUuAs94F3cVBKJXgbRWZmOveZ+2S6gErN/vmdIvNA14
         6U1SkDy56Hafr/dBYyyzsXcSXr5nVuJx5sa6E0SxLJUoKlX9k2NlPfl2MCUJWV/I86uS
         p7YdDIQQUNftSr3jozH6ouk/W2oEoycNz9IpkoZotDBJss+l1RXWkXuzP4TW3f3Oe6/G
         K8pPIIc+B5lsqOMhJ98Mg+tGawu4WNUUPEqoGj1v8ggAU99Wn+PFkcOu61ZBoqh6QJkJ
         Iz5u4MlA8SEsVpbgFrzSmoYWi7fVbSTTiZ1zg1LjgjD+l7SzJbfXPf3aTTw9BEUwQHoj
         oarA==
X-Gm-Message-State: ABy/qLbesWnHZ0Re+53njriMlJU3B4WfGFkMzoM1XLMr3WaU2AD7tKGE
        SxrkEMjNJ5wcSN4hjXyrMp27qgm8x2jZHVyFRS8=
X-Google-Smtp-Source: APBJJlFJ3yLzRjSaZ5TGIc7GshSZ92NCejwA2m9LUyC4vBOSDqHjrz/cvK5NFXGX9h1VI6PkKTZDyyC8vkBxV1WGVHM=
X-Received: by 2002:a17:906:d112:b0:992:387:44d1 with SMTP id
 b18-20020a170906d11200b00992038744d1mr7765098ejz.7.1688491974696; Tue, 04 Jul
 2023 10:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230703121411.69606-1-andriy.shevchenko@linux.intel.com> <20230703121411.69606-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230703121411.69606-3-andriy.shevchenko@linux.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 4 Jul 2023 19:32:43 +0200
Message-ID: <CAJZ5v0iZzvdkxe3NjHbiZzDjea=CoK-pGw3hjSoa9u8f87TLtg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] ACPI: platform: Ignore SMB0001 only when it has resources
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 3, 2023 at 2:14 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> After switching i2c-scmi driver to be a platform one, it stopped
> being enumerated on number of Kontron platforms, because it's
> listed in the forbidden_id_list.
>
> To resolve the situation, add a flag to driver data to allow devices
> with no resources in _CRS to be enumerated via platform bus.
>
> Fixes: 03d4287add6e ("i2c: scmi: Convert to be a platform driver")
> Closes: https://lore.kernel.org/r/60c1756765b9a3f1eab0dcbd84f59f00fe1caf48.camel@kontron.com
> Link: https://lore.kernel.org/r/20230621151652.79579-1-andriy.shevchenko@linux.intel.com
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> ---
>  drivers/acpi/acpi_platform.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/acpi/acpi_platform.c b/drivers/acpi/acpi_platform.c
> index fe00a5783f53..c2ce558bd032 100644
> --- a/drivers/acpi/acpi_platform.c
> +++ b/drivers/acpi/acpi_platform.c
> @@ -9,6 +9,7 @@
>   */
>
>  #include <linux/acpi.h>
> +#include <linux/bits.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/kernel.h>
> @@ -19,13 +20,16 @@
>
>  #include "internal.h"
>
> +/* Exclude devices that have no _CRS resources provided */
> +#define ACPI_ALLOW_WO_RESOURCES                BIT(0)
> +
>  static const struct acpi_device_id forbidden_id_list[] = {
>         {"ACPI0009", 0},        /* IOxAPIC */
>         {"ACPI000A", 0},        /* IOAPIC */
>         {"PNP0000",  0},        /* PIC */
>         {"PNP0100",  0},        /* Timer */
>         {"PNP0200",  0},        /* AT DMA Controller */
> -       {"SMB0001",  0},        /* ACPI SMBUS virtual device */
> +       {"SMB0001",  ACPI_ALLOW_WO_RESOURCES},  /* ACPI SMBUS virtual device */
>         { }
>  };
>
> @@ -83,6 +87,15 @@ static void acpi_platform_fill_resource(struct acpi_device *adev,
>                 dest->parent = pci_find_resource(to_pci_dev(parent), dest);
>  }
>
> +static unsigned int acpi_platform_resource_count(struct acpi_resource *ares, void *data)
> +{
> +       bool *has_resources = data;
> +
> +       *has_resources = true;
> +
> +       return AE_CTRL_TERMINATE;
> +}
> +
>  /**
>   * acpi_create_platform_device - Create platform device for ACPI device node
>   * @adev: ACPI device node to create a platform device for.
> @@ -100,17 +113,28 @@ struct platform_device *acpi_create_platform_device(struct acpi_device *adev,
>         struct acpi_device *parent = acpi_dev_parent(adev);
>         struct platform_device *pdev = NULL;
>         struct platform_device_info pdevinfo;
> +       const struct acpi_device_id *match;
>         struct resource_entry *rentry;
>         struct list_head resource_list;
>         struct resource *resources = NULL;
> +       bool has_resources;
>         int count;
>
>         /* If the ACPI node already has a physical device attached, skip it. */
>         if (adev->physical_node_count)
>                 return NULL;
>
> -       if (!acpi_match_device_ids(adev, forbidden_id_list))
> -               return ERR_PTR(-EINVAL);
> +       match = acpi_match_acpi_device(forbidden_id_list, adev);
> +       if (match) {
> +               if (match->driver_data & ACPI_ALLOW_WO_RESOURCES) {
> +                       acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
> +                                           acpi_platform_resource_count, &has_resources);
> +                       if (has_resources)
> +                               return ERR_PTR(-EINVAL);
> +               } else {
> +                       return ERR_PTR(-EINVAL);
> +               }
> +       }
>
>         INIT_LIST_HEAD(&resource_list);
>         count = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
> --

Applied as 6.5-rc material along with the rest of the series (except
for the last patch that has been superseded), but I moved the
has_resources definition to the block where it is used and added a
'false' initial value to it. as the code might not work as expected
without initializing it.

Please double check the bleeding-edge branch of linux-pm.

Thanks!
