Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBFD90F7F
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Aug 2019 10:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfHQIaT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Aug 2019 04:30:19 -0400
Received: from sauhun.de ([88.99.104.3]:54100 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbfHQIaT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 17 Aug 2019 04:30:19 -0400
Received: from localhost (p5486C5A7.dip0.t-ipconnect.de [84.134.197.167])
        by pokefinder.org (Postfix) with ESMTPSA id E68562C290E;
        Sat, 17 Aug 2019 10:30:16 +0200 (CEST)
Date:   Sat, 17 Aug 2019 10:30:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V2 08/13] i2c: bcm2835: Avoid clk stretch quirk for
 BCM2711
Message-ID: <20190817083016.GA1315@kunai>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
 <1565713248-4906-9-git-send-email-wahrenst@gmx.net>
 <20190814193628.GA9756@kunai>
 <bb924d04-b4a9-56c7-c7d5-31f3cc8c1da3@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <bb924d04-b4a9-56c7-c7d5-31f3cc8c1da3@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> quirks =3D (const struct i2c_adapter_quirks *)of_device_get_match_data(de=
v);
>=20
> would hit the line limit. Do you insists on the cast, because it's
> actually not required?

Not at all, I mixed sth up and forgot that of_device_get_match_data
returns void*.


--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1XuxQACgkQFA3kzBSg
KbZqww/8Caf0okFY7IK0Ft6q6YcN2wNLlAFl3EYp1noT/64s7GDZE/wIPPL/xf2K
wP3EXxEIlAqnI2b9dw+L5uF4UIKOJlMnH6xQC5mtm+xNWgyTzFG/10gb6vPMdVdY
8PsXASQzotqQW6BZUVMFwyTusvu7X6JXrMJm+fO8VPMjfyd+RPIV7IWiKddz+jo2
XV7FJWnnfWG2LU+EMpIyu2g3TzQAlZxEa6LZb4pkG1SG7Vi38g6Ne1vKxvHwRSFS
MeyW9G81d3nidCBlif+xpHG28hSv9hkK013M5JD4guTaOUMAgDUdVn5ds7zkKw1x
KsUeYmpH/UcCqrZ3vRFh5Fw4CqRZB+VydC5QOo7bDjUuWy+PgufGgNOe3pLYoH8f
ztWK9Il+DEUnT73OV6r+55MiRHXm7NaecC36v1lNsZUT/aCZqnUS29vt/u28Etvz
ESJxRIDLjoGSg8CGyW1/zqgHe0lCjZEZCpx0ou6VtjsDGLHrSfdqWHb5Nz5nQLg8
osUepGUo4rZ8ucapKZrYA6LJ7TkwaIRdHLUQQzJLceTOaZXeXGvrGaTX8r1Tg8bA
69FjU2hlqro5RNCJ9ECTsF8jXpQQ1EwXEJ8w7ck2OuZlkMSFq5TLIFcdLrNe31Xd
ampw0Qtlja1zafuXEgRsiemWsfXoy+7kxW7tK7QNtPmitWp2Ruw=
=Ip2v
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
