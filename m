Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCCE45A0B3
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 11:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235659AbhKWK6c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 05:58:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:51372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235693AbhKWK6c (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 05:58:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDDBE60C4A;
        Tue, 23 Nov 2021 10:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637664924;
        bh=KHcj4cqr+Kiuvs8HFpDaNWaWt3d6WI3l2EaG95sF8Q4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PvIThxFf2G6dhHsU/etDBAIzC1ohiTd/oigt+4wNeqwUsRT3LTl/lEew0CoueEO4n
         LBMPjbWilRKSEQOxbzpmMpNWx6gTcAvkD7gXDgECmwYD8xZ9lqDfVtdHpf0xCuQbAJ
         rb15nZ/NRco/jUvF9CEO7Sl+u84twvXHzvdgVNwVxczzdn8CtGdgjad/8RQccixdFP
         Mt7Nb6KF5KigpA8AzM7f3BmsnubbXbj+75DFxQ+dhk80EP5qc57ZcbJoHLgvrxIuSl
         +IemVJFzgfxPyiKfnwzzOzSm5Ve1Q6TdcCd4ingqNQzHn43TL+THNpxyHQfocCiZf/
         1XI+I2obXi2Sw==
Date:   Tue, 23 Nov 2021 11:55:20 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Evan Green <evgreen@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v1 2/3] i2c: mux: gpio: Don't dereference fwnode from
 struct device
Message-ID: <YZzImPdyTchvDAh1@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Evan Green <evgreen@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
References: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
 <20211115154201.46579-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rQ//4SmOp5yzoGcf"
Content-Disposition: inline
In-Reply-To: <20211115154201.46579-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rQ//4SmOp5yzoGcf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 05:42:00PM +0200, Andy Shevchenko wrote:
> We have a special helper to get fwnode out of struct device.
> Moreover, dereferencing it directly prevents the fwnode
> modifications in the future.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--rQ//4SmOp5yzoGcf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGcyJgACgkQFA3kzBSg
KbZtLQ//R6LTylQnx0Cu1ZIemnt4F0fM+SV+F3HqOX+p0oPGDtGtKsrXEH4ktKop
IH+nVzGsv7rdYj130mpRw9fciJo0PBNI8JhCM0kYmPcrz1WSRDktnpc/CaB96BCS
pF3iemzjqykHShBAUc65EbSvQlT6ksufxM6rR0tTcbK6ANyybBkjgSa2bap287Mx
CQerMgammXB+KEoGBxV96SJ5NTeLQ+tUjFGzmPrWNkWev4ja8TJTbH6sOgLlLVYr
KcZIv6H44yyI2r60NcgjU/5Ru+rKT2dgTdlp1Qiw//pU19ghcXSnD0Ioegji3hIH
Ddlmyzqra5c0VPV8d8L5IkB2IhOqOQpJmVYl4AOkz9BU3zxfsPt26tMQ+JDawM1V
51mZ0h2LP5e2Kh7XsQAI9WnCabQYLf9CrJbsX+75EaK31miqzoRzkzT9D9FAols4
ggT53He/B+c2PC+Z2Leo86NcghMsqh3ehRvrVrCdWNLJl+WCaX/OhHYigDM54p6M
iFzY8k3HsMFFoCAAGlDrfeeqhamREa7c/j+HnwgycfZ41IVuBVVjuG+1Dpa2mxr4
wG4u7/dxnyTy8Pk7V1NEYIKrtqvZvl4tE4uub9VOwepwRxmBeyva/uAQuHF2etyF
NveLEXNcNNfTcwYGuLlzpjG/EP0V4Ywc3bBi6ppJjxFJm6+1iT0=
=3s48
-----END PGP SIGNATURE-----

--rQ//4SmOp5yzoGcf--
