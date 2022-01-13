Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562B148D311
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jan 2022 08:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbiAMHml (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jan 2022 02:42:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232273AbiAMHmk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jan 2022 02:42:40 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C023C06173F;
        Wed, 12 Jan 2022 23:42:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD7E7617EE;
        Thu, 13 Jan 2022 07:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D8BC36AEB;
        Thu, 13 Jan 2022 07:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642059759;
        bh=aj+Ty+LL6hJYprfF8bZ6YdjqiZvpfeIwP7onRntXsxw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d4lMxM/iSIj/Q3rlYeQbBZDmcFXkb+T/1iRLcSOpESFyw+6jp8bEVkWQuJL2/xQYb
         9vMdXNFp08L4Qis3WW1VgkMuUEI9eEJ/wdL9vD3TF9JIBfRU5u6kBaUNxupL5/6Y0/
         2UsjQRagw6T8ipn3RY1kxT2wZlYy6FvE8UOafCNBE7X9NuYvTlHG5Aolrc5C2FSr4Y
         dfKhTOw9J5xsF7TlBGcFrNCuYbabZ/kOSumFslgVX1c4LG7+p++ZsYhPxGZgpMzTLq
         3Y4+EA8NiLFVyFw2JVxxR/dkRwDlb869PtCKkUaXK57QFLvN8Dv6meMEWlrLnQW37H
         GDAcdWrVeqkZw==
Date:   Thu, 13 Jan 2022 08:42:32 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Robert Richter <rrichter@amd.com>
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
Message-ID: <Yd/X6DlWjACLODe2@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Terry Bowman <Terry.Bowman@amd.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Robert Richter <rrichter@amd.com>
References: <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
 <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com>
 <ebee1239-4ed4-8c68-54e0-f684cea71e93@roeck-us.net>
 <YdoG+en5Z/MaS/wu@ninjato>
 <CAHp75VfC2XsF2j=obXu7RLNZkKSsZ20eOH2-UMA9AoMAemKa9Q@mail.gmail.com>
 <Yd16cw0AaYcf7eSf@kunai>
 <811d6ec7-7eac-dfd3-5927-4adcc2251fab@amd.com>
 <CAHp75Vfv9kgxu5u1YfjEuRmwj=jSybmZ92bpt30jB8MX4LFHaQ@mail.gmail.com>
 <CAHp75Vf3G1ftL6VrCchCTC7UbEyWD65wdjRjYOwxY9ONxZ=DCQ@mail.gmail.com>
 <74eb7c8f-7072-495a-fc26-b60bf0a1f51a@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nUPXFkb+mu9c8rKV"
Content-Disposition: inline
In-Reply-To: <74eb7c8f-7072-495a-fc26-b60bf0a1f51a@amd.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nUPXFkb+mu9c8rKV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > On top of that I'm wondering why slow I/O is used? Do we have anything
> > that really needs that or is it simply a cargo-cult?
>=20
> The efch SMBUS & WDT previously only supported a port I/O interface=20
> (until recently) and thus dictated the HW access method. =20

Is this enough information to start v2 of this series? Or does the
approach need more discussion?


--nUPXFkb+mu9c8rKV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHf1+QACgkQFA3kzBSg
KbZlGQ/8CwGpBpdZ5PkPlx9rPOQu4vqmY9XVOUFc/usYIYobBF4Ipt8z7o/dY8dy
oDoNXCZ4A3Fs5ifaP2HY2HMwhXsuYYUht3pyWhQIduubc+eYdbw4PYuBoOTKY31Z
SleZRGjCmne0L93Le1vrE/xS/06dTD5qT6u7LngJ0OtoZ6IVsz/TqPMEZ3hxE4sJ
ThPTS+9ayHx//H63Ielg0vmy+/BfPyEXCnE/tDeGFBaO2VlmfsQgI2IhU8YQkYt1
rv3GZHgmlNRCgAKY0pUj4IEM1BA0g1C0oWZFTEMIH+ua30DOiSD79eC6/+0PhkOE
AOwCyaERrWPh6EINZBC9d8UiZPwtaMseNaxJwH4yVxnV/Nk+tY5+w7gZziMxma9d
ztJ1hGHtTriNNszLGuw5X/EuZbmBzWDL9Nr0uQOyt3wOFdoEsPhD08JwrrHh2Ctl
VhMLEynJKH6RcYCokJd7k2IkwXk4lkCsNZ0mCZWLu+XyVacP6qJzlLtr7Yl/F6Na
tkcYGJlrbrRVX+LRAVois7z/GdwLi1ECl+WS0FaZRlzyNgVe7dC7UHZHNgDQshin
e1FLg2dq3xg2JlxSPaGT8fvlUS4EnI3pgQk6nlD+ghS0rl3iXr98KRNmkpgFcpov
vB9He3zhKTGz6U47MHylB9/ISdyLuYy7AaqeqXnhGidKtjBCFqw=
=SGXV
-----END PGP SIGNATURE-----

--nUPXFkb+mu9c8rKV--
