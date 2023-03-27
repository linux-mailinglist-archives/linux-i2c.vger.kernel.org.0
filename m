Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6DC26C9F58
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 11:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjC0J2P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 05:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbjC0J2O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 05:28:14 -0400
X-Greylist: delayed 1811 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Mar 2023 02:28:09 PDT
Received: from mail.pr-group.ru (mail.pr-group.ru [178.18.215.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935E02707;
        Mon, 27 Mar 2023 02:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=metrotek.ru; s=mail;
        h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:
         references;
        bh=HcWg8teO8lRj5+fkRN/aU7d/uNN4yhTheMQkiD4xApM=;
        b=KQ+S8jrBgKzWq5ysztQlVTE5vhmb8TDKsiJ4AO73EnQOimsNUYphLd5V2nwURWxND6CVI5o5OJ9i4
         f5sPMyiqKaCSqOcaAlGJrttb8tGs3UU2qMTHoyTcRxw5c6aXIsf2Wyyn9buSofhf0WU1+uIKXSaO4V
         PeHpQBWTSNaxq3G+jjpvXhw9rq5aV5521JIOi4v7FZhMcgT40Z9kjWtsWstNIL1jMO7vD6Lfm6fFFS
         Nb9kiqeFKsoXPWBWOzx8mVoDn5qU4be6cb0TLPkmE7656dxzQe/oqJjPYiCCnOtZGpUtsoN5ItMSx3
         7XgmsZelFzdYD08AsLEA9CtHvQfb1Xg==
X-Kerio-Anti-Spam:  Build: [Engines: 2.17.2.1477, Stamp: 3], Multi: [Enabled, t: (0.000008,0.010549)], BW: [Enabled, t: (0.000023,0.000001)], RTDA: [Enabled, t: (0.088525), Hit: No, Details: v2.49.0; Id: 15.zxpjd.1gsh4j5iu.3nlts; mclb], total: 0(700)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Level: 
X-Footer: bWV0cm90ZWsucnU=
Received: from h-e2.ddg ([85.143.252.66])
        (authenticated user i.bornyakov@metrotek.ru)
        by mail.pr-group.ru with ESMTPSA
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits));
        Mon, 27 Mar 2023 11:57:39 +0300
Date:   Mon, 27 Mar 2023 11:54:01 +0300
From:   Ivan Bornyakov <i.bornyakov@metrotek.ru>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <20230327085401.pgnira5btzbgehb3@h-e2.ddg>
References: <240155f20aae47e9f7461e2b7416120ba6238886.1679650087.git.geert+renesas@glider.be>
 <20230327030213.GJ3364759@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327030213.GJ3364759@dragon>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Shawn!

On Mon, Mar 27, 2023 at 11:02:13AM +0800, Shawn Guo wrote:
> + Ivan
> 
> On Fri, Mar 24, 2023 at 10:30:39AM +0100, Geert Uytterhoeven wrote:
> > When loading a DT overlay that creates a device, the device is not
> > instantiated, unless the DT overlay is unloaded and reloaded again.
> > 
> > Saravana explains:
> >   Basically for all overlays (I hope the function is only used for
> >   overlays) we assume all nodes are NOT devices until they actually
> >   get added as a device.
> > 
> > Based on a patch by Saravana Kannan, which covered only platform and spi
> > devices.
> > 
> > Fixes: 4a032827daa89350 ("of: property: Simplify of_link_to_phandle()")
> > Link: https://lore.kernel.org/r/CAGETcx_+rhHvaC_HJXGrr5_WAd2+k5f=rWYnkCZ6z5bGX-wj4w@mail.gmail.com
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Mark Brown <broonie@kernel.org>
> > ---
> > v2:
> >   - Add Acked-by,
> >   - Drop RFC.
> > ---
> >  drivers/bus/imx-weim.c    | 1 +
> >  drivers/i2c/i2c-core-of.c | 1 +
> >  drivers/of/dynamic.c      | 1 +
> >  drivers/of/platform.c     | 1 +
> >  drivers/spi/spi.c         | 1 +
> >  5 files changed, 5 insertions(+)
> > 
> > diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
> > index 36d42484142aede2..898e23a4231400fa 100644
> > --- a/drivers/bus/imx-weim.c
> > +++ b/drivers/bus/imx-weim.c
> > @@ -329,6 +329,7 @@ static int of_weim_notify(struct notifier_block *nb, unsigned long action,
> >  				 "Failed to setup timing for '%pOF'\n", rd->dn);
> >  
> >  		if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
> > +			rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
> >  			if (!of_platform_device_create(rd->dn, NULL, &pdev->dev)) {
> >  				dev_err(&pdev->dev,
> >  					"Failed to create child device '%pOF'\n",
> 
> Ivan, so you were aware of that the device is not instantiated before
> this change?
> 

I was not aware of that, thanks for warning me.
Will test in the near future.

