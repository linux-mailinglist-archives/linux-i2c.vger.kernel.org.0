Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBF4738212
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jun 2023 13:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbjFUJbO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jun 2023 05:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbjFUJat (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jun 2023 05:30:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8071718;
        Wed, 21 Jun 2023 02:30:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 75CCE614D8;
        Wed, 21 Jun 2023 09:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B940C433C0;
        Wed, 21 Jun 2023 09:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687339815;
        bh=18nRxiz3RzRU04UzjxaIi/UAFwMnex+OsDW6C9m9tzM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=avWkxEB92WjPUZaa0OQAtoTDGZAonhUdcVlGDiAyztU1gbW9Ztm9Ou+/Z3QyTYFIa
         5Y67KG3ef56ckdI/9k479xJcWpjXht5jigCsC9KepP07J6/febDCKKG2x7luXsE2fr
         b8/Z9nwE+g4Yrm41GnedvZTajj1Ty6dAWgbQb1IXioQi07bJN9qdwdeIbL2S4DR02j
         iSL1bTYnpcK2TXHTCjotNKLlarnGh0TSfBzOMZEwpn5uIjzZZE2mMjVhuuuNX17eQT
         qmLjSO1FnRx1EXA/5oEEokd/0FK1w2HHay7Rd/NhlxO4GGGyPPqUthwYa556LgmvZI
         LQW4/DoTCPsKA==
Date:   Wed, 21 Jun 2023 11:30:12 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Brunner <michael.brunner@kontron.com>
Subject: Re: [PATCH v1 1/2] ACPI: platform: Ignore SMB0001 only when it has
 resources
Message-ID: <20230621093012.nmgrzzepm764kdfy@intel.intel>
References: <20230620163534.1042-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620163534.1042-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Tue, Jun 20, 2023 at 07:35:33PM +0300, Andy Shevchenko wrote:
> After switchind i2c-scmi driver to be a plaform one it stopped

/switchind/switching/
/one/one,/

> being enumerated on number of Kontron platformsm, because it's

/platformsm/platforms/

> listed in the forbidden_id_list.
> 
> To resolve the situation, split the list to generic one and
> another that holds devices that has to be skiped if and only if

/skiped/skipped/

> they have bogus resources attached (_CRS method returns some).
> 
> Fixes: 03d4287add6e ("i2c: scmi: Convert to be a platform driver")
> Closes: https://lore.kernel.org/r/60c1756765b9a3f1eab0dcbd84f59f00fe1caf48.camel@kontron.com
> Reported-by: Michael Brunner <michael.brunner@kontron.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
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
> +	{"SMB0001",  0},	/* ACPI SMBUS virtual device */
> +	{ }
> +};
> +
>  static const struct acpi_device_id forbidden_id_list[] = {
>  	{"ACPI0009", 0},	/* IOxAPIC */
>  	{"ACPI000A", 0},	/* IOAPIC */
>  	{"PNP0000",  0},	/* PIC */
>  	{"PNP0100",  0},	/* Timer */
>  	{"PNP0200",  0},	/* AT DMA Controller */
> -	{"SMB0001",  0},	/* ACPI SMBUS virtual device */
>  	{ }
>  };
>  
> @@ -83,6 +87,15 @@ static void acpi_platform_fill_resource(struct acpi_device *adev,
>  		dest->parent = pci_find_resource(to_pci_dev(parent), dest);
>  }
>  
> +static int acpi_platform_resource_count(struct acpi_resource *ares, void *data)
> +{
> +	int *count = data;
> +
> +	*count = *count + 1;
> +
> +	return 1;
> +}
> +
>  /**
>   * acpi_create_platform_device - Create platform device for ACPI device node
>   * @adev: ACPI device node to create a platform device for.
> @@ -103,7 +116,8 @@ struct platform_device *acpi_create_platform_device(struct acpi_device *adev,
>  	struct resource_entry *rentry;
>  	struct list_head resource_list;
>  	struct resource *resources = NULL;
> -	int count;
> +	int count = 0;
> +	int ret;
>  
>  	/* If the ACPI node already has a physical device attached, skip it. */
>  	if (adev->physical_node_count)
> @@ -113,6 +127,15 @@ struct platform_device *acpi_create_platform_device(struct acpi_device *adev,
>  		return ERR_PTR(-EINVAL);
>  
>  	INIT_LIST_HEAD(&resource_list);
> +	ret = acpi_dev_get_resources(adev, &resource_list, acpi_platform_resource_count, &count);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
> +	acpi_dev_free_resource_list(&resource_list);
> +
> +	if (count > 0 && !acpi_match_device_ids(adev, forbidden_id_with_resourses))
> +		return ERR_PTR(-EINVAL);

... so that you rule out first the devices in this list.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi

> +
>  	count = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
>  	if (count < 0)
>  		return NULL;
> -- 
> 2.40.0.1.gaa8946217a0b
> 
