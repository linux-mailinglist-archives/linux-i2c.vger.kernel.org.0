Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23B177AAED3
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 11:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjIVJyR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 05:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbjIVJyQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 05:54:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFBBE8F
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 02:54:09 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A53C433C7;
        Fri, 22 Sep 2023 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695376449;
        bh=1RGulu+iHVH8KuVLmaEqmKj2IpMS3P7N7btMGLXPqXM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BMQ1/18lISi8u94d8Sr9JS51tFKAiB1btKHOV6xl3WJjTn1IwdS4Mpo/56Q3NnfZx
         Gtwr6QsP6nlmjhQHdZly8fz6yjc/4cgUocmh901aYgCBlSosvU/FX1+ulAu5FCtalX
         CQxUcpNXUVeApg55+m2hYAzsnxqRB2A14A7DJrU/Ux379Xl5E4EqLYzKJrafWrI1y0
         0DMINyTR5S6JCwRmgTq/dZtZj37iTTw23KUrrO1kfop3WOhHeke2Yv9eVNwZLCZJz9
         uV5DHA7IxyUHXgDYfuIil2K83O9xOF5sTnIznP60xbQnvwZZ+jZSM4/kJDjAuXNQQb
         tsEBCij6zScqQ==
Date:   Fri, 22 Sep 2023 11:54:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 4/4] i2c: i801: Switch to new macro
 DEFINE_SIMPLE_DEV_PM_OPS
Message-ID: <ZQ1kPTNbMTGOLwKH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <1de49847-bb13-38b1-2820-15a7aa0fcb9a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VNjB8gfZl8Vv1Iyj"
Content-Disposition: inline
In-Reply-To: <1de49847-bb13-38b1-2820-15a7aa0fcb9a@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VNjB8gfZl8Vv1Iyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 04, 2023 at 10:37:34PM +0100, Heiner Kallweit wrote:
> By using the newer macro DEFINE_SIMPLE_DEV_PM_OPS we can get rid
> of the conditional compiling.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

So, only this patch is left which only needs rebasing, right? Great
work, guys, for keeping at it! Could you also kindly have a look for the
remaining i801 patches from this year while we are at it?

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D&submitter=3D&=
state=3D&q=3Di801&archive=3D&delegate=3D

Thanks everyone!


--VNjB8gfZl8Vv1Iyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUNZD0ACgkQFA3kzBSg
KbbRdQ//dIB52bysUXoJLqydqu0lfP+iT+ysGw67oVeQDjKEAQD8V/2wrwPQMeh4
vGOg5aHCelm5v1n0ldSc580lX/oMTTuqzmYoTmv0avMjMx5qozgaV97OP8XUn/wQ
wdSy9vhUKuKGOEFWDAiANPA7rsDBrecvLdvS3TVCIwdGbabG5vM6hEVfTkZ596yw
Q+Ci6WHKaJvPziDSeKKWv9KDH2mk34oyrd1yFmLrirsh6Az7ZSl+SwtCt1TWyklY
iCakCWrhpWfmpWfAv73FMis6MTiXv4466QqaOulQ507+uAESD8QJkbGFwcyWg3Nx
ferniUQkghBkK2RZnYxMT9nAd5p/Kc+COPypP9rmOjfwJSOARuV7bQgBuszSAgEZ
cFDOfm71XOBF9Kunq5boo9lXwMA3IyyE1KuN7rtUmozhWp4fDWj1PzVEgWiVwqM6
n7Jm/oeUZJNPcO3J/f94k5ddm5yxRphkKaGNL0Bo5rWJ+zbggnmdlsVeJ5in6E/P
O1jaf8OIl5Sp16GsTE+0ln+1zdI9nVQGw3jieIkFI1iEzzwUbYhZtF9DUiTiLYQ1
RNExTGzcCuJCheI5/hNsd5MRIwxrQY+NcknXvv7ctDY8iznOPC4ST6woczJm9VSb
6AMijm4BbNVikbIROLarZmSzJUg0K8UB41y/R12jG7byR1NNeq0=
=JY0U
-----END PGP SIGNATURE-----

--VNjB8gfZl8Vv1Iyj--
