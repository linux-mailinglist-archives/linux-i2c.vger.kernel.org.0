Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52EA1AAE55
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 18:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416092AbgDOQb2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 12:31:28 -0400
Received: from sauhun.de ([88.99.104.3]:56520 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1416085AbgDOQb0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 12:31:26 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 549FC2C1FF2;
        Wed, 15 Apr 2020 18:31:24 +0200 (CEST)
Date:   Wed, 15 Apr 2020 18:31:24 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: tegra: Synchronize DMA before termination
Message-ID: <20200415163123.GD2830@ninjato>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Content-Disposition: inline
In-Reply-To: <20200324191217.1829-3-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 10:12:17PM +0300, Dmitry Osipenko wrote:
> DMA transfer could be completed, but CPU (which handles DMA interrupt)
> may get too busy and can't handle the interrupt in a timely manner,
> despite of DMA IRQ being raised. In this case the DMA state needs to
> synchronized before terminating DMA transfer in order not to miss the
> DMA transfer completion.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied to for-current, thanks!


--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6XNtsACgkQFA3kzBSg
KbbADhAAqwvNfOD7mXtxEJtV3RcBhdYNCoJRUtxcGTAHQVpPbAXy6CzQPj/fYsAB
rUFJEFrFEBBwxemI9pSRgzgR/k1cq/6lxW+S3rH0yaxmSwO0SH2UtctpHnCwI8zQ
Uk5KwRs5b6jlNaSIWpraI3+7KKMc9n+vpHwqMZAqdqvadgkeyMyLrZq84zZJM1oH
PB9HUFpEmvxfk0vpI2R7oOSEMYJRZ50z1AX0XfokWwrJ6seqPzDsET3MJLC1bep5
bLLFD4pHhQ2Cng0DuoEV0APFbpSuW78Yn9nnQY4NdWjE/7UWA35tCdxwsVWSIx0t
Uqdm4TrYhhJ0neGXb2is8z18NRpsqu9Xyxq5GNFNIKqMeaMRJqy8qDrNfC7vJ4nS
BdnlYUdQ1SH/IpoCntv7MFFBJ3c11xMKJ1BRXgmltDe+McV0yi5zYND2BIx0B0ZN
sKe72nwPSalYNYsuCHg3K2wl+mMuZI+l1+TeVrWVK4AHY4RfHp188J/XfhuzJOXm
PHSZ7L8wMx8b/4iez+J2JtAQCknI93f/tyXxEoCDJBD8Y2PANwzbI5LqVTxiIyq+
Bwu8bZy0q42hKjN7B2HkF8ynBtumNAZZPc5nlvhLCoG+IdnZKRdjEbvw4e2deQCH
SHOCCRo+Q1FHRAeiicNlwsSeO0Yoyqz7LVyVBy3dyD6lwjHQReE=
=C3tM
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--
