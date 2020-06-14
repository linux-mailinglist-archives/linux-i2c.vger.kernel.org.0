Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 361651F87F5
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 11:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgFNJJy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 05:09:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:41550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725265AbgFNJJy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 14 Jun 2020 05:09:54 -0400
Received: from localhost (p5486c990.dip0.t-ipconnect.de [84.134.201.144])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57D4B206B7;
        Sun, 14 Jun 2020 09:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592125793;
        bh=GyWN7fwCZHMu/ACIxItEJPZwDRM38mgAnMbmho6SoLM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gyNdZIM7IHGZgb4axJGxNbUz/L5LJBNw8Fp8y5s6kZniCTgX/FW0OS8gk2ySwiQqq
         h3ZtVcEBjBvX8hq+pimwyK0wBcU3fIcKEphF2i6pfwpobZ8cqUdpdU27nCPTiqjRAE
         YmMsfWx4MuLJNhMA/yUv5DidGzaiLbXqbvDzQ/ac=
Date:   Sun, 14 Jun 2020 11:09:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     wu000273@umn.edu
Cc:     kjlu@umn.edu, Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh@kernel.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: xiic: Fix reference count leaks.
Message-ID: <20200614090950.GB2878@kunai>
References: <20200613215923.2611-1-wu000273@umn.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <20200613215923.2611-1-wu000273@umn.edu>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2020 at 04:59:23PM -0500, wu000273@umn.edu wrote:
> From: Qiushi Wu <wu000273@umn.edu>
>=20
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus call pm_runtime_put_noidle()
> if pm_runtime_get_sync() fails.

Can you point me to a discussion where it was decided that this is a
proper fix? I'd think we rather should fix pm_runtime_get_sync() but
maybe there are technical reasons against it.


--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7l6V4ACgkQFA3kzBSg
KbacZw/8CozQWe7U1m+g1iWgjOxVuE65mf+56wzqLkcKyULNknbdqa6A3cLA/BXE
MjpMsuLzwrfVw/KI4eMRvFaYdUE1hYx3UIiwQJNTW06ZvafZ+nmhijnB8xTMQ6VV
ZAR1biiz1Wd9xpaU4Q2s543Hn2Z0a/l4Fip4lZYuvmT09IRKJrrT6zAvNbeXla53
7YKsf0OmFLYUQEzjES7jVf/t9v0z6g9Iy5lTRQqki1VjZT1RspIlu+M2GFiIsT53
y+wbn2QNGCGHh23OrUMByPw2Ni8apZluLR/kKYv3n//+PCVDhuMT999VMuh/aJ9Y
w4dsxEyZdfwTpUgAZGGm8gLaxFYX0AIkJaqC3M+gy+sDc7ZkKNRtnc7DvBR5r7ax
wtbjONMGUsb0uu5q247hjFZsyTWqkl+5oJbkL8a77XODZ/2ppqSHjlzsay0mFwoA
1MsaFdxOnTTwZQSqSwLXTQ0sBsLuS//mAwVt1v4cykRydP1mIeAXiKSc0ezvWlo0
sOC6xh3snVbEH16jMy1j2+NzALqjyiOVNz81cttL9CyTjcpr+7jAzTYLoEKYAHcN
HDYROLWOg6z5RJ9kdpv2iPEF3XOvnkPT4xNkgkI1bl70K8gg4/B3iLtvF88kj7cd
32XVac17Ca6kejsX6PDCUw3bjWG6oVh7NeTWmESC/bv1lgot6xo=
=mHF9
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
