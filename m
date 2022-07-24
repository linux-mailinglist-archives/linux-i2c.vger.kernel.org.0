Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D798657F366
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Jul 2022 07:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235202AbiGXFrS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Jul 2022 01:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbiGXFrS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Jul 2022 01:47:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFA213F35
        for <linux-i2c@vger.kernel.org>; Sat, 23 Jul 2022 22:47:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 37CB8B80D32
        for <linux-i2c@vger.kernel.org>; Sun, 24 Jul 2022 05:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FCCC3411E;
        Sun, 24 Jul 2022 05:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658641634;
        bh=3hQZ9iJjULkCTgF4RtXrGSsZYxuYTHDpaRonXEQtaXs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VKcc4S25vByy/6CPwVodSmKEpNHWOqDXyrcECOhWg9H9q6rEmzHSyaUL9ehwIzsr0
         MyHtCa/iEnWF9pFleZg6tpyjWwDZra48gSXpbv+fwWz+TVOy8fkGmKr0AM09VBZ1OL
         fGnARayTUJj4XXT9kxMTU70EmjYhifbagsQjPh7wAXkByQ+0xOWNZQuTzTt0iTARKT
         7ZZU5tQpPBFLUa4wk9RVr5GZ1vqlqDRJ7AKoaGbg6EHYLd4anMqjGVTr8nTyWHRYfj
         TaZWzZOwtdoVHjScs/Z81IVlwevtlGbKZNSTPpRQ//59kFzpLfZzqglELqvUe5smEc
         RfgG+Nz6iWpWA==
Date:   Sun, 24 Jul 2022 07:47:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Michal Simek <michal.simek@amd.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: cadence: Support PEC for SMBus block read
Message-ID: <Ytzc3sGzcZ3eqsTG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Michal Simek <michal.simek@amd.com>, linux-i2c@vger.kernel.org
References: <20220717145244.652278-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MtK0BqFOxcDoyQGI"
Content-Disposition: inline
In-Reply-To: <20220717145244.652278-1-lars@metafoo.de>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MtK0BqFOxcDoyQGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 17, 2022 at 04:52:44PM +0200, Lars-Peter Clausen wrote:
> SMBus packet error checking (PEC) is implemented by appending one
> additional byte of checksum data at the end of the message. This provides
> additional protection and allows to detect data corruption on the I2C bus.
>=20
> SMBus block reads support variable length reads. The first byte in the re=
ad
> message is the number of available data bytes.
>=20
> The combination of PEC and block read is currently not supported by the
> Cadence I2C driver.
>  * When PEC is enabled the maximum transfer length for block reads
>    increases from 33 to 34 bytes.
>  * The I2C core smbus emulation layer relies on the driver updating the
>    `i2c_msg` `len` field with the number of received bytes. The updated
>    length is used when checking the PEC.
>=20
> Add support to the Cadence I2C driver for handling SMBus block reads with
> PEC. To determine the maximum transfer length uses the initial `len` value
> of the `i2c_msg`. When PEC is enabled this will be 2, when it is disabled
> it will be 1.
>=20
> Once a read transfer is done also increment the `len` field by the amount
> of received data bytes.
>=20
> This change has been tested with a UCM90320 PMBus power monitor, which
> requires block reads to access certain data fields, but also has PEC
> enabled by default.
>=20
> Fixes: df8eb5691c48 ("i2c: Add driver for Cadence I2C controller")
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied to for-next with the Fixes tag, thanks!


--MtK0BqFOxcDoyQGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLc3N4ACgkQFA3kzBSg
KbZpWxAAkKw2Woj6ppRJu2jeAZ/14b/gihFQBEpo7ACNE2scUODjqYTROb3tCCUu
dQtrB5pOYPod82kPdA7FHW+a+kaesJHmAD1HIxmCH4Aou4jMggCUTLGedKUKG9rN
lRXijH41yGEnb1yAOhmqrW9TQ6BKH3Osuc6d44l0DK7XyKWTj1H+L1kfWQp3iyl/
jm4o4+PEGzXhsJrJIdFXB4YCaGBu8D8MiAa9umaS87IZjMPKFrh0FBIMl2vKnrVX
urqngI5jKtvGdkCtQQ4uY89PP5nnJ1DUmQLdev6U42RiWu+IKP1pVqOBAT6f2bgU
6EG6EuczH8uAKKDRTK2qxnA0H+ComLtZaxTLNcToSRexfUusP2pC4PxAxF4x8rwG
215GzV7KySnlUXhQvchM8RV6NVEVi2lzXuXRVJ0HuULhXSmmdnAF/H6YRciq61Vr
zevpsPWX1D9MTbVNHKEbL5aPqs1m1iqz98VJz9cnChK0DtFELoZ5990ZMtju0Amd
u4LwATuolrHsdBEObOHQpkGGAU4PG8KXFBGUVnldOR4fUD61Ow0TSFf6mUJWmOcl
9dCCt+QRJFotpZjdjK5mqzU+iNTSCWGCOgc1sgi1CIaIOSSyXam2Zq/HsRDzmtfR
HVhht0Zt3VG3o151HR4UicKPECdv4yAsQX96U1GnFXbNTrwVZ7w=
=yDie
-----END PGP SIGNATURE-----

--MtK0BqFOxcDoyQGI--
