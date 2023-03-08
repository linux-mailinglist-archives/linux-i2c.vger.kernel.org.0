Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1941F6B1212
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Mar 2023 20:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjCHTdy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Mar 2023 14:33:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjCHTdv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Mar 2023 14:33:51 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA11867D9
        for <linux-i2c@vger.kernel.org>; Wed,  8 Mar 2023 11:33:48 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id d20so16387031vsf.11
        for <linux-i2c@vger.kernel.org>; Wed, 08 Mar 2023 11:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678304028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elaSW8jK4c19wV80MgoUgZ3YhWwQARYHu+N4OavZYdI=;
        b=ZT7fEl+nYdAmg9IvsK09c/PS7bt1DvEk5pFH+d6EEBhGoTZvpc1KA7FFuDrDjTsc8a
         fAA2ZrH4gbwIrF+co/Stl8dTn4GhKT+0FBNAo88O+aWv1TYipAaJ5YLMq2igiwmto7W9
         XWG7+ERZqapGkOs21b1AWRBw4kcJ1aZuvmvNj8tfZuxqbk0YbDjMDMDEX92ewIUzYTSh
         e1t3ZIyyly8r237SQDQJRfxVPu3h61N7SBpIbmX7ZrfnFYAF/0F/WWBp6VFcU3ORaCM3
         4oK1SmkHjQeXY6VXDFuwsFOrmdG+I2VR6d1B3Mt+TNGKvFBRZ9yauHdY3E9IzZLsWSx/
         vgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678304028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elaSW8jK4c19wV80MgoUgZ3YhWwQARYHu+N4OavZYdI=;
        b=z3o6mnaXzba7Cy83qRY/2lAtq+cvOgiIFoWgU7mBW3crAdubOQl0Ep0GzDfNXbb0Kq
         pC5k6vSV1rdAsrAVbKMV2wKVTzc9Ey2BWbTOGQVrsu0kQWrF7G5GR+g3mlJhJuYanbgR
         AHlrSGb8INvZQ85riBX6hPTSZl5Q+rT6d0FwB22HJqAmHcXNLyVhcyzdjlJIAmXjLjaY
         dopT7eQf+W+lCCP1RYhPFNGzuJ8zr+lc9OA9mRuUqNFEf6BJquLqJadZvDzL/h9WTXlB
         M3hhdJOlulYnC9ZOTTkoPnK+zJEqheDoEjSUeATp+AgHwpVPouul3ZkCv5JjMuQs7EwA
         jJVg==
X-Gm-Message-State: AO0yUKWvOhmYXCz2JWs2h7ZvbaOTava5GY7nY+yDVbalc44nBpuUfSJh
        v4+T9STu3nHFvNIH2fqdsaz0LKVoBSWs+rR6v0xZ/w==
X-Google-Smtp-Source: AK7set//ZSmUJFzt7Xok9V0kaTPUAwP+t2ISSQ76Tcf33SidVGnU7PJ9KopuOK39cqAnuwfnhNU07V2i5mPO1ddZW5A=
X-Received: by 2002:a67:f406:0:b0:414:48a5:473f with SMTP id
 p6-20020a67f406000000b0041448a5473fmr12895848vsn.0.1678304027775; Wed, 08 Mar
 2023 11:33:47 -0800 (PST)
MIME-Version: 1.0
References: <20221229160045.535778-1-brgl@bgdev.pl> <20221229160045.535778-2-brgl@bgdev.pl>
 <CAMuHMdWBQaB2caVB9vKQoqE0r6jAqOidMRmsCXxyixEm+HWPdw@mail.gmail.com>
In-Reply-To: <CAMuHMdWBQaB2caVB9vKQoqE0r6jAqOidMRmsCXxyixEm+HWPdw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Mar 2023 20:33:36 +0100
Message-ID: <CAMRc=McHiMXHzeg_B3zEw74yzNcw48jWEDcZRcvPNZ51XiS0kg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: dev: fix notifier return values
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 8, 2023 at 5:58=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Bartosz,
>
> On Thu, Dec 29, 2022 at 5:12=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We have a set of return values that notifier callbacks can return. They
> > should not return 0, error codes or anything other than those predefine=
d
> > values. Make the i2c character device's callback return NOTIFY_DONE or
> > NOTIFY_OK depending on the situation.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Thanks for your patch, which is now commit cddf70d0bce71c2a ("i2c:
> dev: fix notifier return values") in v6.3-rc1.
>
> On SH/R-Mobile platforms, this leads to missing /dev/i2c-* entries.
> On R-Car Gen4, they are still present, as all I2C adapters are
> initialized after i2cdev.
>
> > --- a/drivers/i2c/i2c-dev.c
> > +++ b/drivers/i2c/i2c-dev.c
> > @@ -653,12 +653,12 @@ static int i2cdev_attach_adapter(struct device *d=
ev, void *dummy)
> >         int res;
> >
> >         if (dev->type !=3D &i2c_adapter_type)
> > -               return 0;
> > +               return NOTIFY_DONE;
> >         adap =3D to_i2c_adapter(dev);
> >
> >         i2c_dev =3D get_free_i2c_dev(adap);
> >         if (IS_ERR(i2c_dev))
> > -               return PTR_ERR(i2c_dev);
> > +               return NOTIFY_DONE;
> >
> >         cdev_init(&i2c_dev->cdev, &i2cdev_fops);
> >         i2c_dev->cdev.owner =3D THIS_MODULE;
> > @@ -678,11 +678,11 @@ static int i2cdev_attach_adapter(struct device *d=
ev, void *dummy)
> >                 goto err_put_i2c_dev;
> >
> >         pr_debug("adapter [%s] registered as minor %d\n", adap->name, a=
dap->nr);
> > -       return 0;
> > +       return NOTIFY_OK;
>
> Unfortunately i2cdev_{at,de}tach_adapter() are not only used as
> notifiers (called from i2cdev_notifier_call()), but also called from
> i2c_dev_init():
>
>         /* Bind to already existing adapters right away */
>         i2c_for_each_dev(NULL, i2cdev_attach_adapter);
>
> and i2c_dev_exit():
>
>         i2c_for_each_dev(NULL, i2cdev_detach_adapter);
>
> As soon i2c_dev_{at,de}tach_adapter() returns a non-zero
> value (e.g. NOTIFY_OK), {i2c,bus}_for_each_dev() aborts
> processing.
>
> In i2c_dev_init(), this leads to a failure in registering any
> already existing i2c adapters after the first one, causing missing
> /dev/i2c-* entries.
>
> In i2c_dev_exit(), this leads to a failure unregistering any but the
> first i2c adapter.
>
> As there is no one-to-one mapping from error codes to notify codes,
> I think this cannot just be handled inside i2cdev_notifier_call() :-(
>

Would wrapping i2c_a/detach_adapter() in a notifier callback work? So
that SH can call it directly while notifiers would call it indirectly
through the wrapper?

Bart
