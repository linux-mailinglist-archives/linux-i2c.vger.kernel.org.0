Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A88A97E446
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2019 22:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfHAU2t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Aug 2019 16:28:49 -0400
Received: from sauhun.de ([88.99.104.3]:56894 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725846AbfHAU2t (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Aug 2019 16:28:49 -0400
Received: from localhost (p54B333D2.dip0.t-ipconnect.de [84.179.51.210])
        by pokefinder.org (Postfix) with ESMTPSA id B2B762CF684;
        Thu,  1 Aug 2019 22:28:47 +0200 (CEST)
Date:   Thu, 1 Aug 2019 22:28:47 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Raag Jadav <raagjadav@gmail.com>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] i2c: at91: disable TXRDY interrupt after sending data
Message-ID: <20190801202847.GB16487@ninjato>
References: <cbd93920a225e2e32c7f43ff417f301af57c4e6c.1563820695.git.mirq-linux@rere.qmqm.pl>
 <20190731123734.4ixxlurouni6nopp@M43218.corp.atmel.com>
 <20190801170552.GA3873@pc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline
In-Reply-To: <20190801170552.GA3873@pc>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > [v5.2 introduced file split; the patch should apply to i2c-at91.c bef=
ore the split]
> > > Fixes: fac368a0404 ("i2c: at91: add new driver")
> > > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>=20
>=20
> Tested-by: Raag Jadav <raagjadav@gmail.com>

Thanks for testing! Because I needed to change this commit message
anyhow, I added your tag as well while at it.


--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1DS38ACgkQFA3kzBSg
KbbrMRAAhO6XRrdBH0/H+Wagr0xenobKfeRo/Mg7r3q9n+sm96vnqs3bJbgJnPiA
KJ858WT3Sinj+9U5QfwECoH/zBU9N/oI7y6/yL9wl5WM2A9TyYWh/7Xa+EMz2p+T
hRTJZyrmsy882e+X9tavk1t9EcPEtIdaHpQx4pHC6A4qRhAFw/HdbfZ1xhfvAIQM
nppXDGtvD8WoV+hYkcTYn/RzkRQED/be2OVuGq/Nz5gHYD+ajCk4kIa7NXtsVF12
+EDr+c/xNKJtMpAGxPOcYrSUKJiUmT2R/poj68huieZnWgK7X3FQMvQ0zu6b4Eyk
FWmEg4HbOPkQ7A5l1yEesHqtk77cy5ZVtLXyGFNBEikNy+84K9D2JKQzHH8NWCDq
2XfHYlinOuVnDGXF8/x4K7dmV4XRHUqeWuLx1Q1bz5uuXveCV8dbom2jhfUF/kp6
yDDT3iLbmNiyqva0dYyqtgs78DD95dGPiicVT4dusjy/p8sxw2cfV5WtA/58CcqA
FU0tTHXxU6sgAzD/sSHRZ94S07Wg+G+fib3QVWGHakkM47jGNTIBfHEfhwUJXh3i
qxcxppSP0bTJtCLlEFB9yrjHHWFT5ibACrC1xWQ8MAZMt1tECFpaDht4qgXH9C4Z
8Kqd1vqrqtvrG/94eUJs6SEVlk0WZP366tEY3Yb1InjrUdMomOY=
=GmL3
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
