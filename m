Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 084CD505E4B
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Apr 2022 21:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347603AbiDRTRe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Apr 2022 15:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347598AbiDRTRd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Apr 2022 15:17:33 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C5F60DA
        for <linux-i2c@vger.kernel.org>; Mon, 18 Apr 2022 12:14:53 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id b15so18520292edn.4
        for <linux-i2c@vger.kernel.org>; Mon, 18 Apr 2022 12:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2wJl9MwQ1iwXUwlUKVjn/2v+VbFi/d32jDuFxBZydIA=;
        b=oaMGNTgNTYTte0WwnxDAxybd0+9NRJApwPP/xLLhagaQDKHILGzTwu5/3Q6kkOng1O
         RaLbru6KwjjKdXY7qnXxipyfyvTlwsiuigHzJekTOHkCxvbBl0Pa6yHt81NN98zupO8v
         B4UukqK8PTZbK8VczuypF9GQ1wgycYo6KmfEwwv0TTFm2PJBYH64hcIXdAImbx6LETO9
         q5CPUmyuY9nYTUPeaCKht7VJVJsM6jrP+YcX1nS0v4nh9Dqsa3Wa+jYuPk1z3LK0wj06
         Oz5hgbzsoYMoGKPh3BrBkAzHTXsX506PdW6Bbj0or46RkAcATjaIbRj66MRPtQIoHAez
         BeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2wJl9MwQ1iwXUwlUKVjn/2v+VbFi/d32jDuFxBZydIA=;
        b=vLbr9aKOeEXeXoZYL81DXVYhA2V01l5srzOPtuaj8EeuDGSKzL+rUHTmcLQX5Mts7s
         Zc1EdT7UxSsIyVunncMDb27wDacGJyxAcNd4EAcVCQwV3fJyQU4Iw3bxTqVZTu8fm7+h
         Byu0ail2S+j/MHbA5DM0F70m/dfZy7GHZ37xIJyBmk6NFpkH921ID4KEQY3U0cV5/dMu
         a/xzzNS8epBvxJK9+ndNm9QZurGak7mqDswCpGVtNhDZ8NY1dImj7pNgzKtASrI68wvT
         Ky4akHfRI14oavtsGrKKt/DsQrYL1gOY6tKTw3jOp4SRmOrUZcVsB5a6Ornyd+c3GUWj
         KCOQ==
X-Gm-Message-State: AOAM5327dvYhh2MigE27/DFbofK5mI/VT6bkupzUAzhIcNhSIBaVaxxm
        jm43PYkwhxDKMBe5pyBTGrnSDxndy3ji8D/3bX9zsw==
X-Google-Smtp-Source: ABdhPJzIie1IH6j6emtV00wu9g83/0WPVcwoV+9YzMibw8EFiICQI5hrlnlpadwsxtxTSPcRil+455iEnwuFowQhXpM=
X-Received: by 2002:a05:6402:128f:b0:41d:7e85:8421 with SMTP id
 w15-20020a056402128f00b0041d7e858421mr13403766edv.352.1650309292439; Mon, 18
 Apr 2022 12:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220414090727.2542000-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220414090727.2542000-1-chi.minghao@zte.com.cn>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 18 Apr 2022 21:14:41 +0200
Message-ID: <CAMRc=Mc+GKiy2vv4AJp5uR3Vx-VhfuswRjTpV+53yjgWFW6Fcg@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-davinci: using pm_runtime_resume_and_get instead
 of pm_runtime_get_sync
To:     cgel.zte@gmail.com
Cc:     Sekhar Nori <nsekhar@ti.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 14, 2022 at 11:07 AM <cgel.zte@gmail.com> wrote:
>
> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. This change is just to simplify the code, no
> actual functional changes.

I would love it if people started adding some notes on how
pm_runtime_and_get() can replace the other two in the commit messages
for these patches. Anyway FWIW:

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>

>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  drivers/i2c/busses/i2c-davinci.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
> index e9d07323c604..9e09db31a937 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -539,10 +539,9 @@ i2c_davinci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>
>         dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
>
> -       ret = pm_runtime_get_sync(dev->dev);
> +       ret = pm_runtime_resume_and_get(dev->dev);
>         if (ret < 0) {
>                 dev_err(dev->dev, "Failed to runtime_get device: %d\n", ret);
> -               pm_runtime_put_noidle(dev->dev);
>                 return ret;
>         }
>
> @@ -821,10 +820,9 @@ static int davinci_i2c_probe(struct platform_device *pdev)
>
>         pm_runtime_enable(dev->dev);
>
> -       r = pm_runtime_get_sync(dev->dev);
> +       r = pm_runtime_resume_and_get(dev->dev);
>         if (r < 0) {
>                 dev_err(dev->dev, "failed to runtime_get device: %d\n", r);
> -               pm_runtime_put_noidle(dev->dev);
>                 return r;
>         }
>
> @@ -898,11 +896,9 @@ static int davinci_i2c_remove(struct platform_device *pdev)
>
>         i2c_del_adapter(&dev->adapter);
>
> -       ret = pm_runtime_get_sync(&pdev->dev);
> -       if (ret < 0) {
> -               pm_runtime_put_noidle(&pdev->dev);
> +       ret = pm_runtime_resume_and_get(&pdev->dev);
> +       if (ret < 0)
>                 return ret;
> -       }
>
>         davinci_i2c_write_reg(dev, DAVINCI_I2C_MDR_REG, 0);
>
> --
> 2.25.1
>
>
