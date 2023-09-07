Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98D6A797614
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Sep 2023 18:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236891AbjIGQBL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Sep 2023 12:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241844AbjIGP7U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Sep 2023 11:59:20 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F4A1FFC;
        Thu,  7 Sep 2023 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=v3uvxlhpyVywOeCKfN58HL4kywyDPvCRWTa4uTmYA0Q=; b=cMBALboLcZQB/DNbVCwH0r0KjF
        FKs6pkrAoiU6XIpNGn6ZT3ykUCQ+Ce5ru2X0LJN/wi1zO4BFrFy21XM5xRndzViVJHmSjNc23KM3N
        3tHi+R6HNKVPol+fFZa4SUU5JmE19W1F8uRQb4sBvD8S6qVOGhJkdmL6rX/MYhPu1mT0Zt525MV9j
        eQSsMWb9eZ/3yo6lAKWimBG3nTiy46dA0Vtoz8gVCUe0LTXe+6kaVdpkOeMBO8TclVjgR+WTH2Za/
        2mE5feR0C2jb11Owc26U78mi0p48ztIJuDaE635wnsqQdt0kRDvrdA7s0FDVSpDB14sWBKXvW2n9w
        vEI7gVwQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57708)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <linux@armlinux.org.uk>)
        id 1qeFUF-0003KZ-1Y;
        Thu, 07 Sep 2023 14:55:59 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1qeFUF-0005tY-7p; Thu, 07 Sep 2023 14:55:59 +0100
Date:   Thu, 7 Sep 2023 14:55:59 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Raul Piper <raulpblooper@gmail.com>,
        kernelnewbies@kernelnewbies.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: Debugging i2c : i2cdetect cant detect a device on i2c line
Message-ID: <ZPnWb15ucCotffav@shell.armlinux.org.uk>
References: <CAEwN+MCorDCS7EhN40Qgja_nY+SFc3G61Zd6yntqAS+w26YO9Q@mail.gmail.com>
 <ZPnR4Cx6_Hh3weEl@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPnR4Cx6_Hh3weEl@debian.me>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RDNS_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 07, 2023 at 08:36:32PM +0700, Bagas Sanjaya wrote:
> [also Cc: devicetree and ARM folks]
> 
> On Thu, Sep 07, 2023 at 08:21:44AM +0530, Raul Piper wrote:
> > Hello ,
> > I am trying to detect an i2c device A on i2c1 line on  one of the Arm
> > Cortex A7 platform but not able to see any device on a given address (
> > 0x3d) .
> > 
> > Is there any parameters of i2c which i can change like rise/fall time
> > , timeout etc in a device tree or kernel source and re test it?
> > I have tried changing the i2c speed from 100KHz to 400 KHz  but no success.
> > I have even tried removing the 1.5K pull ups on the i2c lines but no result.

Honestly, from this description, I'm wondering if this posting is a joke.

I2C is entirely _reliant_ on pull-ups. It's a wire-or bus, and the
logic 1 state is created by no device pulling the signal low, thereby
allowing the pull-up resistor to pull the line to the logic 1 state.

The pull-up must be the correct strength for the devices on the bus.
If it is too strong, then a driver may not be able to pull the signal
sufficiently low for other devices to register it as a logic 0.

Conversely, the pull-up must be strong enough so that the rise-time
of the signal is sufficient to register as a logic 1.

If it's a problem with the rise time, then increasing the clock rate
will just make the situation worse.

So, if other devices work on the bus, it could be that the Vil
threshold of this device is not being achieved, whereas the other
devices are happy. Therefore, I would suggest you study the data
sheets of the device that isn't being detected.

Lastly, if the undetectable device has a reset line, it's possible
that the device isn't responding because it's being held in reset.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
