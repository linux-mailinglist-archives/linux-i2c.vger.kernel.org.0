Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4149178E795
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 10:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233290AbjHaIJu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 04:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbjHaIJu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 04:09:50 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A46019A;
        Thu, 31 Aug 2023 01:09:47 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-991c786369cso56575866b.1;
        Thu, 31 Aug 2023 01:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693469385; x=1694074185; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KbmWQjVJqGVUHlXR4ETyAyo/GfEWEt3eMchYixv69zI=;
        b=qw2QHjKUm1FPN9CasRjDY7xRYYsDksFeQACvi6BGRFbyr0NCS8jOHwZLHn52CAJrZf
         1444yhU1x1Ra1NwCfzhbvOLb8x3LceolSWoojqbGQNasdT3dam9VYL3kUAu//befGZxB
         v5VluuZg35A96vjRokvYq0oqEFfg+wJq4ZA1wmUyge0bKqZ9umqmrf3uaCnt/MVuCfwr
         1cgY8svDye4o4pT+lwrQU7yuaIw4mpLQYY4cioHnv5ZoCY/0VvGA5e8gYIoRHN/RUoOe
         OeLgDJV8ITMiELSQWc4On2P8USWkna6a8pd+9yH5Hg9tBKIHE7/72pm4PoEf36Rv1LFe
         dDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693469385; x=1694074185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbmWQjVJqGVUHlXR4ETyAyo/GfEWEt3eMchYixv69zI=;
        b=PBwRJuir79sokDyJLOxmev24/C/qpDs/7Gsw/n18Xql9m6ED4lm0J9+tU5ASDK+nIP
         SwUTHuH2yo+nwg/744h2qH1UFYlqjIpmaFgjGfikwECNDozaSENQMObVTSLNEz2hTt9l
         c9O2YOFyjxU551wFLWJmNLGRqbaKdUBiiEEWfnVSPf9FoS5c8oHa+DfQjQn4KuMqt95f
         A0WO/4B4SVpVxc+OBVl/qBZns8guUkGNbDdwuRieB0NddeIUvyxXj90xQLPE1usvIzb9
         8htjTrrRp9nHuT82kAc4I43eo2CB2cHaK86MJEEBkXETIQcyTl2YbFX5d+p71E5l3e7j
         o2Nw==
X-Gm-Message-State: AOJu0Yxy/tQHBrsqYe0FIQ/2IyOGBs1NzxKkvI/AWXM6YcM7koulpuN0
        P37Y1lYPRMKOHPfP1r8/6XqTSUEOx1lP+CdU7WHBddPZ5Ko=
X-Google-Smtp-Source: AGHT+IFqfbYd7DvF1aIh36j2gvq1jNDBckUESVKnzrTl4Djq1hhwXDSwz29iOgefoFsbnY3+1RVKihn5Hkm7PZh2cp4=
X-Received: by 2002:a17:906:29a:b0:9a1:cb2c:b55c with SMTP id
 26-20020a170906029a00b009a1cb2cb55cmr2953755ejf.35.1693469385435; Thu, 31 Aug
 2023 01:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com> <20230817094520.21286-6-Huangzheng.Lai@unisoc.com>
In-Reply-To: <20230817094520.21286-6-Huangzheng.Lai@unisoc.com>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Thu, 31 Aug 2023 16:09:08 +0800
Message-ID: <CAAfSe-thECfJrPh9-xDXbFHr0XHNCNSdbbXviEizUkEbohRWPA@mail.gmail.com>
Subject: Re: [PATCH 5/8] i2c: sprd: Configure the enable bit of the IIC
 controller before each transmission initiation
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
> When a timeout exception occurs in the IIC driver, the IIC controller
> will be reset, and after resetting, control bits such as I2C_EN and
> I2C_INT_EN will be reset to 0, and the IIC master cannot initiate
> Transmission unless sprd_i2c_enable() is executed. To address this issue,
> this patch places sprd_i2c_enable() before each transmission initiation
> to ensure that the necessary control bits of the IIC controller are
> configured.
>
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> ---
>  drivers/i2c/busses/i2c-sprd.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index 02c11a9ff2da..7314c897525d 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -310,6 +310,8 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
>         return i2c_dev->err;
>  }
>
> +static void sprd_i2c_enable(struct sprd_i2c *i2c_dev);

Can we move this whole function above its caller?

> +
>  static int sprd_i2c_master_xfer(struct i2c_adapter *i2c_adap,
>                                 struct i2c_msg *msgs, int num)
>  {
> @@ -320,6 +322,8 @@ static int sprd_i2c_master_xfer(struct i2c_adapter *i2c_adap,
>         if (ret < 0)
>                 return ret;
>
> +       sprd_i2c_enable(i2c_dev);
> +
>         for (im = 0; im < num - 1; im++) {
>                 ret = sprd_i2c_handle_msg(i2c_adap, &msgs[im], 0);
>                 if (ret)
> @@ -661,8 +665,6 @@ static int __maybe_unused sprd_i2c_runtime_resume(struct device *dev)
>         if (ret)
>                 return ret;
>
> -       sprd_i2c_enable(i2c_dev);
> -
>         return 0;
>  }
>
> --
> 2.17.1
>
