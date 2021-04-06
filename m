Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C39EC355C53
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 21:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233712AbhDFTkn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 15:40:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:57368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233580AbhDFTkm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 15:40:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC2E061158;
        Tue,  6 Apr 2021 19:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617738034;
        bh=Opuv6raurAGHlrasaechyldQhD5+uBJDErm4ArvhcIM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IfIYU2KPrJePCVWfzs6tIdO/g6OO28wbyU7bVAof7HyY1F5WUjCPjecAEzEi11+4q
         +kG8bDwGFXfaKFM4nIPoNc/vFbPG0Ty4tvtBOS3OhrJxhv+r9AyPi9r5plkCHPqA0c
         /aTVdRKYl0NW48gW4cVEJQU4aJpLk/MN+FtmuWwtH4h/PcmKnlvvo0ahYoyrsP3ZYP
         fN20JkM/DRDupX0aGUbeucdbU6FUQFDwPhDQyA4CpE46GsDk0vkMxzCWf+O54odJYg
         nGg1Df/HCWTcbDv+BSPdzoxOUZRTAe06UiIcdGKLW4yIDD1CHSsKstLhqrA50NokEf
         FZ01i+dvo1vZg==
Date:   Tue, 6 Apr 2021 21:40:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/12] ARM: s3c: mini2440: Constify the software node
Message-ID: <20210406194030.GD3122@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-6-heikki.krogerus@linux.intel.com>
 <709e434f-9e35-bdd1-7785-1938b2fb80ee@kernel.org>
 <YGHIyRu625C/kgRL@kuha.fi.intel.com>
 <c326cef1-523a-0ce8-70a1-5cf89bde35f2@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Content-Disposition: inline
In-Reply-To: <c326cef1-523a-0ce8-70a1-5cf89bde35f2@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thanks for explanation. The follow up question is - can I take it
> independently via ARM Samsung/S3C tree?

Is it possible to just ack it, so I can take this all via I2C? Or will
there be merge conflicts. I can provide an immutable branch, of course.


--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBsuS4ACgkQFA3kzBSg
KbajTg//cZnUB68yjCCqBZLP3FgjbRz702c1a/jUsttFznXRZvQ/kcScN/0kkIIu
uQJ7u4QioKtxCeCYiAUz2BYxqOKBxije1tJXs8tcgJSNkzuHe6dWsoaeK9MnapcZ
c5PdWCQAqmt0I12moxJw1rdrVEV1WHIMilMISYREirePk5JXQ98GzwdtvHiQFsJ0
1ad5vPKQBXvQBI2JXMZaRnSrmPYVteM3+hQWdnLQrdZB/c1MnrcwZNWEjroROoo7
mdK6nmmz0gdorp79g8lp+GlcPhzprtIOpk4kpYBumTf7XsxzZQxrIQJGsc+LJU9x
Qxo+0j9+AeTSNnvHWrkV2B37X4DJ4uFYCjJBUb4HninNZ+p2FvTPadG+IyVHOctW
Ll4/P+P6RraUi6prwnUIOgG2Ry0qTA39CFH0YCBAgrlWmRNVKGXTrzx03eKUpT2g
Ya+ZBFtgM6ukhzyUmcUn5+bn1gqQlueATyije3Hx5NySgnTeCGgSBmyo0L3Llu1L
qAMzxrqe7DJs2Ib/A81uoLMwBJUl4CkFgZmcPEfnxx3z0GebKK66aZKvxPa/szON
H/7Qx2JqC93kAhL/Nga6eqTGMee81NHkWGcPUpyPeYEzpKRp7MK3o2XCPSKqWHLQ
M/a9Y+PMzEFHe1KaG+4fKGj9dmTRkrnKlbbf4ay8bESR79UrG08=
=mMtN
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
