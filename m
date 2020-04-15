Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5ED81A9BE7
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 13:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896814AbgDOLNP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 07:13:15 -0400
Received: from sauhun.de ([88.99.104.3]:52850 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896802AbgDOLM5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 07:12:57 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id C08EA2C1FF1;
        Wed, 15 Apr 2020 13:12:55 +0200 (CEST)
Date:   Wed, 15 Apr 2020 13:12:55 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Aishwarya R <aishwaryarj100@gmail.com>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: powermac: Simplify reading the "reg" and
 "i2c-address" property
Message-ID: <20200415111255.GP1141@ninjato>
References: <20200408100354.17782-1-aishwaryarj100@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mejza3ZMMA5Za1mX"
Content-Disposition: inline
In-Reply-To: <20200408100354.17782-1-aishwaryarj100@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mejza3ZMMA5Za1mX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2020 at 03:33:53PM +0530, Aishwarya R wrote:
> Use of_property_read_u32 to read the "reg" and "i2c-address" property
> instead of using of_get_property to check the return values.
>=20
> Signed-off-by: Aishwarya R <aishwaryarj100@gmail.com>

This is quite a fragile driver. Have you tested it on HW?


--mejza3ZMMA5Za1mX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W7DcACgkQFA3kzBSg
KbbKcg/+LuL3CQDRqRDK5QM2XE52jwFinJ8KZNx2KhKdg3UvWQMcWqt+V0ZvVy0F
NTo355uvwsvO9dtuemowZmBP6QgS6SPBWktIpn7FX73l5CCx4YT9J/LsHYnJOoCR
2xm3Ai02XtRv3cB6E9jCKXqLz1gxKdmQVDmVcjODqiqDjzppgXuQhsEDeTb6/jpK
6Blt2slVkB2GYEakAuV5+4lLXdAFb7Gl1+VIGxnBYz0H5eGdzU/i3TC5Zbr3FFWT
tjaFJmnQIPQc9kjw2vXy/UZagb3KQ+9nJe1/55iF9VyaA8u7wpS8dPBwXLuKuqX9
PrHffSmjd7MIVvMXEVq/lh3z3cxk4eFKz8uCh+XYBPFVDpTfyupZoa2mxZHqPk4E
WxpRhoSRY7rG/GyO8dGaMfQdYL+9mX+tDI8is3U4gfUPXqaaTRogZ/85T0Y7rZIN
xs2IO8SC/e8TAQqQ1SbH4oErJk4QjyK9n+YprFiirsm28U8D0FD7/Kiy8nFny/17
4j8DB2xTwtyZyVg8OjPojUm00XEPGZEUFdsYgxUW5nesk+lZkDvlVAWgUg0v9rWO
BjM+OWhc3ShIar6Wp2W8Zog18i5ds4wTYNqMPjI8VUv9muuYxMOUdZGD/oUKcylf
rMBsGgX0hoTe6KVyd+MP9ER4nhckHKMgemOKQJuF14sFRUi8Ri4=
=XD4D
-----END PGP SIGNATURE-----

--mejza3ZMMA5Za1mX--
