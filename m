Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C006B78E755
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 09:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236757AbjHaHpG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 03:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233744AbjHaHpG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 03:45:06 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A81DCE0;
        Thu, 31 Aug 2023 00:44:59 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52713d2c606so567510a12.2;
        Thu, 31 Aug 2023 00:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693467898; x=1694072698; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cVKRGRq/CkwraPzok1l2JYLAmjBhqQlubDR5w+hvVHM=;
        b=slra5N+wxQz+hAahHbIBwHPRfnsJQrWDrs7tMPJCqQTwM2g+yAno8pgve6/GHjJLFq
         whEBOAI4MhG8fo4iiwk525ioHqLK/Gpophjt1N8zY8+AeDltEzX4C+0AgOl/rtDWkwEQ
         wxSYNW6wHAGYFqOv142wDI804tpfBn3fbfD1NISZUJHU9LlwWl8aPpvUw9JTnIp3xlSw
         /7byPWXgpoxtghOGvxvnQt4QbFrLFEbPi2HrrBIGAeCuYcby5b2QXDxPO1083JwT24jn
         VlYfuQhye7RVxmnRy/KlEGb8cLVZ9lrquoluW5xSkpNlrT7cN7WMM4BhrCsIITuLHt2G
         1ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693467898; x=1694072698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVKRGRq/CkwraPzok1l2JYLAmjBhqQlubDR5w+hvVHM=;
        b=CJupJJQCHNP+aiUvh+N02XmOYTE5ItNI8787/posL3nLlOMIEgf1G0fL/uOycjNbKl
         0eMjn/ymi/knV8yHo04lPrjX1a0WkOVktXQHqYprEA0KiXG6Jh7APTn/bvkJTpsi68zU
         ef+vv4AQP/PKiYGiSTp0q3qzrIEHhwctrrPGIJLvfPi82ItkM3TLhDZ4rZmMT027EF4C
         +gjoFKCpZGk0HqGUM7SayKZ9/Kuee0sQGt+yvXnuk5b6N7Hw3mcUk0rBCq+fLiXJDxV8
         v1Gr8XyG3VBSaG73ZKTP8g1Rw5rZReAm0EhwcHaHUyvenKh4pJ9dJ2VTQYBnQBqjL2IB
         2lvA==
X-Gm-Message-State: AOJu0Yyz9LK7ffvdcqsbpMw7OnstW5wGs+AOTFhBVSTKCXmQoH0zvd0G
        YiKnIO82ZIA4ioxE+DkhZ6cOLt6E70G58jcwghQ=
X-Google-Smtp-Source: AGHT+IHK++clkmnkFhKU4FyPc7ZCh6XFoGtVe3ysfsM3rReQKYDg6T7O0WdSPtWq7W1gaV4VLEyOcRGLjms2Qq6uZVQ=
X-Received: by 2002:a17:906:3108:b0:9a1:f5b1:c867 with SMTP id
 8-20020a170906310800b009a1f5b1c867mr3214996ejx.41.1693467897484; Thu, 31 Aug
 2023 00:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com> <20230817094520.21286-5-Huangzheng.Lai@unisoc.com>
In-Reply-To: <20230817094520.21286-5-Huangzheng.Lai@unisoc.com>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Thu, 31 Aug 2023 15:44:20 +0800
Message-ID: <CAAfSe-vGXco2PaLEdb8cTAEkX4db3o6v++hz-vL3o00i=7_wgw@mail.gmail.com>
Subject: Re: [PATCH 4/8] i2c: sprd: Add IIC controller driver to support
 dynamic switching of 400K/1M/3.4M frequency
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
> When IIC-slaves supporting different frequencies use the same IIC

%s/I2C/IIC

> controller, the IIC controller usually only operates at lower frequencies.
> In order to improve the performance of IIC-slaves transmission supporting
> faster frequencies, we dynamically configure the IIC operating frequency
> based on the value of the input parameter msg ->flag.
>
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> ---
>  drivers/i2c/busses/i2c-sprd.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index 549b60dd3273..02c11a9ff2da 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -75,7 +75,14 @@
>  #define SPRD_I2C_PM_TIMEOUT    1000
>  /* timeout (ms) for transfer message */
>  #define I2C_XFER_TIMEOUT       1000
> -
> +/* dynamic modify clk_freq flag  */
> +#define        I2C_3M4_FLAG            0x0100

#define <space> I2C_3M4_FLAG <tab> 0x0100

> +#define        I2C_1M_FLAG             0x0080
> +#define        I2C_400K_FLAG           0x0040
> +
> +#define        I2C_FREQ_400K           400000
> +#define        I2C_FREQ_1M             1000000
> +#define        I2C_FREQ_3_4M           3400000

ditto

>  /* SPRD i2c data structure */
>  struct sprd_i2c {
>         struct i2c_adapter adap;
> @@ -94,6 +101,8 @@ struct sprd_i2c {
>         int err;
>  };
>
> +static void sprd_i2c_set_clk(struct sprd_i2c *i2c_dev, u32 freq);

I would suggest moving this whole function above its caller.

> +
>  static void sprd_i2c_set_count(struct sprd_i2c *i2c_dev, u32 count)
>  {
>         writel(count, i2c_dev->base + I2C_COUNT);
> @@ -269,6 +278,12 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
>                 sprd_i2c_send_stop(i2c_dev, !!is_last_msg);
>         }
>
> +       if (msg->flags & I2C_400K_FLAG)

Where does this flag set? I'm not sure we can use msg->flags like
this. I don't know i2c very well.

Thanks,
Chunyan

> +               sprd_i2c_set_clk(i2c_dev, I2C_FREQ_400K);
> +       else if (msg->flags & I2C_1M_FLAG)
> +               sprd_i2c_set_clk(i2c_dev, I2C_FREQ_1M);
> +       else if (msg->flags & I2C_3M4_FLAG)
> +               sprd_i2c_set_clk(i2c_dev, I2C_FREQ_3_4M);
>         /*
>          * We should enable rx fifo full interrupt to get data when receiving
>          * full data.
> --
> 2.17.1
>
