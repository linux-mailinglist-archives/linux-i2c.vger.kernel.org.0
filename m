Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A42778E762
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 09:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjHaHv3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 03:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240146AbjHaHv2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 03:51:28 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A24CE4;
        Thu, 31 Aug 2023 00:51:26 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99c1c66876aso53809566b.2;
        Thu, 31 Aug 2023 00:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693468284; x=1694073084; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mMGRW4TnjsLd1paw/M4vyUAnlbsIdeR/WZG3DcXxCuo=;
        b=h+gMvSAlkaWoPCdad/CStQFE7dBRRQNi6KLgjqBD0gQuAA+U36Fw4L6zZzmSVkVG6i
         spVyeoloZf3rFuaYNS9eLM/cjCaziwF/mNxHM9Q4AVp7D+FQytOK6ZVRjHx3re8HXUhr
         Gk5ljGTkHs4Di1eh1TiKl9h4PaG0JOnC9IlGL1WNwB24hX3dMwlGEobxRUYjtyLCxfOa
         tum38x9XqB4eloQjNXmBx4Lw0dKgUVXXhp3SB+BY0P4j4S0sswqZ/9yeKVaaxKqIktXN
         S56984IjsPoEWKsR/wM/OmjBh7MtGSqFXsTyZvFJ3l2AA3NNpBCWGMpE9OeFOjw8YPcO
         ELrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693468284; x=1694073084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMGRW4TnjsLd1paw/M4vyUAnlbsIdeR/WZG3DcXxCuo=;
        b=dPj2rhExblgrYk8llkfWiN5qQoPYzLO6OGPiZVl+tZOHFf+0f0sxkzdHGjOYn8gh8/
         Q9hzIfcfFZyLnfr9QylA+2teBemLb/f0HIilqtWiLkCdwsUVhQq6UO8+KptQeaqPlCkb
         BW+bDUyngq9VbjJ+9vNuB2ECYurtJP7Vkif7xf8JETTKrWdHt9Z7gDl+q7p1/by+5/vI
         oWR6mAdVS9OBhDNOY/04ycBZfPLOE357fD+JtMUzaVUCan4qPQkCyRVxk/bN/UA14LNN
         gjwOfP4Ip83+pqnEMohxxiYFHe5W4akUVm3WrKc+h7Eun5WN8+PtyhZJdVtVYb6ibIVp
         0yew==
X-Gm-Message-State: AOJu0Yxm7iiH5u0ii/esDQfJ8hbn0EAFBTNXPX+Dc0eYtPnCdGwQp3KD
        ibrCwvnkejQ2K98nUHS+o8edgXsTDeV5PCrIIC4=
X-Google-Smtp-Source: AGHT+IGLPUUOXxbt731wkXwhPOfypTning4x73PZ286jMjJw8O74sCN1gTe8Kr2lK5AT7vIM+Szd/3mM3Dma/DPugnM=
X-Received: by 2002:a17:906:cc0b:b0:9a1:d915:6378 with SMTP id
 ml11-20020a170906cc0b00b009a1d9156378mr3436823ejb.63.1693468284387; Thu, 31
 Aug 2023 00:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com> <20230817094520.21286-7-Huangzheng.Lai@unisoc.com>
In-Reply-To: <20230817094520.21286-7-Huangzheng.Lai@unisoc.com>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Thu, 31 Aug 2023 15:50:47 +0800
Message-ID: <CAAfSe-sHm6DWsxK4W9QngLsDVrb7qK+wa+E7m5BSVALSFkfJ3Q@mail.gmail.com>
Subject: Re: [PATCH 6/8] i2c: sprd: Add additional IIC control bit
 configuration to adapt to the new IP version of the UNISOC platform
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
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 17 Aug 2023 at 17:46, Huangzheng Lai <Huangzheng.Lai@unisoc.com> wrote:
>
> The new IIC IP version on the UNISOC platform has added I2C_NACK_EN and
> I2C_TRANS_EN control bits. To ensure that the IIC controller can initiate
> transmission smoothly, these two bits need to be configured.
>
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>

I would suggest changing the subject to "i2c: sprd: Add I2C_NACK_EN
and I2C_TRANS_EN control bits".
> ---
>  drivers/i2c/busses/i2c-sprd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index 7314c897525d..d867389c7f17 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -33,6 +33,8 @@
>  #define ADDR_RST               0x2c
>
>  /* I2C_CTL */
> +#define I2C_NACK_EN            BIT(22)
> +#define I2C_TRANS_EN           BIT(21)
>  #define STP_EN                 BIT(20)
>  #define FIFO_AF_LVL_MASK       GENMASK(19, 16)
>  #define FIFO_AF_LVL            16
> @@ -397,7 +399,7 @@ static void sprd_i2c_enable(struct sprd_i2c *i2c_dev)
>         sprd_i2c_clear_irq(i2c_dev);
>
>         tmp = readl(i2c_dev->base + I2C_CTL);
> -       writel(tmp | I2C_EN | I2C_INT_EN, i2c_dev->base + I2C_CTL);
> +       writel(tmp | I2C_EN | I2C_INT_EN | I2C_NACK_EN | I2C_TRANS_EN, i2c_dev->base + I2C_CTL);
>  }
>
>  static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
> --
> 2.17.1
>
