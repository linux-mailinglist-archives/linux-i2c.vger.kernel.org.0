Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67ABC6B1CE7
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 08:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjCIHu6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 9 Mar 2023 02:50:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjCIHul (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 02:50:41 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D89E5036;
        Wed,  8 Mar 2023 23:48:58 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id l18so1149273qtp.1;
        Wed, 08 Mar 2023 23:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678348043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICWknQwFK2m/dBFCkLtUN+LIHSPnra5KDSHgmSsuIbE=;
        b=XA7FKiq3VWSRGnllJG8ioGl6APMrpzbEC7Y1g2rWI3fiLx+JN7z0PTzCZaFgAZbydU
         EJLSUTxt93sM6y5oyaWgFtxAActxkuZoMQwlcwxz0phv5FXU+cgYIeEErVjMc7cUnH5a
         75rNBTa1HPPe+COdz8y/SkgVxs8eP7v44j52jxqtAuSKZ3eW0wemET1BCxHglPNxs0Lb
         lOWhBvnQRI56bsbLWmHkBab/vcgnNM+z1gbKRwK1O0+jP8E7I/0IjY7Axvk8cWESzp4P
         wlYVZdxHmoZfHyxCuH1Wn8p8N2/AMXAK55LFX508m1zjrOlZcbu5Xgxh3R8xkfDLHql2
         lisg==
X-Gm-Message-State: AO0yUKVYL2wrQNGoWJJJCpQAt54LEZBxsST0bm778QzrhxTpoF/vcTI3
        O0cyEwVF+Hn7yExtbHQOKRSfX16DZVq+OeLj
X-Google-Smtp-Source: AK7set+LdvQHmHHcy5hS2bOfNpkNWDHVrAqSy2VJ4eVCZOSCBIMlQhk82u/C/rvShLbkpjy5tha4mA==
X-Received: by 2002:ac8:5c47:0:b0:3bf:c25c:838 with SMTP id j7-20020ac85c47000000b003bfc25c0838mr36729714qtj.68.1678348043593;
        Wed, 08 Mar 2023 23:47:23 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id w19-20020ac843d3000000b003bfbf3afe51sm13057643qtn.93.2023.03.08.23.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 23:47:22 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-536bbe5f888so19708567b3.8;
        Wed, 08 Mar 2023 23:47:22 -0800 (PST)
X-Received: by 2002:a81:ac09:0:b0:535:8cb8:6ae9 with SMTP id
 k9-20020a81ac09000000b005358cb86ae9mr13581888ywh.4.1678348041984; Wed, 08 Mar
 2023 23:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20221229160045.535778-1-brgl@bgdev.pl> <20221229160045.535778-2-brgl@bgdev.pl>
 <CAMuHMdWBQaB2caVB9vKQoqE0r6jAqOidMRmsCXxyixEm+HWPdw@mail.gmail.com>
 <CAMRc=McHiMXHzeg_B3zEw74yzNcw48jWEDcZRcvPNZ51XiS0kg@mail.gmail.com> <CAMuHMdXUSP3Wp0Jei_PpHV1aS6TL0WcUb68qM21aq5NtdR6vww@mail.gmail.com>
In-Reply-To: <CAMuHMdXUSP3Wp0Jei_PpHV1aS6TL0WcUb68qM21aq5NtdR6vww@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Mar 2023 08:47:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWE3vs-zQCUB3RdKQRuMnJ=FXXf4FibCCTr4+g4rzPwWA@mail.gmail.com>
Message-ID: <CAMuHMdWE3vs-zQCUB3RdKQRuMnJ=FXXf4FibCCTr4+g4rzPwWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: dev: fix notifier return values
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bartosz,

On Wed, Mar 8, 2023 at 8:51 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Mar 8, 2023 at 8:33 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Wed, Mar 8, 2023 at 5:58 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Thu, Dec 29, 2022 at 5:12 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > We have a set of return values that notifier callbacks can return. They
> > > > should not return 0, error codes or anything other than those predefined
> > > > values. Make the i2c character device's callback return NOTIFY_DONE or
> > > > NOTIFY_OK depending on the situation.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Thanks for your patch, which is now commit cddf70d0bce71c2a ("i2c:
> > > dev: fix notifier return values") in v6.3-rc1.
> > >
> > > On SH/R-Mobile platforms, this leads to missing /dev/i2c-* entries.
> > > On R-Car Gen4, they are still present, as all I2C adapters are
> > > initialized after i2cdev.
> > >
> > > > --- a/drivers/i2c/i2c-dev.c
> > > > +++ b/drivers/i2c/i2c-dev.c
> > > > @@ -653,12 +653,12 @@ static int i2cdev_attach_adapter(struct device *dev, void *dummy)
> > > >         int res;
> > > >
> > > >         if (dev->type != &i2c_adapter_type)
> > > > -               return 0;
> > > > +               return NOTIFY_DONE;
> > > >         adap = to_i2c_adapter(dev);
> > > >
> > > >         i2c_dev = get_free_i2c_dev(adap);
> > > >         if (IS_ERR(i2c_dev))
> > > > -               return PTR_ERR(i2c_dev);
> > > > +               return NOTIFY_DONE;
> > > >
> > > >         cdev_init(&i2c_dev->cdev, &i2cdev_fops);
> > > >         i2c_dev->cdev.owner = THIS_MODULE;
> > > > @@ -678,11 +678,11 @@ static int i2cdev_attach_adapter(struct device *dev, void *dummy)
> > > >                 goto err_put_i2c_dev;
> > > >
> > > >         pr_debug("adapter [%s] registered as minor %d\n", adap->name, adap->nr);
> > > > -       return 0;
> > > > +       return NOTIFY_OK;
> > >
> > > Unfortunately i2cdev_{at,de}tach_adapter() are not only used as
> > > notifiers (called from i2cdev_notifier_call()), but also called from
> > > i2c_dev_init():
> > >
> > >         /* Bind to already existing adapters right away */
> > >         i2c_for_each_dev(NULL, i2cdev_attach_adapter);
> > >
> > > and i2c_dev_exit():
> > >
> > >         i2c_for_each_dev(NULL, i2cdev_detach_adapter);
> > >
> > > As soon i2c_dev_{at,de}tach_adapter() returns a non-zero
> > > value (e.g. NOTIFY_OK), {i2c,bus}_for_each_dev() aborts
> > > processing.
> > >
> > > In i2c_dev_init(), this leads to a failure in registering any
> > > already existing i2c adapters after the first one, causing missing
> > > /dev/i2c-* entries.
> > >
> > > In i2c_dev_exit(), this leads to a failure unregistering any but the
> > > first i2c adapter.
> > >
> > > As there is no one-to-one mapping from error codes to notify codes,
> > > I think this cannot just be handled inside i2cdev_notifier_call() :-(
> >
> > Would wrapping i2c_a/detach_adapter() in a notifier callback work? So
> > that SH can call it directly while notifiers would call it indirectly
> > through the wrapper?
>
> That would be a wrapper that ignores the NOTIFY_* return
> value, and always returns zero? I.e. we can no longer return an
> error.  I guess that's OK, as i2c_dev_init() doesn't take any
> action based on the returned error code anyway.

This works, so I've sent a fix
https://lore.kernel.org/r/03a8cd13af352c4d990bc70b72df4915b9fa2874.1678347776.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
