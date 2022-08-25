Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E42C35A0A89
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 09:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238793AbiHYHnW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 03:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237854AbiHYHm7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 03:42:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED3CA3D52;
        Thu, 25 Aug 2022 00:42:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6EEFAB81DF1;
        Thu, 25 Aug 2022 07:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE29C433C1;
        Thu, 25 Aug 2022 07:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661413369;
        bh=jo4iwhN0ZYXWfv0uD+BxzoZiXf+fecbwKbdRpXmtjTc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sw1WnXQIDEUm52NyWznsDACN5zHOxRiR8BSO+G95H0m0LmNEZXoOztYX+iUY1O3ww
         o5fioWafmGSewPg8JDP4j9PQE69d3T1USDjU+7Q3UipinBrictZbnaM3EkX8LevvOC
         XeJgzQZHY/wJWBXkLEhW5MRAyfuPPQq8Rat861/9iPWP2DlDP3hqcsa5t04GiVAXrK
         HGKBKeMhZ+15fMMwCf2BkmFfuFB7TtRIwdrqKTd+Xf40HMx6mzK7qqj92IfiT9ycf+
         532EFb1Lp+5sfZDIsw2uFpNPPALcFV1aUb5x50e60kaNwxi8HW9rEwgVu3Ete9tnf8
         ne9cHoFFPu8+g==
Date:   Thu, 25 Aug 2022 09:42:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     luca.ceresoli@bootlin.com
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 3/3] docs: i2c: i2c-topology: reorder sections more
 logically
Message-ID: <Ywcn9Rz887L69yS8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, luca.ceresoli@bootlin.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220824083104.2267000-1-luca.ceresoli@bootlin.com>
 <20220824083104.2267000-4-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="c+SjLRlJH9IOpbir"
Content-Disposition: inline
In-Reply-To: <20220824083104.2267000-4-luca.ceresoli@bootlin.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--c+SjLRlJH9IOpbir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 10:31:04AM +0200, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> The sequence of sections is a bit confusing here:
>=20
>  * we list the mux locking scheme for existing drivers before introducing
>    what mux locking schemes are
>  * we list the caveats for each locking scheme (which are tricky) before
>    the example of the simple use case
>=20
> Restructure it entirely with the following logic:
>=20
>  * Intro ("I2C muxes and complex topologies")
>  * Locking
>    - mux-locked
>      - example
>      - caveats
>    - parent-locked
>      - example
>      - caveats
>  * Complex examples
>  * Mux type of existing device drivers
>=20
> While there, also apply some other improvements:
>=20
>  * convert the caveat list from a table (with only one column carrying
>    content) to a bullet list.
>  * add a small introductory text to bridge the gap from listing the use
>    cases to telling about the hardware components to handle them and then
>    the device drivers that implement those.
>  * make empty lines usage more uniform
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Acked-by: Peter Rosin <peda@axentia.se>
>=20

Applied to for-current, thanks!


--c+SjLRlJH9IOpbir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMHJ/UACgkQFA3kzBSg
KbZCDQ/8C8jQRkpXRQPGrAWtKIAt0E0gRrAzlUyMhnCaZInSKYbVfp+J5a0UVB9M
v3iUU0X2v57DYYBjTbIvOzfjkjJRVDl6zeIlkR1AEwXAscJs74B2tbE7qABQc2By
8qSLbXIHv05D+Nl5pQPBxDqiHFzLLEVg8pT6vqtPJMhPv+dk0uDpix+2qvVSptdV
TqSbQTebhg8edil7bbTYeCD2fWSQ5gnMVLxACbU/rW5WhAQNpeEpyICCbGiELa/D
A2Vq0a4BbFJJ408NEWpyoUJzH0L05B+ZR1JFLjGtOsWJ5YbIzcyOpyTAidd6wxoW
t83dDzSeaGlZWn/Uf643tVjYIbD2d9aCaLaOlvUBmQ7+JDpDdQYZEcXiciNUwkjg
6nvgohKAGtgJdywJBMhi4GuZ0mT0QxIAa4+XyWdif6MACLwAy0NapsKjjHT0mnnl
/OFc2Gw6tqElDjJHRQY+1ApcKeknq2E/y+1Pd+DbpNu4Stg2q0QeIJ3ff01vCTiX
aL/g/C1g+bIPKBd9C0J6c5Reg0KIrlrFiCIGZBDGKN3JYwBfTtMuhTOXyFA+9RsN
IiUJQ2OFPK6o7pLvtlwMwOXgp28Vv9hMmD087Wt+xgp1S1cBWQ1d646/qOf5WzZ5
hS6JEEQcXhqJSI6YZQBUJ6+V6QaO09DBMmYyMsmPed8ijteDv64=
=WKo+
-----END PGP SIGNATURE-----

--c+SjLRlJH9IOpbir--
