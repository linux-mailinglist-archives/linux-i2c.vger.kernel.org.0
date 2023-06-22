Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A476073A565
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Jun 2023 17:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbjFVPx3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 22 Jun 2023 11:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbjFVPx1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Jun 2023 11:53:27 -0400
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4839E10F8;
        Thu, 22 Jun 2023 08:53:26 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-98502b12fd4so202445466b.1;
        Thu, 22 Jun 2023 08:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687449205; x=1690041205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LRq3IplvxHFodqnGJxa2C+GD1dW0/Z+gi8MyiCpWLqY=;
        b=ezFP1kQ9UrqWGUQwuQdT2Q2yvFI7Zv2wYsBzvyMtP8AyryTNgXYIXPkrrLT648Knva
         GUU7jraGSfoyW5EVCLhV/PwqGddKmcVUlXrMEh3DzsCsHYY/ORS5+ghJr/qEwWjb//af
         Cy99O3byqxA/F7ATAPbt9RZIGEvqnjsg7DuePz6ka0umCmk1sNFP7t7sgWoa83gLhM5+
         +bSziO57seBKN1t5WXORAanIcoE6iVN058fL6V0IMj2Y3b8snZbZksgOOTv0yvNJaOAv
         lMMoBRVvj77OrIn+r4w/56HJZbj2LYM0oLRpF0JY0fiwwHOh1BRa5vGUQy36GIHb2V/Q
         kTJA==
X-Gm-Message-State: AC+VfDyNbC/c177HRBdi/hRuBN3LmiWcd6c/7sl1jh1mRKtRhmiB1Ssm
        N1jqn+/IFaEjef2zfwuL7SAM3YPxn1Ob8La7NGY=
X-Google-Smtp-Source: ACHHUZ7LVqAIgZ0Fgp4Dz8vORMJOFzWuw863n68A0YAIPuQ6+qD0UqtP8F+DsinsZ++jl9TQej2WkRT0VHhP8QAroDM=
X-Received: by 2002:a17:906:100a:b0:987:81d:9d49 with SMTP id
 10-20020a170906100a00b00987081d9d49mr12869574ejm.7.1687449204470; Thu, 22 Jun
 2023 08:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230621151652.79579-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230621151652.79579-1-andriy.shevchenko@linux.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 22 Jun 2023 17:53:13 +0200
Message-ID: <CAJZ5v0jt8XCzUxQaBXLz0zXezih1Urq=dt-K9PWVY1JpN=Go6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ACPI: platform: Ignore SMB0001 only when it has resources
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Brunner <michael.brunner@kontron.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 21, 2023 at 5:16 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> After switching i2c-scmi driver to be a plaform one, it stopped

"platform"

> being enumerated on number of Kontron platforms, because it's
> listed in the forbidden_id_list.
>
> To resolve the situation, split the list to generic one and
> another that holds devices that has to be skipped if and only

"have"

> if they have bogus resources attached (_CRS method returns some).
>
> Fixes: 03d4287add6e ("i2c: scmi: Convert to be a platform driver")
> Closes: https://lore.kernel.org/r/60c1756765b9a3f1eab0dcbd84f59f00fe1caf48.camel@kontron.com
> Reported-by: Michael Brunner <michael.brunner@kontron.com>
> Tested-by: Michael Brunner <michael.brunner@kontron.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Link: https://lore.kernel.org/r/20230620163534.1042-1-andriy.shevchenko@linux.intel.com
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: added tags (Andi, Michael), fixed spelling (Andi)
>  drivers/acpi/acpi_platform.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/acpi/acpi_platform.c b/drivers/acpi/acpi_platform.c
> index fe00a5783f53..089a98bd18bf 100644
> --- a/drivers/acpi/acpi_platform.c
> +++ b/drivers/acpi/acpi_platform.c
> @@ -19,13 +19,17 @@
>
>  #include "internal.h"
>
> +static const struct acpi_device_id forbidden_id_with_resourses[] = {

I don't quite like this name and the driver_data field could be used
to indicate the need to check the resources.

> +       {"SMB0001",  0},        /* ACPI SMBUS virtual device */
> +       { }
> +};
> +
>  static const struct acpi_device_id forbidden_id_list[] = {
>         {"ACPI0009", 0},        /* IOxAPIC */
>         {"ACPI000A", 0},        /* IOAPIC */
>         {"PNP0000",  0},        /* PIC */
>         {"PNP0100",  0},        /* Timer */
>         {"PNP0200",  0},        /* AT DMA Controller */
> -       {"SMB0001",  0},        /* ACPI SMBUS virtual device */
>         { }
>  };
>
> @@ -83,6 +87,15 @@ static void acpi_platform_fill_resource(struct acpi_device *adev,
>                 dest->parent = pci_find_resource(to_pci_dev(parent), dest);
>  }
>
> +static int acpi_platform_resource_count(struct acpi_resource *ares, void *data)
> +{
> +       int *count = data;
> +
> +       *count = *count + 1;

Why not (*count)++?

> +
> +       return 1;
> +}
> +
>  /**
>   * acpi_create_platform_device - Create platform device for ACPI device node
>   * @adev: ACPI device node to create a platform device for.
> @@ -103,7 +116,8 @@ struct platform_device *acpi_create_platform_device(struct acpi_device *adev,
>         struct resource_entry *rentry;
>         struct list_head resource_list;
>         struct resource *resources = NULL;
> -       int count;
> +       int count = 0;
> +       int ret;
>
>         /* If the ACPI node already has a physical device attached, skip it. */
>         if (adev->physical_node_count)
> @@ -113,6 +127,15 @@ struct platform_device *acpi_create_platform_device(struct acpi_device *adev,
>                 return ERR_PTR(-EINVAL);
>
>         INIT_LIST_HEAD(&resource_list);
> +       ret = acpi_dev_get_resources(adev, &resource_list, acpi_platform_resource_count, &count);
> +       if (ret < 0)
> +               return ERR_PTR(ret);

Why not use acpi_walk_resources() directly here?

Also, this extra resources walk is only needed if the resources check
is needed to decide whether or not to skip the device, so what's the
benefit of doing it for every device that's not skipped?

> +
> +       acpi_dev_free_resource_list(&resource_list);
> +
> +       if (count > 0 && !acpi_match_device_ids(adev, forbidden_id_with_resourses))
> +               return ERR_PTR(-EINVAL);
> +
>         count = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
>         if (count < 0)
>                 return NULL;
> --
