Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1602240453
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 11:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgHJJ41 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 05:56:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:56644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726141AbgHJJ41 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Aug 2020 05:56:27 -0400
Received: from localhost (p54b3345b.dip0.t-ipconnect.de [84.179.52.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D70DC206B5;
        Mon, 10 Aug 2020 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597053387;
        bh=UYCgfhF1e+uFx1Zd/VA1TwGirtf5akV0V7EXvDsJvBg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DPejT8eGhX3nMCz4CSCgYn0NzTht5Syuy4JreoTGcCsxb4/zjbrsEXpvHKtMx38eu
         27aHaL6h/ul0txDFYHTRALrMWoFXm8mleszGwj7tOYiPU/N4FyR7mBphBVz742BsGy
         XBK8PAa9Ms6Kf3NYyJ+vWpnKLJaifXN52Jpcy/Dw=
Date:   Mon, 10 Aug 2020 11:56:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH i2c-tools v2] allow to preset custom CFLAGS and LDFLAGS
Message-ID: <20200810095625.GF1290@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Jean Delvare <jdelvare@suse.de>
References: <20200807111230.1241-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gdTfX7fkYsEEjebm"
Content-Disposition: inline
In-Reply-To: <20200807111230.1241-1-wsa@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gdTfX7fkYsEEjebm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2020 at 01:12:30PM +0200, Wolfram Sang wrote:
> Sometimes I need to add some flags (like -static for the linker), so
> allow this for all CFLAGS and LDFLAGS used in this project.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to master.


--gdTfX7fkYsEEjebm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8xGckACgkQFA3kzBSg
KbbWBQ//XfgZ2VriBM+aBPeYB2GafJJ3U1zXaUAuAQk5Abi2Y0bHFodrNiVVwPl5
R3UF5ArHaMtUwSw3GSEZ/uzgA9R6MsRr4KvbCVnMQ+XTYrNg6qo1jsoWxy4dgLmk
ZUkjv3L0A3sCQF3pDN8VviBv60Rsyzi77UaJRwN4PB3ty117R3O0TivsRS6+jodc
hCuIxbia0S1itBjbXVEeUOLiiFrN59RWo3LSRCz+IZcADBfvZs7s2+Czh5fbb8DR
0EzZN23g0sX2ssf6OXxrqVx1AFX2btEKSavvjAExdafeOT0rl9bmUX/Gc10RzYH6
BRWrUKrTrn8/EwKQWoLs4UWe4b5AvwFoHcPHsPWB/jwSnxALVJhCF72j7Pqgog1U
2zc5O1eLcM1Z8qjrE3USA+dRcNE1C+3dZap5lcy601GCN21NMz3K51E8L28ZmUSD
6t3n9XKh9JI0kucDGD8KAYOhMGiMxL1HreikzgU40Du3TDcR7hQ0mbT8iRT3lAAn
h3lpn5oTSm/77SuyDtPnEIG1CAwaCJK2hapRRYJUo1UiMzL8m3Mb808oeFCXMVa4
DM0vwKNt+GqyFxvga4jNj/Hq7Gtmctt0LTZD1ebXnx3UTZjAHm+cZFCk8GuTIgHf
y4sJpvzDvUfGv3iF4nRSHAKGO+WI4Faa0abOZxbPfDhVHZ7I194=
=XLB6
-----END PGP SIGNATURE-----

--gdTfX7fkYsEEjebm--
