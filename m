Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A50370F749
	for <lists+linux-i2c@lfdr.de>; Wed, 24 May 2023 15:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234545AbjEXNIJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 May 2023 09:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234409AbjEXNIF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 May 2023 09:08:05 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA3B590;
        Wed, 24 May 2023 06:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=61Rn31dF3jWdPJat0aRqfvllNi1rLQujYmfZp4+qf5o=; b=CvsLH4LbrNoXatF6ospYMXXgCj
        iNGdWnlyFaBjthQZYup5jSkzLboXYGQoXtkQg4LgPDF3qiu7gORsjwMkihhoiSaiNPbreNsFOUcKF
        m57mQ4yJhQuJnE5DweWttmGf5whw4ZYz8mXoIe1oo7IrpMdJIWIbaWtDd4fOV2bBKzWdYF/PQyD1T
        B/xy3ArkFXv0JxdToK+933d9pKYNQVC7Hf7jM1PBGBEhT8Nzrizjj7nx6QQqkCiVsZyrN0ONqJIUw
        dLiIvXbMlWXQqDpRALBA19fH7iQ6ZzZjPjbUXGFFgMo8GRA8/MfsPYu1e5n/ie4gRr0rnlojqX4iu
        Ip75+RaQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42120)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1q1oDa-0002NU-NW; Wed, 24 May 2023 14:07:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1q1oDS-0001dv-AE; Wed, 24 May 2023 14:07:46 +0100
Date:   Wed, 24 May 2023 14:07:46 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Jiawen Wu <jiawenwu@trustnetic.com>, netdev@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        Jose.Abreu@synopsys.com, hkallweit1@gmail.com,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com
Subject: Re: [PATCH net-next v9 6/9] net: txgbe: Support GPIO to SFP socket
Message-ID: <ZG4MIrvASGLwkVhV@shell.armlinux.org.uk>
References: <20230524091722.522118-1-jiawenwu@trustnetic.com>
 <20230524091722.522118-7-jiawenwu@trustnetic.com>
 <83de8be3-7d00-4456-94b0-76fea2de825d@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83de8be3-7d00-4456-94b0-76fea2de825d@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 24, 2023 at 02:51:25PM +0200, Andrew Lunn wrote:
> > +static void txgbe_toggle_trigger(struct gpio_chip *gc, unsigned int offset)
> > +{
> > +	struct wx *wx = gpiochip_get_data(gc);
> > +	u32 pol, val;
> > +
> > +	pol = rd32(wx, WX_GPIO_POLARITY);
> > +	val = rd32(wx, WX_GPIO_EXT);
> > +
> > +	if (val & BIT(offset))
> > +		pol &= ~BIT(offset);
> > +	else
> > +		pol |= BIT(offset);
> > +
> > +	wr32(wx, WX_GPIO_POLARITY, pol);
> > +}
> 
> So you look at the current state of the GPIO and set the polarity to
> trigger an interrupt when it changes.
> 
> This is not race free. And if it does race, at best you loose an
> interrupt. The worst is your hardware locks up because that interrupt
> was missed and it cannot continue until some action is taken.
> 
> Is there any other GPIO driver doing this?
> 
> I think you would be better indicating you don't support
> IRQ_TYPE_EDGE_BOTH.

... which will make the whole point of having interrupt support for this
driver moot, and the SFP code will then poll the GPIOs which will
probably more reliably detect changes.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
