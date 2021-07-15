Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 520233C98C0
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jul 2021 08:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240181AbhGOGYj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jul 2021 02:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240180AbhGOGYi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jul 2021 02:24:38 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD0EC061762
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jul 2021 23:21:44 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id u13so7863137lfs.11
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jul 2021 23:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eDnZkWk4wGXBAneUQ2pO6M6fPGzr2/erew54duA0y+g=;
        b=FQeFZgGIC5DZPxcbpv+PigdW3L94WikM7o2HBJFUZLcGIvndO8tCWrqIim+CESB1uQ
         XlBda0IORHzSfIvirbM4bYZ+GL0v+pc94axE72Cq8CZgI765dpj+XaJQgCsf4riK2vmu
         9E5P+YVkM5GKGUn6nFfoojCn6v47o5K8qI9Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eDnZkWk4wGXBAneUQ2pO6M6fPGzr2/erew54duA0y+g=;
        b=T+Kd0JsadPjOx3AlMeCf7Ho7DJshkjt1CT4aPZPlw1iKdbX4zjV+1j+Lfe2rD6tGRZ
         Sk2Dd/6RJH43wQc9XgYjZCUgtiZx03Fqwvdie58LK1CzTNE+svBd895xEMUQoHT5gox0
         WsDNwfzNPcc8UAIU6sw6ueJxTPtg45tOT4KcIV/mJamRAwt1xOE8FhhZF2IvyVuZFPsE
         MpIqnYZmXgAeB8e4CMmAJW27AyyVTP2+acGx0uvDAiqmaeFSd2/SXuonYyZtnjttvJMt
         JxqHoN3BB5gTnGHF9EmJ+TOdfQbh0qumNCZUSU5JU2OBMYrCurgDslQ++M8glleh46s5
         DtPg==
X-Gm-Message-State: AOAM533iCZEQpmC3b6TiGHV11LpA5fVtEw6PfK5sbX0/3KPWKERt/Y+h
        HI7DyxK23fGNW9bFjSB4RDmDmyDDmBZElSkKjoNrxw==
X-Google-Smtp-Source: ABdhPJzgSd49Fp4x/b7JoIZ4W4zF8u2EyzMr1QKyp1dccSFuXtyCO+7c2sDP+12iNgZW1LhYzoFhxQLddT1EKSUMVrM=
X-Received: by 2002:a19:858b:: with SMTP id h133mr2083722lfd.656.1626330102820;
 Wed, 14 Jul 2021 23:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com> <1626316157-24935-3-git-send-email-kewei.xu@mediatek.com>
In-Reply-To: <1626316157-24935-3-git-send-email-kewei.xu@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 15 Jul 2021 14:21:31 +0800
Message-ID: <CAGXv+5HjVaiaC5DhETNCV880aKjgfwxuVq9Rd=VhVrRNjDPOOQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] i2c: mediatek: Dump i2c/dma register when a timeout occurs
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     wsa@the-dreams.de, Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        srv_heupstream <srv_heupstream@mediatek.com>,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        qiangming.xia@mediatek.com, ot_daolong.zhu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, Jul 15, 2021 at 10:31 AM Kewei Xu <kewei.xu@mediatek.com> wrote:
>
> When a timeout error occurs in i2c transter, it is usually related
> to the i2c/dma IP hardware configuration. Therefore, the purpose of
> this patch is to dump the key register values of i2c/dma when a
> timeout occurs in i2c for debugging.
>
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 95 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 94 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 5ddfa4e..64acd96 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -125,6 +125,7 @@ enum I2C_REGS_OFFSET {
>         OFFSET_HS,
>         OFFSET_SOFTRESET,
>         OFFSET_DCM_EN,
> +       OFFSET_MULTI_DMA,
>         OFFSET_PATH_DIR,
>         OFFSET_DEBUGSTAT,
>         OFFSET_DEBUGCTRL,
> @@ -192,6 +193,7 @@ enum I2C_REGS_OFFSET {
>         [OFFSET_TRANSFER_LEN_AUX] = 0x44,
>         [OFFSET_CLOCK_DIV] = 0x48,
>         [OFFSET_SOFTRESET] = 0x50,
> +       [OFFSET_MULTI_DMA] = 0x84,

On the datasheets I have, MULTI_DMA is 0x8c, while 0x84 is CHANNEL_SEC on
MT8192, and not defined on MT8183 nor MT8195.

>         [OFFSET_SCL_MIS_COMP_POINT] = 0x90,
>         [OFFSET_DEBUGSTAT] = 0xe0,
>         [OFFSET_DEBUGCTRL] = 0xe8,
> @@ -828,6 +830,96 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>         return 0;
>  }
>
> +static void i2c_dump_register(struct mtk_i2c *i2c)
> +{
> +       dev_err(i2c->dev, "SLAVE_ADDR[0x%x]: 0x%x, INTR_MASK[0x%x]: 0x%x\n",
> +               OFFSET_SLAVE_ADDR,
> +               (mtk_i2c_readw(i2c, OFFSET_SLAVE_ADDR)),

Drop the extra outer parentheses. Same goes for all the other invocations.

> +               OFFSET_INTR_MASK,
> +               (mtk_i2c_readw(i2c, OFFSET_INTR_MASK)));
> +       dev_err(i2c->dev, "INTR_STAT[0x%x]: 0x%x, CONTROL[0x%x]: 0x%x\n",
> +               OFFSET_INTR_STAT,
> +               (mtk_i2c_readw(i2c, OFFSET_INTR_STAT)),
> +               OFFSET_CONTROL,
> +               (mtk_i2c_readw(i2c, OFFSET_CONTROL)));
> +       dev_err(i2c->dev, "TRANSFER_LEN[0x%x]: 0x%x, TRANSAC_LEN[0x%x]: 0x%x\n",
> +               OFFSET_TRANSFER_LEN,
> +               (mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN)),
> +               OFFSET_TRANSAC_LEN,
> +               (mtk_i2c_readw(i2c, OFFSET_TRANSAC_LEN)));
> +       dev_err(i2c->dev, "DELAY_LEN[0x%x]: 0x%x, HTIMING[0x%x]: 0x%x\n",
> +               OFFSET_DELAY_LEN,
> +               (mtk_i2c_readw(i2c, OFFSET_DELAY_LEN)),
> +               OFFSET_TIMING,
> +               (mtk_i2c_readw(i2c, OFFSET_TIMING)));
> +       dev_err(i2c->dev, "OFFSET_START[0x%x]: 0x%x\n",
> +               OFFSET_START,
> +               mtk_i2c_readw(i2c, OFFSET_START));
> +       dev_err(i2c->dev, "OFFSET_EXT_CONF[0x%x]: 0x%x\n",
> +               OFFSET_EXT_CONF,
> +               mtk_i2c_readw(i2c, OFFSET_EXT_CONF));
> +       dev_err(i2c->dev, "OFFSET_HS[0x%x]: 0x%x\n",
> +               OFFSET_HS,
> +               mtk_i2c_readw(i2c, OFFSET_HS));
> +       dev_err(i2c->dev, "OFFSET_IO_CONFIG[0x%x]: 0x%x\n",
> +               OFFSET_IO_CONFIG,
> +               mtk_i2c_readw(i2c, OFFSET_IO_CONFIG));
> +       dev_err(i2c->dev, "OFFSET_FIFO_ADDR_CLR[0x%x]: 0x%x\n",
> +               OFFSET_FIFO_ADDR_CLR,
> +               mtk_i2c_readw(i2c, OFFSET_FIFO_ADDR_CLR));
> +       dev_err(i2c->dev, "TRANSFER_LEN_AUX[0x%x]: 0x%x\n",
> +               OFFSET_TRANSFER_LEN_AUX,
> +               mtk_i2c_readw(i2c, OFFSET_TRANSFER_LEN_AUX));
> +       dev_err(i2c->dev, "CLOCK_DIV[0x%x]: 0x%x\n",
> +               OFFSET_CLOCK_DIV,
> +               mtk_i2c_readw(i2c, OFFSET_CLOCK_DIV));
> +       dev_err(i2c->dev, "FIFO_STAT[0x%x]: 0x%x, FIFO_THRESH[0x%x]: 0x%x\n",
> +               OFFSET_FIFO_STAT,
> +               mtk_i2c_readw(i2c, OFFSET_FIFO_STAT),
> +               OFFSET_FIFO_THRESH,
> +               mtk_i2c_readw(i2c, OFFSET_FIFO_THRESH));
> +       dev_err(i2c->dev, "DCM_EN[0x%x] 0x%x\n",
> +               OFFSET_DCM_EN,
> +               mtk_i2c_readw(i2c, OFFSET_DCM_EN));
> +       dev_err(i2c->dev, "DEBUGSTAT[0x%x]: 0x%x, DEBUGCTRL[0x%x]: 0x%x\n",

Nit: Why do some have two registers per line, and some only have one?

ChenYu


> +               OFFSET_DEBUGSTAT,
> +               (mtk_i2c_readw(i2c, OFFSET_DEBUGSTAT)),
> +               OFFSET_DEBUGCTRL,
> +               (mtk_i2c_readw(i2c, OFFSET_DEBUGCTRL)));
> +
> +       if (i2c->dev_comp->regs == mt_i2c_regs_v2) {
> +               dev_err(i2c->dev, "OFFSET_LTIMING[0x%x]: 0x%x\n",
> +                       OFFSET_LTIMING,
> +                       mtk_i2c_readw(i2c, OFFSET_LTIMING));
> +               dev_err(i2c->dev, "MULTI_DMA[0x%x]: 0x%x\n",
> +                       OFFSET_MULTI_DMA,
> +                       (mtk_i2c_readw(i2c, OFFSET_MULTI_DMA)));
> +       }
> +
> +       dev_err(i2c->dev, "OFFSET_INT_FLAG = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_INT_FLAG));
> +       dev_err(i2c->dev, "OFFSET_INT_EN = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_INT_EN));
> +       dev_err(i2c->dev, "OFFSET_EN = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_EN));
> +       dev_err(i2c->dev, "OFFSET_RST = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_RST));
> +       dev_err(i2c->dev, "OFFSET_CON = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_CON));
> +       dev_err(i2c->dev, "OFFSET_TX_MEM_ADDR = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_TX_MEM_ADDR));
> +       dev_err(i2c->dev, "OFFSET_RX_MEM_ADDR = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_RX_MEM_ADDR));
> +       dev_err(i2c->dev, "OFFSET_TX_LEN = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_TX_LEN));
> +       dev_err(i2c->dev, "OFFSET_RX_LEN = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_RX_LEN));
> +       dev_err(i2c->dev, "OFFSET_TX_4G_MODE = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_TX_4G_MODE));
> +       dev_err(i2c->dev, "OFFSET_RX_4G_MODE = 0x%x\n",
> +               readl(i2c->pdmabase + OFFSET_RX_4G_MODE));
> +}
> +
>  static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>                                int num, int left_num)
>  {
> @@ -1034,7 +1126,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>         }
>
>         if (ret == 0) {
> -               dev_dbg(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
> +               dev_err(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
> +               i2c_dump_register(i2c);
>                 mtk_i2c_init_hw(i2c);
>                 return -ETIMEDOUT;
>         }
> --
> 1.9.1
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
