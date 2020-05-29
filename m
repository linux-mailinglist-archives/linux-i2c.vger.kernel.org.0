Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19AC21E7CE1
	for <lists+linux-i2c@lfdr.de>; Fri, 29 May 2020 14:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgE2MMt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 May 2020 08:12:49 -0400
Received: from www.zeus03.de ([194.117.254.33]:45154 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726161AbgE2MMs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 May 2020 08:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=+oIA5wgUwzJjb4dPCB6kck1w6mSy
        8qXzxg5Tr8Sx/Ps=; b=0gmL+hqiBgDuRQqIAI/2u45o90AV3RCtvRl0mRbaNxog
        Fvst33ddbSC69semkvhYlK4+GS6AnwvWCQpYEIzY2NSjb+nZNGcaxVmeScEPy/L5
        oeOms1TTcZeMrUlVa7FFCi0paIiQoHiJtyASm79qnvo7AIoEDeoFSOUKOqY+/aE=
Received: (qmail 3917307 invoked from network); 29 May 2020 14:12:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 May 2020 14:12:46 +0200
X-UD-Smtp-Session: l3s3148p1@DYHyXMimkOggAwDPXwezAI8QqI2eop5A
Date:   Fri, 29 May 2020 14:12:46 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: sh_mobile: Fix compilation warning
Message-ID: <20200529121245.GA20272@ninjato>
References: <f526f90ea62741716de2ecfa310ba22d8cf1d3c2.1557377015.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <f526f90ea62741716de2ecfa310ba22d8cf1d3c2.1557377015.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2019 at 10:13:46AM +0530, Viresh Kumar wrote:
> This currently generates a warning:
>=20
> drivers/i2c/busses/i2c-sh_mobile.c: In function 'sh_mobile_i2c_isr':
> drivers/i2c/busses/i2c-sh_mobile.c:399:26: warning: 'data' may be used un=
initialized in this function [-Wmaybe-uninitialized]
>=20
> Though the code looks okay and shouldn't ever use the variable
> uninitialized.
>=20
> Fix the warning by moving the code around and getting rid of 'data'.
>=20
> Compile tested only.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Tested on a Renesas Lager board (R-Car H2). Dumping register sets
produces identical results.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

And code is actually cleaner now.

Applied to for-next, thanks!


--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7Q/DkACgkQFA3kzBSg
KbZ9pA//c/GIosgNT8+aBJ/mcp7cfUOS2IsZP2a9ByoJ+xRml2UwFJDlehajw8Hk
xIKllEnwpLntdlDiLrZ+ADdhXGxka6dzgI5fbifZiL5PguhmgPZdYsS7uSGTMzkG
U2BvoTVWDtPcNzZUMLTaTLUf+qbGFKU1Pq1KieTx3/DsJwyaFFqdnrIFh7x3+8T8
jWiG1Er/VKx2F5ku4yUSK+anPuwpkwpi+N3ku+xr/TeLKv1uZRd1xGo0TAgD3ZM5
zH/IIkvaQTL9Gjj99IhsxOjvSunqSZPV5gT6sNP7If3w/hjWNxjM8+sRhodFB9us
JInCXNM+6PBH4qmubXQPxxXZFKe6K/bKpoMAXKQzFusNfb1Ynxfnx1AUBKApy1fX
Y89791pkKpjPxDDLwCXEyMQn+wKia9ct1dXsQeUjY/SZDOITNm4d63mpHY537yRk
51unRkivsVevrsrEhdey7RUvrV+fIbqfB4UiOnecaJUr0hi+HTaugGImAjvKSUv/
hB+mjhjYaBDbCiXRuaeWu71m72FLLl7NJdl+9yqvXhD9X2W03C39/d8ksd1lYTqZ
4+QUiOZkMeM2c5T+mtwfiUM3NJhJTTyynuL9enCQ8xImqWYK2pw20Rhew8q3XpFQ
ewen40ZrI0P2FU2XTyS7o9Y6mH6+tT7yRGFqzDF1PYC+Hp4iE10=
=AYBV
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
