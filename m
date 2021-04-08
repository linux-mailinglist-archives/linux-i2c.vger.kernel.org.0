Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86780358E99
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 22:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbhDHUkR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 16:40:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:52906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231906AbhDHUkQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Apr 2021 16:40:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 096D961107;
        Thu,  8 Apr 2021 20:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617914404;
        bh=UZydBhLchFXeHZMl/VTGLaqOhTDK9/+zFibQTitKeSA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nhWczxY9kzBllh0srEa+aawFIoA7941KusMyGgYZ1xk3TUGP0UNjzOouBRDE0pdFc
         R7UKJeGJicXC03InAxOVGosyGueBS2AxaANLhH5rmm5u03JEA9GF8Uw6VjAL7hyKY9
         wGsEe55q/uPoqWHqR03Xw4jUWqOJcxA5zhOFo87jc2xpUwSR1WjV9LWX2B2TbsHB/x
         kMNvC70ae1ap4LlzWnLRuGeRp4zY7AZrtH3jHamigAkj3K+J263pP6oV6JnqT4KVby
         jnOAukcSiHZcBLW6f8v7mh2CUOenH8QlC4XWxYCV3YazPIG/DvrYUiFn3SRczS/+ZU
         EAnc7wMdSwwgA==
Date:   Thu, 8 Apr 2021 22:40:01 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH] i2c: imx: mention Oleksij as maintainer of the binding
 docs
Message-ID: <20210408204001.GB1900@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>
References: <20210407183532.2682-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline
In-Reply-To: <20210407183532.2682-1-wsa@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 07, 2021 at 08:35:32PM +0200, Wolfram Sang wrote:
> When I removed myself as a maintainer of the yaml file, I missed that
> some maintainer is required. Oleksij is already listed in MAINTAINERS
> for this file, so add him here as well.
>=20
> Fixes: 1ae6b3780848 ("i2c: imx: drop me as maintainer of binding docs")
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>

Applied to for-current, thanks!


--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBvaiEACgkQFA3kzBSg
KbZZjQ//YThXw/sAwm+ddCdWH+aM4P1w3aFvdtyZzVGetIjBj+e8hoVdE5v0Y1tB
HD7MVAiQrua3Dde3fOJziCY1Y58znJrtNb+Won8nIGlITE8gfJkPFO38G7cY5NCs
OV4W+80VcrX/7uPyHEeKPvFfjaF87AZgr/O78zolU0Bf8cRm8ozDZqKWPgGDowEh
/Gg0jyHIrfOezuFvBUfVgkkl4dG+wBumprIg5SzpVrZAbsEnXavmKq7xXDNcN+o8
m4oSAhnGG79VJ6zfmqo8Hp1JVmMshr5Dpw75gAytHYSzyKcyHPflqCqnQ8vjuvT5
xPTXYmCtAT/tScXBbuIcqj8wJtL1zVmWJ8edhCI7Cpe4i355BYTSEmg660lYjQ0Z
qvDcjN7vVJfppVS+NDIDHKK/1tY0yJPaA+y72qSlViz+0BDw0PgWeP/XYkG2USoI
GcEemoarPdw/SPEB0tOJBLB9l6JURRrV7q7+cLxGsb4/c5/gX3VanU4UHMrzLIbh
+zd6qVdKPcNN2mW4i/yIoIfO0HZeRxc82LfUt3BA2WnqYu/LX0oRaCD7n7/eTJia
9whjKcG+KsIQI9oI5mmzansE3+JXJqXA0rYAkGrrI5JcUNGvoccFMMIdA/QTdLjR
rhsCyfcDgAwe8SqnBS3j9AUrq2r40F3yNTOj2HrTjtgFnDeJ9+g=
=gHSg
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
