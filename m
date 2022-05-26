Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7B2F534E2B
	for <lists+linux-i2c@lfdr.de>; Thu, 26 May 2022 13:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiEZLmf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 May 2022 07:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiEZLme (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 May 2022 07:42:34 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 712A82A738;
        Thu, 26 May 2022 04:42:32 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id j7so1139659vsj.7;
        Thu, 26 May 2022 04:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JEe4JTq4HMoZ+I0YWVgsR8sQxwI+sin4+wwLO1J3RKE=;
        b=JLvO98Fu21sCqp2drA5IfmaUVr0h4lXAXWuPssLA5gtFkyn/FNC1jLwcQi+AGBV7wH
         uJrpcQYkVYpsRk0cSakfbvPtYDIyFqdskvQJ1qsUHfT+rPBKMNjdeW6IOShNFFKid1b2
         0vNUdDNqr6zoooiZ0/NarObdmNt80ywVrC/tAsYJTXXogKHxQnQYvkkCFB7b7XWPYvmz
         KCMVKcwrNpvs/ZDYn28Ru24YXag2mLh0gV/bYbWeabYCR7Oo+d0fh2EC+ynAeCzEApky
         AvBjMkJrEKG49Q63WoPqYa0sO+vBpxe7FJ5oQ0VotbsdoOrm873KJcD3X0yKlZhjsv8X
         33jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JEe4JTq4HMoZ+I0YWVgsR8sQxwI+sin4+wwLO1J3RKE=;
        b=4cnGZV2OYi42H2Mu9Gpq4P0oxgvqtzIJPOO7KDSpV047tTQZlhy9nj/qvCBITtbTzv
         GDDXKejtCgczoGickWxDAcVLt2vj24B3aWuGR2hDL92dZhVf4FpgeA8hNQUMwe4u9NXX
         xfFv2j2pcozv+QVtXMQdSnjP8LHwDkKrq1nHHoLt15U50LTEjmUaR4jUVzCF3lj5twi/
         YDyjUWq6UxJ275QCc9/5qb/O8bMdAxr/MYiSRHm702SLKGvCxTESNkAEI53x/X83scmi
         3c+hq11sHIpAlRlwax3BFod7g7EsZcHjvTmQ+rPOgF5BnnBJm+TyApjUfF9v7wULvYKe
         ywqw==
X-Gm-Message-State: AOAM532713nz082V4MIKoV2WFvz5pG8mBul8hmEabi393K2tiEggWEkE
        BsHMP2z3cgYSPa8euWx+uk8Z5CYtAPIz1YfYiXI=
X-Google-Smtp-Source: ABdhPJxIWXKb0kNzslGKXSAJfQCxTBRn9ur413NVMbEzqZ/Rc3zTbpcH1KxoGPjgrUzciHvXWJHHcjItv26rUnsZcWM=
X-Received: by 2002:a67:e09d:0:b0:335:def7:e939 with SMTP id
 f29-20020a67e09d000000b00335def7e939mr14828589vsl.27.1653565351588; Thu, 26
 May 2022 04:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220526094100.1494193-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20220526094100.1494193-1-jiasheng@iscas.ac.cn>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Thu, 26 May 2022 14:42:20 +0300
Message-ID: <CAHb3i=v+LV=sGCX8obuy=sXBFvnP9k-THb=mGw4ze8M5AVCYoQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: npcm7xx: barco-p50-gpio: Add check for platform_driver_register
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     avifishman70@gmail.com, Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 26, 2022 at 12:41 PM Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
>
> As platform_driver_register() could fail, it should be better
> to deal with the return value in order to maintain the code
> consisitency.
>
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 71aad029425d..08737fa2dcbf 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2336,8 +2336,7 @@ static struct platform_driver npcm_i2c_bus_driver = {
>  static int __init npcm_i2c_init(void)
>  {
>         npcm_i2c_debugfs_dir = debugfs_create_dir("npcm_i2c", NULL);
> -       platform_driver_register(&npcm_i2c_bus_driver);
> -       return 0;
> +       return platform_driver_register(&npcm_i2c_bus_driver);
>  }
>  module_init(npcm_i2c_init);
>
> --
> 2.25.1
>
thanks, Jiansheng !

Acked-by: Tali Perry <tali.perry1@gmail.com>
