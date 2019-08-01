Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6A407DBF9
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2019 14:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731335AbfHAMyR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Aug 2019 08:54:17 -0400
Received: from sauhun.de ([88.99.104.3]:52666 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730334AbfHAMyQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Aug 2019 08:54:16 -0400
Received: from localhost (p54B333D2.dip0.t-ipconnect.de [84.179.51.210])
        by pokefinder.org (Postfix) with ESMTPSA id 4D4872C2817;
        Thu,  1 Aug 2019 14:54:15 +0200 (CEST)
Date:   Thu, 1 Aug 2019 14:54:14 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-i2c@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH] i2c: at91: fix clk_offset for sama5d2
Message-ID: <20190801125414.GK1659@ninjato>
References: <90b284b92b1ce27a682526db8a8c5e6dc5eeb5f6.1563822220.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wIc/V6YLA2QdyfT4"
Content-Disposition: inline
In-Reply-To: <90b284b92b1ce27a682526db8a8c5e6dc5eeb5f6.1563822220.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wIc/V6YLA2QdyfT4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2019 at 09:05:56PM +0200, Micha=C5=82 Miros=C5=82aw wrote:
> In SAMA5D2 datasheet, TWIHS_CWGR register rescription mentions clock
> offset of 3 cycles (compared to 4 in eg. SAMA5D3).
>=20
> Cc: stable@vger.kernel.org # 5.2.x
> [needs applying to i2c-at91.c instead for earlier kernels]
> Fixes: 0ef6f3213dac ("i2c: at91: add support for new alternative command =
mode")
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

Applied to for-current, thanks!


--wIc/V6YLA2QdyfT4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1C4PYACgkQFA3kzBSg
KbZFSA//TRJXsEMdVwSLj3eU7KRggVg5xj5gtVCvHg0BqnSnYoIHIKz7pTlKG00V
4h/qWAucV2fL+AhF5o2FrLZruVAjTtQnPY52G4A8pEzVSDt/8Cnc/SUYn/BKg/GE
dVmC7LQiHM5QGx+nGX60Ae/s0af0O+bI+DqxKRhOjUDLykU/NyBBekaUL4VDFi08
QDY62uKGn8L1dPOkZYpzgFDa0SIIsJWSUhxeL16bc7eJ2y0+mD2TtmGj227jdZao
anYHCeNuGZb0bfBqy1Qw4j3Yy0lub0Ypv5yUHtMrG1rOe0sYX2lTBkeY66470HUc
97rQkSfkS0dvurhmTG9c4DMUjwsna/PHjsSd0ZE0lLnwTPKIQRAaXr5UHNTa6wq2
O7a6Z9CCnbmR8e2Wni34zLuYgiaT/x0ucrkqPypjjiq6+/wc+lSGe7PTENqzWGGk
Qw+qnCi8sZkWJGqDtU9u956NeP/mOnv+0eMAvL7XKQfQQYCe1qM7fIw9zGH17KzS
tH1qdXUPsZC5ecBE5+0TX/9/zZ8zn2tdP03cqFXT3JMbOi6OfLC9UAl91ZU5pWZr
gykiOcCSphJTzXCYGdEwEpKPCGDx9M6DNXWq/mixcgnEAUN2azEs4xJ7vcxnI0jV
tD9LxsXnfD0HOZaonJxj+BuWsqEjUbofUNR7RO8Sx+7Ia+sFtkQ=
=A49G
-----END PGP SIGNATURE-----

--wIc/V6YLA2QdyfT4--
