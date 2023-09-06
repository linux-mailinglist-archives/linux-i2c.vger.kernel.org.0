Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF96A7935ED
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 09:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjIFHKe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 03:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbjIFHKe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 03:10:34 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D134CE9
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 00:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=yHql
        SmIWAIOx9D8wRvMGi5pEa9tjuw5WUujgb0WYc9w=; b=SuEmTjgsB+FCgm97qFkG
        r7dUiEgQJrQeQIhx6ESn0NPMKFCYvA2SW2TIdDoMyayYEksjG/aYHihTcLPzo5PV
        8IgSnC/0iZHMdNIcFeVbH+0O2bU+YubpGuEoEIFuEleIBdDu8JGdScZGFG9XP7+K
        mcazVCy0OtHodPRYpvJPcRxC7SrM56hi6ZNlaUZnpe8VrW8aYYg2aflukJJbbPX4
        545SufDN/bO0SITDKf7TOMlXYd/G92DzCMziZyOk/6RWkXpJqR1OFmZzzo5RValC
        3SfTrBO8qXU25MHVnc0vJsrliaTtqgKyzlvsRctTZPotVTeqaV5lFpuOyqqDLAGf
        Tw==
Received: (qmail 2724785 invoked from network); 6 Sep 2023 09:10:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2023 09:10:25 +0200
X-UD-Smtp-Session: l3s3148p1@Z4UGcKsEUKEgAwDPXx78AHsOvgc204Bb
Date:   Wed, 6 Sep 2023 09:10:25 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: rcar: add FastMode+ support
Message-ID: <ZPgl4eLYTyDFXiyC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
 <20230904135852.12146-4-wsa+renesas@sang-engineering.com>
 <20230905213710.3dv5h6zvwu4tpnby@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7Ts7kpPtQHL+6LUF"
Content-Disposition: inline
In-Reply-To: <20230905213710.3dv5h6zvwu4tpnby@zenone.zhora.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7Ts7kpPtQHL+6LUF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andi,

> > @@ -217,7 +228,17 @@ static void rcar_i2c_init(struct rcar_i2c_priv *pr=
iv)
> >  	rcar_i2c_write(priv, ICMCR, MDBS);
> >  	rcar_i2c_write(priv, ICMSR, 0);
> >  	/* start clock */
> > -	rcar_i2c_write(priv, ICCCR, priv->icccr);
> > +	if (priv->flags & ID_P_FMPLUS) {
> > +		rcar_i2c_write(priv, ICCCR, 0);
> > +		rcar_i2c_write(priv, ICMPR, priv->clock_val);
> > +		rcar_i2c_write(priv, ICHPR, 3 * priv->clock_val);
> > +		rcar_i2c_write(priv, ICLPR, 3 * priv->clock_val);
> > +		rcar_i2c_write(priv, ICCCR2, FMPE | CDFD | HLSE | SME);
> > +	} else {
> > +		rcar_i2c_write(priv, ICCCR, priv->clock_val);
> > +		if (priv->devtype >=3D I2C_RCAR_GEN3)
> > +			rcar_i2c_write(priv, ICCCR2, 0);
>=20
> is this last bit part of the FM+ enabling or is it part of the
> GEN4 support?

It is "disabling FM+" for lower speeds. Since we never used ICCCR2
before FM+, we need to make sure it is cleared properly.

> > +		for (scgd =3D 0; scgd < 0x40; scgd++) {
> > +			scl =3D ick / (20 + (scgd * 8) + round);
> > +			if (scl <=3D t.bus_freq_hz)
> > +				break;
> > +		}
> > +
> > +		if (scgd =3D=3D 0x40) {
>=20
> would be nice to give a meaning to this 0x40 constant... either
> having it in a define or a comment, at least.

This code existed before and was just moved into an if-body. It will be
updated in another series following this one.

Thanks for the review,

   Wolfram


--7Ts7kpPtQHL+6LUF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmT4Jd0ACgkQFA3kzBSg
KbbPFw//cLOkD7C5M5BdquUYTxjpHocQ6wE20W1KvIThySFmulLTXe4hsH8uctBG
SB5t9GTEuHlTitT24OxIPwu5foG1sDa9V0rSilU3wEG3ckjDjCi6f9zOB44eEPTK
gtpANt1uLmTppCQL8Mt8M1aUGqKAqxfEoBTFrc0Duk7axEeMhYeQjc7ZA6XFtxU8
wA2wEkF1DjijEIiQqB5qTKVMYPu4w+5uUZQf/WQ9t/6+cestm4DurIawKlHg4IKc
AHHqLgK4fNC+NGB1YR/fK48ezBfaVkQkdRacgyA4Q+Cc7pWQ5sW8BPPvGUdEYRFo
s8RZYX2AZhZmF7aaLA9q8IN598l74AOm7lznoASvEu9UfIP2A+BfPWjIjHTlIZn5
ygUVaZIYQL8ooXdwyD/eIkGLvko5UCMbg1DlRnDhIaZRxL8VHbpFkWBkTrK3Geqa
OvDLU+yvVfR/rUsrL1/9B9lBYXtwBxA0ENutilfI+89CXLlS8iczvKFEXA6HAUoy
Z5b11GlZ/uyVl0/IjsXFtcLZwy/6bGBSRB1h+vPdZXdfOsM65uPDbmLtn7509g8j
nOrXXZ6ljhyp6ywx2Gf1ctS0uYGH1q1/lA/doSEjAu7+36HeuaFazJL3jUsMGNCV
ZY6qWBEi7SyOEwCSDsSeA1fym3rTnKpYLtARXe9MOdxInw0iIv8=
=wxPe
-----END PGP SIGNATURE-----

--7Ts7kpPtQHL+6LUF--
