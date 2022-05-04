Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3E151AEEB
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 22:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356461AbiEDUYX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 16:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378001AbiEDUX6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 16:23:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8817910A6;
        Wed,  4 May 2022 13:20:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 46467B828AD;
        Wed,  4 May 2022 20:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67909C385A5;
        Wed,  4 May 2022 20:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651695617;
        bh=geFDPzJVs0HcYSkqypzjcAX2q1cZeSSqsEdLgxt9m4c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vAssURayg6u+1d5DYrK98zrlfYG4mss9BlIK5WGwuqi/GOKAILD1wDfdEScQcGDUc
         tEe+a3NLWvGXj4q/+WoPWIedr+uk0b8vIsAcerK5Cpw9CTrbgbpHfJZT9DUj4QfkFP
         lM3nOL+rHKLsgam8M+WE+iYBQM06EARaFd4IGdqacXARLIzVhsmOecIUjj/0QM+FYU
         xzGZwKTcupqTKkEe4Wcm9rWrh5zTpZKihIa9XSpcuXhSkFlCAZENRFgMiVWzbjVKRL
         XBllzpeZ/9ag9XzVbmHJqEF5yijYgZknxOx32i9n60Im/pTck9vwMU2ikIl/9oGP0d
         aPO8Z4Q6/Bfzw==
Date:   Wed, 4 May 2022 22:20:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     qii.wang@mediatek.com, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        nfraprado@collabora.com, kernel@collabora.com
Subject: Re: [PATCH v2] i2c: mediatek: Optimize master_xfer() and avoid
 circular locking
Message-ID: <YnLf/QdSIm0/B+me@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        qii.wang@mediatek.com, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        nfraprado@collabora.com, kernel@collabora.com
References: <20220411132107.136369-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+Ffh0zQ3V8hTbmod"
Content-Disposition: inline
In-Reply-To: <20220411132107.136369-1-angelogioacchino.delregno@collabora.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+Ffh0zQ3V8hTbmod
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 03:21:07PM +0200, AngeloGioacchino Del Regno wrote:
> Especially (but not only) during probe, it may happen that multiple
> devices are communicating via i2c (or multiple i2c busses) and
> sometimes while others are probing asynchronously.
> For example, a Cr50 TPM may be filling entropy (or userspace may be
> reading random data) while the rt5682 (i2c) codec driver reads/sets
> some registers, like while getting/setting a clock's rate, which
> happens both during probe and during system operation.
>=20
> In this driver, the mtk_i2c_transfer() function (which is the i2c
> .master_xfer() callback) was granularly managing the clocks by
> performing a clk_bulk_prepare_enable() to start them and its inverse.
> This is not only creating possible circular locking dependencies in
> the some cases (like former explanation), but it's also suboptimal,
> as clk_core prepare/unprepare operations are using mutex locking,
> which creates a bit of unwanted overhead (for example, i2c trackpads
> will call master_xfer() every few milliseconds!).
>=20
> With this commit, we avoid both the circular locking and additional
> overhead by changing how we handle the clocks in this driver:
> - Prepare the clocks during probe (and PM resume)
> - Enable/disable clocks in mtk_i2c_transfer()
> - Unprepare the clocks only for driver removal (and PM suspend)
>=20
> For the sake of providing a full explanation: during probe, the
> clocks are not only prepared but also enabled, as this is needed
> for some hardware initialization but, after that, we are disabling
> but not unpreparing them, leaving an expected state for the
> aforementioned clock handling strategy.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Applied to for-next, thanks!


--+Ffh0zQ3V8hTbmod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy3/0ACgkQFA3kzBSg
KbZSgg/+OcspNsB71GsrUFefU76o8S9qJdpJSijNT4pBMxh0uuNqFyyyPDrbC34S
5MJ1viEhDqP3FCzLH5UUnf9Jy5DAVUuaPKXJAbJy/LMHyCiDK7eMZFur4gDbyXdH
w9IcR+CGYSoBonwTGjigl2EbihwVCPSx83a1Qp2Apxz0gmeZpvphiGjACjCsotZG
rWrU7kQsFObAiRncEvyL5frJu1uVNYbQlguUr/u67Ntn2mcNSWuttxLOenZQyYZE
ppRBD4wQh6xK77orTjI1H7qgiUvr8lnw0ftgcUqP+RlOxUX6/gBEOchKX1gVHPkD
VLOhkY/j3D6eNedBBtdVAGYI4zpQe3gk2+ywT2u+S7+Cibj4NKjQCvQj6cXENNhY
+arC6eYbfZaghRbetcJQKKA4ekYa87ahQji095sVNikrhrdheusuPjiGA7ZMfx/O
er7cXUN0ImrPaCIiS+uDD3AlMAwXSnVXTI+3N6PmPOKue3e34H4QEKfozAWGUg4X
nRbR0l4IqjL18nvQEIEj7kFkQ67ZaJr3Th2Fksk3Es2Rhu98ktuNlsrMvILOvBZe
Y33YKB/sFySOvJ2hL0y5gqbL4TTeXh7crLCc+9lvpYlCGn5VtsgpB2lAqw/cHi8j
L7ooc0q+PcfPhJgnKfFby0ytn8Q/3kJK3N3xPJyPxMz6s6Agrs0=
=Znzh
-----END PGP SIGNATURE-----

--+Ffh0zQ3V8hTbmod--
