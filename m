Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D01F27A230
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Sep 2020 20:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgI0SBi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Sep 2020 14:01:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:34730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726358AbgI0SBi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 27 Sep 2020 14:01:38 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 690C4239EE;
        Sun, 27 Sep 2020 18:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601229698;
        bh=IxIVeKJYmD2WxR814QsH0EvlFMWfSB1OHN5F7yMa9aY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FaNdOR7tXX/2emfjfzen11ZnesKWs6RmkzODxKu5B3rlPe6M1ofY7E95DBRFRUd3c
         wzzgtWZLRrCEgJuQUTOTsBLuf/kWEhQbkkxkd3QSIg4v/Kst7Xi2NhBIQUuSOVlfKM
         UMkHjgCrO/ohRqJt7wKP0i1f3zKdQSV/ZX1RzZvQ=
Date:   Sun, 27 Sep 2020 20:01:35 +0200
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
Subject: Re: [PATCH 7/9] i2c: rk3x: Simplify with dev_err_probe()
Message-ID: <20200927180135.GA19475@kunai>
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
 <20200902150643.14839-7-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
In-Reply-To: <20200902150643.14839-7-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 05:06:41PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9w03sACgkQFA3kzBSg
KbZBpQ//da1xjT5NZ0JR2DTtqFdK+FsDuAnixq1XMIfQfk7Kt2bOC1PK9NSqjDPb
TInsycWM2dKpYl1UptBYzlYchflgmox7nLNkkK9SEsnk8RE3THm3FzT32YkQH78M
+3fnm+nDELWNIm+W15ISJY4lnqRZV8+8Pf6j6oJ9wGJtAIZ7ee9qDPuCQrCMAI0j
xQvRN8+0OopUB8puW7pbthc+HgjigBSm0KIb3CQLMwhnhDRhYx5ah5XYmeFo3N8z
8zaAm4ewrNuVfY59fUjBk9jv/tJwPYKk26hVNAa0tHooY16OFf0Ia3HXXqAq03fL
c6mPsGtoYwnkKqNzV+1rpBncdpLRnlh0Fa/pljrZFwrvsOaU/NprJ8K7mrcYGanu
4r/OldG1HGuxkLPdYQTd5VtDfD331uQHqXsvwzBu2mIGnZC/GNWBjj/jrkXyEO1a
IM6CKwKRs+1KcCdZ+y04FA+bgs6T42a8B/JMXHH6sNi0TLigmTGgFTiqzXcyUgtF
DUNpDuuENgCG72wIHxAhThw289KqXqzsLWpZMTbWmtbAxYWAUeitRRUdS0dKAIbO
yqR9BhJWbGJFrzFv2yUwxtGOaz9n7/hRnmGn3hXv7BgFr7/H7z92WEW0bZEDC7QI
hJ/GkaTK5wbEbGa3XdVwcRoG9/Z6gmwrTMl1IF9dbdslWN4puls=
=3XWQ
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
