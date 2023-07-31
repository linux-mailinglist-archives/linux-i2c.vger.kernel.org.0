Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA1AD768AC2
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jul 2023 06:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjGaEVf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jul 2023 00:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjGaEVd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jul 2023 00:21:33 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D167510D;
        Sun, 30 Jul 2023 21:21:30 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bdf08860dso731252166b.0;
        Sun, 30 Jul 2023 21:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1690777289; x=1691382089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZitA7g4lEq5HSSYsaRmgk4c652yJOHd1UWJHaP9uzJ0=;
        b=kBU1Q1S3kp6WRiIFnBiqesOP3oNfzY4PjpVactBA8fweY9YQU9rWYcW+Z0fdUsCfWP
         vDdE6k+zrNA1y/f+A2Xf6XFtLNB9g1Qw5cKfWPuKta+ngFqZJYFyH8NT896Dv9xKD9fd
         jXhw5Hv4ZyCoyYuLYKA65QT/FyEJ7WPFWoIm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690777289; x=1691382089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZitA7g4lEq5HSSYsaRmgk4c652yJOHd1UWJHaP9uzJ0=;
        b=gfD1DRIGCJx9GvqgYMDt0AcPm5bso3/mgiZrENkZ8o/ryv4XFtSK2blahWbMvXcTag
         OFRFtmFg7of6wJdtcupJWWb9PUv3WBKJhDetD/QV8qwt4XFo7D6JvkkSHHK7Zd8W3XYi
         TDpZxSsStRLvw5z3mzbYGeHA0P3A8v9cl/vBqY/iebqOCXjyUV2Nay70HqcMS+ywpBJ0
         IzbvxMi0WLuAXKydocheTOYvcWyGdNo8yp74aoknQZreZlrZpi4ZX84SXQIRTK1uJ2/J
         U7fF/qAApf47QrarKDswX8wd6VbyNI9j1XX55XcOSTsD0S3i9BdhNj6A94yu0zh4KGN9
         ahVQ==
X-Gm-Message-State: ABy/qLZtGeXM50Gy22PtQaz+PMArLmft68xviiULyAOeP/ZAKLM/qiZ6
        Ptn87Ho8WX7t83M71iWyviaQl/Pviq+lF4sA3lM=
X-Google-Smtp-Source: APBJJlFDgZxAn8Q4AK+y0YmkDiz7Rn+hJjCg5hDfnEtGL7P5vUgksBmup3Ptzk+0W/Ntq2y52aZUAHLFf/CgJEV8f+E=
X-Received: by 2002:a17:907:728d:b0:99b:dd23:4f01 with SMTP id
 dt13-20020a170907728d00b0099bdd234f01mr6491075ejc.33.1690777289031; Sun, 30
 Jul 2023 21:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230728122416.17782-1-lianglixuehao@126.com>
In-Reply-To: <20230728122416.17782-1-lianglixuehao@126.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 31 Jul 2023 04:21:18 +0000
Message-ID: <CACPK8Xf6YssamEmHB5XDf8JYk+_=hnG8Yzqn4kCikseqg6rqOA@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Avoid accessing freed buffers during i2c transfers.
To:     Lixue Liang <lianglixuehao@126.com>,
        Eddie James <eajames@linux.ibm.com>
Cc:     brendan.higgins@linux.dev, benh@kernel.crashing.org,
        p.zabel@pengutronix.de, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Lixue Liang <lianglixue@greatwall.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 28 Jul 2023 at 12:40, Lixue Liang <lianglixuehao@126.com> wrote:
>
> From: Lixue Liang <lianglixue@greatwall.com.cn>
>
> After waiting for the transmission timeout, the I2C controller will
> continue to transmit data when the bus is idle. Clearing bus->msg will
> avoid kernel panic when accessing the freed msg->buf in
> aspeed_i2c_master_irq.
>
> Signed-off-by: Lixue Liang <lianglixue@greatwall.com.cn>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 2e5acfeb76c8..c83057497e26 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -713,6 +713,8 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>                 spin_lock_irqsave(&bus->lock, flags);
>                 if (bus->master_state == ASPEED_I2C_MASTER_PENDING)
>                         bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
> +
> +               bus->msgs = NULL;

Eddie, is this the same issue you were debugging?

>                 spin_unlock_irqrestore(&bus->lock, flags);
>
>                 return -ETIMEDOUT;
> --
> 2.27.0
>
