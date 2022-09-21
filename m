Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 034C05E5448
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 22:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbiIUUNa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 16:13:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbiIUUNV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 16:13:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4177EA4B11;
        Wed, 21 Sep 2022 13:13:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 48C0DB832B8;
        Wed, 21 Sep 2022 20:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72058C433C1;
        Wed, 21 Sep 2022 20:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663791194;
        bh=PHk8LjPeryu7k1MUPuNIxIKYgvbrfFf5jF2Ymha8OMw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y+Zj2e2xh9bOFNF8lY5GZiF9WBhmU74YfQtOexO2CAWezzLePLywGmBqS+dyW1hRR
         zbNibMjMPlTIrITo7B61npoe0kJ9ZPmI3Cho9v6xTqpaFigNJirGRiAnhx6nNMPGxg
         vuExZEv/j8hO+5SuzxbRTQAVwyAf2qeQHdWRv1RwhjceM8ViTRBKUDUEQiuH87p6v9
         7JlRGkmJqy5mWA/NjusOrZjuJ3a/R7HI4F/UKqwaSEukOsHds3fKbJX7DJlDqTYIR7
         y0r6ZH7ElzzD3kjyaJ2hU2HnMgHtKGzSrqKaztNV1p6m0Oh/ovvoZUe/3dXXqSemFH
         nMaxMfboI5xmA==
Date:   Wed, 21 Sep 2022 22:13:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Peter Rosin <peda@axentia.se>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer
 overflows
Message-ID: <YytwVuLBo4pPHKEO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Peter Rosin <peda@axentia.se>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YyMM8iVSHJ4ammsg@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3kTeK3XY50ukqv1d"
Content-Disposition: inline
In-Reply-To: <YyMM8iVSHJ4ammsg@kili>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3kTeK3XY50ukqv1d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2022 at 02:30:58PM +0300, Dan Carpenter wrote:
> A couple years back we went through the kernel an automatically
> converted size calculations to use struct_size() instead.  The
> struct_size() calculation is protected against integer overflows.
>=20
> However it does not make sense to use the result from struct_size()
> for additional math operations as that would negate any safeness.
>=20
> Fixes: 1f3b69b6b939 ("i2c: mux: Use struct_size() in devm_kzalloc()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to for-current, thanks!


--3kTeK3XY50ukqv1d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMrcFYACgkQFA3kzBSg
KbYS9BAArOhtfZs76oY6YNiM8cTO3gC9ropb3iQD70LsDFM2A51OI3/HnMvJc3FO
R4Ur9qemhhL8Xt+IGOE1EX+Yz/qctGE9AGtcEoErkUcFRArhonwtT6mcoiOgTM4X
WzAEhqRy40j1zrE2COWGEQiID2YWl4qM1nERfsnyc6sVYbiL57wKv/VHruNFw8tY
/VBSLUAAHFeAITvcjr1fmhNpRzHm0odQt38VkMsGQzciBqj1ygmCtqbRnt8AWa1Z
msKTnw1AIWC4IaWUxXlH0F2WO1L/tOUu3hs2wyNPPQprzFcCWacsWNX4IEUPvxYg
ug2X4N1qMgr3MyvSDwcsPM1qJ2X7PRVlnN8SH3PKRizm4qGJ1qGKqxwmQEbaGyQ8
7M1CZ0cgUAB0nfuAfBoVON62d/6yo15FcRapYT4BOAp7pmsFQVJ2ipCc8rzPLvq0
oeMyK+S/vh7z+B6ml6mf/wI9xFGME5DjwajIp/lqOAU2bcIFUfGBt8EDiz5MdFMn
GPM5vqekW/LVGDAzc+ubTRkRSYlLfQjF469TVFgYDsbrj5HkaHmZTm0LBSGZZpQ8
GQgi7evo5Ubu/0QzZyvgnzt2qxsvv3uJ46zLAWUXbNFAneqik/uJiJqwhHHd/VvS
u4bUnz+GlAcHCzf5Nfbh10z8f5BxN9+10SopwPEhOnCKjYt3pB0=
=P6VH
-----END PGP SIGNATURE-----

--3kTeK3XY50ukqv1d--
