Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6290F6D8E99
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Apr 2023 07:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234523AbjDFFBr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Apr 2023 01:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233603AbjDFFBq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Apr 2023 01:01:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1759B8A6F;
        Wed,  5 Apr 2023 22:01:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 905DC6432C;
        Thu,  6 Apr 2023 05:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1ACC433EF;
        Thu,  6 Apr 2023 05:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680757304;
        bh=XN/KRAdjSBdeqgfcMqrTsnTfe3Vagj/AOgBnYovfOyE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A87TQ/3nKu7dpkq29cB6AZUxd0BatdWJoOS/V+abIZyKjUJt3UGdQSOc0G+Tqps1x
         4/awB5hY3qpUgQ+ASW+2u6M5LsP2YSWU6hiLUPIadfU72iw06YHioY21KbEuxL8lYM
         QfhNdjKdR4Orqi8JhtfA3UiCbq49QLF9797gHYKU=
Date:   Thu, 6 Apr 2023 07:01:40 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Saravana Kannan <saravanak@google.com>,
        Ivan Bornyakov <i.bornyakov@metrotek.ru>,
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
Message-ID: <ZC5SNLY6kw_BXjM6@kroah.com>
References: <e1fa546682ea4c8474ff997ab6244c5e11b6f8bc.1680182615.git.geert+renesas@glider.be>
 <168072737082.449372.6122824582508382689.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168072737082.449372.6122824582508382689.robh@kernel.org>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 05, 2023 at 03:42:52PM -0500, Rob Herring wrote:
> 
> On Thu, 30 Mar 2023 15:26:13 +0200, Geert Uytterhoeven wrote:
> > When loading a DT overlay that creates a device, the device is not
> > probed, unless the DT overlay is unloaded and reloaded again.
> > 
> > After the recent refactoring to improve fw_devlink, it no longer depends
> > on the "compatible" property to identify which device tree nodes will
> > become struct devices.   fw_devlink now picks up dangling consumers
> > (consumers pointing to descendent device tree nodes of a device that
> > aren't converted to child devices) when a device is successfully bound
> > to a driver.  See __fw_devlink_pickup_dangling_consumers().
> > 
> > However, during DT overlay, a device's device tree node can have
> > sub-nodes added/removed without unbinding/rebinding the driver.  This
> > difference in behavior between the normal device instantiation and
> > probing flow vs. the DT overlay flow has a bunch of implications that
> > are pointed out elsewhere[1].  One of them is that the fw_devlink logic
> > to pick up dangling consumers is never exercised.
> > 
> > This patch solves the fw_devlink issue by marking all DT nodes added by
> > DT overlays with FWNODE_FLAG_NOT_DEVICE (fwnode that won't become
> > device), and by clearing the flag when a struct device is actually
> > created for the DT node.  This way, fw_devlink knows not to have
> > consumers waiting on these newly added DT nodes, and to propagate the
> > dependency to an ancestor DT node that has the corresponding struct
> > device.
> > 
> > Based on a patch by Saravana Kannan, which covered only platform and spi
> > devices.
> > 
> > [1] https://lore.kernel.org/r/CAGETcx_bkuFaLCiPrAWCPQz+w79ccDp6=9e881qmK=vx3hBMyg@mail.gmail.com
> > 
> > Fixes: 4a032827daa89350 ("of: property: Simplify of_link_to_phandle()")
> > Link: https://lore.kernel.org/r/CAGETcx_+rhHvaC_HJXGrr5_WAd2+k5f=rWYnkCZ6z5bGX-wj4w@mail.gmail.com
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Mark Brown <broonie@kernel.org>
> > Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C
> > ---
> > v3:
> >   - Add Acked-by,
> >   - s/instantiate/probe/,
> >   - Improve commit description,
> >   - Add comment before clearing FWNODE_FLAG_NOT_DEVICE,
> > 
> > v2:
> >   - Add Acked-by,
> >   - Drop RFC.
> > ---
> >  drivers/bus/imx-weim.c    | 6 ++++++
> >  drivers/i2c/i2c-core-of.c | 5 +++++
> >  drivers/of/dynamic.c      | 1 +
> >  drivers/of/platform.c     | 5 +++++
> >  drivers/spi/spi.c         | 5 +++++
> >  5 files changed, 22 insertions(+)
> > 
> 
> Applied, thanks!

Oops, I thought I had to take this.  I'll go drop it from my tree...

thanks,

greg k-h
