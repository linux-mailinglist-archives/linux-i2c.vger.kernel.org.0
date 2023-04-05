Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA446D88E0
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Apr 2023 22:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233356AbjDEUnp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Apr 2023 16:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbjDEUnd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Apr 2023 16:43:33 -0400
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF8707EDC;
        Wed,  5 Apr 2023 13:43:14 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-17683b570b8so39945290fac.13;
        Wed, 05 Apr 2023 13:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fo4KOndYHjMmbpfxHkmhUzVyW73zzbklAEkQD0vmqLg=;
        b=qjrl45j14NUyHUdQMEp+Q7CuzKUhRpTPaBLBEf5dyxg24AkwrgTs97Sw8xTV00byrf
         NBg1TEhd4vIhXojhxeOSQOso+oiRx7xUOfxjIYw6TyU7Vo1DR5zD/AJ3KjISSRzaRKTq
         dAHmcK81LuKjiIjtEcFjkjWFAGjT/bfxRbOUC8yzc1B8AyRkh2tyY1ZJ5QrAFRfGUXtu
         Qxh9HTksn/LZ69Aw5qQE8g84l6wUZvGZNK6MAp0aK+mBkKlPI+zuuMv/S8epi10wV3dl
         /QiOnAZFoUw7wvVU8OiQtTGDxEbyYdogIvrIqpJxcFaXSAan4eD26G1t8MzY89wvxb2f
         Un1Q==
X-Gm-Message-State: AAQBX9fQBhtP6IwAIaG7GLfvFJJn1n9KkFE8mY+EPFp9VPUxXXyPvpAX
        0fhBDQPRPJHTA8n0js6twQ==
X-Google-Smtp-Source: AKy350YB2Ilkp1Aoa2VvCKvBjmWi9tDKQH08fmFxNM2UVw2G8NAZ3PpJIJOjMXSbsNNwBzdVZHrk4g==
X-Received: by 2002:a05:6870:6023:b0:177:81bb:1b28 with SMTP id t35-20020a056870602300b0017781bb1b28mr4091960oaa.9.1680727373749;
        Wed, 05 Apr 2023 13:42:53 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id zj27-20020a0568716c9b00b001723a2e84b6sm6361842oab.6.2023.04.05.13.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:42:53 -0700 (PDT)
Received: (nullmailer pid 449449 invoked by uid 1000);
        Wed, 05 Apr 2023 20:42:52 -0000
Date:   Wed, 5 Apr 2023 15:42:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Saravana Kannan <saravanak@google.com>,
        Ivan Bornyakov <i.bornyakov@metrotek.ru>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Frank Rowand <frowand.list@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3] treewide: Fix probing of devices in DT overlays
Message-ID: <168072737082.449372.6122824582508382689.robh@kernel.org>
References: <e1fa546682ea4c8474ff997ab6244c5e11b6f8bc.1680182615.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1fa546682ea4c8474ff997ab6244c5e11b6f8bc.1680182615.git.geert+renesas@glider.be>
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Thu, 30 Mar 2023 15:26:13 +0200, Geert Uytterhoeven wrote:
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
>  drivers/i2c/i2c-core-of.c | 5 +++++
>  drivers/of/dynamic.c      | 1 +
>  drivers/of/platform.c     | 5 +++++
>  drivers/spi/spi.c         | 5 +++++
>  5 files changed, 22 insertions(+)
> 

Applied, thanks!

