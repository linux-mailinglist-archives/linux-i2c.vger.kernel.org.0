Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6FF6576E11
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Jul 2022 14:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiGPMv3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Jul 2022 08:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiGPMv3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Jul 2022 08:51:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1D118380
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 05:51:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FF2F61011
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 12:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982A6C34114;
        Sat, 16 Jul 2022 12:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657975887;
        bh=QPpCIEkixu5rDaZ1F0qhpduV2igYwVsnYG/8GxlCvLs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Uq5sQYYeP2YalmSTsCIjdEqN2GKh1UaENSqsM/lTjCMe5PPt36gnTECJ+iz/5dwrH
         zK0kNIG8/aciOee1v3N9hqIoBkFdsIwlVzNZKVgI+B3uB7pOIdowhlpIF3J0tK/PaI
         hb39QN3LHgd12yersuCXn/ayJISdv+1SIL6ygHMlpQ/dwwcxRUJ0EKtX8KFlVQLXMc
         BVObOro+y4wXA6HxXhZMTUyxzsQjZpf/NZyPSXdio1cZvGo588noQqKf4tXDYhHo0y
         Wi53tFCaJ2IcMXD5nL0raLGMFl+6LolkaT+HbLv/bYZ1J9tnAk0O2H89V4NEsCjDjY
         ZmhPGkx+jJuOA==
Date:   Sat, 16 Jul 2022 14:51:22 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next 1/1] i2c: mlxcpld: Add callback to notify
 probing completion
Message-ID: <YtK0QLc7KeI8jz/0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>, linux-i2c@vger.kernel.org
References: <20220713091136.734-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1hQFwpqABUmiSy3w"
Content-Disposition: inline
In-Reply-To: <20220713091136.734-1-vadimp@nvidia.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1hQFwpqABUmiSy3w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2022 at 12:11:36PM +0300, Vadim Pasternak wrote:
> Add notification to inform caller that driver probing has been
> completed. It allows to user, invoked platform device registration for
> "i2c-mlxcpld" driver, to be notified that bus adapter is available, and
> thus some devices could be connected to this bus.
>=20
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied to for-next, thanks!


--1hQFwpqABUmiSy3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLStEoACgkQFA3kzBSg
KbbEwBAArqiOvEO2s+mTc0wHnLru+oMWMDVbO36Q2INMr1RZrY4yTgRJVzX0be8V
V7hamw6CXgOuOCAuSIrr3Yq+wUphxOayoAxGOIjeLl3hDPIfT8fr5c6g9mhP8LAP
aF5ZOrGeN0qpMtt2yzFQzN7j0/U7m48rtClGHmdjaMDX69GhzdSEZp8pbAwSCLF7
OH9VKMPpDqLVpwULXHp94uzIZahYtE1WUShmYFenEaDVM0tPheNqP/EElm3I9QeM
rnnpmj/7azzntPK49GNIukvdSvt2OT/88/Hqlw1z+HnsfwNsRBMOSxFZEVRZdNoJ
Zb7bfUHcoNya3Djy+wPP2f7uQAX5PJoltkWWw4dTFwAbsVgVj6ACwo4JtZ3eTXqz
nY384IbOINrGVyGpIDbw4fyncRoUMf8BSPr3dPTWvWjzwZXcmcJ2ZreLcz9d9AUp
NqUYOP6r0tU3jyOX4PxFRnlbUxbpqtqhlKlwzXNygkIVS1cKQ9YHSdX7NP99fGex
awBNVw1h15mfXuoi7CeESVzFFXQ5zq8RUbUm0tJiFvPU8jJDco3gV62Ve44J0q33
ECTdZuf5OikODzz49axjpWpBoW94NCUXXSmkc424oCUE1kDahg5XkUrz8penUqAd
MFWe+2+7HizS3CHVHXLP0yYwcOE7pFknSP7cEZxjDxtT8Xi0pZs=
=Zg1q
-----END PGP SIGNATURE-----

--1hQFwpqABUmiSy3w--
