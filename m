Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889DF263D39
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 08:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbgIJGZC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 02:25:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:51692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726228AbgIJGZA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 02:25:00 -0400
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24B43207DE;
        Thu, 10 Sep 2020 06:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599719100;
        bh=//a6qxzEgSMZ3QQI7xw0qyPHvTAV/TNy95Zgt/g+v60=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=seRvHY4AHQ3zjw168vBNI9Sn7KbMkxIoe0VjU9K3EMlgTQZOHNWQ2NzzfLYOyHMkz
         pqjU0IrB3AfuBWKvlDjQBkndrzSx2PhUnEUSQ3pC+DyOh1mx6YPspcWR+7pA+EKvQU
         jrQG/7gEMGYy2dft9u5scUMMtbQZhAxxM+u7Bd7g=
Date:   Thu, 10 Sep 2020 08:24:56 +0200
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
Subject: Re: [PATCH 9/9] i2c: mux: reg: Simplify with dev_err_probe()
Message-ID: <20200910062456.GE1031@ninjato>
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-9-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="orO6xySwJI16pVnm"
Content-Disposition: inline
In-Reply-To: <20200902150643.14839-9-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--orO6xySwJI16pVnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 05:06:43PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--orO6xySwJI16pVnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ZxrgACgkQFA3kzBSg
KbYpRw//TLwPExzFBv8TTBphzRzCmoGKsmf5N3jW0O9HgZmAWVorubIMyACOmggd
S8mrJRk0d+HRsUq89l+y7MFDjo1wj86is7xBO4KQTm//nK0zqfeNNXMPGiFGwXa0
IhrTvGn91cJsUNDASSuVHPJUbXFxh62EiXYX+Va+RKJygyPRZEoEgQiaHoZf74sK
q3JETm2um6x2fCbPhIC4jN5TjvFwbnkiWFpUoZg5kQRao/qYCNbUY0XP0sQQMsPL
5PcpWM1HU505eGGIahQv8gl6ejxaz/w8K+GE7GSttBJ6T7/xy7ylqMnbB9sTFz7s
0+3VMAVcQKwFRq8mpU9lXuEc9cnzoyRVlOd3Dxi6QbSN2XIOoG+ipqgYq6ovIP1m
lAaYc+EfCRD9o2EdWkXMo5jh7Z+6FKfhnr0SVZphPcD/pfzFON/EEV4SN8aHxclL
YU6lEWItw9Fmo2XR8JRtLMtzKC+juNKrs6F7FnasrFV8W4BiF2AE5XzQDZ/keDfq
vS1/YnYBtYKGhFLHix56GRFIMsIXaa78ACwvGCIDk8qqrWHvOH3RCugI9CZMrizp
A79qLX53E+hRfgfowJP6LPZvWVWaSwXyBvvgmLGW3LRRfMYCCWy9goIfX3GzkpxB
caRa+RKl7G3B0fU/WQkKn/B0soM1EiUdQVSkmtGDxEb+v8bBzeU=
=oPRu
-----END PGP SIGNATURE-----

--orO6xySwJI16pVnm--
