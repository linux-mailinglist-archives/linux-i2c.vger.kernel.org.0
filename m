Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70F285AA71
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2019 13:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbfF2Lch (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jun 2019 07:32:37 -0400
Received: from sauhun.de ([88.99.104.3]:32836 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfF2Lch (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Jun 2019 07:32:37 -0400
Received: from localhost (p5486CA23.dip0.t-ipconnect.de [84.134.202.35])
        by pokefinder.org (Postfix) with ESMTPSA id D849B3E43C6;
        Sat, 29 Jun 2019 13:32:35 +0200 (CEST)
Date:   Sat, 29 Jun 2019 13:32:35 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Fabrice Gasnier <fabrice.gasnier@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c-stm32: document optional dmas
Message-ID: <20190629113235.GG1685@kunai>
References: <1559655253-27008-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qf1oXS95uex85X0R"
Content-Disposition: inline
In-Reply-To: <1559655253-27008-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Qf1oXS95uex85X0R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 03:34:13PM +0200, Fabrice Gasnier wrote:
> Add missing documentation for "dmas" and "dma-names" properties that can =
be
> used on i2c-stm32.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Applied to for-next, thanks!


--Qf1oXS95uex85X0R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0XTFMACgkQFA3kzBSg
Kba1Uw//Z9FKUMwchGR8MkpSsz1F6e5FkOb3MsnEAyXHrXNW9muX2GEbkEWYgYEl
ArkjPGXaoCeOaf5zKRi1enmAa/XU8wYDZ5lRFG1onmzneFlRdHe2tEHWob6Z208n
xaizWUyhE/mmMWMMsGMB7g/VCYuAjomn0/j4qUxUoRMiPf2W/xSzn3eIgDerCBuR
wm+5rVPqN/O1C7JXKsUg35bqBioEhZSqWHAuz3MNnThc3YEgEqEGnWJPm3hPfOnn
mHfb3Q6dpuzVcuQFQbf8fmwcSW2fJyNLV220Qk8z7t6LkAv1e67BghnAWL9DUv9l
0kypkamIy45XbZoZ5ga4rCoPBmwmW7flpy6sjTre3vgrwDHUgf5F85EH3uJ8ahe0
gLWv9YBrxngDLIEzzeHKCURXJI0KQaRHXCYpIEQLF0iIKHmpsV4szxzk8yw1YsvR
p6yD6AwnOG2f5qc87+xd01SJVnSKU2/dwKbG9tI8IooTtnWt6kMaeBks6oUxl8/u
494OXDL341x/blvNxOzVsuySL3bz3NCTEw25iSpX0pe0nd/LgMOjVW4sUZYim+MD
uFcLiKLSbTDr2jkH0edVIbQmElJgIzd7HTkWe6GMzsgesJ/XK/eLU555j3luuuKi
6v1KOb3rE+vKsc2QPfADJkp+tGiVeeF81u+bx0hbqmyDSzvbu/A=
=QtOX
-----END PGP SIGNATURE-----

--Qf1oXS95uex85X0R--
