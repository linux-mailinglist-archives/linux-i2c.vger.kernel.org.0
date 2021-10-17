Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE2244309B8
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Oct 2021 16:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343821AbhJQOZq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Oct 2021 10:25:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:49062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231156AbhJQOZp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Oct 2021 10:25:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B89B60F25;
        Sun, 17 Oct 2021 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634480616;
        bh=u/RJgwBpG/Tu9YYkznyutqBM6vIUEdyN5FTOH2rAcp8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=erect+gwOpQHpeQmQ+mvrlDf97mqesEDIPrBVBCLXUKv5x+ESvJaDqdKolzrc2XyX
         LzGI7aVgCh70/ps3CCeVDoaEr/mpwcqZM5CJ3S+B3anvpMq047Ut+xmomuGw3dNVgh
         y8LlZbKBInRDa8i+GSLz0q9VFF6lKSejG+MN7KhtMtkTgzbLsXAOzaI3aRHTxeebtj
         AAbTgfBVmZyoEKWARXGMRRT4a1k+8HbftbSjddqjFkmnrw0fvUBIyxmnhKDKREWKNE
         zHvNXIgdikpcPJmmBE3xezhtx88LlbkuBUdlGDIpAuIQXyfMV9oqhL98NXFdvIu2DP
         c0EdXalMDI7+Q==
Date:   Sun, 17 Oct 2021 16:23:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 1/1] i2c: i801: Add support for Intel Ice Lake PCH-N
Message-ID: <YWwx5NJTFmR6Yqkb@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <20211001172154.15660-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6JV+cPk/3aMxWDAh"
Content-Disposition: inline
In-Reply-To: <20211001172154.15660-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6JV+cPk/3aMxWDAh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 01, 2021 at 08:21:54PM +0300, Andy Shevchenko wrote:
> Add PCI ID of SMBus controller on Intel Ice Lake PCH-N.
>=20
> The device can be found on MacBookPro16,2 [1].
>=20
> [1]: https://linux-hardware.org/?probe=3Df1c5cf0c43
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--6JV+cPk/3aMxWDAh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFsMeQACgkQFA3kzBSg
KbY6oRAAg6wFty7kiqnkhMb4/uam1Tg++wcohXBBHfxSGMglrGaDxGQt7q6KFdc0
4TLKYQez42dwCS8hSxdybT//95ndAKZYIlVQh5YrJtaRZrv7/ALFwEz/W+Waoyhl
pioG/sWH9q6DQuYeLaAu7n7JzSL6sQjRTXH5xqMMnm0V5i9n4GZ3et51i8H4kWZi
nwCUnenPV2SWZm40yYku8vf07KBNjlX1wUGEFfnSiZLqIILRN9VaBuYn7u2XO8bp
XkkxaB6EVHVhW/TuRf7tdj93ABV7hA2uNHvVyjSHr+XvAokkyS8j+LHocn62gSRS
eHEBdCQKxhDvK1aDoySEGGORqikr2O8B1ZLhiTrwmuyPfZahYY0trxSB6eS7fc3D
t1XRsJ7RqCtiwMsV8hxt8N+wSH6kNlDRiXzi3f4EUYdzsF5Ty7rzk9SAcDNmkH7e
6jkpqAz5ZYFXsk1gUwi5/cCkG4U6F/lTgowCJhLAF3KSKnHmDvSPCRd+c+PVaP9V
xD6ef65WbN9abMAxhJ4WJepcim0jwJ2YHkEAmhEF71VZnYcr0nlQUYsanQAbHQld
rvGmIsy1vq1k/JbgrRJ4TDc1dW9KlAt0PMdzW93I3UpqUnZKqb/P+F1H0a0YpkHc
KlvLAXTgsNXj0L1hc+xOidwF+OCZllq9kkyTb4g+I3hVxQz1Vns=
=J5KV
-----END PGP SIGNATURE-----

--6JV+cPk/3aMxWDAh--
