Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA7E712282
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 10:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242629AbjEZInr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 04:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242506AbjEZInq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 04:43:46 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075EE1A7;
        Fri, 26 May 2023 01:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BEnGAjRSAYL11F41nqJ2ocesnsS9DwOH6s6TO3lu8lo=; b=rd/kpNKSW4Y2AfqwtO4IBx9Ret
        V124Hsa37ZAPAzZHrkAiTW3hYCE+slJP2cJfXk2+kMRZ1Ov+HBzGUNeuX57UXD2wQhIVScHMR8Q2f
        1QR3AaXfTKFTbDQ3d0VJkoTT2MjR6dYp3hLoYOwZk+HQQ/hm4iO1p9W8S565qRuwGX9xRbYzNKwVO
        Z8yrddH791QFO9uqNNgOnJnXEf8OzypovG2OqOWhRSQ+iJMlj28omjk/Ewm8fVfMt0GwZ3DP6xmcj
        WD+xxLYJp939e26/0wHE8jTmh/Rp+eqEqS48V1HbUUp7KIuJ2Uv1SJvw9FJ1ssKkp02jTGdeD3Bo4
        tY05DtnA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35592)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1q2T2j-0005Dz-5Y; Fri, 26 May 2023 09:43:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1q2T2a-0003aM-62; Fri, 26 May 2023 09:43:16 +0100
Date:   Fri, 26 May 2023 09:43:16 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     'Jakub Kicinski' <kuba@kernel.org>, netdev@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com
Subject: Re: [PATCH net-next v9 8/9] net: txgbe: Implement phylink pcs
Message-ID: <ZHBxJP4DXevPNpab@shell.armlinux.org.uk>
References: <20230524091722.522118-1-jiawenwu@trustnetic.com>
 <20230524091722.522118-9-jiawenwu@trustnetic.com>
 <20230525211403.44b5f766@kernel.org>
 <022201d98f9a$4b4ccc00$e1e66400$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <022201d98f9a$4b4ccc00$e1e66400$@trustnetic.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 26, 2023 at 02:21:23PM +0800, Jiawen Wu wrote:
> On Friday, May 26, 2023 12:14 PM, Jakub Kicinski wrote:
> > On Wed, 24 May 2023 17:17:21 +0800 Jiawen Wu wrote:
> > > +	ret = devm_mdiobus_register(&pdev->dev, mii_bus);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	mdiodev = mdio_device_create(mii_bus, 0);
> > > +	if (IS_ERR(mdiodev))
> > > +		return PTR_ERR(mdiodev);
> > > +
> > > +	xpcs = xpcs_create(mdiodev, PHY_INTERFACE_MODE_10GBASER);
> > > +	if (IS_ERR(xpcs)) {
> > > +		mdio_device_free(mdiodev);
> > > +		return PTR_ERR(xpcs);
> > > +	}
> > 
> > How does the mdiodev get destroyed in case of success?
> > Seems like either freeing it in case of xpcs error is unnecessary
> > or it needs to also be freed when xpcs is destroyed?
> 
> When xpcs is destroyed, that means mdiodev is no longer needed.
> I think there is no need to free mdiodev in case of xpcs error,
> since devm_* function leads to free it.

If you are relying on the devm-ness of devm_mdiobus_register() then
it won't. Although mdiobus_unregister() walks bus->mdio_map[], I
think you are assuming that the mdio device you've created in
mdio_device_create() will be in that array. MDIO devices only get
added to that array when mdiobus_register_device() has been called,
which must only be called from mdio_device_register().

Please arrange to call mdio_device_free() prior to destroying the
XPCS in every case.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
