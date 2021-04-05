Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10CDA3547FD
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Apr 2021 23:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241230AbhDEVDZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Apr 2021 17:03:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:59490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241232AbhDEVDO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Apr 2021 17:03:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 592316117A;
        Mon,  5 Apr 2021 21:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617656588;
        bh=hgMdEZfKlgTEAMlXGXhRkerARCNyZcju+QslGwOa0+w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CuiKqK6svPBMbgSzIV0swbko66D/AF3rArVuHPgVfs8zqbZ51XIxJoy5Rms5WZocO
         FdYtsFXO+pJiN0boea7dUBCuru/Ppj7hCkZvlBTQPQIfsyxkmjMEnLpEkqjCeFErmK
         7EpAnv4PnrCvNumPAGB7HknxP3HYlm5Ax6dKvd42s3HK5Me+cUeHeS9wKzP4TA/bqL
         Y0NATtShghJzuuh7wddqqFX5j/56G8uYm8IHj6ymVW36jgxBSKqfOYDNWAWBPCjueh
         ZDOcVgP4W7mVhE9V1M6efpa/VZa+NDvNpFJ9eQSLD8mLfMhSDgKZUu4PcT3/oPgWSl
         I32DbOIUEpepg==
Date:   Mon, 5 Apr 2021 23:03:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 2/2] i2c: tegra-bpmp: make some functions void
Message-ID: <20210405210305.GH3945@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210331075141.22227-1-wsa@kernel.org>
 <20210331075141.22227-3-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y9PDtDHaFrXNoMPU"
Content-Disposition: inline
In-Reply-To: <20210331075141.22227-3-wsa@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--y9PDtDHaFrXNoMPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 09:51:41AM +0200, Wolfram Sang wrote:
> They return 0 always, so save some lines and code.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-next, thanks!


--y9PDtDHaFrXNoMPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBrewkACgkQFA3kzBSg
KbYD5Q/4yRzQqwhyuGPyBrn+LjCcl54QozSdFBOpPGtnsq0ZxeTQxqk6E2D04DA2
nIinuPWGXvrxGU2S7zI9GgLyoheobAaHrLl7mBZtB7RZhVfPDupALN6BCUtsRi8q
Tn3CIL2rehKkcwykwvVzluVZ45Ko4PdNVqZLqKNc2+I9B8eyK8K5lAZ9k+SSTtLs
Lctp2pDvzktlf6cotzhCXR6Hv6K9gNenSsC10VvJ0Meme3cGWBcFKTCiWa0bz5aQ
HISoDgjo+ySNrt7JntzT1Xd1WFwFS4BO1lh/IlljP1ppFXRE9L79UUTSYXPfzL3x
z/QFhs134/cqrxqMcx2tVOm93eg9lPa6/Q1Gd4vYNzepWTrrNE5i+yz7MKd3nzfz
/KjxwSwS/aLfQLe/zeEhT8CKgrWXBdaDoC1ZgS7/UECJPcUOrcujE3nQpQ2ZHN5C
0o5gjc4Enf7oKCv6goOzG1xKf7jEbNPEwsc0tjmNo0dCOZ/nwPuP6jj8JN0Ox0Tk
s3VTvk0NZdiAfaPwhlR3BAZACAc1N+hLV4f4tchHDJw2UZfFqwxhosXwYbvujWHw
OYQ0BKTc7otuz7kZj30cVkyBYEJITYStk99F/PHw6KV7zfs260xTJ0SuyMyV0pZt
SY3UMsowpNuPhdQ4n0mFgv6VBOxOjy3Tvj7qCsZVh6pmJSk9OA==
=bObP
-----END PGP SIGNATURE-----

--y9PDtDHaFrXNoMPU--
