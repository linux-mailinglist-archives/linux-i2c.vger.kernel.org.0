Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E419618EA13
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 17:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgCVQO7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 12:14:59 -0400
Received: from sauhun.de ([88.99.104.3]:51334 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726538AbgCVQO7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 22 Mar 2020 12:14:59 -0400
Received: from localhost (p54B33042.dip0.t-ipconnect.de [84.179.48.66])
        by pokefinder.org (Postfix) with ESMTPSA id 81B8A2C0064;
        Sun, 22 Mar 2020 17:14:57 +0100 (CET)
Date:   Sun, 22 Mar 2020 17:14:57 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: hix5hd2: add missed clk_disable_unprepare in remove
Message-ID: <20200322161456.GA6766@ninjato>
References: <20191104150049.6366-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <20191104150049.6366-1-hslester96@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2019 at 11:00:48PM +0800, Chuhong Yuan wrote:
> The driver forgets to disable and unprepare clk when remove.
> Add a call to clk_disable_unprepare to fix it.
>=20
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Applied to for-current, thanks!


--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl53jwAACgkQFA3kzBSg
Kba2Pg//dI6w5vFqspLeTRNaiDFsFq5gDXt9k58j06uWcfGFFtSMKxb0AjH2wMGW
6YldH/SDxcEClJg/6RtN8qkVSNTvoVl0uM5kUl3ZozMkQ+nvx/LAZ5D0xlF02kem
sGcqfynPMxS5HOfT0tRZlOPYNqaml3rKv9dFsCkWaSJhXa1nKWT7RDj4kKj8W40/
+GYQi36WCGouvlghYy8OGX5TKcU1MhVme51RJCE7zZpOFzQPGskqWiBGmxPCNuWv
weLoSk3+UsOILL13hAIIyDj2MF3+JpIxf2ofPfXUGGQDWKzwlNufWWt+2uhQla8v
/3h3RdBAGa6SCk4XQ4tYi3PXaIUsqEAML5x4Mfw54q1pdYSws4AWvGIWaI2hJTD8
0/I4QM6QkWVNRU0jsFWla6G262i9sULSoAziBh2tDYpYu2GjighiSDBAu/flNyit
BqKqpzrovToAYvCuC8e8Cvl8LtPtxjz/HEJKdu4KREGPPkal5Rke4Iah3PKZp0js
D89P1S77mczcrXcj7IjvUnlYSeMSmRRt1c0G1Sw415BkfMHJULcQAiv8+ljeJ7u9
YhRqucPUN+SqJsYA0rkXQ7KoilutnOv7W5JHGob8N3ikpO3bDQzmpeKgOP7ZzDaS
+EqJ7fQsIVt0/koN2/BPsDnFg0slL8XWUCwLYfCim2eW/2iCU+U=
=z57U
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
