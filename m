Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A561C46221C
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 21:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbhK2UZM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 15:25:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236399AbhK2UXC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 15:23:02 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF71C09CE47;
        Mon, 29 Nov 2021 08:57:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 799B8B81216;
        Mon, 29 Nov 2021 16:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D30C53FAD;
        Mon, 29 Nov 2021 16:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638205018;
        bh=nw9fCKRxRHuxyBELdoZgKX8zrnVy84l0Mm7/5Rlut4M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kIdaabCHjqT8Wg0iuyi1rSSS1eXcxxgMHjN2vk9O+Dv82WE0rxP1+2QXbspZWtM27
         /O1hbqICS/mPYrJxfLiDLRXjXOXzMcw3qzeCjFViT6BoQHfX/W9p8O+wvAtlrtP9Z0
         fD4DLZbmsabAKOGEyAtV0RUqF9ErozafUpb4U+DTMXm8j0I9b0jlJ5YVPrlgTNgYjv
         x0Cxma4n9JNpvnXEDOZFlxhvwx34JsgN9fE/ozKzBoyTt5FwqZDmHWkyd/kRrAT2Hp
         L705dIDD26lo8jzhcr7MIRyX433U7u8jjL+VgHePLCird72pS9o9JuIX+iU3uIeHOc
         Qm62kx4AcgX+A==
Date:   Mon, 29 Nov 2021 17:56:55 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     lakshmi.sowjanya.d@intel.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jarkko.nikula@linux.intel.com, bala.senthil@intel.com,
        pandith.n@intel.com
Subject: Re: [PATCH v1 1/2] i2c: designware-pci: Add support for Fast Mode
 Plus and High Speed Mode
Message-ID: <YaUGV3lEmW9qtP+3@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        lakshmi.sowjanya.d@intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        bala.senthil@intel.com, pandith.n@intel.com
References: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pdYrnG4IG0rZ50g7"
Content-Disposition: inline
In-Reply-To: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pdYrnG4IG0rZ50g7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 09, 2021 at 04:05:51PM +0530, lakshmi.sowjanya.d@intel.com wrot=
e:
> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>=20
> Add support to configure HCNT, LCNT values for Fast Mode Plus and High
> Speed Mode.
>=20
> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Applied to for-next, thanks!

> +	u32 fp_lcnt;
> +	u32 hs_lcnt;
>  	u32 sda_hold;

Short question unrelated to this patch. Why are all these u32...

>  		dev->ss_hcnt =3D cfg->ss_hcnt;
>  		dev->fs_hcnt =3D cfg->fs_hcnt;

=2E.. and the ones in dev are u16? Wouldn't it be easier if they all had
the same type?


--pdYrnG4IG0rZ50g7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGlBlcACgkQFA3kzBSg
KbbybQ//cFgIOGuLrDo4HhdBzjfexlvSMAdUODfj5qqb50Y+8wnr9+AWfdf7vn/T
GsDHpAZWWtI0zwrorFBR7/9WKih8zqsus1iIoy06ctDyHRC1XgjVZlA0I24PQqIw
E4cv1xLA8u4eTMn39TzGFVwwTUvBxTwQ9E3g2lF168dVHGHD+i4t0lhRlP+cjESY
iIyhKxCHlNiMGR3iSvipxoWlVR4iaNwqaqwbzxFXKJ1OlNcC5/t2cKc4bd+pCYA4
gZV504LWzSLbfilrc3V3G+L8njvYacyp6PH4S5/YoX1V26Qfi1iforyLs3QRz26j
MkJy8K+PCNFPXp85cqI01llxGMV6tIKo7Mra0N8G00gj4TpemdRXcDvv1TPS5Kmg
pP+yx2CWgT1C8wXvhNqZwpiHjt1R55kQpTbdcoXCRg//XKPur3Y2WXY3H1+k7ZJc
A3q2EGzXz4NLl/JnfS5XKHrx5cCxUIiJp2bAmQ53jp5McYi+r8zAJp66+GTiNAXs
MNlbfVMPK0qKaCbCxA4vysQrh//ZQs3vXjVTBtpkRpoDcAemG89QVAz9npHToeVA
vSwM9vRqXNEEI/Bhby0pTPTJlmt64SkgMoWa7mO3Vvp5WUASdTddDblKG63Uunky
ksxrmvpytid0/Atq++wUTXLm/lAC2wIAfIKOnaZ36b+cMVW7AKk=
=W6Kx
-----END PGP SIGNATURE-----

--pdYrnG4IG0rZ50g7--
