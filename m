Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF41E1999D2
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 17:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730556AbgCaPfv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 11:35:51 -0400
Received: from sauhun.de ([88.99.104.3]:42460 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727703AbgCaPfv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 31 Mar 2020 11:35:51 -0400
Received: from localhost (p54B3321E.dip0.t-ipconnect.de [84.179.50.30])
        by pokefinder.org (Postfix) with ESMTPSA id 34D8F2C1EED;
        Tue, 31 Mar 2020 17:35:49 +0200 (CEST)
Date:   Tue, 31 Mar 2020 17:35:48 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: clean up after refactoring i2c_timings
Message-ID: <20200331153548.GB5709@ninjato>
References: <20200326100721.1265-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline
In-Reply-To: <20200326100721.1265-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2020 at 11:07:21AM +0100, Wolfram Sang wrote:
> The pointer is not really needed anymore since we have the timings
> struct available in the function itself now. Remove the pointer and
> access the struct directly.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6DY1QACgkQFA3kzBSg
KbZLwg//Z4dqQER8LFj8fKoespkhbK8s+nVTlYZLJFigNDP0IvkJfM/TOnaweE8y
KPvCVMcWZCHo6p0/l/OK42590m+9sRimVzE36etoTsHoLyeyFpNDFOrOKu6U78Wb
c2FL8OzycAit3sLEobEs2qxFUpdKGFp/8GJGIQ1r0wQ2m6l31e93DFRVv+m81t3y
1jiEMRnyfifwM0O9mTEed/3ra14sM0CDBt7ZCK3dlZ3SYfhbxEeVNY3+jykYzCWm
mksT+WUnib2+KYtRt5Z644rIK9WDe6F6O0Kt7OQWh7vNuGRHfJJv4ituiblqTCft
4M/O0HHltvE1Tgs9M0H9Jv9aZVFMBYWlh61IdCSzBgxdlDz1JyauliM23EV6LTmJ
fmUYwNNGD9Kv0r4lahW/wTp3hS2ehh2tOAdJ610xk0TOC1RftWL7NX+AJC1ShdB/
40QydliLwwOM8/O/D1Q9vYVYyDTvP5WWq6voOlKR4Nfron3HFR1uORFdWENNMKS4
l4u/s8vqR1Yw6gYZJi4dZi7q4odmMYktTRhzllpsHcWEW8i4p+KPbj+1TfA4sPVX
ZgBCog2RC9XcX1XopT8BRmSVShBRsE6ol+/RLzMCJMfvPkw4hMZ4Q8Md8etxKYhI
KYN7zqs28CN7NxmoAo4ZisZ88OmtBNAOo4fQzGEYG5rW8+Y6Zfw=
=dW6O
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
