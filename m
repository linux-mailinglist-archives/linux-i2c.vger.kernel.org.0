Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4C51ED77F
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jun 2020 22:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbgFCUi0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Jun 2020 16:38:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:36860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbgFCUi0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Jun 2020 16:38:26 -0400
Received: from localhost (p5486cfa5.dip0.t-ipconnect.de [84.134.207.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 899522074B;
        Wed,  3 Jun 2020 20:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591216706;
        bh=ynTIpUVLHd3Fetf06EYiB+OyQhltY0fHhPnuDW+nP7k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f2FZRU2mcJEtxwIplnFuwE3HGvAocU4WnMmA5NCU1VX5Bv6um+1TjlU20JYnqXiSe
         mH3Hpqtkd7uIwH2i/30LatW1GAI+PN+jjob5oCjiMhLYCoB+PjDinJlIgyvXARNrjd
         XxhLMODN+7sFHY3YwQOkSci2ztumvgm1J2RpRMjk=
Date:   Wed, 3 Jun 2020 22:38:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: pxa: don't error out if there's no pinctrl
Message-ID: <20200603203818.GA1347@ninjato>
References: <20200602193823.267048-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <20200602193823.267048-1-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 09:38:23PM +0200, Lubomir Rintel wrote:
> The bus recovery patch regresses on OLPC XO-1.75 that has no pinctrl in
> its DT.
>=20
> Fixes: 7c9ec2c52518 ("i2c: pxa: implement generic i2c bus recovery")'
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Applied to for-next, thanks!


--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7YCjYACgkQFA3kzBSg
KbYs1RAAqXFrAks4gE6JldEwD2WqZJrHqz7WDRY6scbc3FrEUZy1Kn1yA/KaJyuR
HKVJISXP/UHGnQTL3QRrc0hMUCeSYcAgBh9HCqEPomlWKF1e0I5zRovpKd36dMxY
aWM4C+VF+KV622MOSIFGQlHYRua+Bld8bi0BP/+DRvfA82ArAjVRB4gez1x55hQZ
I4gSdxn1jPw9azHt7g5kJmKRaPFjPfuzXCVo76BpWevcGu14lvh04CSl+OzFhqQB
xIF8ma2jv7RfKDGWQD1TMVreVDtLitCVDYvnUD6RVQ3ZDE95Ji7XAhalGSN445xY
bknJkglyKhgSH8DuD87alkstj36UqPV3n8r6W2ETB+7bqC8d60zuoZp2dL6lgf3J
4NuTJpU13XunMhx4oU1VR2CUK5HG5vxm9fw5yj82rs9FzsHqAF0bHPMS5x9bcA+I
YQjI8XXpoe/ZCcu05hQe350khVyDrpQfB+/iRR82/srp/8CwpMPPFmQ6SNmZk70D
rLRMzKE43wkMjAVftINuIxnW+09bGmnWSjHhpRaMbHwj5V6Cj3ADrlmRtZWcxrHB
af2uPpvVHkG6/ntWk4Qls8CGKMqNEEWfZRFg2+uCUDKTRHUMlvCKe10/qsSXg7Yl
RvA+OPx47hjNrTXnvKw6zeIMvu6n00DY6JcQqOpsCMlnYT6nABc=
=KqSX
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
