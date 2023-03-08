Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2D96B0F8E
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Mar 2023 18:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjCHRBT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 8 Mar 2023 12:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbjCHRAA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Mar 2023 12:00:00 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC0361AA3;
        Wed,  8 Mar 2023 08:58:43 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id l18so18805356qtp.1;
        Wed, 08 Mar 2023 08:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678294718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQsveLed2uZniCZtaVm8H3zBhAU22fyIRDp2q5iffd8=;
        b=6aLTXylBXyFht9jsh0uavCijXIq9bwPnofsTdMlEoBOOrlbaaq/Ic/xeMSilLjzEg7
         it7BXr8utCMAPb1EnHcX6v9S4bmBZkKW/dCtDR0PPD7cmAs376UwUiCqZuHeGeDJ6U36
         38TfFjSralp/a/Z40Z+lhXxAPO6i52xJUPyP1n0tEmbMKrYBT7xB2Cs5R/18qkGUanYP
         zZNzG3aBpZA1OyvErG/N2YAsfYxNlI3y1tWbVn+/lyMlBl+fycciSMUg9sluqMHCY+hl
         H4Q8XOhIEDlEMJoHTP35VVn29AI+EX84agnos90mrp9xwBkzodcB+MLQoRyT4sOEqRK/
         NYWg==
X-Gm-Message-State: AO0yUKUKmdnsFjDtf4TdkL/E6zmPVjKIO/wnnUaS2pIoDUk0fcsXloMK
        CvA4jhiw+txtOw9jpUYLbNj6MPQFH/mtUEdA
X-Google-Smtp-Source: AK7set/20lW9SnZOz06nVVAQ9zNkyyWySB8FgT8/zkyow7pInko7jEIFi1R61ADW/PUEjUUn17aNxw==
X-Received: by 2002:a05:622a:14e:b0:3bc:ff12:e5e5 with SMTP id v14-20020a05622a014e00b003bcff12e5e5mr30896198qtw.17.1678294717852;
        Wed, 08 Mar 2023 08:58:37 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id b1-20020ac84f01000000b003bb8c60cdf1sm11862343qte.78.2023.03.08.08.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 08:58:37 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-536c2a1cc07so315666977b3.5;
        Wed, 08 Mar 2023 08:58:36 -0800 (PST)
X-Received: by 2002:a81:4428:0:b0:533:8b3a:d732 with SMTP id
 r40-20020a814428000000b005338b3ad732mr11495878ywa.4.1678294716640; Wed, 08
 Mar 2023 08:58:36 -0800 (PST)
MIME-Version: 1.0
References: <20221229160045.535778-1-brgl@bgdev.pl> <20221229160045.535778-2-brgl@bgdev.pl>
In-Reply-To: <20221229160045.535778-2-brgl@bgdev.pl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Mar 2023 17:58:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWBQaB2caVB9vKQoqE0r6jAqOidMRmsCXxyixEm+HWPdw@mail.gmail.com>
Message-ID: <CAMuHMdWBQaB2caVB9vKQoqE0r6jAqOidMRmsCXxyixEm+HWPdw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: dev: fix notifier return values
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bartosz,

On Thu, Dec 29, 2022 at 5:12 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have a set of return values that notifier callbacks can return. They
> should not return 0, error codes or anything other than those predefined
> values. Make the i2c character device's callback return NOTIFY_DONE or
> NOTIFY_OK depending on the situation.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks for your patch, which is now commit cddf70d0bce71c2a ("i2c:
dev: fix notifier return values") in v6.3-rc1.

On SH/R-Mobile platforms, this leads to missing /dev/i2c-* entries.
On R-Car Gen4, they are still present, as all I2C adapters are
initialized after i2cdev.

> --- a/drivers/i2c/i2c-dev.c
> +++ b/drivers/i2c/i2c-dev.c
> @@ -653,12 +653,12 @@ static int i2cdev_attach_adapter(struct device *dev, void *dummy)
>         int res;
>
>         if (dev->type != &i2c_adapter_type)
> -               return 0;
> +               return NOTIFY_DONE;
>         adap = to_i2c_adapter(dev);
>
>         i2c_dev = get_free_i2c_dev(adap);
>         if (IS_ERR(i2c_dev))
> -               return PTR_ERR(i2c_dev);
> +               return NOTIFY_DONE;
>
>         cdev_init(&i2c_dev->cdev, &i2cdev_fops);
>         i2c_dev->cdev.owner = THIS_MODULE;
> @@ -678,11 +678,11 @@ static int i2cdev_attach_adapter(struct device *dev, void *dummy)
>                 goto err_put_i2c_dev;
>
>         pr_debug("adapter [%s] registered as minor %d\n", adap->name, adap->nr);
> -       return 0;
> +       return NOTIFY_OK;

Unfortunately i2cdev_{at,de}tach_adapter() are not only used as
notifiers (called from i2cdev_notifier_call()), but also called from
i2c_dev_init():

        /* Bind to already existing adapters right away */
        i2c_for_each_dev(NULL, i2cdev_attach_adapter);

and i2c_dev_exit():

        i2c_for_each_dev(NULL, i2cdev_detach_adapter);

As soon i2c_dev_{at,de}tach_adapter() returns a non-zero
value (e.g. NOTIFY_OK), {i2c,bus}_for_each_dev() aborts
processing.

In i2c_dev_init(), this leads to a failure in registering any
already existing i2c adapters after the first one, causing missing
/dev/i2c-* entries.

In i2c_dev_exit(), this leads to a failure unregistering any but the
first i2c adapter.

As there is no one-to-one mapping from error codes to notify codes,
I think this cannot just be handled inside i2cdev_notifier_call() :-(

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
