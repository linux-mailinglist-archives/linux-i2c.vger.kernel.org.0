Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57FE717F565
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 11:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgCJKw0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 06:52:26 -0400
Received: from sauhun.de ([88.99.104.3]:47354 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726170AbgCJKw0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 06:52:26 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id 02A962C1EB6;
        Tue, 10 Mar 2020 11:52:24 +0100 (CET)
Date:   Tue, 10 Mar 2020 11:52:24 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Francesco Lavra <francescolavra.fl@gmail.com>
Cc:     tangbin <tangbin@cmss.chinamobile.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c:i2c-core-of:remove redundant dev_err message
Message-ID: <20200310105224.GO1987@ninjato>
References: <20200226103901.21520-1-tangbin@cmss.chinamobile.com>
 <0757d83b-203c-fe40-a8ac-665953d7d336@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7gLe/sNPhR777EPF"
Content-Disposition: inline
In-Reply-To: <0757d83b-203c-fe40-a8ac-665953d7d336@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7gLe/sNPhR777EPF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 11:58:41AM +0100, Francesco Lavra wrote:
> On 2/26/20 11:39 AM, tangbin wrote:
> > of_i2c_register_device already contains error message, so remove
> > the redundant dev_err message
> >=20
> > Signed-off-by: tangbin <tangbin@cmss.chinamobile.com>
> > ---
> >   drivers/i2c/i2c-core-of.c | 6 +-----
> >   1 file changed, 1 insertion(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> > index 6787c1f71..7b0a786d3 100644
> > --- a/drivers/i2c/i2c-core-of.c
> > +++ b/drivers/i2c/i2c-core-of.c
> > @@ -103,9 +103,7 @@ void of_i2c_register_devices(struct i2c_adapter *ad=
ap)
> >   		client =3D of_i2c_register_device(adap, node);
> >   		if (IS_ERR(client)) {
> > -			dev_err(&adap->dev,
> > -				 "Failed to create I2C device for %pOF\n",
> > -				 node);
> > +			return PTR_ERR(client);
>=20
> This looks like an unrelated (and wrong) change. Why would you alter the
> semantics of of_i2c_register_devices()? Besides, this function doesn't ha=
ve
> a return value.

Right. This is not correct.

In general, tangbin has a point, the error reporting is doubled. Lower
layers already report, so both(!) callers of of_i2c_register_device do
not need to. Since I am refactoring all this anyhow in "[RFC PATCH 5/7]
i2c: of: error message unification", I think I will just drop error
reporting in the callers there when resending the series (giving tanbin
credits for the removal).

Is this okay with everyone?


--7gLe/sNPhR777EPF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5ncWQACgkQFA3kzBSg
KbZpcA//S4jnQJB+biCG8KuwbviA/gQmWDm7X4Y6lR9SOVNmv6fT2RlljBaTXFtN
E1s4Cxc23bkUomFNEnfH7tGJcFGnTXJdPtxmuYG7v9h6caK0bWTOUVrH0PDB0eSD
cy+okiDoySmdMBoxGnqHOPeZnbB6IQlEb91HiXS/VvMdluCbcHqRUQ45yNtYys0L
RpmNwcOxL1E/NHG2GetQ5NyZLSC0IONaATOvEUkSpfthWar6u0EcMcUgCr4RruQS
/9Wm34MxU3G42tCDlxHjcf4JB7G535wwZh5hoFPkiUK/UWmPeTF60XqhsJvE9HHP
k4kbWurWFcDh+EOtj8wT3RH4gmBmEt0PhMTDeH0t4thlVhajjjEhPfuFs+1U0VRR
6vn1yBBQs0wyNuKeJQDUCoJ6pIxF1Iwl1nxABuY5u9bF2+1BCpOKZpRRvmcbbhTS
xk3IO/9rU8/7DDuPMOEFXKAg3YSgmYnfEcrSkQew7ZWSuf07wGT4FgvssSFlVnhd
XHwwGzSC/ni6ngjrdc+woRI8EebLww9wvtvbeocnV/cdddSyvCBKYX1MSsMVEBLX
QXorfLdiUFdojkxCZFyQNEqgodI/LRZi9QKGrw/5BQcWRrUVnrzgBtcnfIjvTOGX
fXmgYy+4/2j3+LazmApRzWp9JPOGe2FP440iHlcHYQGgsPS1RBQ=
=OV/r
-----END PGP SIGNATURE-----

--7gLe/sNPhR777EPF--
