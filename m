Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF5C263D46
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 08:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgIJG1O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 02:27:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:52362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgIJG1M (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 02:27:12 -0400
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6EA4A207EA;
        Thu, 10 Sep 2020 06:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599719232;
        bh=Gm5FP8nCLsvEkfvRpd3DNlXiO/khQnSfhfWHWBBmjY0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=etU4Y2hicXxYTNu/4kWYn9Al5j8eZkOpVlo2pD0o1ZsWbpO8yQItP3MmmeCtXmeSe
         fyvU9aDyHqv0zV0t5Qq9zQ5V1TzIGX8u0YUgsApk05uWFgTZuWfYcPmjEM53hyKvc7
         5F65oqU/5kMGkwkHBLR+LePV9sqD9cHQMPpUiAVQ=
Date:   Thu, 10 Sep 2020 08:27:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Michal Simek <michal.simek@xilinx.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 6/9] i2c: imx: Simplify with dev_err_probe()
Message-ID: <20200910062708.GG1031@ninjato>
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-6-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sLx0z+5FKKtIVDwd"
Content-Disposition: inline
In-Reply-To: <20200902150643.14839-6-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sLx0z+5FKKtIVDwd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 05:06:40PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks, but this patch was a bit earlier:

http://patchwork.ozlabs.org/project/linux-i2c/patch/1597203954-1803-1-git-s=
end-email-Anson.Huang@nxp.com/


--sLx0z+5FKKtIVDwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ZxzwACgkQFA3kzBSg
KbYCNhAAo2nfbP6Dmy9CcAEl/QKmFLjmjJKUIQb45IeuIZWlBMUc7gk6SBrqectE
PTAyWBluLF8Pub2rqHtIuQZBEu19HG2reXcyNugVvoz64rUFksRUw0Ap3CJW3MBC
81/i1SLsMp6gNhXUz7T+2JypfIu/XRYB5sMYVFCLFzstxepY15cQ6DwV37ARpJDp
Z9n5uD9qNgcCmerP8TZC6HIwLSa4FDwJ1U2MYzWHp7IVIEA6OwshA/g7b28J/VBU
egPLlaDRy9utqwMH1LqBJe9e8+yB52M/VI6ao4iA5qaMzdy9wROhiigkSJxRK/RS
sx33t55k+3q9CfSiVhOuVepKetiNyTMEvXvOf8DvXqfPeUzIaZr0xKU3vnTa8kE8
RDjC9mDy1aeH92gJxwhDPg90G9kaoz2G8unIynr5aS+5qGnPMQnK3nSn5IGVktD9
aYtx0xQw1Io+BYoyE/W4gW6xOO4MROaqU354P1y+DodMVLrkfv8pluItqu9363cY
NRkePoQnoWP2Ac2/cP7e7bY3P/ha7SNWMLS0FRpAitYAREilgiaABW2T+2v1WoNt
6V6Oy97ceBSNxLuVTLEGWPqJasIk07gTR5SyB4i+doS+wDwfiHh1codmfOyErKz0
00w5u9BN78VIAkriPGp/xz5a2rptVGvT0ovdvT6jsypdGplR1tM=
=5W+d
-----END PGP SIGNATURE-----

--sLx0z+5FKKtIVDwd--
