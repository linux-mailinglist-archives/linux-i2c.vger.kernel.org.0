Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6DD134F979
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 09:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233697AbhCaHJf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 03:09:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:37976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233968AbhCaHJT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 03:09:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01BCF619CD;
        Wed, 31 Mar 2021 07:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617174559;
        bh=iY9vHbcUnG5YAQ7S+Zswyr75kvWJ4LwY/t1hPgUkfQo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EDKZwsxvclGwppNvm4wSzRLl/RPgzG6UexiySW3Uqjnec9YEjheglo2dfiD5jkP/A
         cwyL4h65IznZx0FkO+qpyKqlt59Pd4kTf5z3UeRW7KhJepIzrFnyxyH/y3xSXh8dAt
         Ryeii5bJuZPHPN5EGnhrOQtM+FpcjUuZRqEecrLvLFSzJ3iE6/2aEhY4T0NlvwYUzg
         3Mjh5yjb30BuieTDFTTM+0rRsVGZG0aklPBBEaI/mRMPiwh84PgOR78GLfqSUeKv7q
         gd6Im/2ReMLdryBw/vkqirSUPjzmNxVGCD5hF6LJQIrghGm67JJlnClrrvjQkGTEe8
         eWhgbSF7VNl3g==
Date:   Wed, 31 Mar 2021 09:09:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] Adding i2c-cp2615: i2c support for Silicon Labs'
 CP2615 Digital Audio Bridge
Message-ID: <20210331070913.GA1025@ninjato>
References: <20210318115210.2014204-1-bence98@sch.bme.hu>
 <20210318115210.2014204-3-bence98@sch.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <20210318115210.2014204-3-bence98@sch.bme.hu>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 18, 2021 at 11:52:10AM +0000, Bence Cs=C3=B3k=C3=A1s wrote:
> Create an i2c_adapter for CP2615's I2C master interface by
> implementing parts of the CP2615's I/O Protocol (IOP)
>=20
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <bence98@sch.bme.hu>

So, my code checkers report:

    SPARSE
drivers/i2c/busses/i2c-cp2615.c:88:21: warning: incorrect type in assignmen=
t (different base types)
drivers/i2c/busses/i2c-cp2615.c:88:21:    expected unsigned short [usertype=
] length
drivers/i2c/busses/i2c-cp2615.c:88:21:    got restricted __be16 [usertype]
drivers/i2c/busses/i2c-cp2615.c:89:18: warning: incorrect type in assignmen=
t (different base types)
drivers/i2c/busses/i2c-cp2615.c:89:18:    expected unsigned short [usertype=
] msg
drivers/i2c/busses/i2c-cp2615.c:89:18:    got restricted __be16 [usertype]
drivers/i2c/busses/i2c-cp2615.c:78:5: warning: symbol 'cp2615_init_iop_msg'=
 was not declared. Should it be static?
drivers/i2c/busses/i2c-cp2615.c:96:5: warning: symbol 'cp2615_init_i2c_msg'=
 was not declared. Should it be static?
drivers/i2c/busses/i2c-cp2615.c:102:5: warning: symbol 'cp2615_check_status=
' was not declared. Should it be static?
drivers/i2c/busses/i2c-cp2615.c:131:41: warning: cast to restricted __be16
drivers/i2c/busses/i2c-cp2615.c:131:41: warning: cast to restricted __be16
drivers/i2c/busses/i2c-cp2615.c:131:41: warning: cast to restricted __be16
drivers/i2c/busses/i2c-cp2615.c:131:41: warning: cast to restricted __be16
drivers/i2c/busses/i2c-cp2615.c:148:25: warning: restricted __be16 degrades=
 to integer
drivers/i2c/busses/i2c-cp2615.c:212:27: warning: symbol 'cp2615_i2c_quirks'=
 was not declared. Should it be static?
    CPPCHECK
drivers/i2c/busses/i2c-cp2615.c:258:9: warning: Identical condition and ret=
urn expression 'ret', return value is always 0 [identicalConditionAfterEarl=
yExit]
 return ret;
        ^
  CC      drivers/i2c/busses/i2c-cp2615.o
drivers/i2c/busses/i2c-cp2615.c:78:5: warning: no previous prototype for =
=E2=80=98cp2615_init_iop_msg=E2=80=99 [-Wmissing-prototypes]
   78 | int cp2615_init_iop_msg(struct cp2615_iop_msg *ret, enum cp2615_iop=
_msg_type msg,
      |     ^~~~~~~~~~~~~~~~~~~
drivers/i2c/busses/i2c-cp2615.c:96:5: warning: no previous prototype for =
=E2=80=98cp2615_init_i2c_msg=E2=80=99 [-Wmissing-prototypes]
   96 | int cp2615_init_i2c_msg(struct cp2615_iop_msg *ret, const struct cp=
2615_i2c_transfer *data)
      |     ^~~~~~~~~~~~~~~~~~~
drivers/i2c/busses/i2c-cp2615.c:102:5: warning: no previous prototype for =
=E2=80=98cp2615_check_status=E2=80=99 [-Wmissing-prototypes]
  102 | int cp2615_check_status(enum cp2615_i2c_status status)
      |     ^~~~~~~~~~~~~~~~~~~
drivers/i2c/busses/i2c-cp2615.c: In function =E2=80=98cp2615_i2c_probe=E2=
=80=99:
drivers/i2c/busses/i2c-cp2615.c:244:2: warning: =E2=80=98strncpy=E2=80=99 s=
pecified bound 48 equals destination size [-Wstringop-truncation]
  244 |  strncpy(adap->name, usbdev->serial, sizeof(adap->name));
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The missing 'static' are what buildbot also reported and are correct.
Please check the others if they need action. Especially the strncpy
thing.

Other than that, it looks good. I like that you bind to the IOP
interface only. Keeping the CamelCase is also OK.


--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBkIBUACgkQFA3kzBSg
KbYCxQ//ZBDf3ywaF011ykcNSNDYxnUwsQalRfCEneAp0IKo12neqBIdVETIggDN
/kS5k3kt8DHneJnxoaZbLf3wTEWBwNfnS0S7ewNvrke/I++16z8Tl/aimtI9GOp1
KVPky41c/f9Woupt/orXUeuOZe2EZtkohSPIDi5CEJQGanheEcoY7iju+d4Lr0Se
O/tfClphbbTZiOeUSMDIJ8GdNNTIUGrHW5731wRY3+lInn2TcRpQwsSxRRexhYkE
NR40o8q7HV8ocU/QMNXYP3fbjWj9qWU3SYBJTPKW3LfJGtQhSRr68o7TiCzi+mUO
/ovR2Z1dtulptyhScyHdMpGLgE+tm1FJbEKCu4e0IcyN/WJmkjRFH8Zrolc+lm63
0ETunluow3e9m4czmkJ3LeGo++Ex5TjkjSctw6L1tbdRhnEyvX/xtu5k+UAegEn2
fkLUD9tDwFbibQhxSU/ixkSIT5sZEfcfsntI2B44uKu4RM2y5HMQO0fO+257sdyc
g9tfNhISV+/GlSNwX58MNpSMZICjuF7j+/z9BVO0A7l7GgaNJqALE2Dn3opNh1zP
19pFmeKKygqAtKgcCcB9klOHpas2oDPDsd+SKy+bWCWbGENuHGF3cKgLWiRyg4rV
yTRMUU0QJ2GSx7C/7DfysxixV7gPQFsUPZ6QnmEj9A8+qypJDEY=
=VqNI
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
