Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B4C446AC2
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Nov 2021 23:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbhKEWFw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Nov 2021 18:05:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:59510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230081AbhKEWFv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Nov 2021 18:05:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9043360240;
        Fri,  5 Nov 2021 22:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636149791;
        bh=fNC93UqLpwkqGcd7/TDX2QKnK++9ZMftiIkr5SEwdpQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JWs5QgsoWx/ET4MEpd196oAsU0NokCZpifUWuxjHFS0RMSrsgN2QFoaAc/49Pu4zH
         hSVKwxcWrBRNbqPc3SopJJNuiVV6OGdgYEnJwbQspjBwshWSlmWSVBVVbwTVmUakbY
         CQ9OKoqqI57O0BDMDDKoK1ce3pCHENQTLP28qzTNOO2K4/QSao9MGPcBisXBKz+nfU
         l+u0S2xlEolIh+CZ+j074dWmI0jFFIrowCXvtIjVY++Ng/bE3nxhwAvdeuf+5nW3c+
         FKqQvqU36bc794FZ39OpylPgCNMtvhsc3/JrTieJ8m+mNUju4kOxpNRPEAg01YRFth
         3EglSpebhy1Cw==
Date:   Fri, 5 Nov 2021 23:03:07 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Deep Majumder <deep@fastmail.in>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs: Fixes link to I2C specification
Message-ID: <YYWqGyETMgKcIkul@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Deep Majumder <deep@fastmail.in>, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211104060018.35570-1-deep@fastmail.in>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vIsvX2Y/0kJ9zXyU"
Content-Disposition: inline
In-Reply-To: <20211104060018.35570-1-deep@fastmail.in>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vIsvX2Y/0kJ9zXyU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 04, 2021 at 11:30:18AM +0530, Deep Majumder wrote:
> The link to the I2C specification is broken and is replaced in this
> patch by one that points to Rev 6 (2014) of the specification.
> Although `https://www.nxp.com" hosts the Rev 7 (2021) of this
> specification, it is behind a login-wall and thus cannot be used.
>=20
> Signed-off-by: Deep Majumder <deep@fastmail.in>

Thanks for pointing out this issue!

>  The official I2C specification is the `"I2C-bus specification and user
> -manual" (UM10204) <https://www.nxp.com/docs/en/user-guide/UM10204.pdf>`_
> +manual" (UM10204) <https://www.pololu.com/file/0J435/UM10204.pdf>`_

I'd think we should have two links. One to the latest official specs,
even though it is behind a login wall. And one to the latest free
version. For that, I think the archieve.org address which Wikipedia uses
is more stable thant the pololu address from above:

https://web.archive.org/web/20210813122132/https://www.nxp.com/docs/en/user=
-guide/UM10204.pdf

What do you think?


--vIsvX2Y/0kJ9zXyU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGFqhsACgkQFA3kzBSg
KbaAOw//YL6RowPlNWHeofcvIZVAhv050x6a8/rlWD9GcJuRNsgRgfSUBDM4Wip3
wUYtr+cWb26yo0wQPRtOn99Ig49KUaNtNHciWE7Ta/u3vWFzfHsHCEuxgORp1SSa
61i13MvpQ7PNDvr8dyYcobdmFdBx4/c1ap1rPHE5XGb5kaCLBLG5qkbOiLIObyRI
1+83/wifGv4KwKeAT7rn4aKdRNh9fo9rgTGvLIOO84r1gWdiXw4/wa9vcJx4lPd1
SfgUKVnjz3D/2ZQlaS0wBzKaYkmjpolR/AnDiJ6vExMDiHIrToY9S3c/X4Y0Qv0v
ibG2t555Dos2UWJiawpolnv2HFNc756C+iNzxiKTQf72aAWPXWkoE2RegMKJ+Sym
T7/zTuZK5fzSIxBQ9+x8/svBWGTkiFadU415y69No5TOPNo7aHd1I8gPpNojG2co
JYl9NzW6qs1xvdEvqck8wrZ6QFFqV27K9SzZDKfQc84ImwmkgewI+Vj6ZfjKTkPn
ocjWalScldBv4znhQSczmF+rpjALX5KbEagXqF2v33cPuf/iLiXM3jmgk6hLkLSR
0h8AE+Z6ETQEKFfWxMYt0cwU4Tz7lOY4/Rw5HtHr6IGbXxAgLSpkWf+uAnTCqkze
2p2gLea8TWISHy8wGZX7dNORV0YLqoY2+p6Ph7p0LjQVhJcPSE8=
=F7GT
-----END PGP SIGNATURE-----

--vIsvX2Y/0kJ9zXyU--
