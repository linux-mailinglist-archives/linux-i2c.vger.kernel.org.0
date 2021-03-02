Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA1432B28F
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242174AbhCCBPb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 20:15:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347528AbhCBLbg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Mar 2021 06:31:36 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBC5C061793
        for <linux-i2c@vger.kernel.org>; Tue,  2 Mar 2021 03:30:32 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id g4so13663681pgj.0
        for <linux-i2c@vger.kernel.org>; Tue, 02 Mar 2021 03:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TKcFkhM8Mf5DiRPH37Ng7ifpctLWMXPxIAc63q2YCdc=;
        b=STh1OiHiN3RIX3HBgcV9cNh+gyrXDrSjs+yTS/x+kts2F/gPdGop3OxANQsWwz1PTv
         JTnRE9eMpVVbVq9og+Q5gdkjwX+2PuRATcx+sYWgU5KIYCnXmtL52ehxz79ifFORxLgs
         eYUjOtMlD8m+37T0fPp+NqB1Qcq07p8BTq5gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TKcFkhM8Mf5DiRPH37Ng7ifpctLWMXPxIAc63q2YCdc=;
        b=jJ9KnNGy0890p2bt3CJaac0oNkF5ZeO/qVkqQ863oh4bmVinWyHJEvCIvduW72u+3b
         R/jPy4v7Ac3K+yObaq+/zw/FemxI+Le6qc3wfXd6Y75sCVOtl4NXhQk3Xs0u2wAvpV4W
         MOd89PNG/NKs771fHGsFllRkLv20zN9xo9TriVg1FRCxb0EC1RhFPzmOD+cbamWUsYR0
         8hilcjyXuMvqGrFf+Qcdf03VcRVYch9J9IsZ9Nrp2//ISIlzbuQxZ9j6IKJTRCG33rWk
         UePXSH8fQL3sFyf/ZHmCjbZ03ypc6SxdYLyVKZ1HABZQ5opZkXJ+pn0zFgdcFChW3JlK
         LiuQ==
X-Gm-Message-State: AOAM533D4OHr1zoFlzDkyEf4Unj82afN0Guob1FCxTEAtc0gbiNUz9pG
        7TGzXLhlYSQdeFK7WaR3h6vrIasuGQj6+MvLcDaJ7w==
X-Google-Smtp-Source: ABdhPJwBgRaP7xzFKc8KjHOOHQlUJLofabevE4D9pSBMT3XRudmsTh+IeR6puUqZDyGDZajOd3aOQ/x6HgQHHW5CLqc=
X-Received: by 2002:a63:515a:: with SMTP id r26mr17916655pgl.257.1614684632012;
 Tue, 02 Mar 2021 03:30:32 -0800 (PST)
MIME-Version: 1.0
References: <1612348525-13364-1-git-send-email-qii.wang@mediatek.com>
In-Reply-To: <1612348525-13364-1-git-send-email-qii.wang@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 2 Mar 2021 19:30:21 +0800
Message-ID: <CAATdQgCoLB-iOcxN2ptDmqD69FnyUen5XeRTq=LCCfXmWkBeWw@mail.gmail.com>
Subject: Re: [PATCH] i2c: mediatek: Get device clock-stretch time via dts
To:     qii.wang@mediatek.com
Cc:     wsa@the-dreams.de, srv_heupstream <srv_heupstream@mediatek.com>,
        leilk.liu@mediatek.com, open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-i2c@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Qii,

On Wed, Feb 3, 2021 at 6:43 PM <qii.wang@mediatek.com> wrote:
>
> From: Qii Wang <qii.wang@mediatek.com>
>
> tSU,STA/tHD,STA/tSU,STOP maybe out of spec due to device
> clock-stretching or circuit loss, we could get device
> clock-stretch time from dts to adjust these parameters
> to meet the spec via EXT_CONF register.
>
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 2ffd2f3..47c7255 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -245,6 +245,7 @@ struct mtk_i2c {
>         u16 irq_stat;                   /* interrupt status */
>         unsigned int clk_src_div;
>         unsigned int speed_hz;          /* The speed in transfer */
> +       unsigned int clock_stretch_ns;
>         enum mtk_trans_op op;
>         u16 timing_reg;
>         u16 high_speed_reg;
> @@ -607,7 +608,8 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
>         else
>                 clk_ns = sample_ns / 2;
>
> -       su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns, clk_ns);
> +       su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns + i2c->clock_stretch_ns,
> +                                 clk_ns);
>         if (su_sta_cnt > max_sta_cnt)
>                 return -1;
>
> @@ -1171,6 +1173,8 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
>         if (i2c->clk_src_div == 0)
>                 return -EINVAL;
>
> +       of_property_read_u32(np, "clock-stretch-ns", &i2c->clock_stretch_ns);
> +

I think this new property "clock-stretch-ns" is for the same purpose of
"i2c-scl-falling-time-ns" + "i2c-scl-rising-time-ns" defined in
Documentation/devicetree/bindings/i2c/i2c.txt?

>         i2c->have_pmic = of_property_read_bool(np, "mediatek,have-pmic");
>         i2c->use_push_pull =
>                 of_property_read_bool(np, "mediatek,use-push-pull");
> --
> 1.9.1
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
