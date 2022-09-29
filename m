Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDED5EEF9F
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 09:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235189AbiI2HsZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 03:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234757AbiI2HsV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 03:48:21 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3497713A061
        for <linux-i2c@vger.kernel.org>; Thu, 29 Sep 2022 00:48:18 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id ay7-20020a05600c1e0700b003b49861bf48so3406209wmb.0
        for <linux-i2c@vger.kernel.org>; Thu, 29 Sep 2022 00:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UDwXcBltBsL9b5yOAoWGyn/LRWPSpZVKFgpM98kwsxQ=;
        b=a1hWX+MvN/JBtF7P7cvhg+7w2skJQYhZU0uMVqSFXos3ofxsbrN/eTSQqLAl8uykKD
         fIfyVExTgQEap5qgARfZv9Vy0dkVOWleLBjhrPiw7oNHpNiojOc1hCWmG0nXWcKqtBJC
         +H7Dmsj6cEqIFSbmzNUJIcKuxcEi0jrtvtqpzdcpabWk+ZU0e+qzmxun8IVP0UgXI68v
         5mn5W5PxiATSmN1UT9KjwVg80hIAmoTOKc/6yAFn19tju8wkd3ItqlM1rBGFzFZdbow7
         jJn0/5mKm4jU6an30tGn+Ek65DxZTOK53fzDauEL9FetIQzAQPlFoGtY1ftKS54IfMfk
         nO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UDwXcBltBsL9b5yOAoWGyn/LRWPSpZVKFgpM98kwsxQ=;
        b=iTwF9yeFBQV88DBcswJFB4PENfhXT+Rt9LgxzEB5E8z3RCdaZO9VsWBQnZKpKYkQ+6
         hHP2kyVubaEhTHYLa5dRCpTQEdcxBFKavjIuLDCU2eSwnp/JczbBan4A84YV9+kOvFx7
         g4gR1jOlq1ioF3oLdagYuzGkM8gaLBoy3IrkOZeEK6/Bpv77GDhlRs+yzR67FVKDj1Bz
         jMFSibcFFLbuSNZDqhUyfuoLwU4hgJ6jofZ7z+wT8XMqDxli4UVQtdO4bcSKsz6KBPuh
         DvEwMPE4xkO6ecaROw4wSSGbhBtz2GT2B+2Jazh6FIEf4lubbshPU8NIqHe5MwvnVrRi
         ocDw==
X-Gm-Message-State: ACrzQf0o8WIL6gWZqhTSoukLbcLe77SxRRiq1GjBeIFdUaivp9uB/dDt
        QjJvX04c+56e9u5ROc5nR2XrO6TiOd2Nq9AoRGdjzA==
X-Google-Smtp-Source: AMsMyM7/Y0nb0OMQisFNCdB9TF5rx/8dK6/gfEWIsILtpsKHIWj2m1PUZQq9nx0EL9xW4XDVKASIvZLTvgC1tH9krWw=
X-Received: by 2002:a05:600c:3b8c:b0:3b4:8ad1:d894 with SMTP id
 n12-20020a05600c3b8c00b003b48ad1d894mr1244369wms.113.1664437696593; Thu, 29
 Sep 2022 00:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220927153249.66926-1-zhangqilong3@huawei.com>
In-Reply-To: <20220927153249.66926-1-zhangqilong3@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 29 Sep 2022 09:48:05 +0200
Message-ID: <CAMRc=MeTJ0dv1uiaa34Kwd1JX83ToQZhjTCQEzL3FHoAq9Mu5A@mail.gmail.com>
Subject: Re: [PATCH -next] i2c: davinci: fix PM disable depth imbalance in davinci_i2c_probe
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     nsekhar@ti.com, wsa@kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 27, 2022 at 5:29 PM Zhang Qilong <zhangqilong3@huawei.com> wrote:
>
> The pm_runtime_enable will increase power disable depth. Thus a
> pairing decrement is needed on the error handling path to keep
> it balanced according to context.
>
> Fixes:17f88151ff190 ("i2c: davinci: Add PM Runtime Support")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/i2c/busses/i2c-davinci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
> index 471c47db546b..c836cf884185 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -823,7 +823,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
>         r = pm_runtime_resume_and_get(dev->dev);
>         if (r < 0) {
>                 dev_err(dev->dev, "failed to runtime_get device: %d\n", r);
> -               return r;
> +               goto err_pm;
>         }
>
>         i2c_davinci_init(dev);
> @@ -882,6 +882,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
>  err_unuse_clocks:
>         pm_runtime_dont_use_autosuspend(dev->dev);
>         pm_runtime_put_sync(dev->dev);
> +err_pm:
>         pm_runtime_disable(dev->dev);
>
>         return r;
> --
> 2.25.1
>

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>

What is it with this [PATCH -next] tag people use everywhere now? This
tag should mean that the patch fixes something that's already in next.
The commit in question is 5 years old. Just use [PATCH].

Bart
