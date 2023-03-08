Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 084936B1273
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Mar 2023 20:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjCHTwN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 8 Mar 2023 14:52:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjCHTwM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Mar 2023 14:52:12 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F556B8578;
        Wed,  8 Mar 2023 11:52:09 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id d7so19350190qtr.12;
        Wed, 08 Mar 2023 11:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678305128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrSs/Pb/IsWvrM/MhkZnQe3J140k8LWgDiMB3+GnEP8=;
        b=mK7SU9IYz8x5RjTmhEwcRMUv4e46IOlx2NYXJ1QfhPEi4WnpWGF0XA3cvhlfIyec6U
         ZItJh6jd7Bb/Pqdhu8DoZYxPwXbd0X/X56/LWcvSwkigje1ycehQbXs2/aP8MbuV02f6
         L4cdK1MTPvB7a/djFbkijroWBYPKx46YUxQEy8RG2+ukmee81MKbid6W5zpwwNy1/3US
         6UgLWe6R5zWGR7kCAqz7TJs5sjBz8141tUwsOO42nsScMGX8z4weqr1MxY1IJmUi+Urg
         TaqjfKY4lzxuF8RJm+h5B6v7hJ8NdzbCkAB5A0BKkxX/bOwRZpVKHk0y9g9ySRMi9NU3
         cgdw==
X-Gm-Message-State: AO0yUKVK9Qj2M7n+kKX+1bPP9q0GVz0aImDipN5W5uXfcyajufOr6msj
        PwRS8vC3rcWq7L3dzJvk7UhchgTdQD4r75YM
X-Google-Smtp-Source: AK7set9+qd+1xLcmtAIKwrAZEg5Mfv6FdSnny2U9yyPRP3IGXf+7l+/udRmB9w3G0HyFVs6q9AFMvA==
X-Received: by 2002:a05:622a:111:b0:3a7:e2df:e868 with SMTP id u17-20020a05622a011100b003a7e2dfe868mr30816198qtw.41.1678305128187;
        Wed, 08 Mar 2023 11:52:08 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 198-20020a3705cf000000b0073b9ccb171asm11581936qkf.130.2023.03.08.11.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 11:52:07 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id v13so15819274ybu.0;
        Wed, 08 Mar 2023 11:52:07 -0800 (PST)
X-Received: by 2002:a5b:ccf:0:b0:a6f:9156:5579 with SMTP id
 e15-20020a5b0ccf000000b00a6f91565579mr9546072ybr.12.1678305127234; Wed, 08
 Mar 2023 11:52:07 -0800 (PST)
MIME-Version: 1.0
References: <20221229160045.535778-1-brgl@bgdev.pl> <20221229160045.535778-2-brgl@bgdev.pl>
 <CAMuHMdWBQaB2caVB9vKQoqE0r6jAqOidMRmsCXxyixEm+HWPdw@mail.gmail.com> <CAMRc=McHiMXHzeg_B3zEw74yzNcw48jWEDcZRcvPNZ51XiS0kg@mail.gmail.com>
In-Reply-To: <CAMRc=McHiMXHzeg_B3zEw74yzNcw48jWEDcZRcvPNZ51XiS0kg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Mar 2023 20:51:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUSP3Wp0Jei_PpHV1aS6TL0WcUb68qM21aq5NtdR6vww@mail.gmail.com>
Message-ID: <CAMuHMdXUSP3Wp0Jei_PpHV1aS6TL0WcUb68qM21aq5NtdR6vww@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: dev: fix notifier return values
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bartosz,

On Wed, Mar 8, 2023 at 8:33 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Wed, Mar 8, 2023 at 5:58 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Dec 29, 2022 at 5:12 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > We have a set of return values that notifier callbacks can return. They
> > > should not return 0, error codes or anything other than those predefined
> > > values. Make the i2c character device's callback return NOTIFY_DONE or
> > > NOTIFY_OK depending on the situation.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Thanks for your patch, which is now commit cddf70d0bce71c2a ("i2c:
> > dev: fix notifier return values") in v6.3-rc1.
> >
> > On SH/R-Mobile platforms, this leads to missing /dev/i2c-* entries.
> > On R-Car Gen4, they are still present, as all I2C adapters are
> > initialized after i2cdev.
> >
> > > --- a/drivers/i2c/i2c-dev.c
> > > +++ b/drivers/i2c/i2c-dev.c
> > > @@ -653,12 +653,12 @@ static int i2cdev_attach_adapter(struct device *dev, void *dummy)
> > >         int res;
> > >
> > >         if (dev->type != &i2c_adapter_type)
> > > -               return 0;
> > > +               return NOTIFY_DONE;
> > >         adap = to_i2c_adapter(dev);
> > >
> > >         i2c_dev = get_free_i2c_dev(adap);
> > >         if (IS_ERR(i2c_dev))
> > > -               return PTR_ERR(i2c_dev);
> > > +               return NOTIFY_DONE;
> > >
> > >         cdev_init(&i2c_dev->cdev, &i2cdev_fops);
> > >         i2c_dev->cdev.owner = THIS_MODULE;
> > > @@ -678,11 +678,11 @@ static int i2cdev_attach_adapter(struct device *dev, void *dummy)
> > >                 goto err_put_i2c_dev;
> > >
> > >         pr_debug("adapter [%s] registered as minor %d\n", adap->name, adap->nr);
> > > -       return 0;
> > > +       return NOTIFY_OK;
> >
> > Unfortunately i2cdev_{at,de}tach_adapter() are not only used as
> > notifiers (called from i2cdev_notifier_call()), but also called from
> > i2c_dev_init():
> >
> >         /* Bind to already existing adapters right away */
> >         i2c_for_each_dev(NULL, i2cdev_attach_adapter);
> >
> > and i2c_dev_exit():
> >
> >         i2c_for_each_dev(NULL, i2cdev_detach_adapter);
> >
> > As soon i2c_dev_{at,de}tach_adapter() returns a non-zero
> > value (e.g. NOTIFY_OK), {i2c,bus}_for_each_dev() aborts
> > processing.
> >
> > In i2c_dev_init(), this leads to a failure in registering any
> > already existing i2c adapters after the first one, causing missing
> > /dev/i2c-* entries.
> >
> > In i2c_dev_exit(), this leads to a failure unregistering any but the
> > first i2c adapter.
> >
> > As there is no one-to-one mapping from error codes to notify codes,
> > I think this cannot just be handled inside i2cdev_notifier_call() :-(
>
> Would wrapping i2c_a/detach_adapter() in a notifier callback work? So
> that SH can call it directly while notifiers would call it indirectly
> through the wrapper?

That would be a wrapper that ignores the NOTIFY_* return
value, and always returns zero? I.e. we can no longer return an
error.  I guess that's OK, as i2c_dev_init() doesn't take any
action based on the returned error code anyway.

The only error conditions that can happen in i2c_attach_adapter()
are:
  - "Out of device minors" message in get_free_i2c_dev(),
  - WARN_ON(dev == WHITEOUT_DEV) in cdev_add(),
  - Generic -ENOMEM.
Looks like all of the above can be ignored, as they are all unlikely to
happen, and there is nothing to be done to recover...

Note that this is not "called directly from SH".
The SH/R-Mobile SoCs where I noticed the issue are ARM32.
I guess it can happen on other platforms, too, depending on initialization
order...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
