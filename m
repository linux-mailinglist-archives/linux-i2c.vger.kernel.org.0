Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAF1268B75
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 14:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgINMvV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 08:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgINMtc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 08:49:32 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED11DC06174A;
        Mon, 14 Sep 2020 05:49:14 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b124so12504567pfg.13;
        Mon, 14 Sep 2020 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ROlxFZgVA2Swaooaus/a1+q0GqMXxQ0FAmAp3yP/6bY=;
        b=aSvv3znH5p3QtfV/kQJwGkY2pRzv7SRMcndqbikAXwclu1YjKE0lVYiZNlgEY3fgEK
         SQUUhfrDs9S3Gv7qRZOp7Qz2hfawC7lxdCdm7sNZibCD+Kgk6s8li4yLSmcJ/96Zcr0b
         2jyha3hKUs02yriAZZAW6UyzSvxincKiIXcnlkBQ2/cUhFGAIELxFjkZ0ATMdsRIAKAX
         5LdYGpzi558jCJy6WJQMkZugoSSpNSFoxWj+ktNGKXMzyinEj4fdG9QiS/bL658GgSik
         ivaj15mNwpgb3NjX/UEysV0ceWHJqSSypNlu6hHMeQxBrJiAsaiJALpuaxGlXZ1a87hx
         AB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ROlxFZgVA2Swaooaus/a1+q0GqMXxQ0FAmAp3yP/6bY=;
        b=XZTQUwTDXGdoLMlwBOd7Uc+8J9aZJp/9t1VHnk/aQBvMoxyvG+4N/loNO8Xf0xbJ0G
         aS9j13zWOWtbGUtlGNDicPfLCC7jxsZEQnccl8AnUCf3DWK1eRyFBsYjgvOFuHXMRWXE
         cULfl7V+dGnlRd22WazLo4CJPlSx94q8T5YdEzJElYUSH4jQrlr3E/PRQ9zUX7z3Kddh
         0DfxUhIdWqVsrYC9NdRyj8KOxb1i2xYFaLst2CaV4llRSkJYv/fjoY4+vSxoWGmCWUa2
         54OsaNreZ6K29iwf1Yo9S1B9UeET57uWfX/ATAFTmyTExJ4przCDehnp5Pq+hpT7eDAK
         zvqA==
X-Gm-Message-State: AOAM531VzQEloQOWafjq2+iWZlLHLoNxNIUUMYT6XseRXwlw3kfowPj2
        5a/ojTgFfaYfgn1EfbfR2C28A5khV5o/skE/H2A=
X-Google-Smtp-Source: ABdhPJymIOiWRsrqO646XK7+kQkW9udJ13idCdF7Qj+IW0QYeT6iuSE88ABLwNuRb+kln8anCVu8Svp0jQ7dfhX/vlU=
X-Received: by 2002:a63:c543:: with SMTP id g3mr10946987pgd.203.1600087754465;
 Mon, 14 Sep 2020 05:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <1599890246-21191-1-git-send-email-qii.wang@mediatek.com>
In-Reply-To: <1599890246-21191-1-git-send-email-qii.wang@mediatek.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Sep 2020 15:48:56 +0300
Message-ID: <CAHp75VeBuR4fkVk0z=+d7EonHz0h=4=eRj3Wfe8R_8T=eyHaeA@mail.gmail.com>
Subject: Re: [PATCH] i2c: mediatek: Fix generic definitions for bus frequencies
To:     qii.wang@mediatek.com
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Leilk Liu <leilk.liu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Sep 12, 2020 at 9:02 AM <qii.wang@mediatek.com> wrote:
>
> From: Qii Wang <qii.wang@mediatek.com>
>
> The master code needs to being sent when the speed is more than
> I2C_MAX_FAST_MODE_PLUS_FREQ instead of
> I2C_MAX_HIGH_SPEED_MODE_FREQ. Fix it.
>
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index efc1404..0cbdfbe 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -681,8 +681,8 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
>         unsigned int cnt_mul;
>         int ret = -EINVAL;
>
> -       if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ)
> -               target_speed = I2C_MAX_FAST_MODE_PLUS_FREQ;
> +       if (target_speed > I2C_MAX_HIGH_SPEED_MODE_FREQ)
> +               target_speed = I2C_MAX_HIGH_SPEED_MODE_FREQ;

Thanks for fixing this. Indeed, somehow I messed these up.

>
>         max_step_cnt = mtk_i2c_max_step_cnt(target_speed);
>         base_step_cnt = max_step_cnt;
> @@ -759,7 +759,7 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>         for (clk_div = 1; clk_div <= max_clk_div; clk_div++) {
>                 clk_src = parent_clk / clk_div;
>
> -               if (target_speed > I2C_MAX_FAST_MODE_FREQ) {
> +               if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ) {

But this one is not related. Original code used to have

#define MAX_FS_MODE_SPEED              400000

       if (target_speed > MAX_FS_MODE_SPEED) {

And this change doesn't fix the above mentioned problem.

So, please split into two separate changes.

>                         /* Set master code speed register */
>                         ret = mtk_i2c_calculate_speed(i2c, clk_src,
>                                                       I2C_MAX_FAST_MODE_FREQ,
> --
> 1.9.1



-- 
With Best Regards,
Andy Shevchenko
