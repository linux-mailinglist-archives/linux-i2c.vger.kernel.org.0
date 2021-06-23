Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433793B1E9F
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 18:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhFWQ25 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 12:28:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:59034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229918AbhFWQ25 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Jun 2021 12:28:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E0456101D;
        Wed, 23 Jun 2021 16:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624465599;
        bh=x9Y32u8xKnq9y9RUCEeFlJlF/lSKVUF+efxe6yJZN4A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fz4b58xSieSWwb4sHRoe4Lj2rrT7gQSIUzklMVC3obvRrjUTvDFLU4hCRQNC1cdJl
         FCRfpjjpGoomjQOmxBZGWbhJwhe0Lz35zllUWnm0z7787yx3Z09UX3GTt9zW2VZgkO
         zhwfEuYACVH6v/dBQI9T/hgXO06ZvTGs9OPOm9Q9AMD1bNqZ6Q9GnQ7eJCHzjpj+0b
         2hRndsgIxBEP3PiYNSJYhIGHF43COPjFViTmsde0QQA3aLXycwdukKQRKK5K7W3TdU
         NWhHAOkZNmaOwcygMLAsQMnK1JHOcc8GP5b6cvB176RsbB4lX3N53yKMTJh9CPVDN/
         DblZ3aUNa4vBA==
Date:   Wed, 23 Jun 2021 18:26:36 +0200
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
Subject: Re: [PATCH 2/9] i2c: xiic: Simplify with dev_err_probe()
Message-ID: <YNNgvMKtG6Fg0Jee@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
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
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RyrFzM+QFbnSHop+"
Content-Disposition: inline
In-Reply-To: <20200902150643.14839-2-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RyrFzM+QFbnSHop+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 05:06:36PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--RyrFzM+QFbnSHop+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDTYLwACgkQFA3kzBSg
KbaeVw//XoYX3KOAm8qeZlZZ1yMVkrOM8FdXdIkWJXp/6GWZ2CZw1O2bmnTmWLtu
oTpTQUJeibcURR6v0MX7SUFJHRRUMa0iN56HulVX2ficfGOhKBG2bh/YPbnOPKOc
kyc0oe4L9AXqWIs+XtNQHyCpV8rJoP73vIXSlYZVF6UbwNzDQl8c8Br6ryP1kY4I
Dd9XNXM6PnLYsmTJtnYZ4ZcGhn7YSYTaSUsoo8Ec+N51f9Aavi9dDDyqLl62kbZS
SQBlBigpHUw3XC7NNtKL8D5zyMfrvfIdbHyMGbIJ1lDUZ7oeXj55Gvk7qrI6eg4Y
d3SEELrApAwxisaWfKP/2BiECz5WL+eH4ak59S1Gs/s6M8x0/BncbRFmWRSyy+It
WSGxJhX0R2WU54ECN/JAjrVP75GPlIEc1gNpwkdCF1djAg9banpxKOe7dWNvFmrW
ezzm2no8S8BeoKxGnR1XBQhAd9Dqwor4V3qKWtSPYyS9uegAhllnXHIXp0nJxJNz
xk4XjBZaL9+0QCe6TfSdKO2skHGejTHnrCSpNKedXCd5ax1la/HHT7qhNu3fXPhC
2tS7osemPAXLJ/+5yBlFTD+SEMvAJTL/4PjUZmLlvOk0tn4lOTc38pk8bqzgUoZI
HW7ehBttpBwKxRgE42hdeJIj/MAAVxTzEyoYTO9qWEN1hJHH++E=
=ofX/
-----END PGP SIGNATURE-----

--RyrFzM+QFbnSHop+--
