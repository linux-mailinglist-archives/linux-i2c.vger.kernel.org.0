Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A994A258AA1
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 10:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgIAIq1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 04:46:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:34536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbgIAIq0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Sep 2020 04:46:26 -0400
Received: from localhost (p54b33ab6.dip0.t-ipconnect.de [84.179.58.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E28F3205CB;
        Tue,  1 Sep 2020 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598949985;
        bh=Ej/xXbLv6pFbyjl0t87cGQ0joph447A5JF+zxsqDPpk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZI49kMFsc2zKwEcaGT3/TULcL3HB1mxWb0Ku2a0c3iDNnPMsljE08FZLwCkwrf2+g
         u5wk3BhzwMmeqLtt59U3pjogdjQaFIMf4aq8lbBOlgQiGS2mGutpv9S7MyqLwolxUk
         fIyQqj14UyGEcmihr8CabeYxU7ocxzLbUrrJK9Kk=
Date:   Tue, 1 Sep 2020 10:46:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>, jdelvare@suse.de,
        jarkko.nikula@linux.intel.com, chris.packham@alliedtelesis.co.nz,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: algo-pca: Reapply i2c bus settings after reset
Message-ID: <20200901084619.GA897@ninjato>
References: <20200901005713.27453-1-evan.nimmo@alliedtelesis.co.nz>
 <20200901082046.GO1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <20200901082046.GO1891694@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +/**
> > + * struct i2c_bus_settings - The configured i2c bus settings
> > + * @mode: Configured i2c bus mode (PCA9665)
> > + * @tlow: Configured SCL LOW period (PCA9665)
> > + * @thi: Configured SCL HIGH period (PCA9665)
> > + * @clock_freq: The configured clock frequency (PCA9564)
> > + */
> > +struct i2c_bus_settings {
> > +	int mode;
> > +	int tlow;
> > +	int thi;
> > +	int clock_freq;
> > +};
>=20
> This is a good candidate to have it in generic header for sake of the
> unification. Possible users:
>=20
> struct tegra_i2c_hw_feature
> struct cci_data::struct hw_params

Could be evaluated, but outside the scope of this patch, I think. This
is a bugfix, so a self-contained patch makes backporting a lot easier.


--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9OClcACgkQFA3kzBSg
KbZ3xQ/+P34ln28a/hlgQwyw/s8pEjEAxK0+TTq9GQroguDqywWfo1d9wruqwmG1
NuHBkVKvOKlIeICymzEBpDtvncbbdgMVG/ewECf+wg9/kpsCYFOCa9GJN7zkVJVJ
40eldiFUiYk0IrbqiIypqSnKPlnO5NOrlYqidf44f40F6mJS5lz5ooXbP+I5a++K
FggKsNNhpyKeOyONz2iOe+lqMJYqC/3iJxeYBJzUB2IFjJcZN3fXHQ5qkMqsSLgW
xjWi3Dg8sCIkwqqKOtIJ22daXVQ05pYNNWkYhzVG1/dB9ICAoqgIiLVVv+PEZ/5/
OpEBFwE+9CtBFfRoJI6MTYop3/TGeE7RZDj+f5u3X41EEYW1lhoCypnfRDQMXMOL
vRlpzZ/ja98vZZBUCB14P024BHHRcINxMCpXFAGlj4jw5yIlXxSZ9mJoAHEZYdwd
KfP8h+vaFyFYqXd8P6VIWsUxj888vSpxz9vBVRXb/dYjYZi4vx5Ao8io72mLnKST
jkPou/lXb1Xm9b6jpic9pGx7C+13GyrM2p1NNcWnE1KHAq7g8bLVSIDWJ+WHsRCT
nnKP8spABei4sHL3ZkEotMuBQX4ZeLXAdLeNMBgGVcov+KaH7kLjeAREF3oAnkm/
8BEj4NxwHYs/PQBjgCV2yKWoZXsFoogu0KeiMSw39+fX3SbclJA=
=UEqD
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
