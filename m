Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61ED2263D36
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 08:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgIJGYw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 02:24:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:51512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726228AbgIJGYu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 02:24:50 -0400
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5BCF207DE;
        Thu, 10 Sep 2020 06:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599719089;
        bh=YYdbufaGVHlqO4nKD2x3a6t2VMqS5rsZ1vep5b/qwAU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aTAXkxtLEunJFDT7fR21mpntjBM1h5RX7bLwZGytsLNRI6f9ocxRQhQ3P1zD9DYAi
         hKiIw0BWQy+ig7qo9I/QWmxojJQ7ybNsK/S+m3pCv2dBD0gVFTmozjlhPJiG6XDPjx
         285R+8i4zWAgog4LQ+tLw3BkQzLJEu8AG3RmQ66U=
Date:   Thu, 10 Sep 2020 08:24:46 +0200
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
Subject: Re: [PATCH 8/9] i2c: mux: gpmux: Simplify with dev_err_probe()
Message-ID: <20200910062446.GD1031@ninjato>
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-8-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
Content-Disposition: inline
In-Reply-To: <20200902150643.14839-8-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 05:06:42PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9Zxq4ACgkQFA3kzBSg
KbbgJg/9GSHP1qRdFGhNdLgjcwkknpOwbjsZrYyXVYeYuUFbx9XQPf55dRd2yB28
h6D02c/8cGep4CPrKQQDUpg/yFqTXV16AniUtjv8w0mP+BlBsyZ/GWhjUIsYxnHG
Ff9l2LogCfDSoy3ZV5GLyELiGN0Ex3W1m6X5vjj+u3/pBMANwC6sUp89CmqgCic7
IBX2wORSVUtvnA1cfA9ecn556CmTIWg9UzbGGV5/bPPItVALZ9gejg8CjHjaol/6
mSUYdfaawrNZE9GYWP0iypPzu1qIdvPCcV38nbVp1/Y5DRA5bYD+NV3Yfc9MpLpK
Ws+kpqElTyzcqorAABjk9TYUMa0CwEMfH40YysuupfdFRrZqkxMTtHQQ1DDhd//a
p35eewasMSRaFzPalg5jAYX1WylSCi68O/o7tcmetO+4O0/z2yjTKrHsynaGKDpP
6wy1pRywMx7ppAWamk1/4JQiq6KbpfjDK/0cbHVTigzUfCVvw0F6stAmUwqfV4dg
/Osc9IuAXWlyax4rOcbWB5HsYXuPf5m3nqTNlHyYpFEThj0S8AfeyM8Zy1sDZ1SY
Zk7VVFPPAIfDqfWlNMLhYTGrynwXjsDXW5gUUE71PccXJ2P1ZsbRO91fGDoZ+sIq
ZOWfSEl1GHIwbSEmf06MM+fQNRg8WM3zA7EReBpW5GSntii3vpY=
=CslT
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--
