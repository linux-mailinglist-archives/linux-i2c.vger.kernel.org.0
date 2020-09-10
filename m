Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49DE263D3B
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 08:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgIJGZh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 02:25:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:51904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726228AbgIJGZg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 02:25:36 -0400
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1703A206A1;
        Thu, 10 Sep 2020 06:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599719136;
        bh=1tmPJGIkpBXHgR/46GF8TeWUiMz2EH43SrJ8FMzonN0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TXaXfT1gOvjM9QB5dCOqR58HhVflow1+Q+bmi9oYJZdyWEd3X6svuE1JTuswzqWqg
         1jmkkGWmaKl1PXdy/VCMIjw2b8PtEY7ioBS6LQX8JyTGqsHG1l/VPZoHMmFzki/SJR
         cseoRUmUBSndK4MRfpeGrkR8H+RiqbHr5/q/p+s4=
Date:   Thu, 10 Sep 2020 08:25:33 +0200
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
Subject: Re: [PATCH 3/9] i2c: bcm2835: Simplify with dev_err_probe()
Message-ID: <20200910062533.GF1031@ninjato>
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Mjqg7Yu+0hL22rav"
Content-Disposition: inline
In-Reply-To: <20200902150643.14839-3-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Mjqg7Yu+0hL22rav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 05:06:37PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--Mjqg7Yu+0hL22rav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ZxtwACgkQFA3kzBSg
KbaeHg//TExyGapDctpG3/NfiZUK8fRTxopI6eApuGkuRNFi4dDR7IN7TnG4JBIC
ZzQa6MIT0nKsWK8hVRcGpEFYgU5pyxXvjT7UWr+EHD4sYaTJRocZVvNjC1D4FZhh
JjgPJ6zbcneONv5izf77WadDSDkGXZ/PFo03gqW/NIaXx64YyCIp9LkPdqFqHYrw
cmlC7ZMWUIVIBvITbES4MaW+h3byshkSNdy+45RPf15CH4w27YJubcFWlOozdWg5
T4hRK0XLKuBzjvNF/K+tj8OPyWUHQS17P0M1fJ6orSo5XnkANcac9crhTSA2+mQG
vOFCYGFh4ctXFYb2l4N+q2sZvqqjItcntGkQGYMNs0naoFN6rdIo9KYhhbU9nx9T
JcYuUVKxv2mITRhD+Lvq0YfxJmKYoqpnGeN6I5UIqcV9QH3n1VKZOA6CwXVhgVaM
L4CSVfQak+iqj3Yxz5D3p22uF5788jHRW8nKuR/aqQvyTB7nHYwTQR97jQWtpxuA
b6aG1tecsKP4GxXhKozl1twrAtk0wqvvz/MrY7XDlTOwq4vDSgVioSSkPaw0G6E3
n3BhV5CVQbBdSvFxg6IVpNsvGxGWOoEZFfvNup+6Q2DDqLiX556mvvt+0iJSoBgz
ZS6M10mqVyirKjO9YWLDD4yUCx9VLgDUuXPdaNcLqvnpnlmipjs=
=NMWb
-----END PGP SIGNATURE-----

--Mjqg7Yu+0hL22rav--
