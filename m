Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB586D7F72
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Apr 2023 16:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238253AbjDEO2w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Apr 2023 10:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237766AbjDEO2v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Apr 2023 10:28:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1924B65B0;
        Wed,  5 Apr 2023 07:28:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4642A63E44;
        Wed,  5 Apr 2023 14:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF11C433D2;
        Wed,  5 Apr 2023 14:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680704868;
        bh=Pzi6zJxJr8ZUgmTZZZ6XD+HYvxPprYklmZaH/0dEtMk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ImRaG3GVvpmqJNe1S1e8k+pepVfUqu3UM9plmOCyikVY8gYB6aJzgjb8sMQg3A2r/
         KMGDHqlNG+R53It2QnpunzBxNsOlSY/fdAq/bI+9XomAP2dHQNJFEDd6pwf1/lmg7/
         1oMVTm0Pm+FKilQuUhP7LZQOK+SJOZyfSG4aNFlwJSfYYcZUF50/kFu4e1YoUMr8Jp
         s3fGRSMkHOmOc6X+IRGhODnKcRLyUN/TZS/SGidTHDH0N3Jqh7CQF2rB6obnqte0Mp
         nF1ZUTO5v9xP01Un2nOGctkdwjH+SzH2fONJeCWj+3pyxFHGCI5P9B8dNbhjdK/2UD
         BXWwm5RfeCfrw==
Date:   Wed, 5 Apr 2023 22:27:37 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
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
        Ivan Bornyakov <i.bornyakov@metrotek.ru>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] treewide: Fix probing of devices in DT overlays
Message-ID: <20230405142737.GH11367@dragon>
References: <e1fa546682ea4c8474ff997ab6244c5e11b6f8bc.1680182615.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1fa546682ea4c8474ff997ab6244c5e11b6f8bc.1680182615.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 30, 2023 at 03:26:13PM +0200, Geert Uytterhoeven wrote:
> When loading a DT overlay that creates a device, the device is not
> probed, unless the DT overlay is unloaded and reloaded again.
> 
> After the recent refactoring to improve fw_devlink, it no longer depends
> on the "compatible" property to identify which device tree nodes will
> become struct devices.   fw_devlink now picks up dangling consumers
> (consumers pointing to descendent device tree nodes of a device that
> aren't converted to child devices) when a device is successfully bound
> to a driver.  See __fw_devlink_pickup_dangling_consumers().
> 
> However, during DT overlay, a device's device tree node can have
> sub-nodes added/removed without unbinding/rebinding the driver.  This
> difference in behavior between the normal device instantiation and
> probing flow vs. the DT overlay flow has a bunch of implications that
> are pointed out elsewhere[1].  One of them is that the fw_devlink logic
> to pick up dangling consumers is never exercised.
> 
> This patch solves the fw_devlink issue by marking all DT nodes added by
> DT overlays with FWNODE_FLAG_NOT_DEVICE (fwnode that won't become
> device), and by clearing the flag when a struct device is actually
> created for the DT node.  This way, fw_devlink knows not to have
> consumers waiting on these newly added DT nodes, and to propagate the
> dependency to an ancestor DT node that has the corresponding struct
> device.
> 
> Based on a patch by Saravana Kannan, which covered only platform and spi
> devices.
> 
> [1] https://lore.kernel.org/r/CAGETcx_bkuFaLCiPrAWCPQz+w79ccDp6=9e881qmK=vx3hBMyg@mail.gmail.com
> 
> Fixes: 4a032827daa89350 ("of: property: Simplify of_link_to_phandle()")
> Link: https://lore.kernel.org/r/CAGETcx_+rhHvaC_HJXGrr5_WAd2+k5f=rWYnkCZ6z5bGX-wj4w@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C
> ---
> v3:
>   - Add Acked-by,
>   - s/instantiate/probe/,
>   - Improve commit description,
>   - Add comment before clearing FWNODE_FLAG_NOT_DEVICE,
> 
> v2:
>   - Add Acked-by,
>   - Drop RFC.
> ---
>  drivers/bus/imx-weim.c    | 6 ++++++

Acked-by: Shawn Guo <shawnguo@kernel.org>

>  drivers/i2c/i2c-core-of.c | 5 +++++
>  drivers/of/dynamic.c      | 1 +
>  drivers/of/platform.c     | 5 +++++
>  drivers/spi/spi.c         | 5 +++++
>  5 files changed, 22 insertions(+)
