Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7062E17F620
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 12:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgCJLVE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 07:21:04 -0400
Received: from sauhun.de ([88.99.104.3]:47594 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgCJLVE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 07:21:04 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id BBEF12C1EC6;
        Tue, 10 Mar 2020 12:21:02 +0100 (CET)
Date:   Tue, 10 Mar 2020 12:21:02 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Robert Richter <rrichter@marvell.com>
Subject: Re: [PATCH v2 2/2] i2c: smbus: remove outdated references to irq
 level triggers
Message-ID: <20200310112102.GT1987@ninjato>
References: <20200228171221.5412-1-wsa+renesas@sang-engineering.com>
 <20200228171221.5412-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0WGqsT62A4RTsSXf"
Content-Disposition: inline
In-Reply-To: <20200228171221.5412-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0WGqsT62A4RTsSXf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 06:12:21PM +0100, Wolfram Sang wrote:
> IRQ levels are now handled within the IRQ core. Remove the forgotten
> references from the documentation.
>=20
> Fixes: 9b9f2b8bc2ac ("i2c: i2c-smbus: Use threaded irq for smbalert")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--0WGqsT62A4RTsSXf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5neB4ACgkQFA3kzBSg
KbZ3sg//UswuXtm0IzOHfr4WjG4xKliwJWNQ8fHDCxUtzscsorCZN3QrWRhA39vp
oNLxM2xEqJwtnuOcyJ29cjCJLIEB7E+IHAVh0TuLc7VNpiLoNEoVXtJUDK1C6N2/
+yC9BtS6GbarYDpx/qMabHGY3YNmBFXs8YJN0p/odea5QLsNUFSqJq/7y8dszYYZ
TxCMNICtPLx57jWY/6MbvtCH3+jgFH7iAE3fK7HjnlXlXJnUI7z5RSr35N1q+u4Q
4JB1mrqxUoAbUBn0JM4mAYysemIJ/CWLQfnoPxV5gsAI1DwxJCKiFxfY1UKqxtpT
q0MxVdu+kAELYAx2M7ETMkbAnZlclCDu7FMCE2uYXTJYx+ClrG9wBU8BiIvQBi9T
QeUiYHJwABI5bYaxoesH1QQcAr2w4NpaKRcUzhqLRAxn7pW5Ls3mwIiFXCtg9Ite
x66PlEHnz43Y4JsrVkWLhMNOqZLmHp9j9TDmCARLNSF+ricuL8MUKFIg1BvZ410U
RDcuNrwJoaWaHS8DS22B7h1sDwtU0v3FlA3aNGKhk9QpHl+644js2kI2SDNy1e9j
MRb/l357GiKeId30wwdnGmRPSlW5D53DCafT4yo+pzQvFUlaNn72EioaiKwjrEjn
A8yPaQZt8MPCi6Cn4uUngWkCdDRVIiWeipJ+vwOLEkmfmRQEgdY=
=0Yhl
-----END PGP SIGNATURE-----

--0WGqsT62A4RTsSXf--
