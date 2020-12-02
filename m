Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0291C2CC139
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388933AbgLBPqx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:46:53 -0500
Received: from sauhun.de ([88.99.104.3]:40004 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387985AbgLBPqx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:46:53 -0500
Received: from localhost (p54b3307e.dip0.t-ipconnect.de [84.179.48.126])
        by pokefinder.org (Postfix) with ESMTPSA id DC9312C048D;
        Wed,  2 Dec 2020 16:46:11 +0100 (CET)
Date:   Wed, 2 Dec 2020 16:46:11 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     kernel@pengutronix.de, shawnguo@kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: Remove unused .id_table support
Message-ID: <20201202154611.GC13425@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        shawnguo@kernel.org, linux-i2c@vger.kernel.org
References: <20201116202910.30061-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline
In-Reply-To: <20201116202910.30061-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 05:29:10PM -0300, Fabio Estevam wrote:
> Since 5.10-rc1 i.MX is a devicetree-only platform and the existing
> .id_table support in this driver was only useful for old non-devicetree
> platforms.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to for-next, thanks!


--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/HtsMACgkQFA3kzBSg
KbbeLw//Y/KhmS8Ul3xGCGbza2bRCZmVk9ohgDkqfCMrbxiMCjFsxTHEQgb7Ye71
PegXfmkKraDEyCOBrPWi3ed+R5dwrK4BwltP7wVRQ405bo8DyGws7gUrzp6fPjLM
dP839j1oM8yMuQekEuR5F4QU/s19BqqhkeD8/F6Pf47EVkve9YOv06+jqpAQ4qLI
/zTkF7b+xBngbaFgi5ATOL/x1X4tvrbN6GiBTLAbC9YQpEGDtT8EW0DruIiNHWdA
PL3gOwd1WwxFu/ozaED8JcPt7TflnFP874rTpH2C11pdn6VDuHetyBPq6cnonPV+
lvju7hRGnhgWCRV3JvD/GC7ZGMway4HL+KnqzAE3qjebrqRc4dad9OiwnFk/F69s
XV038ZbbEEH0ui+cj5dkLm/aAtHJXCya6GsDgYo3eYOvoXF5Z8eFCgsaKeeT7dWj
HZgZoQP8vWN2wmsIIm9T8PTVDs6qoBvUORNcAXEPYVxk5BR+T+zdgmKwi1EmTnYr
BTDeOUqTXH7RHqUPTPpUo7H3cNCknDKl/0zMgIqqUSABymeDP5FtbPFcWUOjg5KB
3lrIkiJ5WFgqb94gUjgpzxJt/3rotRnoOisz+8YBMXzapfIzJVrdcUVEXTUmbUyr
+PU/V96woLwf3bRK/v0JERx3tuSRgdDaw1yWq0dare7yxuYJddA=
=jvSh
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--
