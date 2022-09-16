Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBE705BB2DF
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 21:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbiIPTi1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 15:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiIPTi0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 15:38:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D543ABD4F
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 12:38:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 32189B82925
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 19:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E52C433C1;
        Fri, 16 Sep 2022 19:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663357102;
        bh=sOJGIpU8E4nzMRiWC7rH6cKW40/l+skAf/83T1XoyHA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fv890tBEpeBFsWBp/Pq3Q7hp5Li3atYz/0OUVgSj5n9mWygznJPe3R3SeX864k9wT
         tGxXXWA5evCHqZw+BvE90p1i5zSRRS6h5PsNZzgqKNNBj1sSA/A4Yhn4LHT35NEaui
         51ldIXn9mngn0OsoiJKiOAreBL80o+5ZaeJk+sGIHkJ6Lcn8PZgMf3ZHW6hI+vBhna
         a6E8JGpfxhjDqzUA4For1lxTyMyj9UqLJ0u6evN2AEw8+nLjQ0lHgZ4RxP8kmAXyXO
         qN9LUAXW+FNGX7t/xo3izpCER6FGToshYAijJHFzptLoUowACu2lDpdr1yfGCRvrc/
         7cvn52FX54WyA==
Date:   Fri, 16 Sep 2022 20:38:18 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] i2c: imx: If pm_runtime_get_sync() returned 1 device
 access is possible
Message-ID: <YyTQqlNJCZOJ1BFp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <20220912132040.156713-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XoJISzSBsNyo1TzX"
Content-Disposition: inline
In-Reply-To: <20220912132040.156713-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XoJISzSBsNyo1TzX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 12, 2022 at 03:20:40PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> pm_runtime_get_sync() returning 1 also means the device is powered. So
> resetting the chip registers in .remove() is possible and should be
> done.
>=20
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: d98bdd3a5b50 ("i2c: imx: Make sure to unregister adapter on remove=
()")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to for-current, thanks!


--XoJISzSBsNyo1TzX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMk0KoACgkQFA3kzBSg
KbbpDA//XxAonRT1FsT3QNEgecXm7kGUV8Ark0NnesMJMmHzqLer5fKD3nvz5Cky
s5VZoXxT9LSR9KY3t9qVNmyagfg/Oy49HgbvwfMvc56VYxiCYnOfhl3sFa2d6wId
xa97f6Jrzqa2XOcfg/QOFxHjo28Rv9hhBFecukgtuoCo4pWJORJLwg1LPcRE27lJ
eNv01oYML70pUDbkzSh1uMW7RISeyT0Hc74DDF/botG1SrdZTZmPSz9Kt7ky04Vv
BrL5BgqMA9gPDzUF2v2eITOr3a2DiWU70zthg76iNkoLtPknKtHtYG18+g0mHH71
cSKjcPKGSohIZrKOoVMhxRMoGCIPKSq4wXNuKHGJo46BVrU/s+sx4zuh4C3s/Cv3
y308VOHu1w3NjWgyEYUZ+DeAPFLqyOFPOSklzSnwX1CsLNKr3sxB5beEoLNEUf1g
4g3kaW+G/QzvcQ1BHrDX5mMAjJp/K5328jVGhBzP28OAJGody22SU+3aD6Q4mW5W
kmMoKw5jn4fYxIEWXcOMYyPK4kmA4/yn6IMY1w9nfx5h65Wm4DpDryYv+whvdjL7
81zD7n0iRQ9V5Nh9iqFgJHpeoUrUJDSQVZvJLhN76p1L6DC1LpMtuWBO+rqBLKWB
zMV1vMYTP5lLzwm+z+1Hr8pX3ohtDc4SZi+lY09vmgN4wJyUbks=
=FvQM
-----END PGP SIGNATURE-----

--XoJISzSBsNyo1TzX--
