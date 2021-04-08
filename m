Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27AC2358F84
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 23:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbhDHVxl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 17:53:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:37998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232748AbhDHVxj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Apr 2021 17:53:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 921C1608FC;
        Thu,  8 Apr 2021 21:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617918807;
        bh=P3HQvEGEdch+dj/KdTLs4icsotD9s/ktMq84BucWuJM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lAC4nze9tW+dv+A0/zZ2j394kXLby34VY5R2rXHK4PcCe5ZuWI60/Mv7c/KQgt4dy
         IusziAqIyQAUJjCTDIdiOn1SjlJJtbYwR7njYpHuqkly33Hp1c8clHD8H8+QKDVo/1
         qFcbSHISU2n9Eo5GELtF+K5BHaMS35ZTiVO5JX75nKgADQ94llQbR+5QuihSkNqZrj
         qK9gL9fkMtJGGrwntt/aZkZniWWPwX0eJ8lhiG5KxfxzbIozz5BgJvUiKIog3fgF+m
         gKiieHTb8UB3fs87+BuBn3Sgs7hjX7UMe1wSkUP12DuDklE0p/nEEjsszYfb6o/A/L
         t/nRBclXC98qA==
Date:   Thu, 8 Apr 2021 23:53:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] i2c: Adding support for software nodes
Message-ID: <20210408215323.GK1900@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KjSGHOmKKB2VUiQn"
Content-Disposition: inline
In-Reply-To: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KjSGHOmKKB2VUiQn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 01:50:35PM +0300, Heikki Krogerus wrote:
> Hi,
>=20
> The old device property API (device_add_properties()) is going to be
> removed. These prepare the i2c subsystem and drivers for the change.
> The change is fairly trivial in case of i2c. All we need to do is add
> complete software nodes to the devices instead of only the device
> properties in those nodes.
>=20
> thanks,
>=20
> Heikki Krogerus (12):
>   i2c: Add support for software nodes
>   ARM: davinci: Constify the software nodes
>   ARM: omap1: osk: Constify the software node
>   ARM: pxa: stargate2: Constify the software node
>   ARM: s3c: mini2440: Constify the software node
>   platform/x86: intel_cht_int33fe_microb: Constify the software node
>   i2c: cht-wc: Constify the software node
>   i2c: nvidia-gpu: Constify the software node
>   i2c: icy: Constify the software node
>   platform/chrome: chromeos_laptop - Prepare complete software nodes
>   Input: elantech - Prepare a complete software node for the device
>   i2c: Remove support for dangling device properties

I applied all patches to an immutable branch "i2c/software-nodes" now.
Once buildbot successfully checked this branch, I will merge it into
for-next and advertise it to interested parties.

Thanks for this work!


--KjSGHOmKKB2VUiQn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBve08ACgkQFA3kzBSg
KbYvxA//cZnjCYK/TU9aW0p4aOvHHgXSMSoOsAhYqodIUaBAem6H4DUt8SrOmDSS
aIAupj/EYqBdV/oy8aLnkEHkyId2NnMrhTZ5Yp/pL7G+tkUZrKThgZ+iLHVwqNrv
4S0cYtMkr4+h+mp+WxvRQbougOyUHKrE9BKSDB9ZLwFHYDM6fNcKa6vP1YipN9wV
c+IS1spaWeIbMERW2rYL9oWAY/b01JWJLOvu806s4Kqtlbx9dAWGtEXpRvUFisXn
1BoIHMYZgA35aB6470MI+E5NLJKISR/QXW3y9qGVLPvE7co/D9my6m5qnUlujPR1
d2g6E5Bkn7j6GfM0PFip1ykK6+UFAKtKB8/STVT8AKxhDijAEXStMIWPOeXRpahZ
ogUvlTMoMHeLB5ON2L0lfnbBmp9Xw4sO2i1EdV8171kUpbBQSzg3ZOQhxXV2RXLY
zVBYQTXfeNijhpdbu3B4ocYNiI0buHqIErPFsz2FKvVZ4QasOtDwTl6YYz5w1t+m
EIi5KjsXiDWK651E8DzkxdBWNzASqwd265CSQkYZiRyM1hPQVCvQDgBGcpe0o50X
CLqzGalu9vEiho/8AKRSGSL6ggl6+8i6G8HfnS7wbef0T7Ff+82SsSiNK74hscA/
x3FkLNXTGbAU9CJIJFQlgOVOGtTw8Qxuv7z1XBg08imUupittmU=
=cOYM
-----END PGP SIGNATURE-----

--KjSGHOmKKB2VUiQn--
