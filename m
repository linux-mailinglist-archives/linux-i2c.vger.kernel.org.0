Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4CDC32FEFC
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Mar 2021 06:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhCGFln (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Mar 2021 00:41:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:43132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229753AbhCGFln (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 7 Mar 2021 00:41:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B704464FC8;
        Sun,  7 Mar 2021 05:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615095703;
        bh=AW5zH+rDS1Y+5Cf25xqzXBxeQ1XhheLhVwldqoIinjY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dkRoDhncIAvHulu5s7GsjKwYnwVHSRbh+rmYtlLI+yrxxIrljGAo7R7SzZKUhqN3d
         ji8ONXymYz+zLm/pTUyhbe9IriTmX/r/zUoJnYYLXcOPleZojw4qnO82csWnZIwXRq
         POqxwMCUQx9szjhxSMJNuewNW2KyoWbNMu6UrYFskG3Q8C0NP14PhdHoWWWg+Ysub2
         WSeoHKkITkQuI1PN/sT3P8T2PIZKktY/JlHKo96S8o2MtOYQv63SJzhe5lSWdhMAyp
         QoqIJePwOM00EyOuDS86Gvw0uQ1e0Dlc8N8CLfDO+h1SPVUdiOkFheiS/KkbO8Jqhc
         6ZkN8GM6y+Adg==
Date:   Sun, 7 Mar 2021 06:41:37 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH i2c-tools] remove 'eepromer' subdir
Message-ID: <20210307054137.GA977@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Jean Delvare <jdelvare@suse.de>
References: <20210115114321.394262-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <20210115114321.394262-1-wsa@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 12:43:21PM +0100, Wolfram Sang wrote:
> These tools are deprecated for 6 years now because we have better
> alternatives. They are not built by default. I think it is time we can
> remove them.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to master with the update requested by Jean.


--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBEZ4wACgkQFA3kzBSg
KbYwtg/9FQacQQW8wQYlZ3BUI6UkZhiceH2iEcowpPRqwfc5dpBsiCHoWKoSWJOJ
8SI+N9E32TGw8L3Sd5+02JmrGUpqK1Mh1Fma4I/mCuOimJlQdSVyI/fmpT2r87md
jO6H5YLhZ+KeRjlNmK5cT5RzLfHglknemuBkJNW0LuH7XtoNSdfMJK+lKhJx/Dq3
+rayAgKOkXNXli7em+Tepcap2eUt3kTs+qrhrw4e24K2RJM0pZZuNDRw3ZpdDCmG
6KmyoRsRhC9ur6YTtC8yref+EGmFb6nfdvIc+aGbU8GbpGr8cIlUYK3pConjpkbE
VD6XoCI+zxwP4+yeDOe0gLMSADlTaeZOIfaqovLlQ5/TtHECooc1c99wFUy2chX2
zs1Ck2ozA0RBKAyv5pj4sOeLIzSK+sgSwvOWmwwpaKMyKW96T0gdTmUpMmb6ocQ8
qs+hTe8gD7cSXi3YW8VWNL0PXFnWb9UNkrUd8Nt3FlgKFn+kAp8PzGUZ8bW0TENs
0uDiVuXFcc6WY2EkevMDkW12RR7SGErw6UCEWdspwG8wVQbbNhrgjzdsigdQHyrI
s18oFxBVy7Nj3vvvl2zv3vfMbwACQvCZWXLjk5ZcsIEz2VxILWqBEWmtPgWKr+4C
6t7CBBPyH/Y4FJj/hOQDKI8nzWrsWfc5eJDjZBRUL2mKAPn6KQk=
=9RIj
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
