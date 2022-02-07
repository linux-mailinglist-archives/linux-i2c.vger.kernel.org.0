Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6114AC257
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 16:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbiBGPDN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 10:03:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383558AbiBGOot (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 09:44:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A598C0401C1;
        Mon,  7 Feb 2022 06:44:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BA078610F4;
        Mon,  7 Feb 2022 14:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5E6C004E1;
        Mon,  7 Feb 2022 14:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644245088;
        bh=nAXYK6axBeHMkgxPIHA717JtUwiI1dmoeMXfl99zioA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mQITou0XDAOSWP81fk1y1hectagluyyjmUG8VGPZGPCxJTm0AWNNjllv0hA67naU8
         2ThVsMrysosu7UCWIWsIkpEBCdBm3kfTtEjZY9jY3YVSA1WqL3BvN8FrrC67rKWKG6
         ohV61tzluTTstzOKHYz1RgNltgcaVtcxfD6oYwWpMIbaWuBlISp9i6hyzAxHS8mXGe
         rXZRkSw68DyfXNPtiPrW/xy2onfDbyINxLiIpWz4hfgNKpcGiUZ8fk39WRcSuLWRHS
         dNwxBskJL2wzYBSQe4AjcyMd2GFj3+zjGCNvoIuWfsTEa6WVmespaNc76tpREPTcQ7
         /1b+imhMuoi4Q==
Date:   Mon, 7 Feb 2022 15:44:44 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Elie Morisse <syniurge@gmail.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: amd-mp2: Remove useless DMA-32 fallback
 configuration
Message-ID: <YgEwXK8h+KR3LPgg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Elie Morisse <syniurge@gmail.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <80f5c9b0f496d769882d807008c21aad192139f9.1641731644.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9lcnKpQ8wmhWyrg8"
Content-Disposition: inline
In-Reply-To: <80f5c9b0f496d769882d807008c21aad192139f9.1641731644.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9lcnKpQ8wmhWyrg8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 09, 2022 at 01:34:18PM +0100, Christophe JAILLET wrote:
> As stated in [1], dma_set_mask() with a 64-bit mask never fails if
> dev->dma_mask is non-NULL.
> So, if it fails, the 32 bits case will also fail for the same reason.
>=20
>=20
> Simplify code and remove some dead code accordingly.
>=20
> [1]: https://lkml.org/lkml/2021/6/7/398
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to for-next, thanks!


--9lcnKpQ8wmhWyrg8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBMFwACgkQFA3kzBSg
KbYR4Q//TGJNfc01Vq4YzC91lxvdI0IbGaGZiLakzfjOYcDpAt9bJ7ogy9VAo9bI
TnFGvBNKeooCJnCMXFZCjgBJjVNBG71dk+22V8GgtrG4pvAksmh0i6p/eRco9R0Q
13zEEbgvjLzF+ryjmoD+ef0XOQsf6zpjUdwlJQTkvmytTV6kq3d/O8tGrfbL/dxx
nHQU2mFEGSmqby47J2V2t2wlgrowwDc2X8FGG70B/8Xw6ZqQCeDqnHAdWmKNwuTV
RPzumkAIRo86tAzbtqvyMsrqNlvIXRkkiGjYtcEm/Jgqj8ANHSK7i1AJkwpt4R+f
vMWzLjczDI9tdPX5CyTIkR/Vdv0jZBdDkUeIFklkBNpzKroRP9LAxxE7BUyulFEK
5l++WnUJBzYhA0EuQEpujjCYMx/lzPav1jqZDKnjQs8aInM8b64PumPqEi60lKs8
/OHnl+uoMLmVVJMZOwQ/c0Jo6naUSqvPUGGiKmrOpW1mWsfBU+cMQNXdreMAxDXE
MN7yf+4bst1+zKpRQ0aHFGnOmuXfBhTHWM+oXlD433AjiB927m62P1MiWtxnV6/R
R4pvUF80qYUK0vCI2Qs11CNehsaeuBUYToYFrnAix/22HAyYy4k0FDCoJwyy/sGl
BrYzt10ucPouHsOA+jIG//eKDoSwMA6JfH3W53X87PuTggGbl7E=
=qksk
-----END PGP SIGNATURE-----

--9lcnKpQ8wmhWyrg8--
