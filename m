Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7519797B0F
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Sep 2023 20:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbjIGSBS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Sep 2023 14:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244058AbjIGSBR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Sep 2023 14:01:17 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050801FCF;
        Thu,  7 Sep 2023 11:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=X4xUKnQy5Cuyq/hlcTvI9PdWU+bO5LlG1WNNbVR8IrU=; b=lleRes3stqKrEVBIpyWoQv1a+r
        gcuk3LwaMYPqCntIqfD62zX3R9U/uxNscQhd1wwd7tn7UfdE112nDjujBeGXAVKSObqviG4BNYL2K
        q3BmwOaKa5OjDUdO6MCFf6uOx+jUfqPrrh2Y9xzHwhJ2Q5ubd3NUDgyWey8OW2Z+b7CDu3zkE1E7s
        WrQjNXU1jxJZ30sKuLMPjb4dd8R7BuNjxvjpg1PNctN6zBnCBn/iIv74WZJSNsz9W/TXCS692xvxk
        GpoZnI9Csrhw6/ExpTYX1kHfafdv2PaGIhuQGz7qWsqqVik+dlGjAtgpA54Ro/eVtauQY/r8FIIBx
        e24awPug==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36672)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <linux@armlinux.org.uk>)
        id 1qeJJ7-0004BF-0b;
        Thu, 07 Sep 2023 19:00:45 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1qeJJ6-000639-R6; Thu, 07 Sep 2023 19:00:44 +0100
Date:   Thu, 7 Sep 2023 19:00:44 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Raul Piper <raulpblooper@gmail.com>
Cc:     tanure@linux.com, Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Devicetree <devicetree@vger.kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: Debugging i2c : i2cdetect cant detect a device on i2c line
Message-ID: <ZPoPzNIDHHC/v/Tw@shell.armlinux.org.uk>
References: <CAEwN+MCorDCS7EhN40Qgja_nY+SFc3G61Zd6yntqAS+w26YO9Q@mail.gmail.com>
 <ZPnR4Cx6_Hh3weEl@debian.me>
 <ZPnWb15ucCotffav@shell.armlinux.org.uk>
 <CAJX_Q+0-v=oadJ697VDawyEhDSPBAS_oqakZFHWVUfsnbCanMA@mail.gmail.com>
 <CAEwN+MAtQSSwDLiERG4uEhv5YpS6EZrL4FER3wxVx+e3paxz4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEwN+MAtQSSwDLiERG4uEhv5YpS6EZrL4FER3wxVx+e3paxz4w@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RDNS_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 07, 2023 at 10:38:10PM +0530, Raul Piper wrote:
> On Thu, Sep 7, 2023 at 9:47 PM Lucas Tanure <tanure@linux.com> wrote:
> >
> >
> >
> > On Thu, 7 Sept 2023, 14:56 Russell King (Oracle), <linux@armlinux.org.uk> wrote:
> >>
> >> On Thu, Sep 07, 2023 at 08:36:32PM +0700, Bagas Sanjaya wrote:
> >> > [also Cc: devicetree and ARM folks]
> >> >
> >> > On Thu, Sep 07, 2023 at 08:21:44AM +0530, Raul Piper wrote:
> >> > > Hello ,
> >> > > I am trying to detect an i2c device A on i2c1 line on  one of the Arm
> >> > > Cortex A7 platform but not able to see any device on a given address (
> >> > > 0x3d) .
> >> > >
> >> > > Is there any parameters of i2c which i can change like rise/fall time
> >> > > , timeout etc in a device tree or kernel source and re test it?
> >> > > I have tried changing the i2c speed from 100KHz to 400 KHz  but no success.
> >> > > I have even tried removing the 1.5K pull ups on the i2c lines but no result.
> >>
> >> Honestly, from this description, I'm wondering if this posting is a joke.
> >>
> >> I2C is entirely _reliant_ on pull-ups. It's a wire-or bus, and the
> >> logic 1 state is created by no device pulling the signal low, thereby
> >> allowing the pull-up resistor to pull the line to the logic 1 state.
> >>
> >> The pull-up must be the correct strength for the devices on the bus.
> >> If it is too strong, then a driver may not be able to pull the signal
> >> sufficiently low for other devices to register it as a logic 0.
> >>
> >> Conversely, the pull-up must be strong enough so that the rise-time
> >> of the signal is sufficient to register as a logic 1.
> >>
> >> If it's a problem with the rise time, then increasing the clock rate
> >> will just make the situation worse.
> 
> Where can I change this time? Can you please provide example of some
> device/device tree?

You can't directly. The rise time is a function of the capacitive
loading on the lines and the pull-up resistor. It's not a software
parameter.

> >> So, if other devices work on the bus, it could be that the Vil
> >> threshold of this device is not being achieved, whereas the other
> >> devices are happy. Therefore, I would suggest you study the data
> >> sheets of the device that isn't being detected.
> What Vil threshold? I checked the power supply to this device and it
> is ~3.3 V as expected.

This makes me convinced that you're not familiar with electronics.

Vil is a pretty standard parameter in all digital logic for "Voltage,
input, low" - the voltage at which it is guaranteed that the device
will see a logic 0 signal on its input.

If I draw a diagram illustrating the voltage levels on an input,
top is the supply voltage, bottom is ground, then most are:

	+------+	<--- Vcc (supply voltage)
	|      |	<--- Within this region, it is guaranteed that
	|      |	     the device will see a logic 1
	+------+	<--- Vih (input high)
	|//////|
	|\\\\\\|	<--- Within this region, the value that the
	|//////|	     device sees is indeterminant
	|\\\\\\|
	+------+	<--- Vil (input low)
	|      |
	|      |
	+------+	<--- Ground (0V)

So, if the voltage on the SDA and SCL pins does not reach Vil or below,
there is no guarantee that the device will see a logic 0 on its input,
and it either won't work, it may sporadically work. Basically, Vil is
the threshold voltage at which the manufacturer _guarantees_ that the
device will see a logic 0, and Vih is the threshold voltage at which
the manufacturer _guarantees_ that the device will see a logic 1.

Both these parameters will be specified in the data sheet, possibly
as a function of supply voltage.

> >> Lastly, if the undetectable device has a reset line, it's possible
> >> that the device isn't responding because it's being held in reset.
> The device is fine, I am sure about it. As the device provides data on
> USART as well and I am getting it.
> >
> > Please try to use an logic analyser like saleae logic.
> > Probe the i2c bus, reset line, power lines, pins that set the i2c address for the device.
> > Can tell us which device it is?
> 
> Its a GPS sensor(still under development) .Logic Analyser gives NACK
> on the given address.

Which means either the device is not seeing the logic levels necessary
to receive the address, or maybe if this is a prototype I2C device,
maybe it has a bug in its address matching logic, or the address is
incorrectly set.

I'd first be checking that the Vih and Vil for this device are being
achieved by putting an oscilloscope on its input pin and comparing
that with the device specification.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
