Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFE007DA704
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Oct 2023 14:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjJ1MrQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Oct 2023 08:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjJ1MrP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Oct 2023 08:47:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC98DB4
        for <linux-i2c@vger.kernel.org>; Sat, 28 Oct 2023 05:47:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2B7C433C8;
        Sat, 28 Oct 2023 12:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698497232;
        bh=etyMXCiu9Vov6M3/4UgP+1Q7+cqy25OzHkVPRxl84Cs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HY43KX1CHDq9icnAR/wzupbpFsAljAxRi37tOt9UOh3bOidZ4jPRbkjJhsbokRSnG
         B0IiuS9jXHoBxZQJdchS8SsDxDzfmnOE5EbO5U4cSn/Q0E+s5metJUWbXnjKjvBYy1
         O3TmU0v6TNrv5Dw9bGdXNPDWp6DphFyl1IgZFxzwejr7rUkMtSFunox/7dkyaUP/+G
         XyPzwR2aqyd56Z9VpcCijXMoUd/SHWM4cWDd+gMtAVl/joMbQEYZKqR864A7uQoam4
         Ozv6O9W5I7fqMhqR5z2bZnwesRR3cxIB1WdJqvTFPSTrRCxmefXF5Y3pI8cgB+zhIm
         nF+v/vg7JS/1A==
Date:   Sat, 28 Oct 2023 14:47:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: core: fix lockdep warning for sparsely nested
 adapter chain
Message-ID: <ZT0Cza5q5Cjuqyeh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Daniel Mack <daniel@zonque.org>, linux-i2c@vger.kernel.org
References: <20231018094613.849007-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i5wyaVInG9c65XPw"
Content-Disposition: inline
In-Reply-To: <20231018094613.849007-1-daniel@zonque.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--i5wyaVInG9c65XPw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 11:46:13AM +0200, Daniel Mack wrote:
> When adapters are chained in a sparse manner (with intermediate MFD devic=
es,
> for instance) the code currently fails to use the correct subclass for
> the adapter's bus_lock which leads to false-positive lockdep warnings.
>=20
> Fix this by walking the entire pedigree of the device and count all
> adapters along the way instead of just checking the immediate parent.
>=20
> Signed-off-by: Daniel Mack <daniel@zonque.org>

Applied to for-next, thanks!


--i5wyaVInG9c65XPw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU9AswACgkQFA3kzBSg
KbZ3KBAApyzxi+AE5TPnCd16cpaqFd9OtUCGer3+LOpENY14xrcI1i8U8OkaufVZ
f8+ifvY5mk9vgZVTjWxgtaDzVpGIKJx98hqUE0NbFOmIsFmJDIeSEVJ5sJSkS3ON
tyT7Miq9DTIet7xwH+m9JOKmFnRWwDM508FR99H7awEcg5wHb1FmA2wbNxgJTQBa
WLIBKivgEDoyPTsNd0T8Dq1y/zGU2C8p+Qa+MXROigWZlSEkIWTzv/ClElXOY0qp
RwFY/anEwgx6dMCVr7ivaTkJ+cjfs7/PLcrRd8XcOgfakA7Wm71RXR4SWlJtcIdr
K2Yv3XP92U7Gc2YM+zR9Zhv4lXX0pZM9FupRRQhzF9FgZgZ0zxUj3yd+SEsCsJi9
pHkSRmEuGDi7Ne/nx/pur32CR0CgQL3bhy87RufMaMar99VNRieTEUDrFv1tC5oB
xNhtIDyujulDUprmcHbz0MwTtBU3gagm3VXvgQyXsqS1xt9D3iHpHqIGTJAqTgGg
+E0o4IuLHB2L+yi4PgxpABUQy9708B/OtLG0SOtd6JGy0MvyqXF2EwRWs7/ip2FU
VKzJuszhO9fAouzX8hMc8xu0JBXZrVuXaGDPLn60hA86vTzc5jC+yFT8hn/8YkFO
UAxiypsuE773FphNzna6bgimHGzjc6sne1GLWIU6eFoqcHTtrbI=
=VU10
-----END PGP SIGNATURE-----

--i5wyaVInG9c65XPw--
