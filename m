Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A27A7DBF8
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2019 14:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731330AbfHAMyN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Aug 2019 08:54:13 -0400
Received: from sauhun.de ([88.99.104.3]:52654 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730334AbfHAMyN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Aug 2019 08:54:13 -0400
Received: from localhost (p54B333D2.dip0.t-ipconnect.de [84.179.51.210])
        by pokefinder.org (Postfix) with ESMTPSA id C15AB2C2817;
        Thu,  1 Aug 2019 14:54:11 +0200 (CEST)
Date:   Thu, 1 Aug 2019 14:54:11 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-i2c@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] i2c: at91: disable TXRDY interrupt after sending data
Message-ID: <20190801125411.GJ1659@ninjato>
References: <cbd93920a225e2e32c7f43ff417f301af57c4e6c.1563820695.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="huG+SbfbdD6eblZQ"
Content-Disposition: inline
In-Reply-To: <cbd93920a225e2e32c7f43ff417f301af57c4e6c.1563820695.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--huG+SbfbdD6eblZQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2019 at 08:55:27PM +0200, Micha=C5=82 Miros=C5=82aw wrote:
> Driver was not disabling TXRDY interrupt after last TX byte.
> This caused interrupt storm until transfer timeouts for slow
> or broken device on the bus. The patch fixes the interrupt storm
> on my SAMA5D2-based board.
>=20
> Cc: stable@vger.kernel.org # 5.2.x
> [v5.2 introduced file split; the patch should apply to i2c-at91.c before =
the split]
> Fixes: fac368a0404 ("i2c: at91: add new driver")
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>=20

Applied to for-current, thanks!


--huG+SbfbdD6eblZQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1C4PMACgkQFA3kzBSg
KbbXOA//YUJRNYYceulCQU9cxSmo121EG1To2Lbvr071Bd3sbHq6ZiTDEUdF6giG
YRLytVqXDDolKdrFm98C4w/5wQc6Pf0Xou4I6DZNARoX+huZm2jsNuIA923PbANX
nbd2qRTHq7O9O3zkaUM4YI2SozSFX46gmYTwbpt/WHJI1u1y6hhLJJLk16j7XFWl
8k3GCRZ43sNfIo4mwU8iw7rKFLIH+A7cn4xg/L+wrszVDkDNc5Q0grGz3EoiGIII
xFLdYoKMA5hyUndWqCF7mzSNCkspXEgnT+W+leq+MOgnJQsAFX5jSsWgYgcORe6H
SMQvLKFWwzEQ4p/EKbvT8xg+7ZZEzausvJubZPid4j4bseoBaCVKF/PP5M1x56fa
kilMm8l5DBrONoDhGei8pKaUsxCO5/77jckWsKRG47dPepcX48x2FbCfRtRu8jZB
x8fdbwlUSp5ogpTGjXqZDpL40wlk4aiwLEEUbKKb0w4sGd6zW4uoYv+G9td+MLF3
vLByctHfzI6WbvuM/hrF/17zoZ/oAq28WY0C8EyECyHCjQzJlBRK+EUxIbvc2fB3
cR/oQQ+PKgYhttWZbWczxshSYSft3aCFPpsTo7yW6DJf3NuU6qFAwXVF1PA7gJD5
MVclVeR7IQT4pVsDVQB8HrHaAwzuAkmIQGQPGparR6M1lUnmIv8=
=oFkO
-----END PGP SIGNATURE-----

--huG+SbfbdD6eblZQ--
