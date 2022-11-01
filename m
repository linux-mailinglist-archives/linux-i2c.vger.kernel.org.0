Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D400F615646
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 00:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbiKAXyC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 19:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiKAXyA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 19:54:00 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79A713DC6;
        Tue,  1 Nov 2022 16:53:59 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id a14so22267708wru.5;
        Tue, 01 Nov 2022 16:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z3FRDuuLwsrtOeXY8HtkGnt8wtOUT94ofl0sNB3vcQI=;
        b=gqKp3LZYwPxJIeLX8gVUpL8ykLCVcRNAnborbEZPNhGocFSNT1rNvacrShoBu2PdFF
         w1yMXm9voWJM5cT3jp7kELL/BdjEUQ8ZGZrOKzueh91ZcO2hgG0iNHnytAQ0LsuUeE9U
         3jpVUW3ul3T3ate4IjmDNEwqGakP154inpieEINWycYvpF+om15bbg4aleEd414LhMeW
         18iN03Zm68Du8ZaQMVJpk5SL1lGRoAhSOyXrLf8k4uJR0tfyjuTcW8Kt8EcWdsLLQXDr
         dd/hEAg5d8aMEXWyZxe8Pbw9H9bL7E74Mc0b/urnX1zuMo5m7KSJl8esZidDwcNVTgXp
         zq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3FRDuuLwsrtOeXY8HtkGnt8wtOUT94ofl0sNB3vcQI=;
        b=reF+y5Xq1jr24kszbL9XCC3iZhoQnGMgd4bPjAXQJaI9aG3NwWdLwH/Xnb8EdYHUCg
         mhUdcW93UwMDuXqoLhzJb+TicAZyuQydHeTfBkF19E7ueuTC7KGF+iz4fav+6nHsg5j7
         l0oLu48aAiN/kH1vbSCqo2CfA4WgRoZ0g7D9aXMRAQSAmbZOJ9pTN7WfNbPnivHoozu/
         +P7Y8mz++A0Lhc6+K31UUav/W3qqS+lAwMHQXHbjkow6jh434nzNJHHdmxC1n8L/TUR4
         y1AhvI048DmERpmBYgzuWzEDn/YwSRR6D6F14am0b7mpKgyv7Nq2nDGfiZVp3nvxTTW+
         uu7g==
X-Gm-Message-State: ACrzQf3q71+gCCIKEifvSBOW9hEpke7BERp+bJ1ElrfS9D0JmbzyDGak
        0nBJUcDK7aodrWhoU/7Eqeo=
X-Google-Smtp-Source: AMsMyM6S4RYnyr9fA/9Z/Ui+zms2pmGeKvZVTBxyY2J8xgdEBuu/b4yBP1CcYZR6KTyQFGiin2B/Ng==
X-Received: by 2002:a5d:47a6:0:b0:236:7854:246d with SMTP id 6-20020a5d47a6000000b002367854246dmr12836652wrb.300.1667346838314;
        Tue, 01 Nov 2022 16:53:58 -0700 (PDT)
Received: from DreamMachine2.lan (188.red-83-35-57.dynamicip.rima-tde.net. [83.35.57.188])
        by smtp.gmail.com with ESMTPSA id f7-20020adff987000000b0022e6178bd84sm11209264wrr.8.2022.11.01.16.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 16:53:57 -0700 (PDT)
Message-ID: <d464a5319e1571613abcd7f0b3120e82a6f62e6e.camel@gmail.com>
Subject: Re: [RFC PATCH 1/2] i2c: core: Introduce i2c_client_get_device_id
 helper function
From:   Angel Iglesias <ang.iglesiasg@gmail.com>
To:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-iio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 02 Nov 2022 00:53:56 +0100
In-Reply-To: <20221101145421.jwytax2srno4hhrl@pengutronix.de>
References: <cover.1667151588.git.ang.iglesiasg@gmail.com>
         <aeac9f372ffe0013757e261229e6e23f76f2d8f9.1667151588.git.ang.iglesiasg@gmail.com>
         <20221101145421.jwytax2srno4hhrl@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (by Flathub.org) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 2022-11-01 at 15:54 +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Sun, Oct 30, 2022 at 06:52:18PM +0100, Angel Iglesias wrote:
> > Introduces new helper function to aid in .probe_new() refactors. In ord=
er
> > to use existing i2c_get_device_id() on the probe callback, the device
> > match table needs to be accessible in that function, which would requir=
e
> > bigger refactors in some drivers using the deprecated .probe callback.
> >=20
> > This issue was discussed in more detail in the IIO mailing list.
> >=20
> > Link:
> > https://lore.kernel.org/all/20221023132302.911644-11-u.kleine-koenig@pe=
ngutronix.de/
> > Suggested-by: Nuno S=C3=A1 <noname.nuno@gmail.com>
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Suggested-by: Jonathan Cameron <jic23@kernel.org>
> > Signed-off-by: Angel Iglesias <ang.iglesiasg@gmail.com>
> > ---
> > =C2=A0drivers/i2c/i2c-core-base.c | 15 +++++++++++++++
> > =C2=A0include/linux/i2c.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
> > =C2=A02 files changed, 16 insertions(+)
> >=20
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index b4edf10e8fd0..e6623226e393 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -2236,6 +2236,21 @@ int i2c_get_device_id(const struct i2c_client
> > *client,
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(i2c_get_device_id);
> > =C2=A0
> > +/**
> > + * i2c_client_get_device_id - get the driver match table entry of a de=
vice
> > + * @client: the device to query
> > + *
> > + * Returns a pointer to the matching entry if found, NULL otherwise.
> > + */
> > +const struct i2c_device_id *i2c_client_get_device_id(const struct
> > i2c_client *client)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct i2c_driver *drv=
 =3D to_i2c_driver(client->dev.driver);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return i2c_match_id(drv->id_=
table, client);
> > +
>=20
> I'd drop the empty line after the return. Is it worth to note in a
> comment that it only works for bound clients? (Oopses otherwise)

Yup, my bad, that newline shouldn't be there.
Sure, seems reasonable to leave warn just in case.

Kind regards,
Angel

> Best regards
> Uwe
>=20

