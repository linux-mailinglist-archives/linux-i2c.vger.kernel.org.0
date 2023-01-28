Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 815AC67FAC0
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jan 2023 21:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234726AbjA1URO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Jan 2023 15:17:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbjA1URN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Jan 2023 15:17:13 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B4222A05
        for <linux-i2c@vger.kernel.org>; Sat, 28 Jan 2023 12:17:11 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id h19so6913150vsv.13
        for <linux-i2c@vger.kernel.org>; Sat, 28 Jan 2023 12:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ujPYE2Tccn6z3KxKUSVhZWB/6ljcy0NrewFRgFoChRo=;
        b=OprqN0tx8wVI0V3qkOPsfCk+TgRj4XRwP377LsUdYaPie+9r1YUA3OhqdBzWpcCIQ0
         ihvniywd5JiP/94exqCcTJ4tUyMWklmAIdoyTxCUWDZgiixTeSDeUhGmDUfdjSL3eep6
         w+DUa304GLUWsW+mBD4zB1mIQS0DQQYR8lplj2dyNdmEkgkVK2yM6085cjU9FfSFtiUX
         H42LLNRCnpfZcISX0QCQCmul4i2cTHC3nZ3yeYHROB0xx6cZveCPEnr58bkvq8HbspYm
         h8WWdOQ/2iZCP6Qf9z/j5KGFJD/YNKHkXQ/SVo3ptHP6+dKatbl5SQuM8DZvKf+aSxVi
         Nmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ujPYE2Tccn6z3KxKUSVhZWB/6ljcy0NrewFRgFoChRo=;
        b=kURoSp0j8MlhTb7hPi60bEi4ADQI+dl7NgGS+3uat/lIk18K4OVci0AMF156M+r2jk
         vk2pq9OFdConL1zQhJ5m5ZC5ixKmGdgXhqB5VDvQ3BDYV0EkAQ/gD8UZfcFjz+b7Ks+8
         gw1JnZHt9y6krY3HkndR8oLv96zj0ggu4PtZT4fD7bjnjOy6uPziu5cXmqf/e4jcJOoU
         IcWiC4ANYiy/Avf2BEP9rKAVWSDSFWRvw+URyMhrkjAHpavT3LWeCn612cktHZXX1UcI
         zRQsZmX/HTd7hyirg1mdoKc2FGLARpns1TMDaadVtgY0C/S0ZbDEmrr9C6/LR9t241GH
         n5Aw==
X-Gm-Message-State: AFqh2kojp18YV5io1Fu3KKs+N+Z3XadmvY8asCx/r9YVk1EmccsCrDry
        o/HFFeoBc5Jf+rO0HJsfNzQCXY8VeyYZwz4TkWCp3w==
X-Google-Smtp-Source: AMrXdXtfMFBNvTu/RyaSLqA4XiaTJ9U0TVR2L3t9kB5IuOmJdCycFBX0CXDRuI8QLigLuXoDnERskNv4dB/TLI5FNh8=
X-Received: by 2002:a05:6102:3e08:b0:3c5:1ac1:bf38 with SMTP id
 j8-20020a0561023e0800b003c51ac1bf38mr6700388vsv.78.1674937030730; Sat, 28 Jan
 2023 12:17:10 -0800 (PST)
MIME-Version: 1.0
References: <20230118134940.240102-1-brgl@bgdev.pl> <Y9DpbChLZfDONHPz@ninjato>
 <Y9GpL9RBNM8H2ZSL@shikoro> <CAMRc=McHowkYJBckM1eikcrBUoXXZN+OkozA-dNXZc1Zgd+Kfw@mail.gmail.com>
 <Y9VxQCu95HfGnWNe@ninjato>
In-Reply-To: <Y9VxQCu95HfGnWNe@ninjato>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 28 Jan 2023 21:16:59 +0100
Message-ID: <CAMRc=MdyLfai3svyfQ2=0M4HqhWQHa1tr-xCWBrk5rECQNizwg@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: dev: don't allow user-space to deadlock the kernel
To:     Wolfram Sang <wsa@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URI_DOTEDU
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jan 28, 2023 at 8:02 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> Hi Bartosz,
>
> > > https://lkml.iu.edu/hypermail/linux/kernel/1501.2/01700.html
> > >
> > > There are still drivers using i2c_del_adapter()+kfree(), so removing the
> > > completion could cause use-after-free there, or?
> > >
> >
> > Ugh, what a mess... I was mostly focused on the character device side
> > of it but now I realized the true extent of the problem.
>
> Still, thanks for trying. Really!
>
> > It's all because the adapter struct really should be allocated by
> > i2c_add_adapter() and bus drivers should only really provide some
> > structure containing the adapter description for the subsystem the
> > lifetime of which would not affect the adapter itself. This way the
> > adapter (embedding struct device) would be freed by device type's
> > .release() like we do over in the GPIO subsystem. Instead the adapter
> > struct is allocated by drivers at .probe() meaning it will get dropped
> > at .remove().
>
> Or, like SPI does, use controller_alloc() which initializes the parts
> needed by the core, returns to the driver which needs to setup the
> private data, and finally calls controller_register().
>

If we could add a helper like struct *i2c_adapter_get_device(struct
i2c_adapter *adap) and convert all users who access adap.dev directly
to using it instead in a sweeping change across the subsystem - that
would already be a huge improvement as this would allow us to later
move struct device memory into the subsystem and free it in .release()
and not allow provider drivers to free it at .remove(). Something to
consider. Let me know if that's an interesting option.

> > I don't have a good solution. I've been thinking about it for an hour
> > and every solution requires sweeping changes across the entire
> > subsystem. Or else we'd introduce a parallel solution that would do
> > the right thing and wait in perpetuity until all drivers convert -
> > like with i2e probe_new() which is after all much simpler.
>
> Thank you for spending time on another solution. "Perpetuity" is a good
> word to put it :/
>
> > Anyway, that's all I've got. We probably need to drop this change and
> > live with what we have now.
>
> I am curious to see if this finding will make it into your FOSDEM talk.
> Looking already forward to it!
>

Ha! Yeah, definitely. I went down that rabbit hole a while ago and am
bothered by the amount of latent bugs I'm finding. I sent some patches
for GPIO and SPI (and this one for I2C). See you there, I guess?

> Happy hacking,
>
>    Wolfram
>

Bart
