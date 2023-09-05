Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB00A79323A
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 01:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238546AbjIEXEA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 19:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjIEXD7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 19:03:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B74F7199;
        Tue,  5 Sep 2023 16:03:55 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14B7C433C7;
        Tue,  5 Sep 2023 23:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693955035;
        bh=wMx4Tp3d/EJsu6/oCM6hDQiu1DWer7zBkf0OEbTAv7s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GyAowMHhMN3dIJNd8pMn037z7dgwt4wq+dDE7tACBzarLdVtEtDwprbQBEk31n9bD
         BNFePJFYmmDf1rgi8g3viVXEM4CSHSg6cRfLHBeFgqnHqDpGkrbDk2zAKgVho88o4x
         KwkhuDx1gRDXR1bDAoZWjrAz2N0ESrqLPhPNLM+WXqqAt8R7y1pCMn4CzlUL9OQZV2
         uX5uTjvnaYA2ZqcIjjELu7MEnmmRYRv/A4LY5vbqWNc7XYlzunrbmUIJI9X5nMdj+1
         f3DTCgAA9KsyWwZNKIGew7hd9OVGhNj+0GKi8XhKmNL6LOV4Q6jnq+IQiOO0hs6EOj
         dw/hI836iz3Ow==
Date:   Wed, 6 Sep 2023 01:03:52 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/mellanox: NVSW_SN2201 should depend on ACPI
Message-ID: <20230905230352.nizvkaurtwqjdoxe@zenone.zhora.eu>
References: <cover.1693828363.git.geert+renesas@glider.be>
 <ec5a4071691ab08d58771b7732a9988e89779268.1693828363.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec5a4071691ab08d58771b7732a9988e89779268.1693828363.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert,

On Mon, Sep 04, 2023 at 02:00:35PM +0200, Geert Uytterhoeven wrote:
> The only probing method supported by the Nvidia SN2201 platform driver
> is probing through an ACPI match table.  Hence add a dependency on
> ACPI, to prevent asking the user about this driver when configuring a
> kernel without ACPI support.
> 
> Fixes: 662f24826f954d49 ("platform/mellanox: Add support for new SN2201 system")

I don't think the Fixes tag is needed here...

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/platform/mellanox/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
> index 382793e73a60a8b3..30b50920b278c94b 100644
> --- a/drivers/platform/mellanox/Kconfig
> +++ b/drivers/platform/mellanox/Kconfig
> @@ -80,8 +80,8 @@ config MLXBF_PMC
>  
>  config NVSW_SN2201
>  	tristate "Nvidia SN2201 platform driver support"
> -	depends on HWMON
> -	depends on I2C
> +	depends on HWMON && I2C
> +	depends on ACPI || COMPILE_TEST

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Andi

>  	select REGMAP_I2C
>  	help
>  	  This driver provides support for the Nvidia SN2201 platform.
> -- 
> 2.34.1
> 
