Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C856C266884
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Sep 2020 21:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgIKTF4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Sep 2020 15:05:56 -0400
Received: from www.zeus03.de ([194.117.254.33]:41096 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgIKTFz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 11 Sep 2020 15:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=/uUbtp7hUG/VyVj3myOj7u1wlZUm
        SRscYv/Xxrxy5i8=; b=Dl8uQkjjfzBg7pibrIZniB7ifW+VX//TRmmXVElF+mgg
        rj/0T2Vudb4in1j7fPXI+DnQlZnLXx9VPNRm1EGqkZPO6FbeFFpd9RSwERKAfkfC
        gC9FC/Y5LwJAjKhHClM5HeCTBph+Kbg6z4RZNWQVKTlnHSZQZ9r0FMNBV1rgExw=
Received: (qmail 1083521 invoked from network); 11 Sep 2020 21:05:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Sep 2020 21:05:52 +0200
X-UD-Smtp-Session: l3s3148p1@6sidXw6vwMQgAwDPXwg3AOu94Zz7tvsj
Date:   Fri, 11 Sep 2020 21:05:49 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 1/1] i2c: add slave testunit driver
Message-ID: <20200911190549.GA909@ninjato>
References: <20200911071658.13966-1-wsa+renesas@sang-engineering.com>
 <20200911071658.13966-2-wsa+renesas@sang-engineering.com>
 <20200911125419.GE23480@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <20200911125419.GE23480@gnbcxd0016.gnb.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alain,

> great that you published your slave-unittest driver.
> I gave it a try rapidly and can confirm it works as expected on the stm32
> platform. I tested with a loopback between 2 i2c controllers.

Thanks, much appreciated! I read this as Tested-by :)

> > +config I2C_SLAVE_TESTUNIT
> > +	tristate "I2C eeprom testunit driver"
>=20
> Should be tristate "I2C testunit driver" I believe (no eeprom)

Oops, yes.

> > +	switch (tu->regs[TU_REG_CMD]) {
> > +	case TU_CMD_READ_BYTES:
> > +		msg.addr =3D tu->regs[TU_REG_DATAL];
> > +		msg.flags =3D I2C_M_RD;
> > +		msg.len =3D tu->regs[TU_REG_DATAH];
>=20
> Some protection might be needed here since the size is coming straight fr=
om
> the i2cset command while the buffer is limited to 256 bytes.

Well, the size is not a problem because all the regs are u8. But for the
address, we should mask the lower 7 bits, in deed. We could use the free
8th bit to double the length, but we probably better keep it reserved for
something yet unknown.

Thanks for the review!

   Wolfram


--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9byokACgkQFA3kzBSg
KbYW1g//bLG2yGVpprXPwG1EhjIPQjitxovRUlNPscd4HuJNaRVyF4mUdwLNTYHm
x519fAWgyG/lEuRZO72XYr5bc8ZFT1K7R6DjM2AC1hyXXN8B7wlA+EqxYsE09QDz
SYhET5r/YQLqo6XV8liKhhYUyPmzDrVTBugF2zhbxiCLe1+pCv+StfcSMgHUt4Y6
jK+yRV7cVYeRpaKhI6nDwDboHhsknCcIknOBCgPhCCOwFbVtXJv66AIcAhL2AOms
pKJhmNzeASDUKK8dMRM7l0Bh0vLMyB7SMfpk07Kgt2EOEYhC3DhMSoTdAjTTGzd4
WkGu6RQT5F32u2NVpVE74RzDroiAjaUw7eYyH2MF+JG6Pc5GWdXXcPuU4qzIGDF0
4apJVMERQUTxhyf5kvdWsHHmJ+Dn0kt94wif1AH+UKNpyAzZkuVbw+WHf67ptZYV
MIQriUR4YbTk+QhgYm5viHvMA3fhFJexn5Q6EigY49asrPm/9fEc1khqRTC3KOrX
EWuGmfLdyMuZy61C68F6+k2nU1KY5S4WyOvc/fUBq1VB0SylPgVSoVBM3iGpJPJ9
g3z1E/zKPJIPPJBvsfqVdOQRq8MP6RXZikQPAegDPlWMFUEnT/rpQSpQgJD3NW2F
4NvQhTloe0OS6RBebXvjNTeuDCjxiNl56h6LRcpJdnK8YpmxL+k=
=zda8
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
