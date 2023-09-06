Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73557793C5E
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 14:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235123AbjIFMLL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 08:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240581AbjIFMLL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 08:11:11 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17085171F
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 05:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=YyKx
        SEw64CuPDiuCgGzAN3A6ofWzKjxmBcED81gY0A4=; b=UhLN09bTV7ehGrr8oh43
        6VjNiIRbx6EIwC9zNWj8NGxat5pG4ldrNJ/f7YxGhemcwJNC75/ofWoZhowrlQr1
        hRS3lt9v+IJR6o6wuKlInAinV4PWfHQdWsDUgGfBrq1131jEQSbFJUaya05Ffyt/
        WDdSSrvwbfFo55Kf2MMWTvnBStuU2dpiV6A/lZhvmNsSaLSwMwsQom8qWvefPR2w
        Yxnp8pDdqMQ0DGJPOidtfbD0rAE4nKXG44qAtSex4erOXPI/JZ8RTwQl9y5nr5yI
        mcPMdfN4SmqEcyTSL9hK5c42Wn/fudwNqQdjMHOOFpaQ1g2X/DQPGKX8Qkhe7n2+
        Dg==
Received: (qmail 2814613 invoked from network); 6 Sep 2023 14:11:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2023 14:11:01 +0200
X-UD-Smtp-Session: l3s3148p1@hTsJo68EPRQucrGD
Date:   Wed, 6 Sep 2023 14:11:00 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: rcar: add FastMode+ support
Message-ID: <ZPhsVLiGck+XF5T7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
 <20230904135852.12146-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdW3nGaCHU2GeO3=MHDvZskmXd17GJwj=xBp_ZVawAtniA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T7IJSgVMdsFtcOK6"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW3nGaCHU2GeO3=MHDvZskmXd17GJwj=xBp_ZVawAtniA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--T7IJSgVMdsFtcOK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > -       u32 icccr;
> > +       u32 clock_val;
>=20
> Perhaps use a union to store either icccr or smd?

Yup, can do.

>=20
> >         u8 recovery_icmcr;      /* protected by adapter lock */
> >         enum rcar_i2c_type devtype;
> >         struct i2c_client *slave;
> > @@ -217,7 +228,17 @@ static void rcar_i2c_init(struct rcar_i2c_priv *pr=
iv)
> >         rcar_i2c_write(priv, ICMCR, MDBS);
> >         rcar_i2c_write(priv, ICMSR, 0);
> >         /* start clock */
> > -       rcar_i2c_write(priv, ICCCR, priv->icccr);
> > +       if (priv->flags & ID_P_FMPLUS) {
> > +               rcar_i2c_write(priv, ICCCR, 0);
> > +               rcar_i2c_write(priv, ICMPR, priv->clock_val);
> > +               rcar_i2c_write(priv, ICHPR, 3 * priv->clock_val);
> > +               rcar_i2c_write(priv, ICLPR, 3 * priv->clock_val);
> > +               rcar_i2c_write(priv, ICCCR2, FMPE | CDFD | HLSE | SME);
>=20
> ICCCR2 note 1: "ICCCR2 should be written to prior to writing ICCCR."

Eeks, I remembered it the other way around :/

> >         ick =3D rate / (cdf + 1);
>=20
> In case of FM+, cdf will be zero, and ick =3D=3D rate?

Yes.

>=20
> > @@ -292,34 +324,55 @@ static int rcar_i2c_clock_calculate(struct rcar_i=
2c_priv *priv)
> >         round =3D (ick + 500000) / 1000000 * sum;
>=20
> ick =3D=3D rate if FM+

Yes, does this induce a change here?

> >         round =3D (round + 500) / 1000;
>=20
> DIV_ROUND_UP()

DIV_ROUND_CLOSEST() I'd say, but I have a seperate patch for that.

> > +       if (priv->flags & ID_P_FMPLUS) {
>=20
> IIUIC, on R-ar Gen3 and later you can use ICCCR2 without FM+, for
> improved accuracy, too?

Yeah, we could do that. It indeed improves accuracy:

	old		new
100kHz:	97680/100000	99950/100000
400kHz: 373482/400000	399201/400000

Caring about regressions here is a bit over the top, or?

> > +               /*
> > +                * SMD should be smaller than SCLD and SCHD, we arbitra=
rily set
> > +                * the ratio 1:3. SCHD:SCLD ratio is 1:1, thus:
> > +                * SCL  =3D clkp / (8 + SMD * 2 + SCLD + SCHD + F[(ticf=
 + tr + intd) * clkp])
> > +                * SCL  =3D clkp / (8 + SMD * 2 + SMD * 3 + SMD * 3 + F=
[...])
> > +                * SCL  =3D clkp / (8 + SMD * 8 + F[...])
> > +                */
> > +               smd =3D DIV_ROUND_UP(ick / t.bus_freq_hz - 8 - round, 8=
);
>=20
> Perhaps use rate instead of ick?

That's probably cleaner.

> DIV_ROUND_UP(ick, 8 * (t.bus_freq_hz - 8 - round));

This looks like you assumed "ick / (t.bus_freq_hz - 8 - round)" but it
is "(ick / t.bus_freq_hz) - 8 - round"?

> > +               scl =3D ick / (8 + 8 * smd + round);
>=20
> DIV_ROUND_UP()?

Okay.

> > +               if (smd > 0xff) {
> > +                       dev_err(dev, "it is impossible to calculate bes=
t SCL\n");
> > +                       return -EINVAL;
>=20
> Perhaps some "goto error", to share with the error handling for non-FM+?

I will check with the refactored code.

> > -       dev_dbg(dev, "clk %d/%d(%lu), round %u, CDF:0x%x, SCGD: 0x%x\n",
> > -               scl, t.bus_freq_hz, rate, round, cdf, scgd);
> > +               dev_dbg(dev, "clk %d/%d(%lu), round %u, SMD:0x%x, SCHD:=
 0x%x\n",
>=20
> %u/%u
>=20
> Perhaps it makes more sense to print SMD and SCHD in decimal?
>=20
> This also applies to the existing code (CDF/SCGD) you moved into
> the else branch.

Can do. I don't care it is debug output.

> > +               if (scgd =3D=3D 0x40) {
> > +                       dev_err(dev, "it is impossible to calculate bes=
t SCL\n");
> > +                       return -EINVAL;
>=20
> This was -EIO before.

I'll squash this into a seperate cleanup patch I have.

Thanks,

   Wolfram


--T7IJSgVMdsFtcOK6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmT4bFAACgkQFA3kzBSg
KbZv3A//X40G/mXBVIsm9A1xDul1E9P+P8XuhKQwaefee1bYOvOQVv1r+a+LayVq
nV2zSyH4l5Ec4oXubwPO2+hdgxYLpZRl4aejjtaUrTlRvEHLb/xCI7Hn3OQ1G/yc
G5CFBP3Etnhk7y9uNo7Et/3Oy5X2AlwDRR9c01WPw/BY9GobnY3x09A6YTm5TtT2
jBBx9TPFGmwhulGt1JXBFBEifPJfOvjR34yAubRAulwTGdbOVvufvULZIIJrXlku
Y/hOQZbklOLu/M6/3Te6/pZYg2BzFcUM8S/g5uDYx2dC1RvOrlLnlcZb0L5WrhsM
10lnU1qwYDQqNTdwChuXepMsg90UpFLCwzrcH8nayLzaaCHjYmv/oV9ft1rpxZxj
14v8/BgO9zCWhe9hBAdcVPH+npHs6yAD/fyUmsppbsN6WVP+NCd8apKpUAhuPdVY
5oVfW02a8jkw9WLo2tjzqhRNFHG2JiRXRdd4Ej+OH1DcdV9ytEURiw8ztmAothfG
GoGH8CjZjn2xHNTvPEY4A+3kbAgVe9a/pB3vXpIRjf0DYr8OSI5mUvx/oZwTk4qw
VBVeLFihA3TuOwMU0PtoLw9ioDmzfaETOLqrpJL0Pij82WtAz20i45D4lDZ/Jcgi
vGeCWVbZeLwOzivXDFQYZ1GPpxSDUqdwPRHTCurQPv8GFm9AKFI=
=iUx3
-----END PGP SIGNATURE-----

--T7IJSgVMdsFtcOK6--
