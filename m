Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 060E313CDE4
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 21:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbgAOUOb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 15:14:31 -0500
Received: from sauhun.de ([88.99.104.3]:41318 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729061AbgAOUOb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 15:14:31 -0500
Received: from localhost (p54B33239.dip0.t-ipconnect.de [84.179.50.57])
        by pokefinder.org (Postfix) with ESMTPSA id 693B02C39C2;
        Wed, 15 Jan 2020 21:14:29 +0100 (CET)
Date:   Wed, 15 Jan 2020 21:14:29 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     shubhrajyoti.datta@gmail.com
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH v2 1/3] i2c: xiic: Add timeout to the rx fifo wait loop
Message-ID: <20200115201428.GG23789@ninjato>
References: <d328af197cc5fec64d203fa45b768571f28a54b2.1578569758.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6BvahUXLYAruDZOj"
Content-Disposition: inline
In-Reply-To: <d328af197cc5fec64d203fa45b768571f28a54b2.1578569758.git.shubhrajyoti.datta@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6BvahUXLYAruDZOj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 05:07:58PM +0530, shubhrajyoti.datta@gmail.com wrot=
e:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>=20
> Add timeout to the rx fifo empty wait loop. Also check for the return
> value for xiic_reinit and pass it to xiic_start_xfer.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Applied to for-next, thanks!


--6BvahUXLYAruDZOj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fcqQACgkQFA3kzBSg
Kbbjiw//TzovoPTEZcEUkvOG5bJ0Zajiex785a9pCTLNXaXhudPD3kY1GlpJ+FSU
d1BjZoOjjZ52YBBx9yKa7iGjTq7QG/tV5+YzM5JzpNG5Q707rEIrPlLQ/wlx1EyP
igiUjP6Ny6dq4NTgOkEnjZIxtOmSGMbX8AvECG4ZTEyLhWqVp6qHhEZn0rH9AxQz
GX1Lr9pB8yZhjgiUyH0LQZQkA3ym5gQwM80uPGP+abyW/103KrAVPOGmLAcdDHjx
eNZFtHty7NoVvyLqKNmaDM7cgH9SMFJQyWYqRgXEoRjBikAZgkeWu1/F3mad6HVh
oWnFj7cQlNfhUz4pMRK8I+Gd+ndxMOsZPNRSSjm8LT37xBEBDF9omLEQMcb6u6Cl
6H7qlFQjX8mK3jhNnYRCo57327iJU8O0IlNZmeRPwMxxOZmhOBRh3oHtiUZbXLU/
LuRfQq2oBSPiwPI0kFf2stx2rnO7ec6gEDuBmwZ8jw0b1gpoZMBmHtWTcD/t32iW
u55eO5djEy6DU0IT7A200klr67/XaqdgK35t4kI5QkSjv+toXJl2HYnGMtdrxdmO
BAMFbSdZJkEMdWZcrCW6I6KpqZJs26aPK9um6B6Pjk9wRVlhDgYvnBA5rxWRIncx
kO0YqfrtddX4IB4bkQc8mj7aCZ0JGVi1L6vr1P17iHZzf1QUfAw=
=vvwU
-----END PGP SIGNATURE-----

--6BvahUXLYAruDZOj--
