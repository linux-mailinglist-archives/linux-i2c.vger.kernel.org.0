Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FAE16D1DEC
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Mar 2023 12:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbjCaKW0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Mar 2023 06:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbjCaKV3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Mar 2023 06:21:29 -0400
Received: from mail.pr-group.ru (mail.pr-group.ru [178.18.215.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB077D8C;
        Fri, 31 Mar 2023 03:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=metrotek.ru; s=mail;
        h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:
         references;
        bh=Mo9vAtGSkTJ+jRRjzDL+LT7UGFqCHyfS46KX9CNNSXU=;
        b=axN0TyBn3xNwrykt0EIwwUPufxgn09Ohxj3feLL+lxT7TISPmQ4DDxY6nqtmPyYK4KAWQO2d3wiVJ
         JdJxGbrFH84p8mzVNzZWHfYx+aO2g/vdBqO/g/UNl2bCpJIUtj16ti8L/Ow0jDIYo6t0CRyHxxID5e
         HQ99HWls3XNehhx3H7AoGXmUzsWMrv0f1AirWz/j/Eu0ZuxmDuLggjd+WlSODG8sk/NXOt7/9cf6F3
         l9XwRf6srVZeHNm3oAislVCh8Q/Bfzs4j4g8jl9+43A55JmC2Vd26JlVaTVmq4qbMAPMuI2yHi1KOX
         AEL2bS0Eoc7Nt/qevLkfT6jf/kR0eLQ==
X-Kerio-Anti-Spam:  Build: [Engines: 2.17.2.1477, Stamp: 3], Multi: [Enabled, t: (0.000008,0.011710)], BW: [Enabled, t: (0.000022,0.000001)], RTDA: [Enabled, t: (0.095159), Hit: No, Details: v2.49.0; Id: 15.jk22d.1gsrir44n.1361u; mclb], total: 0(700)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Level: 
X-Footer: bWV0cm90ZWsucnU=
Received: from x260 ([78.37.166.219])
        (authenticated user i.bornyakov@metrotek.ru)
        by mail.pr-group.ru with ESMTPSA
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits));
        Fri, 31 Mar 2023 13:19:03 +0300
Date:   Fri, 31 Mar 2023 13:18:57 +0300
From:   Ivan Bornyakov <i.bornyakov@metrotek.ru>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        Shawn Guo <shawnguo@kernel.org>,
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
Subject: Re: [PATCH v3] treewide: Fix probing of devices in DT overlays
Message-ID: <20230331101857.wjfwkeiiww4geznk@x260>
References: <e1fa546682ea4c8474ff997ab6244c5e11b6f8bc.1680182615.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1fa546682ea4c8474ff997ab6244c5e11b6f8bc.1680182615.git.geert+renesas@glider.be>
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

Here is my use-case: a bunch of FPGA-based devices, which are SPI
slaves, WEIM childs and other platform devices, described in DTS with
status = "disabled"; in run-time DT-overlay with status = "okay" for
these devices is loaded via ConfigFS with help of out-of-tree patch.

Although without this patch I had no issues probing overlay-enabled
devices, it won't hurt either.

Tested-by: Ivan Bornyakov <i.bornyakov@metrotek.ru>

