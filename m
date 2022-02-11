Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B45C64B1B3A
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 02:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346785AbiBKB0W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 20:26:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344042AbiBKB0V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 20:26:21 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B80781120;
        Thu, 10 Feb 2022 17:26:21 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: krisman)
        with ESMTPSA id C08D71F469ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1644542780;
        bh=x9xd9mW3dxu6WXXxYBXdKYFMuDvhWWT9wcjasq9vcU0=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=btM3SLYO20KSjlJdecdJBFp7bs8l9yvod527TSzWny/udp4o+vZQ0cewI15y72qU9
         V0sBnk1rmuynSVuYSSjcaMSH8hkIcLdZkmFKh6WzS1H38a5xOU0xNoo2KYLYXkjK/v
         TSdK0Lqmkzi4jPY5mUeOSNleXyvWQqAuZcoWKGbAysG/qsJ4ab/0532wMMJn8LcGMB
         w17wLdrvL/Rg7RoEdGmzuUZrKDBy+jTC/7CRBP4rFAMoDgkSY25wf0gO4pI6fI9HX9
         SfUlVU+AHVFknV2AvIXorzddhhr1AIiHNOACISCVI2yWZ87zGnydqOK20m63qbmovb
         8T79jjpDG2lEg==
From:   Gabriel Krisman Bertazi <krisman@collabora.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Shreeya Patel <shreeya.patel@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        wsa@kernel.org, kernel@collabora.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v4] gpio: Return EPROBE_DEFER if gc->to_irq is NULL
Organization: Collabora
References: <20211116093833.245542-1-shreeya.patel@collabora.com>
        <874k56znix.fsf@collabora.com>
        <CAMRc=MdByxO3+hJruvUkULtXAaB7aWewTd=Wv0MbWyX2vykdjA@mail.gmail.com>
Date:   Thu, 10 Feb 2022 20:26:16 -0500
In-Reply-To: <CAMRc=MdByxO3+hJruvUkULtXAaB7aWewTd=Wv0MbWyX2vykdjA@mail.gmail.com>
        (Bartosz Golaszewski's message of "Thu, 10 Feb 2022 19:00:07 +0100")
Message-ID: <87v8xmxkg7.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> My email address changed in September, that's why I didn't see the
> email you sent in November to my old one.

Hi Bart,

thanks for the prompt reply and sorry for the wrong email address.

> gpiod_to_irq() can be used in context other than driver probing, I'm
> worried existing users would not know how to handle it. Also: how come
> you can get the GPIO descriptor from the provider but its interrupts
> are not yet set up?

I'm definitely some context here, as its been quite a while.
Shreeya, feel free to pitch in. :)

This is one of the races we saw in gpiochip_add_irqchip, depending on
the probe order.  The gc is already visible while partially initialized,
if pinctrl-amd hasn't been probed yet.  Another device being probed can
hit an -ENXIO here if to_irq is yet uninitialized or enter .to_irq() and
oops.  Shreeya's patch workarounds the first issue, but is not a
solution for the second.

There is another patch that has been flying around to address the Oops.

https://lkml.org/lkml/2021/11/8/900

She's been working on a proper solution for that one, which might
actually address this too and replace the current patch.  Maybe you
could help us get to a proper solution there?  I'm quite unfamiliar with
this code myself :)

-- 
Gabriel Krisman Bertazi
