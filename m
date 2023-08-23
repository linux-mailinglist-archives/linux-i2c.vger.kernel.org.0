Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7EC785AF8
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 16:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbjHWOnN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 10:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235658AbjHWOnM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 10:43:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14FEE6A;
        Wed, 23 Aug 2023 07:43:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 55190619E9;
        Wed, 23 Aug 2023 14:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F6FC433C7;
        Wed, 23 Aug 2023 14:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692801789;
        bh=fgDZrtbVxcf2bE9W6U6JXTtW9mKFyTDDnHCkZ5TSDD8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nGyYwuXk77nY/Y0OO2QDR/XH4/1CWLkMUSHkigFIMzno+Ui5Bvl1YytR44WBfhz6p
         WJr8NbhfX1sqVkagFXsv3g8b0qjCszVNvXf+fEXFx9XEeYJBho2LtgQfPty6GHsljx
         03gqm/oz+7GXC3G08GOTyF4OB2JHXYD7F17DWf/EMspfBif0TqV2jA+nsJoCgQJkUK
         cuN1ogh8qEhr4uLkrdUifHvNYi/nevZ5CX58iYUkuI0MbIsYoVajQ1hwh8Z/oQqaRb
         mswiLz00Ov9ZxbIYg4SMKfaBw6daLwpvc5198/xlmK4lw/Eci1ES9Ay/UchqcBtM7l
         +J5bseyXtPWUg==
Date:   Wed, 23 Aug 2023 16:43:04 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yann <yann@sionneau.net>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yann Sionneau <ysionneau@kalray.eu>
Subject: Re: [PATCH v2] i2c: designware: add support for pinctrl for recovery
Message-ID: <20230823144304.yr5l7u6y3kxuciad@intel.intel>
References: <20230820110158.sixmrcs5kbv3sof3@intel.intel>
 <20230816095015.23705-1-yann@sionneau.net>
 <97d62909-551b-4abd-a743-5be09e617665@linux.intel.com>
 <685b10d2-7627-eea8-69e4-454af039fa5d@sionneau.net>
 <d9ea51b28fabdfd43570ccbe207b528c@sionneau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9ea51b28fabdfd43570ccbe207b528c@sionneau.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yann,

> >> Tested-by from author is needless. Expectation is that author has tested
> >> the patch while not always true :-)
> >> Ok, I just wanted to emphasize the fact that I have the device and I tested
> >> the change with the device. Ack!
> > 
> > @@ -905,6 +906,15 @@ static int i2c_dw_init_recovery_info(struct
> > dw_i2c_dev *dev)
> > return PTR_ERR(gpio);
> > rinfo->sda_gpiod = gpio;
> > + rinfo->pinctrl = devm_pinctrl_get(dev->dev);
> > + if (IS_ERR(rinfo->pinctrl)) {
> > + if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
> > + return PTR_ERR(rinfo->pinctrl);
> > +
> > + rinfo->pinctrl = NULL;
> > + dev_info(dev->dev, "can't get pinctrl, bus recovery might
> > not work\n");
> >> I think dev_dbg() suits better here or is it needed at all? End user may
> >> not be able to do anything when sees this in dmesg. I.e. more like
> >> development time dev_dbg() information.
> >> I agree dev_dbg() is a better idea.
> >> 
> >> Does i2c-core-base.c: i2c_gpio_init_pinctrl_recovery() already do
> >> dev_info() print when pinctrl & GPIO are set properly making above also
> >> kind of needless?
> >> 
> >> Thanks for the review. In fact I had to use gdb to understand why the
> >> recovery was not working. Because as you said, it only prints something to
> >> say "everything looks ok!".
> >> 
> >> I kind of prefer when it prints when something goes wrong.
> >> But I let you decide what you think is the best.
> > 
> > You need to differentiate here between an error and not an error.
> > If the return value is an ENOMEM, then this is an error. Although
> > I think you should not return, but the message needs to be an
> > dev_err().
> 
> Ack.
> > On the other hand, if the return value is a '0', then I think
> > dev_info() is correct.
> 
> Ack.
> 
> > Either remove the logging or make it correct.
> 
> I'll print a dev_err in case of error (except for -EPROBE_DEFER) and a dev_info in case of NULL.

Maybe dev_warn() is the best if there is a failure but you keep
going anyway.

> > One more note, the sentence "can't get pinctrl,... " sounds like
> > an error. If the pinctrl is not connected on your system, maybe
> > it's because your system is not designed to have recovery. Please
> > write a message that doesn't sound like an error (or suppress the
> > logging).
> 
> I insist that I would have liked to see a message in case of pinctrl setup failure whatever the reason, even if it's because CONFIG_PINCTRL is not set. That would be a "bug" for the developer, in case he/she wants to have recovery working.
> Sometimes developer just forget to enable the correct config or to put the correct stuff in DTB and printing debug messages really helps to understand what's going on.

Please, read more carefully. I am not suggesting to remove the
message; I'm suggesting to reword it so that it doesn't sound as
an error if it's not an error. But this is a note, i.e. a minor
review.

Andi
