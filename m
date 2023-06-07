Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36054725994
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 11:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239212AbjFGJI6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 05:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239401AbjFGJI3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 05:08:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E701BFE;
        Wed,  7 Jun 2023 02:07:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7E5C2634BA;
        Wed,  7 Jun 2023 09:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7396AC433D2;
        Wed,  7 Jun 2023 09:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686128869;
        bh=YAEe1VLXTNTSTt/pdws0rPeQ73U38ghhiWtW+vFAuMw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a5P2k0Eko2u45xXRWSzJWOW1qbfXobkSguT4+p8JF5sPROt8BlfXXKnPfYGXBdh4f
         ahGVUhFzKOFCeYg0p7rmlJrXmy8wYHJ7Yi9SYBiPlAykvmDN7de9sKLHspXrzG+iQJ
         WK6rRQS1k8oeyJe6PpimrjCEWbAw1nUkF1k5lqmsD+ihfCVkt486Snjjr6/K0t3Fn3
         fvgTq1VVWopEtvSKilATimWLwP2n0IumpYefQP4+TcXjF3J3XP+/eZlQLq70PB/Pxm
         cOYRkXylsV/xBVEcKov9feO1/3llUdx17cg4uxFO+V01psqn70ejtGSHCw+bOfmh1q
         cglryWnzSNwqA==
Date:   Wed, 7 Jun 2023 11:07:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH] MAINTAINERS: Add entries for Renesas RZ/V2M I2C driver
Message-ID: <ZIBI4tY9iLZpMkb5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20230606140426.383462-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="z566J4CM3u1l72jy"
Content-Disposition: inline
In-Reply-To: <20230606140426.383462-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--z566J4CM3u1l72jy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 03:04:26PM +0100, Biju Das wrote:
> Add the MAINTAINERS entries for the Renesas RZ/V2M I2C driver.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Cool, thanks! I think the I2C list should be added as well. Also, we
need either Fabrizio's ack or SoB.


--z566J4CM3u1l72jy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSASOIACgkQFA3kzBSg
KbbgzA//UVcniQUfZdWJJZ0JuKiXKZw8Hdk6ZshBDyrDDRNFm6c9vFCrnQ/2wRbm
1gTsckkwEw3b/IyLqpaZ+KyoQwU6pGl3lxbmU3SeEjJwdlNmD4VofUh+v/Mf/VJJ
OhrHGuHyqVsypK+y3KU0QHFbsrP65LkCW0Y9o1Yp8iW0xcDRky4sj8QhGVVYThDB
f5YP62NtI6MsLzGAXZe8fvRrxZKq8wH/qRwMczyMFKgRKaWwhM2WunBxeHUjBRG3
HFUug8Aien4onBTnRY4VJfiP+gyVYl1g5CCO++2TJObpS2GmaSe/3O+c89xEWVBk
KPdD+FnvIIOZPDHvUmowBq8n3MmYvCD03rH7zRMheoYgTdSJNaN/p9an/flvJDbY
KUV76cuM97c0ZQz+X/sMrciRBXzGEAHzUEhOV+EoMA8tNNljMpnaMIukH2+ENfQf
kpkDMbo6uXd/YdUluIhQfZVKHutOI88V9ChrG56L3TJqIQHhtkTmBIqHRHNSVpne
mYbXYUbv1PXJkQJn73CiMLeGp2+j5I6JgdSklCuC/ppKWCAVLe1ZP4FayQbSau0q
cE6aXYlHPFEozfzjmmyv4Ja6J9Xng+XMsnxQ4mhYMg2hDU5P+zt8LZHlr0Zjtk8K
qHAHNDbt8CObawIGbLXk4E3ZA2Ejv6poocuOrRC1GXUnAnmy0Fs=
=/KbW
-----END PGP SIGNATURE-----

--z566J4CM3u1l72jy--
