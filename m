Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A42525F207F
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 00:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiJAW5A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Oct 2022 18:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJAW47 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Oct 2022 18:56:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF66748C95;
        Sat,  1 Oct 2022 15:56:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 68F3EB80B05;
        Sat,  1 Oct 2022 22:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7695C433D7;
        Sat,  1 Oct 2022 22:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664665016;
        bh=0ZqIZXQ0UBM+eCdZQcIqyAV5qBiAep5lHkCgJj0z1r4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OmdRHje8ipOZYfXSsr7DzH0zSZiPPtZL6eKgNEbHMW3htC+MqwvN+In1RmD8JjSt2
         N/d2O/zNyprn9f/QlpuZib5Ls+sTC/6pVMkbUhK/AjbhmqgNa9M0j77mpp1nZf7lLN
         qF3GE8zbqZgVQF/nIRGIZOjHEwR42CbAR3n7ZsrUAb3ZpzgNHqjfamPh/zhkLEQ5VK
         otxwc/Ej1XrHtCo5NjuiXif4rmMvNXO6kEbPZ6Gbehvv0q4aZvrN5uQWN5mxe2npDg
         K6RoWM+jLXqgnFS8bDcI8pGsUc3ayyRqvLyIVjx1cz+te9F5PAozozPDkK4Lm7u331
         +8FTyN6QL4bWw==
Date:   Sun, 2 Oct 2022 00:56:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Mani Milani <mani@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Prefer async probe
Message-ID: <YzjFtGoGhWc1CnzC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Mani Milani <mani@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
References: <20220826074430.1333272-1-mani@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hv4+KhldsRmNp9+Q"
Content-Disposition: inline
In-Reply-To: <20220826074430.1333272-1-mani@chromium.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hv4+KhldsRmNp9+Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2022 at 05:44:30PM +1000, Mani Milani wrote:
> This i801 driver probe can take more than ~190ms in some devices, since
> the "i2c_register_spd()" call was added inside
> "i801_probe_optional_slaves()".
>=20
> Prefer async probe so that other drivers can be probed and boot can
> continue in parallel while this driver loads, to reduce boot time. There =
is
> no reason to block other drivers from probing while this driver is
> loading.
>=20
> Signed-off-by: Mani Milani <mani@chromium.org>

Applied to for-next, thanks!


--hv4+KhldsRmNp9+Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM4xbQACgkQFA3kzBSg
KbbYzA//YvggdxqjzTv/b1s6l/VCMXQ1wFHnCQ3Ctc7GBz3qnzvbrZOLdLEbrd+N
pkaQqAueT7+EV6f0Dl4jPh84S9NbM3l4q+eUhVF9Cg53izYnDgaZuL5WrfDG9qQB
0joybV/MWC8aem39Zk0c1SN/mgzdFGZmuobHCDQ3hPsfBRJBDlKG4YsTP2CzL40i
+HAJ3nLWarkTTM/GIQxF4w/3hqK912DjatUftXHSe5HGjuHz9BMlG+fQJgCg3J7z
u87BnXxtv9AcU8YvBU/oMkqiamDPaW8wSEGL8tByddt3/r9CWFnvp2L1z+s87kV6
/UD15oqeE33Yc40rLg3PdLN1mn1CoZyBj0WhR8SFsJvKbxnwferbU6USbj57lWXw
KHJAC5WPKOa5KwVqFIcFBPV+vzIm0GHQ2oe4r6ALwWKGBrbqvqW6MCHYHzQ82Iyt
VuYuwjDKDfrgk2Y+f1h0F6uZFNjmUUIdWjBIKNM79OJY0D70rJOY7pilBipT/hie
V6mrr7Bv7swlbZrm+evmRqmj7F3rUnKYRBQWlZQ/RPI17b8ZCm5ueW7zvFoOQ/Cy
Q350HB/q6oq4mOG+AT7ML/uEy6dm7b5kJrQdPPKrWDzEq1n8uXRYPPbUHO6EraJy
QUc/DsnpO6eSMR8prlZo1wiX4OBFaRmZ3dg8aMDED70k1zzBx7o=
=PXC6
-----END PGP SIGNATURE-----

--hv4+KhldsRmNp9+Q--
