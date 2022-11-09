Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D376622C73
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Nov 2022 14:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiKINeY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Nov 2022 08:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiKINeX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Nov 2022 08:34:23 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A932AC6A
        for <linux-i2c@vger.kernel.org>; Wed,  9 Nov 2022 05:34:23 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id 13so46749184ejn.3
        for <linux-i2c@vger.kernel.org>; Wed, 09 Nov 2022 05:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hRp9ggfrc3pUhH9noDOfG+UiWKthVVd275v3/Gnchcc=;
        b=aXyU+cQZbjaM3EYAqiUJn3okIvP2e+SODq8aYWqIwzolbE+jBkhydN1zN9gS6J6S2t
         nJRubFkkS8Z8NTbnp73jQ5IHzVDhViOqJVEr+ydO9TlZEjv19ZBHIzI3nppE8QEizUfE
         wjMcic7NBViBYAZZ5Bw+j3TMooHCzHTbJY9VArlQ9KMMQSxBUwQYX461AkwiGjzVIX+d
         6guJ2K6extaSKkB3UyWvJyXx8Gya49h1IlyRPk+jirk4s+1j1IzF8tiqnjlEtY52UKF2
         93/WoNGhCZaCtFtJbo+F/cYXnYdtHeNIYuVsbC4RQYL7l+uqnalMnxE/7Ds6pVJK8666
         WUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRp9ggfrc3pUhH9noDOfG+UiWKthVVd275v3/Gnchcc=;
        b=ofuDOzjVdqDkLc0zGXW5M8KtxA+qevj+AybGhuVP5t5PWDar3/Hnw2qZWiyhGnHJWs
         Cev2QV7rG3uqkY4d+TYIeFExFSS5eH2yP3THL6r1wpKHsyB9a+qW7AWn8RiQ/bfONZuS
         Zs87rzLMVkLH0O3HwK8tQuMW4GilhMoNo9OWw+DdXuPmWde+4ffpM0ByUZskWA2tb29l
         PefooLHpWixue0/ru8d8Y+/CIMPAcBgcJZiiEi+Bqf6umxgcQltNcK4amZzZtmNn3Li3
         bOnQkT4cMYfO83uslDuAE7U3r7vfOLnfxlhYjtR58SH1g+6kDpHd34CkQeEqdkzvo6Q1
         EYeQ==
X-Gm-Message-State: ANoB5pl7ylhYhrEPMVwploy/DoqtUUaaswCIyE2hVAxOsVlH4VYRgdB3
        fkUoCGwvAEY5dGP0F9oDimLhh//vTL3SPvPJxK0=
X-Google-Smtp-Source: AA0mqf7tAyXaBYFaB/TMNCyFr5IQym41MY+ujgilkkq1l2YZHn5HWQoqBIZ6Fo+x/si5MfSvowvF2KKje0J6KxLJyz4=
X-Received: by 2002:a17:906:1458:b0:7ae:4d8c:91fe with SMTP id
 q24-20020a170906145800b007ae4d8c91femr20131187ejc.452.1668000861495; Wed, 09
 Nov 2022 05:34:21 -0800 (PST)
MIME-Version: 1.0
References: <20221109112250.124829-1-yuancan@huawei.com>
In-Reply-To: <20221109112250.124829-1-yuancan@huawei.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Wed, 9 Nov 2022 15:34:10 +0200
Message-ID: <CAHb3i=tUA5ai_hVHZYJS9Yo3ihF_TkKxM8wb6SsVBLmae7FwYA@mail.gmail.com>
Subject: Re: [PATCH] i2c: npcm7xx: Fix error handling in npcm_i2c_init()
To:     Yuan Can <yuancan@huawei.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 9, 2022 at 1:24 PM Yuan Can <yuancan@huawei.com> wrote:
>
> A problem about i2c-npcm7xx create debugfs failed is triggered with the
> following log given:
>
>  [  173.827310] debugfs: Directory 'npcm_i2c' with parent '/' already present!
>
> The reason is that npcm_i2c_init() returns platform_driver_register()
> directly without checking its return value, if platform_driver_register()
> failed, it returns without destroy the newly created debugfs, resulting
> the debugfs of npcm_i2c can never be created later.
>
>  npcm_i2c_init()
>    debugfs_create_dir() # create debugfs directory
>    platform_driver_register()
>      driver_register()
>        bus_add_driver()
>          priv = kzalloc(...) # OOM happened
>    # return without destroy debugfs directory
>
> Fix by removing debugfs when platform_driver_register() returns error.
>
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 0c365b57d957..83457359ec45 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2393,8 +2393,17 @@ static struct platform_driver npcm_i2c_bus_driver = {
>
>  static int __init npcm_i2c_init(void)
>  {
> +       int ret;
> +
>         npcm_i2c_debugfs_dir = debugfs_create_dir("npcm_i2c", NULL);
> -       return platform_driver_register(&npcm_i2c_bus_driver);
> +
> +       ret = platform_driver_register(&npcm_i2c_bus_driver);
> +       if (ret) {
> +               debugfs_remove_recursive(npcm_i2c_debugfs_dir);
> +               return ret;
> +       }
> +
> +       return 0;
>  }
>  module_init(npcm_i2c_init);
>
> --
> 2.17.1
>

Thanks Yuan!

Reviewed-by: Tali Perry <tali.perry@nuvoton.com>
