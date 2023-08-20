Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E57781D85
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Aug 2023 13:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbjHTLC3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Aug 2023 07:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbjHTLC2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Aug 2023 07:02:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9DA46BB;
        Sun, 20 Aug 2023 04:02:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3883560CEC;
        Sun, 20 Aug 2023 11:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AB2C433C7;
        Sun, 20 Aug 2023 11:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692529325;
        bh=D9F83LnHCzB/B6DrASGGWoF5v/ghjA2/wqo72X39IaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TkcKG6euz7zFGSTqAeeCVmMUaQUdBlKM02qNaS/6DEokY2iFCtOT0JK/bl/wGIm/h
         729ioY8Gx5Ss/QAdU+G7W0Eyt0NWvNuBw9ew7xvLaSx8HU6K/J+ONNrg57QqNr+Z3t
         pduElSzf8NYQzAPfijsUKwD58MZqDhYUFuBqw97ku76zqwTSQgSwVj0UU37aalzG2W
         qKKih6hIWzNeLI7pChYtdzXyNCp1SrGIuztfFt45sOKy9YWiGE+IM8VvzFWBsTsGfD
         gYuyWI4SdsCQ10Q/XeXKsqNRJS7AsOzW/kjIIOomh4Bnf3wcSNpnLhjNzwFBwwjgkv
         zjENAmMi2btEg==
Date:   Sun, 20 Aug 2023 13:01:58 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yann Sionneau <yann@sionneau.net>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yann Sionneau <ysionneau@kalray.eu>
Subject: Re: [PATCH v2] i2c: designware: add support for pinctrl for recovery
Message-ID: <20230820110158.sixmrcs5kbv3sof3@intel.intel>
References: <20230816095015.23705-1-yann@sionneau.net>
 <97d62909-551b-4abd-a743-5be09e617665@linux.intel.com>
 <685b10d2-7627-eea8-69e4-454af039fa5d@sionneau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <685b10d2-7627-eea8-69e4-454af039fa5d@sionneau.net>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, Aug 17, 2023 at 04:27:26PM +0200, Yann Sionneau wrote:
> Hi
> 
> Le 17/08/2023 à 10:07, Jarkko Nikula a écrit :
> > Hi
> > 
> > On 8/16/23 12:50, Yann Sionneau wrote:
> > > From: Yann Sionneau <ysionneau@kalray.eu>
> > > 
> > > Currently if the SoC needs pinctrl to switch the SCL and SDA
> > > from the I2C function to GPIO function, the recovery won't work.
> > > 
> > > scl-gpio = <>;
> > > sda-gpio = <>;
> > > 
> > > Are not enough for some SoCs to have a working recovery.
> > > Some need:
> > > 
> > > scl-gpio = <>;
> > > sda-gpio = <>;
> > > pinctrl-names = "default", "recovery";
> > > pinctrl-0 = <&i2c_pins_hw>;
> > > pinctrl-1 = <&i2c_pins_gpio>;
> > > 
> > > The driver was not filling rinfo->pinctrl with the device node
> > > pinctrl data which is needed by generic recovery code.
> > > 
> > > Tested-by: Yann Sionneau <ysionneau@kalray.eu>
> > > Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> > 
> > Tested-by from author is needless. Expectation is that author has tested
> > the patch while not always true :-)
> Ok, I just wanted to emphasize the fact that I have the device and I tested
> the change with the device. Ack!
> > 
> > > @@ -905,6 +906,15 @@ static int i2c_dw_init_recovery_info(struct
> > > dw_i2c_dev *dev)
> > >           return PTR_ERR(gpio);
> > >       rinfo->sda_gpiod = gpio;
> > >   +    rinfo->pinctrl = devm_pinctrl_get(dev->dev);
> > > +    if (IS_ERR(rinfo->pinctrl)) {
> > > +        if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
> > > +            return PTR_ERR(rinfo->pinctrl);
> > > +
> > > +        rinfo->pinctrl = NULL;
> > > +        dev_info(dev->dev, "can't get pinctrl, bus recovery might
> > > not work\n");
> > 
> > I think dev_dbg() suits better here or is it needed at all? End user may
> > not be able to do anything when sees this in dmesg. I.e. more like
> > development time dev_dbg() information.
> I agree dev_dbg() is a better idea.
> > 
> > Does i2c-core-base.c: i2c_gpio_init_pinctrl_recovery() already do
> > dev_info() print when pinctrl & GPIO are set properly making above also
> > kind of needless?
> 
> Thanks for the review. In fact I had to use gdb to understand why the
> recovery was not working. Because as you said, it only prints something to
> say "everything looks ok!".
> 
> I kind of prefer when it prints when something goes wrong.
> But I let you decide what you think is the best.

You need to differentiate here between an error and not an error.
If the return value is an ENOMEM, then this is an error. Although
I think you should not return, but the message needs to be an
dev_err().

On the other hand, if the return value is a '0', then I think
dev_info() is correct.

Either remove the logging or make it correct.

One more note, the sentence "can't get pinctrl,... " sounds like
an error. If the pinctrl is not connected on your system, maybe
it's because your system is not designed to have recovery. Please
write a message that doesn't sound like an error (or suppress the
logging).

Thanks,
Andi
