Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44C6D634392
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Nov 2022 19:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234380AbiKVSXa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Nov 2022 13:23:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234371AbiKVSX3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Nov 2022 13:23:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4856729A8;
        Tue, 22 Nov 2022 10:23:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B33C16183B;
        Tue, 22 Nov 2022 18:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0AAC433C1;
        Tue, 22 Nov 2022 18:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669141406;
        bh=PxdaRK69h9h4WyUDQw+RUIYs6RywgaToqZp+l7JZRPs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YeWx5iyu26FCPGky4JAWrnugqLr1oE7bXaAfzu7nvoY4481CsTPgkClaryeulxsnF
         L5p+TYnEIVo/FvzAqtOlMBit5u1jJIuyPDmDeGpXK//kGVilAPeehGSMcrkCFg2e0Y
         dd8VBa5HXYT+Z/47Vq+bNjMz84sQZ52YuEZ4KMBcnzr56S/AfFWBVkKW1ERRUVCwrJ
         cBfPUlh6wqqicaBWKAPl0H2yxEyDl0Y61754yqi1WE7/0qv5GH9uniqXs1COrczPn5
         2NOdVVxZXbK7mibEElxBGP+fHT61zQVKjfrhBld22z6Orib/TrxHwTayjvAjRPrLFT
         2sdFH+Tbo/Kmw==
Date:   Tue, 22 Nov 2022 18:35:57 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Crt Mori <cmo@melexis.com>
Cc:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 186/606] iio: temperature: mlx90632: Convert to i2c's
 .probe_new()
Message-ID: <20221122183557.07a9e095@jic23-huawei>
In-Reply-To: <CAKv63uti8o2i-SFsJ7iK+R0N1go1tzVKpWZHbaRD3Wta2mXuZQ@mail.gmail.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
        <20221118224540.619276-187-uwe@kleine-koenig.org>
        <CAKv63uvVsLhbt9y0fWxPWp005rnWzCn6Vm0UmOnW08B87fkCzw@mail.gmail.com>
        <20221119100250.iw757ovgwjbwr2ho@pengutronix.de>
        <CAKv63uti8o2i-SFsJ7iK+R0N1go1tzVKpWZHbaRD3Wta2mXuZQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 20 Nov 2022 10:49:20 +0100
Crt Mori <cmo@melexis.com> wrote:

> Ok. Acked-by: Crt Mori <cmo@melexis.com>
> (resending since previous mail was not delivered because it was not plain=
text)
>=20
> On Sat, 19 Nov 2022 at 11:02, Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Hello,
> >
> > On Sat, Nov 19, 2022 at 12:04:41AM +0100, Crt Mori wrote: =20
> > > On Fri, 18 Nov 2022 at 23:46, Uwe Kleine-K=C3=B6nig <uwe@kleine-koeni=
g.org> wrote: =20
> > > >
> > > > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > >
> > > > .probe_new() doesn't get the i2c_device_id * parameter, so determine
> > > > that explicitly in the probe function.
> > > >
> > > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.d=
e>
> > > > ---
> > > >  drivers/iio/temperature/mlx90632.c | 12 ++++++++++--
> > > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/tempe=
rature/mlx90632.c
> > > > index f1f5ebc145b1..19e30cfca8a7 100644
> > > > --- a/drivers/iio/temperature/mlx90632.c
> > > > +++ b/drivers/iio/temperature/mlx90632.c
> > > > @@ -1168,9 +1168,9 @@ static int mlx90632_enable_regulator(struct m=
lx90632_data *data)
> > > >         return ret;
> > > >  }
> > > >
> > > > -static int mlx90632_probe(struct i2c_client *client,
> > > > -                         const struct i2c_device_id *id)
> > > > +static int mlx90632_probe(struct i2c_client *client)
> > > >  {
> > > > +       const struct i2c_device_id *id =3D i2c_client_get_device_id=
(client);
> > > >         struct mlx90632_data *mlx90632;
> > > >         struct iio_dev *indio_dev;
> > > >         struct regmap *regmap;
> > > > @@ -1337,7 +1337,15 @@ static struct i2c_driver mlx90632_driver =3D=
 {
> > > >                 .of_match_table =3D mlx90632_of_match,
> > > >                 .pm     =3D pm_ptr(&mlx90632_pm_ops),
> > > >         },
> > > > +<<<<<<< ours =20
> > >
> > > Maybe some of the merge artifacts left (also below)? =20
> >
> > *groan*, ok, thanks for pointing out the obvious. Fixed in my tree. Ftr,
> > the fixup is:
> >
> > diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/temperatu=
re/mlx90632.c
> > index 19e30cfca8a7..753b7a4ccfdd 100644
> > --- a/drivers/iio/temperature/mlx90632.c
> > +++ b/drivers/iio/temperature/mlx90632.c
> > @@ -1337,15 +1337,7 @@ static struct i2c_driver mlx90632_driver =3D {
> >                 .of_match_table =3D mlx90632_of_match,
> >                 .pm     =3D pm_ptr(&mlx90632_pm_ops),
> >         },
> > -<<<<<<< ours
> > -       .probe =3D mlx90632_probe,
> > -||||||| base
> > -       .probe =3D mlx90632_probe,
> > -       .remove =3D mlx90632_remove,
> > -=3D=3D=3D=3D=3D=3D=3D
> >         .probe_new =3D mlx90632_probe,
> > -       .remove =3D mlx90632_remove, =20
> > ->>>>>>> theirs =20
> >         .id_table =3D mlx90632_id,
> >  };
> >  module_i2c_driver(mlx90632_driver);
> >
> > When (and if) I'll resend the series, the fixed version will be
> > included. (Unless someone picks up the broken patch with the above
> > fixup of course :-)
Who would be crazy enough to do that?

(fixed up whilst applying)

Jonathan

> >
> > Best regards
> > Uwe
> >
> > --
> > Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig     =
       |
> > Industrial Linux Solutions                 | https://www.pengutronix.de=
/ | =20

