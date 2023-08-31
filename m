Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 806CD78E6EE
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 09:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbjHaHEv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 03:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjHaHEv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 03:04:51 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B084F1A4;
        Thu, 31 Aug 2023 00:04:47 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bf1f632b8so50283366b.1;
        Thu, 31 Aug 2023 00:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693465486; x=1694070286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=chnLjaozS5BkRXrr1nwrjahyfsHhcF+8pv2DcBooXIg=;
        b=UurrKLOZkwX1m2fPOPEzzal8sUS12pMpLDwh6XKIvJxKNkIX2Cq5ntcZsuwjOHvmim
         yGnxsUH1oVC+ulyj0f7hj5KFYFSoYtumC0Oycj6OjILnJnc43jEkrMJhAX33Z+a5eWNZ
         Zl1i9of9moVMvK1Ja2VB4UGJsFyfJRrRQLOhr+icj/CQngWff3RYQkHHVqd6rakyy07O
         SiKdA1CPOZWzgU5cJXldQVauaPmc80bfFO/euGY7O6yyBhC/+lShRwTpepwoW/OD0dtJ
         5R66Elj2gABKDIohMIW60yRW2BT8LoiU2E4kW26WX4MIce3+KvkNkU1ruGSSzMxf+a7j
         Kn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693465486; x=1694070286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chnLjaozS5BkRXrr1nwrjahyfsHhcF+8pv2DcBooXIg=;
        b=H6zWPvsHJb6G+V9HSuvNBRW9UEDbW1RCB2NmOGPEPIsk04EdKw6AWlm0F2nBb9pMsH
         JOYU8Fai5svpUhhjqQTLnS484qqChuMIFfOipUelFpr0QviLu2VTIzra8pFRS752vqdJ
         26TQAK/pwN7TtlLENrwguB6siASJ+MKXvQn0Y9n6fuShWYM24tAguMKt8gN/pvj/CkXb
         t9V41suWzNat3HF+f/akwZiLyWcfj5cJE93u7pNlES04Qy3kO9U0H8APUpC+cSHqvras
         SzuwklVhTlrrzM2R78kfIULtB/um8tKgMkcc0f4uTarogglx69HJvkBq+PPOc3a9KH4e
         yMMg==
X-Gm-Message-State: AOJu0YzFRmC7svVMTDsarRgUb9THmOJL7HCNgUWnz+bSnO+mupaXFssG
        Un2JYsXv8wFFiGzwhlYOhlhMc2Kpb14Degn3TQ8=
X-Google-Smtp-Source: AGHT+IHLfUxxL2I3zNJ6fIvxFxoAHgkzrNwPgkRDdbgvEpN/3pAlSjNvVvqAP30nz9hQwMI8Y7JIfX3w7t5w9KNvH5A=
X-Received: by 2002:a17:906:3287:b0:9a1:ca55:b668 with SMTP id
 7-20020a170906328700b009a1ca55b668mr3329979ejw.59.1693465485857; Thu, 31 Aug
 2023 00:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com> <20230817094520.21286-4-Huangzheng.Lai@unisoc.com>
In-Reply-To: <20230817094520.21286-4-Huangzheng.Lai@unisoc.com>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Thu, 31 Aug 2023 15:04:08 +0800
Message-ID: <CAAfSe-uv-PrUHXFT=LGQAr1=ptBpfkcfT1LODi5ALJR8qTjH7g@mail.gmail.com>
Subject: Re: [PATCH 3/8] i2c: sprd: Use global variables to record IIC
 ack/nack status instead of local variables
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 17 Aug 2023 at 17:46, Huangzheng Lai <Huangzheng.Lai@unisoc.com> wrote:
>
> We found that when the interrupt bit of the IIC controller is cleared,
> the ack/nack bit is also cleared at the same time. After clearing the
> interrupt bit in sprd_i2c_isr(), incorrect ack/nack information will be
> obtained in sprd_i2c_isr_thread(), resulting in incorrect communication
> when nack cannot be recognized. To solve this problem, we used a global
> variable to record ack/nack information before clearing the interrupt
> bit instead of a local variable.
>
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> ---
>  drivers/i2c/busses/i2c-sprd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index 066b3a9c30c8..549b60dd3273 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -85,6 +85,7 @@ struct sprd_i2c {
>         struct clk *clk;
>         u32 src_clk;
>         u32 bus_freq;
> +       bool ack_flag;
>         struct completion complete;
>         struct reset_control *rst;
>         u8 *buf;
> @@ -384,7 +385,6 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
>  {
>         struct sprd_i2c *i2c_dev = dev_id;
>         struct i2c_msg *msg = i2c_dev->msg;
> -       bool ack = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
>         u32 i2c_tran;
>
>         if (msg->flags & I2C_M_RD)
> @@ -400,7 +400,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
>          * For reading data, ack is always true, if i2c_tran is not 0 which
>          * means we still need to contine to read data from slave.
>          */
> -       if (i2c_tran && ack) {
> +       if (i2c_tran && i2c_dev->ack_flag) {
>                 sprd_i2c_data_transfer(i2c_dev);
>                 return IRQ_HANDLED;
>         }
> @@ -411,7 +411,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
>          * If we did not get one ACK from slave when writing data, we should
>          * return -EIO to notify users.
>          */
> -       if (!ack)
> +       if (!i2c_dev->ack_flag)
>                 i2c_dev->err = -EIO;
>         else if (msg->flags & I2C_M_RD && i2c_dev->count)
>                 sprd_i2c_read_bytes(i2c_dev, i2c_dev->buf, i2c_dev->count);
> @@ -428,7 +428,6 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
>  {
>         struct sprd_i2c *i2c_dev = dev_id;
>         struct i2c_msg *msg = i2c_dev->msg;
> -       bool ack = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);
>         u32 i2c_tran;
>
>         if (msg->flags & I2C_M_RD)
> @@ -447,7 +446,8 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
>          * means we can read all data in one time, then we can finish this
>          * transmission too.
>          */
> -       if (!i2c_tran || !ack) {
> +       i2c_dev->ack_flag = !(readl(i2c_dev->base + I2C_STATUS) & I2C_RX_ACK);

Do we need clear i2c_dev->ack_flag in sprd_i2c_clear_ack()?

> +       if (!i2c_tran || !i2c_dev->ack_flag) {
>                 sprd_i2c_clear_start(i2c_dev);
>                 sprd_i2c_clear_irq(i2c_dev);
>         }
> --
> 2.17.1
>
