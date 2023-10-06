Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 414177BB048
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 04:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjJFCZP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Oct 2023 22:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbjJFCZO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Oct 2023 22:25:14 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB410E7
        for <linux-i2c@vger.kernel.org>; Thu,  5 Oct 2023 19:25:12 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-578e33b6fb7so1152739a12.3
        for <linux-i2c@vger.kernel.org>; Thu, 05 Oct 2023 19:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1696559112; x=1697163912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :mime-version:references:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxYo6IvDP4Cql5sw9bTnnh2Yqh8RieWPcYmErtsaoMY=;
        b=RzeQJAFqgtZh1NhIc4o3D8kks06sO6r8hqzUiMazYNtMQU2o+Bs1CH9J4dnp3D5Re4
         vrzS9qG6tXnEtpfu3ZagBSQfpG84zEpQPEnNjF5wXFCS73/J9y+PWak6hCsHyr1Etldn
         M62v7xr35V3ZjafYraezjpNswMzRkzJl5cSxEz3kV4LJV063Yd12dOvT9laXIPwcKaSD
         W2NN0/xWHGzE2B0JTnNyeQEQsqIsDKBk2cvqcM4U/9Qqf5+Mnqa6umJAz2xdiDk9X9NG
         Au3K2Tp9iPok29nk1V6F/on3Kw1Wams/2lhC8g122vKIPOwd2Fo60TL2LND3rX2xXPia
         LXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696559112; x=1697163912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :mime-version:references:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CxYo6IvDP4Cql5sw9bTnnh2Yqh8RieWPcYmErtsaoMY=;
        b=dRB06VhN6Ukg/uMtNwnoF9KXVV5lEPDK4qGeQ186sWfyxNTWWf8bOlGNN3t5YltkUy
         Ny2mOp+ige2F1Zy7ikwLdg4vqfr7BLkeGKWPGkbxW4aEdoOq9jkvlS9rbACsiycN8eSs
         VdkQmHO4yp0Ux9bIhARyWNlD8h1P9tks17BCWPzjumBU1OTrZpH9a6yeIt7MTooLDFtR
         XuzbcixN6BgIfMc7u/cGKsI1h5wsmZIS2XgOUWPNJb5MfKPSAwkeych8kojvZPAtwo4F
         0ROUv691zEDBZGvXJddqXj8IGUKEsI5Ud6yhnQQATgRfDxbQS0GrC4ScCMxyQrNp9WYW
         Q8vw==
X-Gm-Message-State: AOJu0YwJGqygD1Qz3FR3vbtz4fDzr6aoWjOMdN1DuvWgoVM0ResE36Zc
        1zb9mld07n6rLP2bFWXYlHFHcEJws3EMpUJekT4WNQ==
X-Google-Smtp-Source: AGHT+IFwhwsyiIbKY3C4WD+0/ePkpd25/S3dbGe0Zd6YKc1+vFt6mHdS6faR6OqiHQ7LdSQOzoDww5EWr4asjIaXiqo=
X-Received: by 2002:a05:6a20:551d:b0:161:7a0c:3c38 with SMTP id
 ko29-20020a056a20551d00b001617a0c3c38mr5963368pzb.32.1696559112315; Thu, 05
 Oct 2023 19:25:12 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Oct 2023 21:25:11 -0500
From:   Jian Zhang <zhangjian.3032@bytedance.com>
References: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
 <ZRZ/ObZmntMLw2r+@ninjato> <975c69de32eefb124fe668e921e8dbda86962deb.camel@codeconstruct.com.au>
 <052ccd48-2541-1ef3-1f33-75b7d49611ad@os.amperecomputing.com> <9407cee639b3eeb715a953c33b26a9a3830a64f8.camel@codeconstruct.com.au>
Mime-Version: 1.0
In-Reply-To: <9407cee639b3eeb715a953c33b26a9a3830a64f8.camel@codeconstruct.com.au>
Date:   Thu, 5 Oct 2023 21:25:11 -0500
Message-ID: <CA+J-oUsjqT4aQH8ZHbMex18xP_LODD5ycCyhTpv=C2X0DqriZA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
To:     Andrew Jeffery <andrew@codeconstruct.com.au>
Cc:     Quan Nguyen <quan@os.amperecomputing.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>, andrew@aj.id.au,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>,
        Tommy Huang <tommy_huang@aspeedtech.com>,
        "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>,
        brendan.higgins@linux.dev, joel@jms.id.au, zhangjian3032@gmail.com,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>, xiexinnan@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> From: "Andrew Jeffery"<andrew@codeconstruct.com.au>
> Date:=C2=A0 Fri, Oct 6, 2023, 08:20
> Subject:=C2=A0 [External] Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in=
 slave read
> To: "Quan Nguyen"<quan@os.amperecomputing.com>, "Wolfram Sang"<wsa@kernel=
.org>, "Jian Zhang"<zhangjian.3032@bytedance.com>
> Cc: "Andi Shyti"<andi.shyti@kernel.org>, "moderated list:ARM/ASPEED MACHI=
NE SUPPORT"<linux-aspeed@lists.ozlabs.org>, <andrew@aj.id.au>, "moderated l=
ist:ARM/ASPEED I2C DRIVER"<openbmc@lists.ozlabs.org>, <yulei.sh@bytedance.c=
om>, "open list"<linux-kernel@vger.kernel.org>, "Tommy Huang"<tommy_huang@a=
speedtech.com>, "open list:ARM/ASPEED I2C DRIVER"<linux-i2c@vger.kernel.org=
>, <brendan.higgins@linux.dev>, <joel@jms.id.au>, <zhangjian3032@gmail.com>=
, "moderated list:ARM/ASPEED MACHINE SUPPORT"<linux-arm-kernel@lists.infrad=
ead.org>, <xiexinnan@bytedance.com>
> On Thu, 2023-10-05 at 14:55 +0700, Quan Nguyen wrote:
> >
> > On 04/10/2023 13:08, Andrew Jeffery wrote:
> > > On Fri, 2023-09-29 at 09:39 +0200, Wolfram Sang wrote:
> > > > On Wed, Sep 27, 2023 at 11:42:43PM +0800, Jian Zhang wrote:
> > > > > When the `CONFIG_I2C_SLAVE` option is enabled and the device oper=
ates
> > > > > as a slave, a situation arises where the master sends a START sig=
nal
> > > > > without the accompanying STOP signal. This action results in a
> > > > > persistent I2C bus timeout. The core issue stems from the fact th=
at
> > > > > the i2c controller remains in a slave read state without a timeou=
t
> > > > > mechanism. As a consequence, the bus perpetually experiences time=
outs.
> > > > >
> > > > > In this case, the i2c bus will be reset, but the slave_state rese=
t is
> > > > > missing.
> > > > >
> > > > > Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when =
timeout occurs")
> > > > > Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
> > > >
> > > > Somebody wants to add tags here? I think it should go to my pull re=
quest
> > > > this week.
> > > >
> > >
> > > I've tested this patch applied on top of fee465150b45 on an AST2600 a=
nd
> > > the the system behaviour doesn't seem worse. However, I can still loc=
k
> > > the bus up and trigger a hung task panic by surprise-unplugging thing=
s.
> > > I'll poke around to see if I can get to the bottom of that.
> > >
> > > Resetting the slave state makes sense, so with the above observation
> > > aside:
> > >
> > > Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > > Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > >
> > > That said I do wonder whether we should update the slave state in the
> > > same place we're updating the hardware state. It would cover off the
> > > gap identified by Jian if it were to ever occur anywhere else.
> > > Something like:
> > >
> > > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c=
-
> > > aspeed.c
> > > index 5a416b39b818..28e2a5fc4528 100644
> > > --- a/drivers/i2c/busses/i2c-aspeed.c
> > > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > > @@ -749,6 +749,8 @@ static void __aspeed_i2c_reg_slave(struct
> > > aspeed_i2c_bus *bus, u16 slave_addr)
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 func_ctrl_reg_val =3D readl(bus->ba=
se + ASPEED_I2C_FUN_CTRL_REG);
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 func_ctrl_reg_val |=3D ASPEED_I2CD_=
SLAVE_EN;
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 writel(func_ctrl_reg_val, bus->base=
 + ASPEED_I2C_FUN_CTRL_REG);
> > > +
> > > + =C2=A0 =C2=A0 =C2=A0 bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE=
;
> > > =C2=A0 }
> > >
> > > =C2=A0 static int aspeed_i2c_reg_slave(struct i2c_client *client)
> > > @@ -765,7 +767,6 @@ static int aspeed_i2c_reg_slave(struct i2c_client
> > > *client)
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 __aspeed_i2c_reg_slave(bus, client-=
>addr);
> > >
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 bus->slave =3D client;
> > > - =C2=A0 =C2=A0 =C2=A0 bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE=
;
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 spin_unlock_irqrestore(&bus->lock, =
flags);
> > >
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 return 0;
> > >
> > >
> >
> > We tested both Jian's patch and Andrew's patch on our MCTP-i2c bus
> > (ast2600 based BMC) and see both patches work well.
> >
> > We currently use upstream i2c-aspeed.c driver with the commit [1]
> > backported. Without that commit, we frequently experienced the bus hang
> > (due to bus arbitration) and it is unable to recover.
> >
> > But, by reverting that commit and with Jian or Andrew's patch, we see
> > the bus could be able to recover so we think both changes are good.
> >
> > [1]
> > https://github.com/AspeedTech-BMC/linux/commit/11a94e5918aa0f87c828d63f=
d254dd60ab2505e5
> >
> > Anyway, I would prefer Andrew's way because the bus->slave_state must
> > always be reset to ASPEED_I2C_SLAVE_INACTIVE everytime
> > __aspeed_i2c_reg_slave() is called.
>
> Jian, what's your preference? Are you happy to do a v3 along the lines
> of my suggestion above?
Thanks, LGTM,=C2=A0 I will send the patch v3.

Jian.
>
> Otherwise Wolfram can take v2 and we can always do the cleanup in a
> follow-up patch.
>
> Andrew
