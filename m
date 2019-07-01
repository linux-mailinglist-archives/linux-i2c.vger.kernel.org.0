Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB0425BBEC
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2019 14:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfGAMmU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Jul 2019 08:42:20 -0400
Received: from sauhun.de ([88.99.104.3]:55634 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727128AbfGAMmU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Jul 2019 08:42:20 -0400
Received: from localhost (p54B3346F.dip0.t-ipconnect.de [84.179.52.111])
        by pokefinder.org (Postfix) with ESMTPSA id 77D0A2C360B;
        Mon,  1 Jul 2019 14:42:18 +0200 (CEST)
Date:   Mon, 1 Jul 2019 14:42:18 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Cc:     Rob Herring <robh@kernel.org>,
        Eduardo Valentin <eduval@amazon.com>,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@intel.com,
        brendanhiggins@google.com, Mark Rutland <mark.rutland@arm.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCHv7 1/3] dt-bindings: i2c: document bindings for
 i2c-slave-mqueue
Message-ID: <20190701124218.GA4399@kunai>
References: <20190605164651.15991-1-eduval@amazon.com>
 <20190605164651.15991-2-eduval@amazon.com>
 <20190611231425.GA29500@bogus>
 <b3e5ac5c-baf7-bc8a-701a-4af3b8983155@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <b3e5ac5c-baf7-bc8a-701a-4af3b8983155@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Looks like the slave reg missed the key value bit:
>=20
>=20
> https://elinux.org/images/f/f6/ELCE15-WolframSang-ShinyNewI2CSlaveFramewo=
rk.pdf
>=20
> Example: reg =3D <(I2C_OWN_SLAVE_ADDRESS | 0x42)>;

Yes.


--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0Z/6YACgkQFA3kzBSg
KbYYWw//eSVKk0pxgmvKMkr3qLS+I+sytYlhN5VtnDJhdVFrxi5wdKyIF4liX0A0
nR1H+nnK76LlveIMWsWNSIOm44UNckqlcoNpfucCTgRBssPoS1vvrkbZtIzb/Sdj
v3RaA6417TOkdrfm6T5IcLoKtR8Au9oydZpowrfyqWDxMw/D0JABGZvpfo6tKrnU
a29NmaNzi4zdPBtK51uT0pCHbCGk4lAwl4uRtsss75kDIXgtsXud1gDQUhhuX+VO
0WDdo1jg4WcTu5hsX/vPmxONH27eQmkFQEnWvYgvrhpjf96C1eXFfgEe1xQijlJx
w2p21LlgpziCLVZp5Ae+YhMDheZ1Z7MDflGBeZlsSDRtRuOx8JHp23VC/6/5hK5C
1IRI7qQ/Ql464Zy15KRw/6KlH5eIVfo3+s4ikc3gMoaDrfAW9J1U++BgqQbA6ZIn
lcK7eezlmCBZ9eu79v0miGsEH5wI1nD+X6ch/peOIWMH36SnH7bFTsUtXlM5jrLq
2yuUEbgldT2JTs7Tabayfc/26Ku58k4FeWqKI0VAlxJb4jRUudlixqntVtGqhdHW
99elcR6mcfohFx5jzhc8ui4YagyLr8z9BQeDVG2CsNAFRT5WvQBtPDFIPx+OxFTb
B9ZSFj38jdmlOqPAmbXiTJNNNzdCkr2ca9Oloz1prFq6HXyJ0qQ=
=Clag
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
