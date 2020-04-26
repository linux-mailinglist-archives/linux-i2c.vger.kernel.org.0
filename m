Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2FD91B8D92
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 09:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgDZHmC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 03:42:02 -0400
Received: from sauhun.de ([88.99.104.3]:42758 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726110AbgDZHmC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Apr 2020 03:42:02 -0400
Received: from localhost (p54B33954.dip0.t-ipconnect.de [84.179.57.84])
        by pokefinder.org (Postfix) with ESMTPSA id 489E02C01E8;
        Sun, 26 Apr 2020 09:42:00 +0200 (CEST)
Date:   Sun, 26 Apr 2020 09:41:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        patrick@stwcx.xyz, kernel@axis.com
Subject: Re: [PATCHv3] i2c: slave-eeprom: Make it possible to pre-load eeprom
 data
Message-ID: <20200426074159.GA1262@kunai>
References: <20200424113036.15109-1-bjorn.ardo@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <20200424113036.15109-1-bjorn.ardo@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 01:30:36PM +0200, Bj=C3=B6rn Ard=C3=B6 wrote:
> If the slave eeprom has a "firmware-name" in devicetree, then
> pre-load the data in the eeprom with this file. Otherwise we
> init the eeprom with 0xFF.
>=20
> Signed-off-by: Bj=C3=B6rn Ard=C3=B6 <bjorn.ardo@axis.com>

Minor cosmetic changes added and applied to for-next, thanks!


--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6lO0MACgkQFA3kzBSg
KbbNgBAApN1/DcJCmQisIY69ZctEf8kWkD1Dd/r4J2tyWguxXWL4Y2QEDOhdyd9q
l/Bg1sIq14yc16fk4rXZVTWOi15b/DHlLiq5ti5Lz1GxgaTry1Y0PuXCuiBUOwa0
JPv07ZUG2JW6hC/rORAZJp/BgIoZu2QM+CN0OpKXbPutkJtSnXVyLQbwokRTaO8I
YKRwR/pl7MUTmf7gFcRRLffhCdVfKLkmrotFMgkiI1LUdgQldS2E22lbs2/43kVc
IfOCpu1ZemgE4KTi03VMY9Ohi9b1jvxK+HoCc+wcicTg8BXoRxL9gZY7PE0/x+WB
BfevmED46X2n/cIFLt2yuLhSVR2GkzqG5V4maA0lrT4mRFJfHac4jffxvM2ase2x
cqTos3fnc7QGpww0E0ka8chwvRPGZbrHHw2ULXjLsplPJnnVMnDKtrlep1luqP5n
SYr57UdS82RE2weOUG1J0ZKIcn/EUDhG1FE5fgPvre5ymZ+TNmViz7YqBWIe07Ra
EFXS2/1wUtfhpkGste5HxKvm4B+wzjNsEMkorsyJgDWOpDWOuPSdikkm9er9EJDQ
ftwDFamyz49QrgGgg5+ccnJN6v+z1PQE+SG0Wxd9cy11L8MlzP2GezNTh7oxkrFU
XS2TPdrbAARw9kpKwYIsE3fZ1k4jfaTuGlQadNKEERRoGA8Y+ok=
=2yx8
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
