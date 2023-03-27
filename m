Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82D56C99D7
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 05:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbjC0DCo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Mar 2023 23:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbjC0DCd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Mar 2023 23:02:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3804EDA;
        Sun, 26 Mar 2023 20:02:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 56B8260FA6;
        Mon, 27 Mar 2023 03:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A44C433D2;
        Mon, 27 Mar 2023 03:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679886141;
        bh=ro2qYTrcUU+cYhFXYtbYc9UeqCUWNKAZPvp1734oaxE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aLZt7NmN7dW3zHYBppahDR1suBSqRyBNY6gEku33VIEE8YNRasAVWE8W8XUqsIArJ
         Ci3xKcKUIEDN9Q9djm7qkK7Nevf4zuoXQNzQjVlU8h7p3Kk/wJr0ULzeYnh/pENXEW
         DJR8ZlP3LOyo9VoX103xUNM2I0mlKX+iROjSK7fPMx2SqJeRAoTrUpneH2kpeh91g8
         uBCf9kZ0aQ4FlVpRAEXDeS1jLsr1hUXRBXoxeim4u6cc/Cs6qZuegxhPD+dekgmtcy
         vUdAL7AAJClbM04zLcsuGXUwuL5yIFVdpm9xkxVQkgN8kRGHj68oz7vPEpw8RicxIH
         Lk3zOs4Oh+5RA==
Date:   Mon, 27 Mar 2023 11:02:13 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ivan Bornyakov <i.bornyakov@metrotek.ru>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] treewide: Fix instantiation of devices in DT overlays
Message-ID: <20230327030213.GJ3364759@dragon>
References: <240155f20aae47e9f7461e2b7416120ba6238886.1679650087.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <240155f20aae47e9f7461e2b7416120ba6238886.1679650087.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+ Ivan

On Fri, Mar 24, 2023 at 10:30:39AM +0100, Geert Uytterhoeven wrote:
> When loading a DT overlay that creates a device, the device is not
> instantiated, unless the DT overlay is unloaded and reloaded again.
> 
> Saravana explains:
>   Basically for all overlays (I hope the function is only used for
>   overlays) we assume all nodes are NOT devices until they actually
>   get added as a device.
> 
> Based on a patch by Saravana Kannan, which covered only platform and spi
> devices.
> 
> Fixes: 4a032827daa89350 ("of: property: Simplify of_link_to_phandle()")
> Link: https://lore.kernel.org/r/CAGETcx_+rhHvaC_HJXGrr5_WAd2+k5f=rWYnkCZ6z5bGX-wj4w@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
> v2:
>   - Add Acked-by,
>   - Drop RFC.
> ---
>  drivers/bus/imx-weim.c    | 1 +
>  drivers/i2c/i2c-core-of.c | 1 +
>  drivers/of/dynamic.c      | 1 +
>  drivers/of/platform.c     | 1 +
>  drivers/spi/spi.c         | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
> index 36d42484142aede2..898e23a4231400fa 100644
> --- a/drivers/bus/imx-weim.c
> +++ b/drivers/bus/imx-weim.c
> @@ -329,6 +329,7 @@ static int of_weim_notify(struct notifier_block *nb, unsigned long action,
>  				 "Failed to setup timing for '%pOF'\n", rd->dn);
>  
>  		if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
> +			rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>  			if (!of_platform_device_create(rd->dn, NULL, &pdev->dev)) {
>  				dev_err(&pdev->dev,
>  					"Failed to create child device '%pOF'\n",

Ivan, so you were aware of that the device is not instantiated before
this change?

Shawn
