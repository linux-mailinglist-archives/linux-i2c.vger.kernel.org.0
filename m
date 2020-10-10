Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4655B28A331
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Oct 2020 01:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390470AbgJJW5W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Oct 2020 18:57:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:57042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732268AbgJJTyP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 10 Oct 2020 15:54:15 -0400
Received: from localhost (p5486c996.dip0.t-ipconnect.de [84.134.201.150])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30DD4206E9;
        Sat, 10 Oct 2020 11:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602328025;
        bh=OhiXebBRx8Rwbg2KldieQ1pJi0vUNsaPUawJWNFRIrE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dbdOdhsqfqvFpcp7uWLq89PmR60s0gXqn3TtPMkzBgHhb4noKNOROcOr2nTuQG+WM
         EO3wOcn9pdnRovQPAVvbmnk3iHvEo7sjngIJBwcSSTw/P6DGa/sozIbNE0cb9/n3oq
         ZzdJ3SmqkdgpVGqzcdrZtnohwsRSrxjivK3tvG44=
Date:   Sat, 10 Oct 2020 13:06:58 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Christian Eggers <ceggers@arri.de>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        David Laight <David.Laight@aculab.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 0/3] i2c: imx: Fix handling of arbitration loss
Message-ID: <20201010110658.GA4669@ninjato>
References: <20201009110320.20832-1-ceggers@arri.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <20201009110320.20832-1-ceggers@arri.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Changes in v5:

Changes in v6 were missing... Because patch 1 was updated, I reverted it
=66rom for-current and will apply this series to for-next instead to give
it some more time for testing.


--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+Blc4ACgkQFA3kzBSg
KbaokA/+OH8pJeBlEf2ZMBAFVh+s8Dd1uVh5pyrEHmJ6zX6p8sJeSBnicetzeLdu
r4GtmZiOIChX885ANS+zAWsvfZpxoW2ltN7OCk7ZPugYSD1TOICrHwwyKAw2hr/2
MEs3OEeCYpR9kPAf9l7RBQvTAZEGezhIUkiKHNZ70QVZeE0ASd+ozlGD9Sx3s0aa
3ayPcsis8aYIFrioZfZIqT51mxv3Sz4c8KKpt6hs98End++5HoP3k5YNgEJslwuX
HHmG+Mh3YPSMxbAJEAeJPCFOw4a5LwH3A+y8OL4/WmUY0qwckZiAxFDYNNjKmUdV
11gRXC7k80IlfDoG2/tymleKMj49pL4OYKtZrb+vuOBnf2riwd3jI/SBcpxqGsre
wKSAAeM1xMy/62UVRIU1OnWkMWDkzTlKgrbPwwYT6r+fsVH2xRJ8Ug6OXeu12pKl
1G6LNa2y3pI82gubBWoChwATnAoPFqKcElDnoQYl5RlTcUFolJEXRwRcOSEvR1Sh
qJ52U4jVy1Wd5/CF0mnfduo7aDd/XQLCNVW7xHcxO9yLJz13TqFAaJE+dVuc9FqE
LrLEbULC7D9/RE75LQdn02Xv+e14z4O2aZnsq8zvWfYd5PdnjPVf5NP2HYCe4x07
1U/237cIyy2jSrJtKEi5+K+J8p9uBPyWZqZA0N6j13EZBpuKmTc=
=PkoP
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
