Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A6B6B1E32
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 09:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjCIIcY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 03:32:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjCIIcE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 03:32:04 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FE217147
        for <linux-i2c@vger.kernel.org>; Thu,  9 Mar 2023 00:30:41 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id e82so1091696ybh.9
        for <linux-i2c@vger.kernel.org>; Thu, 09 Mar 2023 00:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678350640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6X01iIU0wnxPVN4mE7EbEfeiXJ0H/q86RXnLPkaXpNQ=;
        b=sFFwDzyP/v/Gl+iJe8PCcylVUjYTJrmsMUblQNR9XkeUOZMY0fQ/Hc0T8Gwc/6uMq2
         91LZ3Tz4iYasKiwJiIJeDzz+C3SkEpdJuEvZCa6Pe9UlGlmlajfZOiVEPA/8wGrYAKjA
         LmGzDBMrO6/hVFU1kCe/8ncg01bk3tUxqDYtQe6qkBUYVmQfCW+WQliQlqbkx1d/J2N8
         MdLjWXCRsGXSmVqjHwy+iHqigZedg08E7CePrj5752x+w70FD1ufJU6sATF8pxmFC85V
         fE3T39j5W3O2Osjenh6sZ47hgip062gCMozpYQKpRfzSF1AK3nefZDMdRlfBlduVHZFP
         XfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678350640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6X01iIU0wnxPVN4mE7EbEfeiXJ0H/q86RXnLPkaXpNQ=;
        b=HYn5IhKRWXPRf1QouSdELsCqfJmACzVL5K6+zmfgd2GHOGaDHUQrlU/FslZ69ZkSuD
         R+FzXXV5w2EDN8qiqEcI/JT5e8+jYHrL8/0I6e0vyFblkeIlOhIFsptX1rRlcoaLrdg7
         52jz+JA73hZ82wY8PtQFeSNEj4IOmh29+It025kc55nX6NTELrPRQDGMKy/tkYlZq2+k
         HPxfmqFFuj3mo9/BQHm5C7ZBXeZifK91cqg0PvyONUjClNcgrH8t7JWKIO/LdQoTNoEl
         DdIifFcmW8a1DgRb5KphFdtvqO4+HnBmv4IGNwBmnYSB1uwXedpw2K/JVgW79X8jbWRk
         3Dzg==
X-Gm-Message-State: AO0yUKVfySvWXbOiSaepnVtv5+boD3takQhHJAPT/6fFETRzsGF9Wx45
        QlO/gE02+Wv5ckaAy3KNTSaXAxBWmLIe+zTiBCQdfZHfi/r4b055
X-Google-Smtp-Source: AK7set+0Omu29SoUGI3ideA2ereu9ALg/F/QLm40StIVYVsoJ0c5ssjGhRiOVnxdmvi71H975er5diCiOZcF+UB5KCk=
X-Received: by 2002:a25:cd0a:0:b0:b26:884:c35e with SMTP id
 d10-20020a25cd0a000000b00b260884c35emr1643582ybf.4.1678350640088; Thu, 09 Mar
 2023 00:30:40 -0800 (PST)
MIME-Version: 1.0
References: <03a8cd13af352c4d990bc70b72df4915b9fa2874.1678347776.git.geert+renesas@glider.be>
In-Reply-To: <03a8cd13af352c4d990bc70b72df4915b9fa2874.1678347776.git.geert+renesas@glider.be>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Thu, 9 Mar 2023 09:30:29 +0100
Message-ID: <CACMJSevqE8NC-=so7W_Xge-yw7w+La0dJTqx0z9u_AYt-7gtuQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: dev: Fix bus callback return values
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 9 Mar 2023 at 08:45, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> The i2cdev_{at,de}tach_adapter() callbacks are used for two purposes:
>   1. As notifier callbacks, when (un)registering I2C adapters created or
>      destroyed after i2c_dev_init(),
>   2. As bus iterator callbacks, for registering already existing
>      adapters from i2c_dev_init(), and for cleanup.
>
> Unfortunately both use cases expect different return values: the former
> expects NOTIFY_* return codes, while the latter expects zero or error
> codes, and aborts in case of error.
>
> Hence in case 2, as soon as i2cdev_{at,de}tach_adapter() returns
> (non-zero) NOTIFY_OK, the bus iterator aborts.  This causes (a) only the
> first already existing adapter to be registered, leading to missing
> /dev/i2c-* entries, and (b) a failure to unregister all but the first
> I2C adapter during cleanup.
>
> Fix this by introducing separate callbacks for the bus iterator,
> wrapping the notifier functions, and always returning succes.
> Any errors inside these callback functions are unlikely to happen, and
> are fatal anyway.
>
> Fixes: cddf70d0bce71c2a ("i2c: dev: fix notifier return values")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Seen on r8a7740/armadillo and r8a73a4/ape6evm, where the i2c-shmobile
> adapters are probed before i2c_dev_init().
> Not seen on r8a779g0/white-hawk, where all I2C adapters are probed after
> i2c_dev_init().
>
>  drivers/i2c/i2c-dev.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
> index 107623c4cc14aaf9..95a0b63ac560cf33 100644
> --- a/drivers/i2c/i2c-dev.c
> +++ b/drivers/i2c/i2c-dev.c
> @@ -646,7 +646,7 @@ static void i2cdev_dev_release(struct device *dev)
>         kfree(i2c_dev);
>  }
>
> -static int i2cdev_attach_adapter(struct device *dev, void *dummy)
> +static int i2cdev_attach_adapter(struct device *dev)
>  {
>         struct i2c_adapter *adap;
>         struct i2c_dev *i2c_dev;
> @@ -685,7 +685,7 @@ static int i2cdev_attach_adapter(struct device *dev, void *dummy)
>         return NOTIFY_DONE;
>  }
>
> -static int i2cdev_detach_adapter(struct device *dev, void *dummy)
> +static int i2cdev_detach_adapter(struct device *dev)
>  {
>         struct i2c_adapter *adap;
>         struct i2c_dev *i2c_dev;
> @@ -711,9 +711,9 @@ static int i2cdev_notifier_call(struct notifier_block *nb, unsigned long action,
>
>         switch (action) {
>         case BUS_NOTIFY_ADD_DEVICE:
> -               return i2cdev_attach_adapter(dev, NULL);
> +               return i2cdev_attach_adapter(dev);
>         case BUS_NOTIFY_DEL_DEVICE:
> -               return i2cdev_detach_adapter(dev, NULL);
> +               return i2cdev_detach_adapter(dev);
>         }
>
>         return NOTIFY_DONE;
> @@ -725,6 +725,18 @@ static struct notifier_block i2cdev_notifier = {
>
>  /* ------------------------------------------------------------------------- */
>
> +static int __init i2c_dev_attach_adapter(struct device *dev, void *dummy)
> +{
> +       i2cdev_attach_adapter(dev);
> +       return 0;
> +}
> +
> +static int __exit i2c_dev_detach_adapter(struct device *dev, void *dummy)
> +{
> +       i2cdev_detach_adapter(dev);
> +       return 0;
> +}
> +
>  /*
>   * module load/unload record keeping
>   */
> @@ -752,7 +764,7 @@ static int __init i2c_dev_init(void)
>                 goto out_unreg_class;
>
>         /* Bind to already existing adapters right away */
> -       i2c_for_each_dev(NULL, i2cdev_attach_adapter);
> +       i2c_for_each_dev(NULL, i2c_dev_attach_adapter);
>
>         return 0;
>
> @@ -768,7 +780,7 @@ static int __init i2c_dev_init(void)
>  static void __exit i2c_dev_exit(void)
>  {
>         bus_unregister_notifier(&i2c_bus_type, &i2cdev_notifier);
> -       i2c_for_each_dev(NULL, i2cdev_detach_adapter);
> +       i2c_for_each_dev(NULL, i2c_dev_detach_adapter);
>         class_destroy(i2c_dev_class);
>         unregister_chrdev_region(MKDEV(I2C_MAJOR, 0), I2C_MINORS);
>  }
> --
> 2.34.1
>

Thanks for addressing it.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
