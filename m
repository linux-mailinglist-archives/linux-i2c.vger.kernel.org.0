Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9682723D7FB
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 10:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgHFI0z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 04:26:55 -0400
Received: from 7.mo3.mail-out.ovh.net ([46.105.57.200]:40224 "EHLO
        7.mo3.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbgHFI0z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Aug 2020 04:26:55 -0400
X-Greylist: delayed 2392 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Aug 2020 04:26:54 EDT
Received: from player774.ha.ovh.net (unknown [10.108.42.119])
        by mo3.mail-out.ovh.net (Postfix) with ESMTP id 2612025C3F0
        for <linux-i2c@vger.kernel.org>; Thu,  6 Aug 2020 09:09:30 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player774.ha.ovh.net (Postfix) with ESMTPSA id 678AE151CBA45;
        Thu,  6 Aug 2020 07:09:27 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-100R003ae728b2c-0a5b-4560-ba92-7fc4479bba6b,
                    9D5F4B8471F7AF6BEF45141B8B52B4DEEC6DEFE4) smtp.auth=steve@sk2.org
Date:   Thu, 6 Aug 2020 09:09:26 +0200
From:   Stephen Kitt <steve@sk2.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove the 2.6 "Upgrading I2C Drivers" guide
Message-ID: <20200806090800.08b77d4a@heffalump.sk2.org>
In-Reply-To: <20200805215351.GB2182@kunai>
References: <20200805183149.21647-1-steve@sk2.org>
        <20200805215351.GB2182@kunai>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/kgU_wN_WIe/3qfVl_jWGz_t"; protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 12441756922702286274
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrjeelgdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtsehgtderreertdejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeevledvueefvdeivefftdeugeekveethefftdffteelheejkeejjeduffeiudetkeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--Sig_/kgU_wN_WIe/3qfVl_jWGz_t
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, 5 Aug 2020 23:53:51 +0200, Wolfram Sang <wsa@kernel.org> wrote:
> On Wed, Aug 05, 2020 at 08:31:49PM +0200, Stephen Kitt wrote:
> > All the drivers have long since been upgraded, and all the important
> > information here is also included in the "Implementing I2C device
> > drivers" guide.
> >=20
> > Signed-off-by: Stephen Kitt <steve@sk2.org> =20
>=20
> True! Thanks.
>=20
> But I can't apply the patch?
>=20
> > base-commit: 2324d50d051ec0f14a548e78554fb02513d6dcef =20
>=20
> Maybe because I don't have the commit in my tree? Can you rebase on top
> of 5.8?

Ah, yes, the commit is on top of Linus=E2=80=99 current master, following t=
he merge
of docs-5.9 from Jon=E2=80=99s tree. In 5.8 the file is a .txt file, but Ma=
uro
converted it to .rst for 5.9, and this patch removes the latter file (to
avoid a merge conflict later on...). If you prefer, I can submit it to the
docs tree instead!

> And please also remove the reference in Documentation/i2c/index.rst

Oops, yes, I=E2=80=99ll do that in v2 once we decide where it should go.

Regards,

Stephen

--Sig_/kgU_wN_WIe/3qfVl_jWGz_t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAl8rrKYACgkQgNMC9Yht
g5zSLRAAhKG82QKWhcfBEqXAUYW+EI/HS4cuNBAHc7jtXMtRu7AHa7IWbTNUREg3
D4bgLDHTCb605RUYkcQNhHsyIwtX7E+TKW2aXOyCb3fSV13JQQ390twdyD3MQ+nB
+h/wVup17oOrSJ1ff/ZuJ5Hew1kRJmov8hHsicOxAhxQiiHUarIHh3bxGYU+4+iI
LeL0IzP2gyvm9gUP4SIDHSaLhz/80ESr1K5ZUM7BjfMwiMULw0MzAFc50fTHO/FI
wW4NJxR3eW1U3kmF/EhgiPJBUdhT/8AUyqD9IDo2dfvfAnypyby6EwTJlCFq/M1G
o7vdVWVVCzj8ozZY0uLiOW9t3g+LUDtSrZbCcT6ZaSzbbxkMjlfC73qgwXBRiBSC
RovhF5r8STb398bLJL2wpe5uvP5NJwj9Vtl030itXFtsRefQwow45CTSV0Z4nSGv
RGMceBwwLAeF75A07fPFnruuHCb+Aazmh0JFdb8BIaj6DwaEFyuvAwOOhQSrDuLj
tkS+/f5SQykJknaGH8ZohRNJ/36/iBZvhDPzZkpQQeNr/rDpSG80D+ZiUVe2ZZX8
rQaGeeLhk/+SwD4CyiHjBhzcgOt8vDCd19ua/HVKZnpiYveuMpY61fqiXLVoeNaW
BQ2Vx2lbfyEL1j92/uY2V4nHH0BCFyUqqfN8ECg8TN5FlTH5K6E=
=qNI2
-----END PGP SIGNATURE-----

--Sig_/kgU_wN_WIe/3qfVl_jWGz_t--
