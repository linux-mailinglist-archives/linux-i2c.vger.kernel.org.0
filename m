Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A6C551533
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jun 2022 12:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238602AbiFTKFT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jun 2022 06:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240933AbiFTKFE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jun 2022 06:05:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BC213F78;
        Mon, 20 Jun 2022 03:04:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 46652B8100B;
        Mon, 20 Jun 2022 10:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FAEC3411B;
        Mon, 20 Jun 2022 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655719449;
        bh=nuyOjq3kbA0oH9KqhQl7VyXBnSZxp250qorZIvLiOlY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H15poN1qc4ilJQOU84gJjgdy+DdVZRlnKeazbyRvGKYb5NF+kRIUD07Fxm+dXcTVd
         dr5BDbo2X1dbuseZ58Fic+fVMLmArmb/vvD/8CE1bMJlmWo0Rdtg6mzkHTAt2f8MpG
         ZnL/LXJlS+oM2zBRWl0zn9ixQc3ANQXBzKNyyepP9Ht72HHps41tsrXb7kC8Sq9z2T
         eFU8bHGn34LIqawEVtWsLqGig9D6V6EriOjcxkCsjoT83soo0c3TwDytt028O9TLFm
         6dYad40PrejJJRLAS/2M4562WIUJ+lv4NRnIlybVvl2CuhUqDu0qkO/nhhneXtFLjL
         QiiQoQVxUTb4Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1o3EGL-0008Eu-31; Mon, 20 Jun 2022 12:04:05 +0200
Date:   Mon, 20 Jun 2022 12:04:05 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Frank Zago <frank@zago.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, linux-usb@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 2/3] gpio: ch341: add GPIO MFD cell driver for the
 CH341
Message-ID: <YrBGFZwLENLigWMV@hovoldconsulting.com>
References: <20220401023306.79532-1-frank@zago.net>
 <20220401023306.79532-3-frank@zago.net>
 <YouzaO6ogxYj40Bp@hovoldconsulting.com>
 <9b5b8cb4-7c05-b3cf-ca68-85d334a7f0b0@zago.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b5b8cb4-7c05-b3cf-ca68-85d334a7f0b0@zago.net>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 15, 2022 at 08:29:31PM -0500, Frank Zago wrote:
> On 5/23/22 11:16, Johan Hovold wrote:

> >> +static void ch341_gpio_irq_enable(struct irq_data *data)
> >> +{
> >> +	struct ch341_gpio *dev = irq_data_get_irq_chip_data(data);
> >> +	int rc;
> >> +
> >> +	/*
> >> +	 * The URB might have just been unlinked in
> >> +	 * ch341_gpio_irq_disable, but the completion handler hasn't
> >> +	 * been called yet.
> >> +	 */
> >> +	if (!usb_wait_anchor_empty_timeout(&dev->irq_urb_out, 5000))
> >> +		usb_kill_anchored_urbs(&dev->irq_urb_out);
> >> +
> >> +	usb_anchor_urb(dev->irq_urb, &dev->irq_urb_out);
> >> +	rc = usb_submit_urb(dev->irq_urb, GFP_ATOMIC);
> >> +	if (rc)
> >> +		usb_unanchor_urb(dev->irq_urb);
> > 
> > This looks confused and broken.
> > 
> > usb_kill_anchored_urbs() can sleep so either calling it is broken or
> > using GFP_ATOMIC is unnecessary.
> 
> Right, that function can sleep. I changed GFP_ATOMIC to GFP_KERNEL.

These callbacks can be called in atomic context so that's not an option,
I'm afraid.

> > And isn't this function called multiple times when enabling more than
> > one irq?!
> 
> There's only one IRQ, so only one URB will be posted at a time. It
> is reposted as soon as it comes back unless the IRQ is disabled or
> the device stops.

AFAICT you have up to 16 (CH341_GPIO_NUM_PINS) interrupts, not one. So I
still say this is broken.

> >> +}
> >> +
> >> +static void ch341_gpio_irq_disable(struct irq_data *data)
> >> +{
> >> +	struct ch341_gpio *dev = irq_data_get_irq_chip_data(data);
> >> +
> >> +	usb_unlink_urb(dev->irq_urb);
> > 
> > Same here...

> >> +}
> >> +
> >> +static int ch341_gpio_remove(struct platform_device *pdev)
> >> +{
> >> +	struct ch341_gpio *dev = platform_get_drvdata(pdev);
> >> +
> >> +	usb_kill_anchored_urbs(&dev->irq_urb_out);
> > 
> > You only have one URB...
> > 
> > And what prevents it from being resubmitted here?
> 
> I don't see what would resubmit it here. The gpio is being released.

Your implementation needs to handle racing requests. The gpio chip is
still registered here.

Johan
