Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12D2A48B7E4
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jan 2022 21:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236969AbiAKUL4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 15:11:56 -0500
Received: from www.zeus03.de ([194.117.254.33]:40498 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236632AbiAKUL4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Jan 2022 15:11:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=6cwdOEeL23AOWy/ln0Nej2nh/iHV
        3Qz/OFjc8YlCWWQ=; b=nlhd9Nfv+fG27VHiZFrUkmJZc9Z5FKMed0NGqAbzEYS3
        08OMQozaT92cE3jkXxWR+RS3nwxzIujp2z2zNlH1VcHdZU+MtlgGjIjxr+rt7Rra
        /qpPvVp3hx2sjx0T41BDFhwl+E6VPEfpH4iIZ9fP23PcH1tgMn0IzFMxj8bE5DM=
Received: (qmail 529868 invoked from network); 11 Jan 2022 21:11:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jan 2022 21:11:53 +0100
X-UD-Smtp-Session: l3s3148p1@HpNEEFTVys4gAQnoAEaoAA7mlQOmLUNe
Date:   Tue, 11 Jan 2022 21:11:50 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] i2c: sh_mobile: remove unneeded semicolon
Message-ID: <Yd3khmKbmsUc3lyH@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20220108054109.119750-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E/uryiEhX9olkz+s"
Content-Disposition: inline
In-Reply-To: <20220108054109.119750-1-yang.lee@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--E/uryiEhX9olkz+s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 08, 2022 at 01:41:09PM +0800, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./drivers/i2c/busses/i2c-sh_mobile.c:849:3-4: Unneeded semicolon
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Applied to for-next, thanks!


--E/uryiEhX9olkz+s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHd5IEACgkQFA3kzBSg
KbafaRAAkiDbNomAKsY2RK0Vc00xql1gn8gaKydg3Wi+trsfIG47HCdyvNXpoQQa
zRR21n+ZUYwihzx3YIUA/uigDiy135Ukc4E0RQkMp8nhZR4hzmy4DMDqMH9rU/4n
qfG/L2SeISCgJGgw5nzWHVaguSJGyxM87Pml3tJlkTyRjWOqtbLJ8uZRakSgXTMO
bFia0nh7v3gWU5flxnwALJZN9fnogsr8yn27VLT6OQI0CsA2//LS4zfXKivqom9T
TYzA5waY4Fl8fbKJNoP+CWlNma9IDkm2Q3wygPMzVXPbypTWPfyrC2TfqvIgBhda
gJT9JfaAkEE7ZUqeZ2R9g1LlpSryE87fRDGTlXsl1lP0iQns+G+Ev7BkFGcN0HmO
YjI2AqC5j9esc46rpDWbVfbVQ10vxMl9ene74MVtfYquIqqbTHtAeFd1pJy9XUax
9VAR+v5uuxO9wENvtD62wsO3DCsIqLa2FmEiGp3dagoOIcKpP+stj313Ap1tkWpn
Ec/hHlWdV2jkAsttwAdY1FPDNkkCW4VQ2wzbNvssRh3qbKiT8coHNyRWRUG6cwEN
Km1mvCBbIdd+Z7yXeA3lqLGzdAoHp5btgYDA98fiZhjrfXduicjF96A2Dhflj/1Z
t6M+NkKDzWGHCR6zwVW1aFTNpBE4uVvKVRQcujueUq9d9af927o=
=3DHl
-----END PGP SIGNATURE-----

--E/uryiEhX9olkz+s--
