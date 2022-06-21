Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6815E552B5B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jun 2022 08:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346297AbiFUG5q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jun 2022 02:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbiFUG5p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jun 2022 02:57:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF8B1CFE4;
        Mon, 20 Jun 2022 23:57:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3D705B81699;
        Tue, 21 Jun 2022 06:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE58C341C0;
        Tue, 21 Jun 2022 06:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655794661;
        bh=+kaDe/Oc1bAbXeDpkUaPaEqe5MkYjktUVSkOvw2ENsA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NL/Cr1TLFu3AZMGTVjKIQwKYHYVCEyrdjwzWY2iZTV9roW4HiOSgspUkaKbDUEg6i
         0owWKTefExYoOqnTNKpDIsrmn6nz8Cglc/h1ag6r4+ubpDmjrIorxv0TNmb+Tyr6RM
         pf8rwjCz/wqwqCmHdEigjZkM9TDFLzOFPN889sJnXbtOEVy4aWwS/oM840gTr4CDOd
         6O9j7Ry+ZbF1Xua5ybSoMEgzqy/uX90WUa2QQ9iSTsYLXTJ2KDEqjElm2aTY7VV4V1
         rWoMFxXQ0AkyqO/6khHEeAKJ2yidCyp9GioqezwVzaZxbnA38TAs1koHgmoaUtIoKI
         IR9n2DSGh7ITA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1o3XpO-0002OK-JE; Tue, 21 Jun 2022 08:57:35 +0200
Date:   Tue, 21 Jun 2022 08:57:34 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     frank zago <frank@zago.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, USB <linux-usb@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v6 2/4] gpio: ch341: add GPIO MFD cell driver for the
 CH341
Message-ID: <YrFr3s50ZMD1Et9W@hovoldconsulting.com>
References: <20220616013747.126051-1-frank@zago.net>
 <20220616013747.126051-3-frank@zago.net>
 <YrBLGMD/Gzfv0W6F@hovoldconsulting.com>
 <CAHp75VfWbC2fbKenuzx6LXjUTApcUKyX6gXd-3Pe31cvrbT7kQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfWbC2fbKenuzx6LXjUTApcUKyX6gXd-3Pe31cvrbT7kQ@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 20, 2022 at 06:08:19PM +0200, Andy Shevchenko wrote:
> On Mon, Jun 20, 2022 at 12:26 PM Johan Hovold <johan@kernel.org> wrote:
> > On Wed, Jun 15, 2022 at 08:37:45PM -0500, frank zago wrote:
> 
> ...
> 
> > > +     /* Create an URB for handling interrupt */
> > > +     dev->irq_urb = usb_alloc_urb(0, GFP_KERNEL);
> > > +     if (!dev->irq_urb)
> > > +             return dev_err_probe(&pdev->dev, -ENOMEM, "Cannot allocate the int URB\n");
> >
> > This isn't how dev_err_probe() is used.
> 
> While I agree on the below comment, what does this imply?

That you should only use dev_err_probe() to handle -EPROBE_DEFER. That's
what it is was added for, documented as, and it is what the
implementation still tells you.

I see now that there has recently been some mission creep:

	7065f92255bb ("driver core: Clarify that dev_err_probe() is OK even w/out -EPROBE_DEFER")

I'm not sure I agree with that, but fortunately we don't need to have
that debate in this case due to the below.
 
> > And allocation failures are already logged so just return -ENOMEM here.

Johan
