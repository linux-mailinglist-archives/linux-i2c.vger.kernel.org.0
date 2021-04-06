Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85EB4355CDD
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 22:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347178AbhDFU3O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 16:29:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:35784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347137AbhDFU3N (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 16:29:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 260A3613D2;
        Tue,  6 Apr 2021 20:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617740944;
        bh=ycO3Lven3n9FV1W0louvhRA6+NVC79zMPhxR2jAN3uM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L3Ic6dXC4Qc4OMVO2UNJzIGGQVlGjKjF8QLC7GX4ZyGywZ/dwFA2EKu/ffCHcikJg
         j2ncSDod4oPrFX4UIIpP3ixsWHNArZqxFWFuCPk0h9kqBLRi33yUqSKru5x/g6bXr9
         zELAJ+hhJQKGrqjQV6CASqSB0e/mITCzf0nhe/I61j39GwfCVai4NmroVqCGEQT452
         oo/nFldJ6JpegsFHEAvkcYSHJshUfFEsEt4hu1k0yOByWZ3izGrYVehEMizRZiTyeX
         YBmVphfgkPpoo2lZUTl0A/7CVmofrIVV4p2hn+DYxfhE2RYC6eLujHoKoe/w0xzBbq
         UO1S7JfnQdC8A==
Date:   Tue, 6 Apr 2021 22:29:01 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v4.1 5/6] i2c: imx: Simplify using
 devm_clk_get_enableded()
Message-ID: <20210406202901.GB3804@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
References: <20210330181755.204339-6-u.kleine-koenig@pengutronix.de>
 <20210406064618.24194-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <20210406064618.24194-1-uwe@kleine-koenig.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 08:46:18AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> devm_clk_get_enabled() returns the clk already (prepared and) enabled
> and the automatically called cleanup cares for disabling (and
> unpreparing). So simplify .probe() and .remove() accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

So, this will go in with the rest of this series?

In that case:

Acked-by: Wolfram Sang <wsa@kernel.org>


--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBsxI0ACgkQFA3kzBSg
KbaqwhAAs6JTJGXDGGmYMqARRRvgzGiDtUS9ddeJLb21TWjKhFwDS6drdE0Hmxg1
BBzUeEtZ7hHyfQJyH7r7cKFgNkH2TXc1ggxCt1UxGPw7QINWsC+FBvQN09SUxpt0
4GnSmeYF1ECvhfrC0TR+HaDo0ca8G2fJ/ZykKHnyZMyZeDUisVAOcfuh2IRJlWJT
nQT/3BuJ0cJNkfcMH9+alHjRJHB4zjhw/Ag9pmJfaAuMjz8bfEWMGt3FwDSdz7Oy
nY4rH2QGR2X8XifjLAxbXYC+ICoFDRTQFldThj56cINM8noSk40oGqiev5IfwRED
Uycs3qU/RM4Ny+4ySGJXWTBStmSl/UxmD9+CEkyxXbqAWi7RSAInlJwV/+pjcYek
UeXQDVpR4Mh9IUlBMvsHseijiew7SjKcA2P15nyvvWDA10z9I4x4sVK1Oke1pgML
vTDnC+IbOnl9tdbUyetB4hhJtZtyleJb4ZaSOLHNpfW8BfDNCsB+ik8TywyT5Gbc
1wWaQN3V3VUVXWa3aXSFvefym7007A182L2cR6vJQif+4AATt136wUZYeWEV+BUw
/uscUkkY9JlqSCKiWCb9L9z6XYxUGf4Zh1BEWkXmOwsVgLCDWiJd0knbKVc62WnY
gAJJFWE65oBQmyOGdw6sYMCdsopF9M8f3zqEa2DJ40wQv+Mq0kc=
=Y2Nf
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
