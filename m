Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA83D7B779C
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Oct 2023 08:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbjJDGIy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Oct 2023 02:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbjJDGIx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Oct 2023 02:08:53 -0400
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E423A7;
        Tue,  3 Oct 2023 23:08:49 -0700 (PDT)
Received: from [192.168.68.112] (ppp118-210-190-253.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.253])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 90DDF20059;
        Wed,  4 Oct 2023 14:08:41 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1696399727;
        bh=U9qVTqbFIewKoAsLnFsdhiJGF9HS2KYiKRlGJluJu0Y=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=UiS+P6bky+a6ZVu7C+L1ig8dFGepNsZX+B9a26raR5D4qi7PJvyPkhdRYew2EDLy0
         sDd8p5jF5W4xtogGyCKDzdfUOz/KYLI3IpAxDj6J4uVJPes1x3SL/9rpED2hVTlb0A
         QaCPU36IOoMhtVPm9N8+W5cnJeXjBAM6K2K+h71mmmZxGp1z2SUbyO7vXTWbKh7uoK
         rC1qIm+XvfuBpB1RS2nN9izTm9IHqxUU0Y/VL9UmBNnBqJcHSi/eeMNPSgNNAXtYY7
         1pTBnTdljnRBfxWALVJVnR3qz/1NXYmHXW96Th3FsZ8kn3gSJ2OF+I8ijkO58cssim
         zpSKJblfsZCaA==
Message-ID: <975c69de32eefb124fe668e921e8dbda86962deb.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
From:   Andrew Jeffery <andrew@codeconstruct.com.au>
To:     Wolfram Sang <wsa@kernel.org>,
        Jian Zhang <zhangjian.3032@bytedance.com>
Cc:     brendan.higgins@linux.dev, benh@kernel.crashing.org,
        joel@jms.id.au, andrew@aj.id.au, zhangjian3032@gmail.com,
        yulei.sh@bytedance.com, xiexinnan@bytedance.com,
        Andi Shyti <andi.shyti@kernel.org>,
        Tommy Huang <tommy_huang@aspeedtech.com>,
        "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Wed, 04 Oct 2023 16:38:38 +1030
In-Reply-To: <ZRZ/ObZmntMLw2r+@ninjato>
References: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
         <ZRZ/ObZmntMLw2r+@ninjato>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 2023-09-29 at 09:39 +0200, Wolfram Sang wrote:
> On Wed, Sep 27, 2023 at 11:42:43PM +0800, Jian Zhang wrote:
> > When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
> > as a slave, a situation arises where the master sends a START signal
> > without the accompanying STOP signal. This action results in a
> > persistent I2C bus timeout. The core issue stems from the fact that
> > the i2c controller remains in a slave read state without a timeout
> > mechanism. As a consequence, the bus perpetually experiences timeouts.
> >=20
> > In this case, the i2c bus will be reset, but the slave_state reset is
> > missing.
> >=20
> > Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeou=
t occurs")
> > Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
>=20
> Somebody wants to add tags here? I think it should go to my pull request
> this week.
>=20

I've tested this patch applied on top of fee465150b45 on an AST2600 and
the the system behaviour doesn't seem worse. However, I can still lock=20
the bus up and trigger a hung task panic by surprise-unplugging things.
I'll poke around to see if I can get to the bottom of that.

Resetting the slave state makes sense, so with the above observation=20
aside:

Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

That said I do wonder whether we should update the slave state in the=20
same place we're updating the hardware state. It would cover off the=20
gap identified by Jian if it were to ever occur anywhere else.
Something like:

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-
aspeed.c
index 5a416b39b818..28e2a5fc4528 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -749,6 +749,8 @@ static void __aspeed_i2c_reg_slave(struct
aspeed_i2c_bus *bus, u16 slave_addr)
        func_ctrl_reg_val =3D readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
        func_ctrl_reg_val |=3D ASPEED_I2CD_SLAVE_EN;
        writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
+
+       bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;
 }
=20
 static int aspeed_i2c_reg_slave(struct i2c_client *client)
@@ -765,7 +767,6 @@ static int aspeed_i2c_reg_slave(struct i2c_client
*client)
        __aspeed_i2c_reg_slave(bus, client->addr);
=20
        bus->slave =3D client;
-       bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;
        spin_unlock_irqrestore(&bus->lock, flags);
=20
        return 0;


