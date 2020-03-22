Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9C6F18EA48
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 17:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgCVQXz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 12:23:55 -0400
Received: from sauhun.de ([88.99.104.3]:51494 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726869AbgCVQXz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 22 Mar 2020 12:23:55 -0400
Received: from localhost (p54B33042.dip0.t-ipconnect.de [84.179.48.66])
        by pokefinder.org (Postfix) with ESMTPSA id 8EE862C0064;
        Sun, 22 Mar 2020 17:23:53 +0100 (CET)
Date:   Sun, 22 Mar 2020 17:23:53 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, vkoul@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mxs: Use dma_request_chan() instead
 dma_request_slave_channel()
Message-ID: <20200322162353.GE6766@ninjato>
References: <20191217074505.22527-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2qXFWqzzG3v1+95a"
Content-Disposition: inline
In-Reply-To: <20191217074505.22527-1-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2qXFWqzzG3v1+95a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2019 at 09:45:05AM +0200, Peter Ujfalusi wrote:
> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
> eating up the error code.
>=20
> By using dma_request_chan() directly the driver can support deferred
> probing against DMA.
>=20
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Applied to for-next, thanks!

This driver is looking for a maintainer! Not much work, but still. So,
if someone who reads this is interested, let me know.


--2qXFWqzzG3v1+95a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl53kRgACgkQFA3kzBSg
KbYpww//ZHuO+vdrwCU/8+E79GAmZOvtmFZavOMa97NDWrNFFvB/RoP2gZPhEoZ3
irMqPrbs9wRlFp1/17zvEfdvTcd/SaG+Eo2/eYFcEu+JTzZ6+CRkqv8VrDfCTKp/
U4KRE9qnn0bQCSlU/PqqnBGZLT/M3UIZBpZETd1woCbry/jb8vtjUhXqOi9fiRvx
7a5N22vNRR29NmafmjOnppWh/GQJwF369apaF/0vXCK09hB98nPCrX9XdJqxfPZZ
eWACcwoyPxEA1KednREw2Si7jqbMNosEdsfN2/+GJZlQstMtDoye6du6JkoCOeOv
XtlHcIX9gC5aViQWsOoxdOAPnCEH3EN+xa+lDveOCwVQSUtyQlCmoCE9DbsNwQCH
1W80a8O4ktMG9KSeWmbjsGmyZOoxE3Oxj8Nwwebp7Fk535GqjXIxZGRnxA0Kynm1
XJR4hcZJvLVzFEG/3yhLtS7meSoXmiVHmmSgRsHFvownE/K3RllREHlOxe4e+18x
zj5j+9BUhDwUuaXlLU7JUcp8RXz0d1cJk4YWdmQqkz5I0KA/TzPORb5V+mrsNM4j
WXaaKFd/LTu7YszYxtes38skel/elO8rH4ONRf0l2JGyQ6iq+xCvJOBNEB4PISi7
vShJaiIv7ez8UE429xH3gzbapalKxjZld+602Obn1ssavQiynyU=
=N00J
-----END PGP SIGNATURE-----

--2qXFWqzzG3v1+95a--
