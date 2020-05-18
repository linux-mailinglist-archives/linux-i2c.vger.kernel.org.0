Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64BEB1D7D27
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 17:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgERPoa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 11:44:30 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39513 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgERPoa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 May 2020 11:44:30 -0400
Received: by mail-oi1-f196.google.com with SMTP id s198so9367495oie.6;
        Mon, 18 May 2020 08:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zmc+aX1vQ2DoVqQHld2NGpTEXaFRkMWY7XPbs/Yym5g=;
        b=k8JHEjCN926wYbYmGJBOnt5MIDc9azyFNX3iZN0+VVx0DxTBEEtX5rBD/4V7UQ52aU
         IHqWIaFymlQbMlZ4/ZykBXhmOuLG4RWIj3m21QJUP2bj5j1+hP3cnFaUsdtaCpGnAD3E
         LMftWZlsZ5arNewlWiRY79qgiH0lo+5yLaaC935pCbXHQMSd942TEmRpL6sJSyLSwukZ
         AULAOQZkga15xxK3pVTgvRsz42q3S01kVCw4+VDj/esHCjc1PEbk6REK7jRmFPbPQV0E
         5ubFc1J+k7yXp6hJL7yJ7+gd4lvsXDyT9hiVKZpT55TabE166OWrQcZUs9/3EIThvH42
         +j+g==
X-Gm-Message-State: AOAM530FAu3ViYn2P9zII8NKWxKG0hXefNlpSl4/V7fL/JsFepsPbDge
        XjxNSrumqRekuR1nSh8LGnWsrGoNGvrE8+bMw0GdR4ho
X-Google-Smtp-Source: ABdhPJy2nzNFTl+3u/yZOZKPJD6snXgr3/xAOGW+7fC9tpBtXaFCbD/tlFqxKMUwcf8LG/1SZLomAT8oopgBVFdHLgs=
X-Received: by 2002:aca:895:: with SMTP id 143mr10832413oii.153.1589816669165;
 Mon, 18 May 2020 08:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com> <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
In-Reply-To: <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 May 2020 17:44:17 +0200
Message-ID: <CAMuHMdXjLakWDDEy=02prC7XjAs_xBnt2mArPFNwyHgUoWw6-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: mediatek: Add i2c ac-timing adjust support
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 14, 2020 at 3:13 PM Qii Wang <qii.wang@mediatek.com> wrote:
> This patch adds a algorithm to calculate some ac-timing parameters
> which can fully meet I2C Spec.
>
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 328 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 277 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 0ca6c38a..7020618 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c

> +/*
> + * Check and Calculate i2c ac-timing
> + *
> + * Hardware design:
> + * sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src
> + * xxx_cnt_div =  spec->min_xxx_ns / sample_ns
> + *
> + * Sample_ns is rounded down for xxx_cnt_div would be greater
> + * than the smallest spec.
> + * The sda_timing is chosen as the middle value between
> + * the largest and smallest.
> + */
> +static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
> +                                  unsigned int clk_src,
> +                                  unsigned int check_speed,
> +                                  unsigned int step_cnt,
> +                                  unsigned int sample_cnt)
> +{
> +       const struct i2c_spec_values *spec;
> +       unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
> +       unsigned int sda_max, sda_min, clk_ns, max_sta_cnt = 0x3f;
> +       long long sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src;

So sample_ns is a 64-bit value. Is that really needed?

> +       if (!i2c->dev_comp->timing_adjust)
> +               return 0;
> +
> +       if (i2c->dev_comp->ltiming_adjust)
> +               max_sta_cnt = 0x100;
> +
> +       spec = mtk_i2c_get_spec(check_speed);
> +
> +       if (i2c->dev_comp->ltiming_adjust)
> +               clk_ns = 1000000000 / clk_src;
> +       else
> +               clk_ns = sample_ns / 2;
> +
> +       su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns, clk_ns);
> +       if (su_sta_cnt > max_sta_cnt)
> +               return -1;
> +
> +       low_cnt = DIV_ROUND_UP(spec->min_low_ns, sample_ns);

So this is a 32-bit by 64-bit division (indeed, not 64-by-32!)

noreply@ellerman.id.au reports:

    ERROR: modpost: "__udivdi3" [drivers/i2c/busses/i2c-mt65xx.ko] undefined!
    ERROR: modpost: "__divdi3" [drivers/i2c/busses/i2c-mt65xx.ko] undefined!

for 32-bit builds.

> +       max_step_cnt = mtk_i2c_max_step_cnt(check_speed);
> +       if ((2 * step_cnt) > low_cnt && low_cnt < max_step_cnt) {
> +               if (low_cnt > step_cnt) {
> +                       high_cnt = 2 * step_cnt - low_cnt;
> +               } else {
> +                       high_cnt = step_cnt;
> +                       low_cnt = step_cnt;
> +               }
> +       } else {
> +               return -2;
> +       }
> +
> +       sda_max = spec->max_hd_dat_ns / sample_ns;
> +       if (sda_max > low_cnt)
> +               sda_max = 0;
> +
> +       sda_min = DIV_ROUND_UP(spec->min_su_dat_ns, sample_ns);

One more.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
