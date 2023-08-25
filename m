Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C28FF788FC6
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Aug 2023 22:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbjHYUWw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 16:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbjHYUWj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 16:22:39 -0400
X-Greylist: delayed 543 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Aug 2023 13:22:34 PDT
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D06A71A5
        for <linux-i2c@vger.kernel.org>; Fri, 25 Aug 2023 13:22:34 -0700 (PDT)
Received: from localhost (i5E861F7A.versanet.de [94.134.31.122])
        by pokefinder.org (Postfix) with ESMTPSA id E93CCA42A15;
        Fri, 25 Aug 2023 22:13:29 +0200 (CEST)
Date:   Fri, 25 Aug 2023 22:13:29 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next 1/2] i2c: mlxcpld: Allow driver to run on ARM64
 architecture
Message-ID: <ZOkLabwMmNI922Pk@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Vadim Pasternak <vadimp@nvidia.com>, linux-i2c@vger.kernel.org
References: <20230822185137.36215-1-vadimp@nvidia.com>
 <20230822185137.36215-2-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KIR94gU3+BsfVUNT"
Content-Disposition: inline
In-Reply-To: <20230822185137.36215-2-vadimp@nvidia.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KIR94gU3+BsfVUNT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2023 at 06:51:36PM +0000, Vadim Pasternak wrote:
> Extend driver dependency by ARM64 architecture.
>=20
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>

Applied to for-next, thanks!


--KIR94gU3+BsfVUNT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTpC2kACgkQFA3kzBSg
KbZDIg//b3iYuwYz9RHgbXKGzIq/MUL9TRx5sdK8CO0vCtp2vTcEPhiKFdwjf6iT
VOjdlrSxjAsiPrMZ0y91P+vs0F+lhFMchr9cPLcQMYB5uqQZ8u+pYqAQZBGoplnW
otbsfccf9qiVdU5Aj/7g+Q/2Fk1atfYn9IZD5ERF65SULPZSKWV2jC4yKAEyFHHv
KMlMBH4db5N64W6C5qDb/oNGrgOPgosZF/CMDZ+8872vJ+vdtHllWHoOKdMaz/mt
Q0I7Rv6MDWZdffWT60TZP/k4tvRhb96CkGYWJZccdAs6d65TSk8dmPrOeDFzUGH9
+98nFr26T74ZZb4Lkl4bDO62ZIemmZpFUqvJHggBPItRl5rC9QRX5PixEwyysLIG
c8HXJpI/cyI0OkCwaoSVSgzNQNPrKWeoAZKK+vDzgyQPbOa4TOcvtE2n4uClWgZ6
Be1874f4aFYnvK+V9ye6k1GUfr9CwFf0E2akgEBaudcXOnIUUe9QqTmHwmTdI5N4
T6d+qgPWKjwvdKFyLoBmooIzGyBGOFbU1UU7sOSgoQ6izifF3GVeLyFMYmAoaVNY
gTYzGOUlysEYpwIT67j6WOiEnQcw9asQxOFjjFJuYCaNgq1XuUnYzaJADKBdVNFo
7P2FRS1/xpCal8fHziDeqjyru0a2tShPbORHUDsTy3IXxoiOT7w=
=emNm
-----END PGP SIGNATURE-----

--KIR94gU3+BsfVUNT--
