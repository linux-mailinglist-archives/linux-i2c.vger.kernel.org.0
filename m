Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A95174885
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2019 09:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388578AbfGYHzl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jul 2019 03:55:41 -0400
Received: from sauhun.de ([88.99.104.3]:47736 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388335AbfGYHzl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Jul 2019 03:55:41 -0400
Received: from localhost (p5486CDF3.dip0.t-ipconnect.de [84.134.205.243])
        by pokefinder.org (Postfix) with ESMTPSA id 3A54C2C282F;
        Thu, 25 Jul 2019 09:55:39 +0200 (CEST)
Date:   Thu, 25 Jul 2019 09:55:38 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sean Young <sean@mess.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: ir-kbd-i2c: prevent potential NULL pointer
 access
Message-ID: <20190725075538.GB1323@kunai>
References: <20190722172632.4402-1-wsa+renesas@sang-engineering.com>
 <20190722172632.4402-2-wsa+renesas@sang-engineering.com>
 <20190725051202.o47mz4unbn63z6uk@gofer.mess.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline
In-Reply-To: <20190725051202.o47mz4unbn63z6uk@gofer.mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sean,

thanks for the review!

On Thu, Jul 25, 2019 at 06:12:02AM +0100, Sean Young wrote:
> On Mon, Jul 22, 2019 at 07:26:31PM +0200, Wolfram Sang wrote:
> > i2c_new_dummy() can fail returning a NULL pointer. The code does not
> > bail out in this case and the returned pointer is blindly used.
>=20
> I don't see how. The existing code tries to set up the tx part; if
> i2c_new_dummy() return NULL then the rcdev is registered without tx,
> and tx_c is never used.

Yes, you are totally right. I missed that the send_block function is
also only called iff zilog_init succeeded. Thanks for the heads up and
sorry for the noise.

>=20
> > Convert
> > to devm_i2c_new_dummy_device() which returns an ERR_PTR and also bail
> > out when failing the validity check.
>=20
> Possibly I was being overly cautious with not bailing out if tx can't
> be registered; moving to devm is probably a good idea. However the
> commit message is misleading, because the existing code has no
> NULL pointer access.

Yep, I will resend with a proper commit message. Technically, there is
no need to bail out anymore because there is no NULL pointer access. My
tendency is now to not bail out and keep the old behaviour (registering
without tx). What do you think?

Regards,

   Wolfram


--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl05YHoACgkQFA3kzBSg
Kbb0Fg//T+O24dPRZUIRCXb4QStDI05XO3V3ecMujrNrRI3ZVB/TX3AQFQ14WKAu
W3p7vv/8BxSRDhrLvEFzEOuSSxTzp4HjU7//jo8OkbccUrK2Sd9OAC/IXstHGcR6
BVO49QDcRF7BGVfQOoxwo4pjNxg9EMRPlmcaOzvZ6FhHC/jbRn9DmkRgDaWbDPba
dpjCiqlbihvCkcDkIPEfCuOTmEOZaceBKWKgawJ2eoN+0MivCPbRkoT0fdSa00H4
qiAbSrWvH+hg96+fkp8AJeDx3wkRC/YQQA4HL9ibJLiPv8qkImqu0oOhZ2y6VwYt
ek9LSUO/eAgRu+KYPbjoS2oAml/oqZFB9XSFg4NCNDAGU0qLznCpe3TJ6WqAsrwI
hA69F9vECYLx22YH/Zg6mRaf0Zyb49yoFIRKj3ZqtEwVys6a4170c6C3iR8qEycK
i4qHJzWn37P7lblZvc4Do5uo5yx6qNZKSFWSzH5qNGMhMl1qMErMQ7aASGH0/dD9
RguCYcVMwPpsaItrUDE2P78DPSPdXRpCOoY8iwYjHhyaZ5BFQKUVz0l7L/gqAOyy
O3YKbBoQrzCLC/Iu8iRsleqiL+s8+KUfz5jyeoPncRMoygtv8lgB+NUPZY7VAgL8
1FGG4/REIoTIUVn7Wen8lVvuQiLGj2XjcJ78m1dosv2JeIi2Gz4=
=XMJb
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
