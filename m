Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1E82F91FA
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Jan 2021 12:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbhAQL2W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 06:28:22 -0500
Received: from www.zeus03.de ([194.117.254.33]:38504 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728382AbhAQL2U (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Jan 2021 06:28:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=EuAcIGM5UpaqNlEQP9NTkc9HxhbR
        /sTXIcTuq3b2I7c=; b=Zo78i2u9ZF+Fo5YhbPErZYbfHbEJB+pDHpy/jlEXi521
        izXDPr/DHHpsslDusiBJgj7kxysBxwxZsEPBPJgufZPdVTiinfNSALGaxgFvbu83
        pRjx4peZjVLz35xDGFpSfijl/WeaWifE/644Wj2Fbguz1mSoqTASERLhF7gSNfE=
Received: (qmail 301521 invoked from network); 17 Jan 2021 12:27:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jan 2021 12:27:35 +0100
X-UD-Smtp-Session: l3s3148p1@tK1d5Ba5fJkgAwDPXy7qAHeYPdzlZkhM
Date:   Sun, 17 Jan 2021 12:27:35 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Robert Richter <rric@kernel.org>,
        Jan Glauber <jan.glauber@gmail.com>,
        David Daney <david.daney@cavium.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] i2c: octeon: check correct size of maximum RECV_LEN
 packet
Message-ID: <20210117112735.GD1983@ninjato>
References: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
 <20210109124314.27466-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline
In-Reply-To: <20210109124314.27466-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 09, 2021 at 01:43:08PM +0100, Wolfram Sang wrote:
> I2C_SMBUS_BLOCK_MAX defines already the maximum number as defined in the
> SMBus 2.0 specs. No reason to add one to it.
>=20
> Fixes: 886f6f8337dd ("i2c: octeon: Support I2C_M_RECV_LEN")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAEHycACgkQFA3kzBSg
KbY2ohAAp/hyssOPhPf3OI/RB21Oy1wD1tgMlneSN2fgkqWW462s//YHlYebmNBq
vK2VAK+JH3UCHwmVF8IyaCmPtBi7hdtFwR/xyf4Zh4zijH9Rtl4rqpfvdX/zWw0o
dGmJ5Ffy6U91qvfWjUq6P+SwtApL27PTgV7eVXz3uR70rihPyDL09wPqzD6dEnT1
pet14ry5r1yA+i674vaQQpPQsJJh86i5DxcH2oCWnGAZP8GSx7lBXqG8YBiN2Ph2
Dkp4IF2z+xHIxO27+4FB/p8rQGGqZmKZLHooI2scKuVZAu1faxWCkUSUrxfbStZ0
0DZj6cV0W/ggCS3kQogRyGnTpcJIvdZQsKvTerL8UborlNpcDGqyMUm0edbbsShT
KshchzdEv1VlxasElZHaTegyijJmX0b6dTA278orxgqxEWm6iXu6VsNJCyLw1kt9
3AxdJMGG3yqSXwRdXSyK4tznwoLlH+20Hg5L1sDGdu558naDuwoPlfUS2BkZzkq7
SkFt7wL4jwNy/HKIxD++7TOR246z9k7uRz08vgn3OK1masBX+9wZyjKRn4lQfamE
mb8r5/8L21jchBfcqgYOFPDA8Q8DCSDHkX2q+0u/Ldox4rqcTXevkkrzHDAKRRZW
4Nwi0u62slT2pvIr4llGpL3NMZz3NyGpSMevchq5E9p6C30NXyo=
=wLIN
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--
