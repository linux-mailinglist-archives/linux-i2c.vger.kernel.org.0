Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88DA5A26FB
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 21:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728546AbfH2TGl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 15:06:41 -0400
Received: from sauhun.de ([88.99.104.3]:42400 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727437AbfH2TGl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 15:06:41 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id BA9D42C001C;
        Thu, 29 Aug 2019 21:06:39 +0200 (CEST)
Date:   Thu, 29 Aug 2019 21:06:39 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Max Staudt <max@enpas.org>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-m68k@vger.kernel.org,
        linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH v5 3/3] i2c/busses/i2c-icy: Add LTC2990 present on 2019
 board revision
Message-ID: <20190829190639.GH3740@ninjato>
References: <20190819121618.16557-1-max@enpas.org>
 <20190819121618.16557-3-max@enpas.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kHRd/tpU31Zn62xO"
Content-Disposition: inline
In-Reply-To: <20190819121618.16557-3-max@enpas.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kHRd/tpU31Zn62xO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 02:16:18PM +0200, Max Staudt wrote:
> Since the 2019 a1k.org community re-print of these PCBs sports an
> LTC2990 hwmon chip as an example use case, let this driver autoprobe
> for that as well. If it is present, modprobing ltc2990 is sufficient.
>=20
> The property_entry enables the three additional inputs available on
> this particular board:
>=20
>   in1 will be the voltage of the 5V rail, divided by 2.
>   in2 will be the voltage of the 12V rail, divided by 4.
>   temp3 will be measured using a PCB loop next the chip.
>=20
> v5: Style
>=20
> v4: Style
>     Added other possible addresses for LTC2990.
>=20
> v3: Merged with initial LTC2990 support on ICY.
>     Moved defaults from platform_data to swnode.
>     Added note to Kconfig.
>=20
> Signed-off-by: Max Staudt <max@enpas.org>

Applied to for-next, thanks!


--kHRd/tpU31Zn62xO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oIj8ACgkQFA3kzBSg
KbYTIg//aO1FrBTmT/QfrKtesFvAvdPu7gvw0MG4I219fbET8QCNiv0qj66cmeru
By6FNeH7UIuOAABpKfsJfnQX35VEs758AzrGwD8A47xE7TO/aN94nuhQ9QYK1GJB
0mxAIkuQ0rkFp/+elWzyRAyALjad4lI+vZRYkgZnGLr3j0FGg6ObEdRccn8OnmdS
B/Jn2+5DhDKj4gNX/xHCxl8vmnYFiXOIZp4XKxblYqu/HY9KM7BgdNV6eonpN6ZD
OXScHi+J6CKVg+pOoI/PWvoyB+vPFo+0DZwtGKLxDkAoGmqKtIK5AFZbWQnzw0uz
S8WqmH0AbVi1A8aXb0YfxgunL96L5rqHaIZx3i3jUi5W9GGA3PTRCHdhMzzDt1DX
iJW72OyuU7fWlOl0nTKzOTeIpthboTcolH8d3vnFFhpi0hYiYwrP9rI0KP+t6in6
91F1WkZDHK1ukp9+LjUkeLcmfIzNFc+UMsUeocUu2WL49hwQWN5O+4O1w9DqvR9v
yb8oNZO5PnBzpaPM2iQV8cfPe2/weJiGfBs+K65NCbmOn8KvlKGzPL4eMCGc62ZL
cPop+da0XRBAWGo2diN9BkhzTtXWSPTMJDZUAC5mLaRXWD/8AEU81J9JSdpWMvi6
J9K2b6hUzqINpzVYh+TGVyXZSy+j8MljaAswUTrAHjjRnXDI/XA=
=7zkG
-----END PGP SIGNATURE-----

--kHRd/tpU31Zn62xO--
