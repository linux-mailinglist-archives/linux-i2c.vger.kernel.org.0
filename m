Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C1823D3AE
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 23:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgHEVx5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 17:53:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:41536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbgHEVx4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 17:53:56 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D9985206F6;
        Wed,  5 Aug 2020 21:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596664435;
        bh=sZ6NtYl4kSkpGgYluXCBNylXjubYGDYiZ7REXObxpiE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pJHOmgPmrG2PjGRMT5PTL1TxUi8BO/IJKeMoD3QGjnTn7OmL6m8eb35nf5wvyuW/L
         MfY3LUPG8jvTJFfXVS3Pmv42f/QWMBkpTNQvVH0/HHKQq9GWRWbXAc1p5MTZ3oQ5gJ
         fVVG2XpVsbKgmcBPFY0bkWsHbyDQjKUw4FxQI7Ro=
Date:   Wed, 5 Aug 2020 23:53:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove the 2.6 "Upgrading I2C Drivers" guide
Message-ID: <20200805215351.GB2182@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stephen Kitt <steve@sk2.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200805183149.21647-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline
In-Reply-To: <20200805183149.21647-1-steve@sk2.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, Aug 05, 2020 at 08:31:49PM +0200, Stephen Kitt wrote:
> All the drivers have long since been upgraded, and all the important
> information here is also included in the "Implementing I2C device
> drivers" guide.
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>

True! Thanks.

But I can't apply the patch?

> base-commit: 2324d50d051ec0f14a548e78554fb02513d6dcef

Maybe because I don't have the commit in my tree? Can you rebase on top
of 5.8?

And please also remove the reference in Documentation/i2c/index.rst

Kind regards,

   Wolfram


--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8rKm8ACgkQFA3kzBSg
KbYzIxAAgGggm7VOWU+6eYwd3WHI3TraPED+QgALSlGqMnNOsvBejUv/G2G9uuRr
RibSUlPlLb2E5P+4QW9Ny3y9Pt0BQQMk+HptCwXXYf5C5BbF4QG2aUErU8CcE837
WE7kFlR98M1+H3idCbPAmmfMpJUclBUlK2/wVVgLKPIfK+xPEYEgztOQ0mXtdllc
kn8GcHy2IORJjPptLM6VRDk2kDDrqOUQXxNQkFbHPwdBpnlQD+45SlIMrngHc4BF
9KLVCXW78/vBni9khvVBAe7pTnSW5oic1lEGn9ZEnZt2/St8EDlsui0R5Z8Viwn2
MvVsPbW+EVr0qXRe3TiPZSVrxYue3eOLWAbvXqt4PAHW7NjZUeI6CppLahk6g2G3
njwPwIUYDZEKqY2TIqRXAF0Afu64v6qvZmzOo5dFkaa03FNeiNR2J09eRkuAdWql
rZX9xiFk9dWJskbfXjDWAjFlsqIU0oN5oveIMh3qAXQAh+yxpvEZ1nfvqb6Ayu4D
7827YG2JV4yRrb6EtTK/Z3Wi/AxyxqmKiLWLcX+4YhbR9/fbvB4bWR+vC+3yY49C
RALlJahCtAQhQlZd6smZweExCXZxtKsLaVWMpPRhAtfxaKtOtLgT4Iey6wRB5aWa
8/xZoIMT4WQ1wZEPfh6eVqDU62Wlq4ol6KreT3d4RqY00CiytQA=
=9h2p
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
