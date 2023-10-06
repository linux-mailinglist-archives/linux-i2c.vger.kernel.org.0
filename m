Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8955A7BAF88
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 02:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjJFAUJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Oct 2023 20:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjJFAUI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Oct 2023 20:20:08 -0400
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FDCD8;
        Thu,  5 Oct 2023 17:20:04 -0700 (PDT)
Received: from [192.168.68.112] (ppp118-210-84-62.adl-adc-lon-bras32.tpg.internode.on.net [118.210.84.62])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3214D20059;
        Fri,  6 Oct 2023 08:19:57 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1696551600;
        bh=3sH1cC4T7Uxpkbo5Qenr+5cCv9WsbR2e9hfD400KTuo=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=RaIzrwLNVT0wczma4nXdI8uzOys7yIcWc0tNsg6EH01Cmu22paNVn/DeDt08xzpwM
         6k/F+MybjfiauBnPzT4fxMomIejKYmSUxbjozPFXOT9DiDm/Eftj04RAqULlEqH+H8
         nChvGX13LaKYYZxqoudhOgVdG2qTW6f3cBc1LeKiQOcAIVRkQCY2va4xa3NVVXSStp
         MShkXmhpLyL+el3+FZDGqOnXT2i/p1WoTorByug64Uqu7JYQBEIGLO92j7g+tZ/hYy
         uTiO3B0Hb/o+RfhzlcIEfOnKOWSdnQTaolThdEcTIoj999+4PeH0iYDr3t+FW6gKVg
         fE5NHoUlNchlw==
Message-ID: <9407cee639b3eeb715a953c33b26a9a3830a64f8.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
From:   Andrew Jeffery <andrew@codeconstruct.com.au>
To:     Quan Nguyen <quan@os.amperecomputing.com>,
        Wolfram Sang <wsa@kernel.org>,
        Jian Zhang <zhangjian.3032@bytedance.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>, andrew@aj.id.au,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>,
        Tommy Huang <tommy_huang@aspeedtech.com>,
        "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>,
        brendan.higgins@linux.dev, joel@jms.id.au, zhangjian3032@gmail.com,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>, xiexinnan@bytedance.com
Date:   Fri, 06 Oct 2023 10:49:55 +1030
In-Reply-To: <052ccd48-2541-1ef3-1f33-75b7d49611ad@os.amperecomputing.com>
References: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
         <ZRZ/ObZmntMLw2r+@ninjato>
         <975c69de32eefb124fe668e921e8dbda86962deb.camel@codeconstruct.com.au>
         <052ccd48-2541-1ef3-1f33-75b7d49611ad@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 2023-10-05 at 14:55 +0700, Quan Nguyen wrote:
>=20
> On 04/10/2023 13:08, Andrew Jeffery wrote:
> > On Fri, 2023-09-29 at 09:39 +0200, Wolfram Sang wrote:
> > > On Wed, Sep 27, 2023 at 11:42:43PM +0800, Jian Zhang wrote:
> > > > When the `CONFIG_I2C_SLAVE` option is enabled and the device operat=
es
> > > > as a slave, a situation arises where the master sends a START signa=
l
> > > > without the accompanying STOP signal. This action results in a
> > > > persistent I2C bus timeout. The core issue stems from the fact that
> > > > the i2c controller remains in a slave read state without a timeout
> > > > mechanism. As a consequence, the bus perpetually experiences timeou=
ts.
> > > >=20
> > > > In this case, the i2c bus will be reset, but the slave_state reset =
is
> > > > missing.
> > > >=20
> > > > Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when ti=
meout occurs")
> > > > Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
> > >=20
> > > Somebody wants to add tags here? I think it should go to my pull requ=
est
> > > this week.
> > >=20
> >=20
> > I've tested this patch applied on top of fee465150b45 on an AST2600 and
> > the the system behaviour doesn't seem worse. However, I can still lock
> > the bus up and trigger a hung task panic by surprise-unplugging things.
> > I'll poke around to see if I can get to the bottom of that.
> >=20
> > Resetting the slave state makes sense, so with the above observation
> > aside:
> >=20
> > Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> >=20
> > That said I do wonder whether we should update the slave state in the
> > same place we're updating the hardware state. It would cover off the
> > gap identified by Jian if it were to ever occur anywhere else.
> > Something like:
> >=20
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-
> > aspeed.c
> > index 5a416b39b818..28e2a5fc4528 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > @@ -749,6 +749,8 @@ static void __aspeed_i2c_reg_slave(struct
> > aspeed_i2c_bus *bus, u16 slave_addr)
> >          func_ctrl_reg_val =3D readl(bus->base + ASPEED_I2C_FUN_CTRL_RE=
G);
> >          func_ctrl_reg_val |=3D ASPEED_I2CD_SLAVE_EN;
> >          writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG)=
;
> > +
> > +       bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;
> >   }
> >  =20
> >   static int aspeed_i2c_reg_slave(struct i2c_client *client)
> > @@ -765,7 +767,6 @@ static int aspeed_i2c_reg_slave(struct i2c_client
> > *client)
> >          __aspeed_i2c_reg_slave(bus, client->addr);
> >  =20
> >          bus->slave =3D client;
> > -       bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;
> >          spin_unlock_irqrestore(&bus->lock, flags);
> >  =20
> >          return 0;
> >=20
> >=20
>=20
> We tested both Jian's patch and Andrew's patch on our MCTP-i2c bus=20
> (ast2600 based BMC) and see both patches work well.
>=20
> We currently use upstream i2c-aspeed.c driver with the commit [1]=20
> backported. Without that commit, we frequently experienced the bus hang=
=20
> (due to bus arbitration) and it is unable to recover.
>=20
> But, by reverting that commit and with Jian or Andrew's patch, we see=20
> the bus could be able to recover so we think both changes are good.
>=20
> [1]=20
> https://github.com/AspeedTech-BMC/linux/commit/11a94e5918aa0f87c828d63fd2=
54dd60ab2505e5
>=20
> Anyway, I would prefer Andrew's way because the bus->slave_state must=20
> always be reset to ASPEED_I2C_SLAVE_INACTIVE everytime=20
> __aspeed_i2c_reg_slave() is called.

Jian, what's your preference? Are you happy to do a v3 along the lines
of my suggestion above?

Otherwise Wolfram can take v2 and we can always do the cleanup in a
follow-up patch.

Andrew
