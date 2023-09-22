Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65507AA946
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 08:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjIVGsE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 02:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjIVGsD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 02:48:03 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10FB4CE;
        Thu, 21 Sep 2023 23:47:57 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso216136166b.1;
        Thu, 21 Sep 2023 23:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1695365275; x=1695970075; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4+CrpOA3BbVW7YcDdIAr2SSQwmfCSbThy/86zuEQlAE=;
        b=cOPh1qAz7ooo2dQZbRpT7Dt4YUmCOmQdVAciUYbLrTKuE8beRijSV9WIRm4CoZwXxD
         qWhRiletBkjXTDR1y8a7ryQZsJtjr+4PBb85MRqkX/u+J70nocT/BRb11NrKbguJ1F7R
         9cDTumDzxpWwdYB9zkPvVLiYLz97/GybvajBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695365275; x=1695970075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+CrpOA3BbVW7YcDdIAr2SSQwmfCSbThy/86zuEQlAE=;
        b=WrfBCjgTyY+6/x6UqMPeFcKVzMvC5eS16vce81xNTGSU9oN6inJDXEFDZRKlzuEbHb
         d5VMDudbjs/fKWfnweOKRUjSBjDarm6Q8QwIAmgWuOY7KO3ELa7FQiztZE5VKvxVPTYc
         8oBxsF69eP0aJWIo3/HTPTWd1ivi34tasqvv/+ruQ8jygbCh+w78FanyJjmqNx+LbvZb
         Z0AzcUfw6WldxpsnhU2vI/h19LnBe7z/K9Gkn6f8B5lifSoNx4RYlp885+9DqjEdUdo4
         fadt1JJz4azmYm5mjiX95yo2N3gQgcOeJLQ7563D8H0yJ5mnSflV62FhhDjB2ANwcqu7
         hOzQ==
X-Gm-Message-State: AOJu0Yzc7cEfIBNUG0iKQRy4Ot5/6MbuzFwGmcgidAdET/6TX/Cxb34p
        3lrKLZspKEoSNdIaydXNQIOeScwMdoPKANRbVkAeSoVBJYM=
X-Google-Smtp-Source: AGHT+IFPI2FY8X4q00f7f4Mb2FQ7AJt0Qto84RYqQGnxZEpGoEFadMazeAbjtK9yxAqqptZrOQefbddxMjsmJTR6WV8=
X-Received: by 2002:a17:907:75fc:b0:9ae:50e3:7e40 with SMTP id
 jz28-20020a17090775fc00b009ae50e37e40mr5278297ejc.52.1695365275252; Thu, 21
 Sep 2023 23:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230810072155.3726352-1-zhangjian.3032@bytedance.com>
In-Reply-To: <20230810072155.3726352-1-zhangjian.3032@bytedance.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 22 Sep 2023 06:47:43 +0000
Message-ID: <CACPK8XfWKLS_4nBC+NCSw=21iQeaHzBXOROmz9T+S0qZHCBKeg@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Fix i2c bus hang in slave read
To:     Jian Zhang <zhangjian.3032@bytedance.com>,
        Tommy Huang <tommy_huang@aspeedtech.com>
Cc:     brendan.higgins@linux.dev, benh@kernel.crashing.org,
        andrew@aj.id.au, zhangjian3032@gmail.com, yulei.sh@bytedance.com,
        xiexinnan@bytedance.com,
        "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED,URIBL_CSS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 10 Aug 2023 at 07:22, Jian Zhang <zhangjian.3032@bytedance.com> wrote:
>
> When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
> as a slave, a situation arises where the master sends a START signal
> without the accompanying STOP signal. This action results in a
> persistent I2C bus timeout. The core issue stems from the fact that
> the i2c controller remains in a slave read state without a timeout
> mechanism. As a consequence, the bus perpetually experiences timeouts.
>
> This proposed patch addresses this problem by introducing a status
> check during i2c transmit timeouts. In the event that the controller
> is in a slave read state, the i2c controller will be reset to restore
> proper functionality and allow the I2C bus to resume normal operation.
>
> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>

Tommy has submitted a similar fix:

 https://lore.kernel.org/linux-i2c/20230906004910.4157305-1-tommy_huang@aspeedtech.com/

His change is very heavy handed; it reinitialises the bus including
re-parsing the device tree (!).

Should we have merged this fix instead? If not, are you able to
confirm that his change fixes your issue?

Cheers,

Joel

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index e76befe3f60f..1a95205fc946 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -113,6 +113,7 @@
>                  ASPEED_I2CD_M_RX_CMD |                                        \
>                  ASPEED_I2CD_M_TX_CMD |                                        \
>                  ASPEED_I2CD_M_START_CMD)
> +#define ASPEED_I2CD_SLAVE_CMDS_MASK                    GENMASK(31, 29)
>
>  /* 0x18 : I2CD Slave Device Address Register   */
>  #define ASPEED_I2CD_DEV_ADDR_MASK                      GENMASK(6, 0)
> @@ -706,6 +707,22 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>                      ASPEED_I2CD_BUS_BUSY_STS))
>                         aspeed_i2c_recover_bus(bus);
>
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +               /*
> +                * If master timed out and bus is in slave mode.
> +                * reset the slave mode.
> +                */
> +               if (readl(bus->base + ASPEED_I2C_CMD_REG) & ASPEED_I2CD_SLAVE_CMDS_MASK) {
> +                       spin_lock_irqsave(&bus->lock, flags);
> +                       u32 func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +
> +                       writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +                       writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +                       bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
> +                       spin_unlock_irqrestore(&bus->lock, flags);
> +               }
> +#endif
> +
>                 /*
>                  * If timed out and the state is still pending, drop the pending
>                  * master command.
> --
> 2.30.2
>
