Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353E83E93D9
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 16:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbhHKOoj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 10:44:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:35244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232680AbhHKOoi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 10:44:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43E8A60E93;
        Wed, 11 Aug 2021 14:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628693054;
        bh=nxgp5H+RnhOR05fAcA31g/2Yye5vSP9ihBsQgfVFZIE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I5q3z7SRKfxnCVMLbAc+5DmqdY6C2iImSq0PtS46lg1/0MNxcAeuSweVRkrT1QYli
         bztoD5Ed6rUvSUIQAnDlGpxJXBRH7em3ets8PHFgC8mv6dICgKsrDC033tdQuVeDyd
         TNRkfvd/FAuTWvU0i6PRzgws07yC8929GWXT/rU7mCh+jRwdomfN9PCd/KY7vV2r7o
         LaGE0c6ZFqwId5hva0TReT1iUDnQaPLGLE8CUQQuiQRnW6EU8wgGIudURWybrfakYR
         WqLcBuDeUHcQKBIBhyqWrKrkKZFDRDqzCJ5P1as97iXLO8WriUaPwuglsVrLLODdnG
         T3ZozQztexLcQ==
Date:   Wed, 11 Aug 2021 16:44:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 2/3] i2c: designware: Use DIV_ROUND_CLOSEST() macro
Message-ID: <YRPiPHEOEP/bzYZZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20210712142027.22900-1-andriy.shevchenko@linux.intel.com>
 <20210712142027.22900-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Lf3+gByS4rT9GnRY"
Content-Disposition: inline
In-Reply-To: <20210712142027.22900-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Lf3+gByS4rT9GnRY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 05:20:26PM +0300, Andy Shevchenko wrote:
> Instead of open-coding DIV_ROUND_CLOSEST() and similar use the macros dir=
ectly.
> While at it, replace numbers with predefined SI metric prefixes.
>=20
> No functional change intended.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--Lf3+gByS4rT9GnRY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmET4jwACgkQFA3kzBSg
KbZ0JQ/+MvfTlmeZcX56Ts3K/l5avztZbyKtKA73/D7wm4vgkEeClhFEzThyQAh9
4fFvbZq3Cu2gW0tMSSyKuVxq83KGxTq2uPNFXW7C9t4qU2QCuU5dnefsDaocNw/M
vLMLLLWH3B4HjLBZijLAM9wXZcgoeP83SNSSyMbxnlK+R7DezFdWcBUF4/hKm+pZ
UPTU1HAhhmusg8ABdWjBp9qrbRG4Ob6rF333Fqhs9vOsCuT+l7+naddVCc8eFN7Y
i20BQZVudph+Vr8MPmgm2IlMpRE+qMosgdh0pUHgRnkzCwpOuHRslYoGhwoyBa5/
VvpRDKTOWe5tvzlbcuSrHVjArQUvHQN7+1LpvDXaPt8FAJtjmIN0Ue170nfJmPxA
ZBR49FK3CuPYY7kzv+iHcPD6ug1JMDpCFLImOpHml2CgiSzwFqIJ9oJi4HlIxu4z
TRD5FZBVf7Rxfmd8/Oq7Zsg9Yc0tWYIoHnsprTQybFD0ogss8BrXBEnWyrS2KNiJ
W4w3hazabdrs4erQiYrY7fVTni+xY47y5Gydf+P73635baV4joLwibS8UjSgOfUm
RYXr4AiRxChsmT/9oqz6o15lLdnw6zwAeikYbWY5Oi5r8qghh60RGT+1OFfcoBDI
2YmnefxdHR+tmZcgDeSIGX95BwOuwGBY51WcPRJ4ul5zpzKIGuI=
=Fwwd
-----END PGP SIGNATURE-----

--Lf3+gByS4rT9GnRY--
