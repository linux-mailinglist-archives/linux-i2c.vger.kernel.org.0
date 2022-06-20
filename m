Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B5B5521DE
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jun 2022 18:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242269AbiFTQI7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jun 2022 12:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiFTQI7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jun 2022 12:08:59 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B971F2F4;
        Mon, 20 Jun 2022 09:08:58 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id h23so22042147ejj.12;
        Mon, 20 Jun 2022 09:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7UqePF8/+Hm2P7IqihZhJWfNdv8VurIs2DoJU0Nq/ug=;
        b=gdiuOE4+sAK5ES+HTqlkH6Cvtnoa7ihSsTn1ww3qCwEw6uIoQ9mUTBdui5+3b7gi09
         +rfa9fZ4L02hJzLOhWXgTH0Qwzu9VoxoyFelAqMdISKvUekTKUXfUmEUggZZrUsApD86
         4xC6i4iMmzfPmTsZXUw0NPjjiYakpntnDZh2BJbrCOldiHGOJAyrr2OoZg5whjPJKKkA
         aAISw3j5iCY4NWCiZScodSRVhPRvufdRc23n/4ch3+ts7pz5grQadriMuYBZXYGpo+k3
         mkKtMf3OWQJddP6/5/qrAVYEVRHoCY+E8GEv+j0WG52iwwiyxzNBf8GQqytQPJv4cRaH
         sPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7UqePF8/+Hm2P7IqihZhJWfNdv8VurIs2DoJU0Nq/ug=;
        b=iRFj+tiQH5rL6wXx7uP/1HRWs1XaNaM6F+bopWSITfQxOXs0I+b0u+ZafJX1M8RNZ2
         qXG1CCGQejlUSJ5/wndcbD9PRTknJN01X+Vatlb6/mYrHAjGLj6RU6b4eOuzzpiXUtCm
         Yz+foTmdjuX0Z+R5PUV108NZov173bXyeGsxp6oG0wUlzjqxo7Nw6qFUYOpT0KMo7gAJ
         /nYMqdZeG9xUHGCvEASEwZQ+q65QGbr86l6s07bViGiIR5jw4Nxbvw86m9FAE+FjJS6m
         1VbDiGzHIxXWfxbzK9uJ3/gh/WFPEij9LxJvr08OqnGRsX119PofyfOpp40mtzUKtNTn
         KFmA==
X-Gm-Message-State: AJIora+nrEFz6enwqU6B1PkrcPybUdkBXynJqw9+JKR2LIHwxDTW4VVl
        sKVINYuK1mVlkVg5Ijm6DKmc9ZITPi1NpEOs/hg=
X-Google-Smtp-Source: AGRyM1vAB1akKJku/tYgE+WIdkNWNY2d0+86sCNsvo9KYRmVgXbSC+Z4rKhkKLeo8rmcO+b4zqeThedxboQH3ilnjik=
X-Received: by 2002:a17:907:9721:b0:70c:65e7:2aa5 with SMTP id
 jg33-20020a170907972100b0070c65e72aa5mr21552291ejc.132.1655741336829; Mon, 20
 Jun 2022 09:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220616013747.126051-1-frank@zago.net> <20220616013747.126051-3-frank@zago.net>
 <YrBLGMD/Gzfv0W6F@hovoldconsulting.com>
In-Reply-To: <YrBLGMD/Gzfv0W6F@hovoldconsulting.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Jun 2022 18:08:19 +0200
Message-ID: <CAHp75VfWbC2fbKenuzx6LXjUTApcUKyX6gXd-3Pe31cvrbT7kQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] gpio: ch341: add GPIO MFD cell driver for the CH341
To:     Johan Hovold <johan@kernel.org>
Cc:     frank zago <frank@zago.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, USB <linux-usb@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 20, 2022 at 12:26 PM Johan Hovold <johan@kernel.org> wrote:
> On Wed, Jun 15, 2022 at 08:37:45PM -0500, frank zago wrote:

...

> > +     /* Create an URB for handling interrupt */
> > +     dev->irq_urb = usb_alloc_urb(0, GFP_KERNEL);
> > +     if (!dev->irq_urb)
> > +             return dev_err_probe(&pdev->dev, -ENOMEM, "Cannot allocate the int URB\n");
>
> This isn't how dev_err_probe() is used.

While I agree on the below comment, what does this imply?

> And allocation failures are already logged so just return -ENOMEM here.

-- 
With Best Regards,
Andy Shevchenko
