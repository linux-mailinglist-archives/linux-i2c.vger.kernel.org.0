Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40A2FFCFC6
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2019 21:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfKNUjn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Nov 2019 15:39:43 -0500
Received: from sauhun.de ([88.99.104.3]:44798 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726549AbfKNUjn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Nov 2019 15:39:43 -0500
Received: from localhost (x4dbf5278.dyn.telefonica.de [77.191.82.120])
        by pokefinder.org (Postfix) with ESMTPSA id 75FD52C03EE;
        Thu, 14 Nov 2019 21:39:41 +0100 (CET)
Date:   Thu, 14 Nov 2019 21:39:41 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: Remove superfluous call to clk_get_rate()
Message-ID: <20191114203940.GA7213@kunai>
References: <20191113101453.28157-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <20191113101453.28157-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2019 at 11:14:53AM +0100, Geert Uytterhoeven wrote:
> Variable "rate" already contains the current clock rate, so use that
> rather than calling clk_get_rate() again.
>=20
> Fixes: 8d0494037bb2af32 ("i2c: rcar: get clock rate only once and simplif=
y calculation")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks! I agree with Luca, though, and dropped the
Fixes: line because this is not a bugfix.


--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3Nu4wACgkQFA3kzBSg
KbYOhw/8C4D0pVhnKhYFYMmGpFhyCj+SCs23OkGBeIAy3KnBGoZNc/WZpf8Qy9uF
nNjDz5zqA/evTCAJpdPaWMc0Zp3XJLm1tRlSMOpY8UFeKsoDatJ03MKtc0pQMIyI
BW0P/EVeVizSb2okV12f1qr5U3U94z2tYfD82RGTSQGEWyukpZyiwG1uz4xQM5Cs
xing7TEH/O+TPzxxuYd3+mPdkPUuNS+Q7uJXhFF9sEt2TR5lcmJ0ahKXhjvQvlSZ
jL4PgpSoPB1DuWRBeEnTGrDKlJ13Byxnxl7IuxbkgvW2StNlmushUhlD9T63NZls
kUx/LyRcOuS/83IdxAg8V9m/ElxtAYMlLJArU2KqBpoNbRMb28+VWr7Hbn2iLxZo
hAxCrQlUGUudWcwwiZod5c5UwxnTz069inSd/uEVSxkinAsNb3WMbbyaSIP758p9
VxF7BUV0LdXuTe1g74NnI18K6UF3X+nmliszausc02egFuqC88hq6WdkhUYLaBeQ
ZLOAr3oUUWRfhj5Uj0Jv80ndLGr8gAIe+1hFXS2ZySyrHGPbB98anZs69n2atPT0
YdQNdrjPQM70Uqub58+MOoCY81dHqFmRib2P8T+VMpN0OcsMmQffExTvFk3RdANd
NF/5J4DyQ/mM0stAcTybvkvt+NJ5umbGe61c1I6OTpi4mBjm3BI=
=GmwN
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
