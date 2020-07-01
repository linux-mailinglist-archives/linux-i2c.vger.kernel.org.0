Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B5E210E27
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 16:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731039AbgGAO5T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 10:57:19 -0400
Received: from www.zeus03.de ([194.117.254.33]:43140 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727014AbgGAO5T (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Jul 2020 10:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ixsaqyBVatpjFGlKvxteR7MZYNGi
        CdYi3qR8OOCYrOw=; b=PAbP2lGQCaYaVequRWufII7gAi3d8c61yHxifXAN5YRm
        hr/9w06qZzetaUzVHDwK4cPQz7LBigqRbIAU3jgJeIM2X7C4Lr6AcYKFxKCTgKdV
        p2pmooTxdX6Sp22srl+xUpXpA+U+AhB0LS9XX5H/KhHUPaZw3G9v6kY0ilZ38vo=
Received: (qmail 587987 invoked from network); 1 Jul 2020 16:57:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jul 2020 16:57:17 +0200
X-UD-Smtp-Session: l3s3148p1@uLAVgmKpAuAgAwDPXwRGAHjapuWXvfu/
Date:   Wed, 1 Jul 2020 16:57:14 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Alain Volmat <alain.volmat@st.com>
Subject: Re: [RFC PATCH] WIP: i2c: rcar: add HostNotify support
Message-ID: <20200701145714.GA2808@kunai>
References: <20200701080904.11022-1-wsa+renesas@sang-engineering.com>
 <20200701092731.GD2261@ninjato>
 <20200701121633.GI2261@ninjato>
 <20200701123207.GC3457@gnbcxd0016.gnb.st.com>
 <20200701132145.GJ2261@ninjato>
 <20200701143738.GF3457@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <20200701143738.GF3457@gnbcxd0016.gnb.st.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Hum ... sorry ... I'm having some doubt about such a generic 'smbus' nami=
ng.
> I mean, stating 'smbus' within the controller node kind of says
> "I am working in SMBus mode", and not only "I am supporting Host-Notify &=
 Alert".
> In such case, NOT having 'smbus' would mean that the driver do not support
> SMBUS and SMBus xfer and all smbus related stuff would get disabled ...
> We for sure do not want to have everybody add a smbus property in their DT
> if they support SMBus xfer for example.
>=20
> This is probably too wide, don't you think ?

It would be, yet I don't think this is case.

The "smbus" property means that _additional_ SMBus restrictions apply to
that bus. Like additional timeout values, reserved addresses etc...

It does not mean that we can't use SMBus style communication on an I2C
bus. We can because we can easily emulate it. This is not an additional
restriction.

So it rather means "SMBus restrictions apply here". No such properties
means no such restrictions. But then you can't have HostNotify and Alert
because the addresses are not reserved.

We can update the binding to "smbus-restrictions" perhaps, although it
doesn't really sound nice to me. Maybe Rob also has an idea.

I'll send a patch later and then we will see what he says.

D'accord?


--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl78pEcACgkQFA3kzBSg
KbaP8w/+IkbpGpmiBMjJPMoV428Q8QibtzE0DmO00+hg6JDKiOH66/h1Ajramcgj
mSB4zbu3RuQaAhudtrZo+IeQNHKATGNB5C77pFwu6dXRx+0hceiG4lV9rUzwg1PD
g3QWqOk7+KONqLI6AkK6igxUaaQa2aeM6LaFmPFy90Ia8oMoVN8UI+l/0GWqGsqy
tIYe5kxPo/PMIXknC5nGOAq9yulU3e2w9/cUSNgcJvKMnNClJ1JE67hEQZQ/DIKR
fVCX9I8gkp6K3d/2d8kQIoalJtM8Ou9TRbBAM2DLexnkIX2T5nMIwQR//v0c5iuX
NH0tjyE+IQmagmakRJjqUQeAW0vFbEXGHpUO2cGv7WS0UwxfYfYLadZX8Nq2uoXM
7z7oG/9aJ+bn2bDBk+I3WuBRndxkTnvu2tfByRMPobp/eVT5rjELKwGlPN2pFnx9
KtH2SeuLZzC424XUUiiCSEOXDffQRsB3LkGjFCRDGZXy2xy6QBCh/e/EzlbjXWln
Cof79HHjF5tZAMfu16NDixd9b24ZKwTlnObB2vjgtErRPan3YiL9QTUCayo0rwPO
otieSBc7aefSo84Uvmv+fv/MNKgYK+HSB4LCXVObJq5lVgGNRCUoeIuhikbyQXTN
io+bx7DOKaKjHrN1s1ZXrFrBtOPZMUJq7tv0+bNd3Vdnr1roiqo=
=twv3
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
