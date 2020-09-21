Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25808271F3D
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 11:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgIUJrp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 05:47:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:33756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbgIUJrp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 05:47:45 -0400
Received: from localhost (p5486cf2a.dip0.t-ipconnect.de [84.134.207.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E1E52193E;
        Mon, 21 Sep 2020 09:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600681664;
        bh=LcXKBX1wP04dCEC8OyZKFVCw6H/G2yo5Sn1JBV1yC+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ueW+MtNOP7Crg00KaYYY5U871SWksGQ07GPClpbQ5iCT3vjZkZoNT+hip0yWBHorw
         GUyqW+UJiyZWF27ERWbAzCP+RIbxorEhUPBDrDLlWQqGDoYIvcxHLqniDIcA8kQlrH
         YyKfSDbTsLtcceOKrEFhC2GXTIx6kGsnWizRT0Ww=
Date:   Mon, 21 Sep 2020 11:47:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>, od@zcrc.me,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: jz4780: Remove of_match_ptr()
Message-ID: <20200921094741.GN1840@ninjato>
References: <20200904131152.17390-1-paul@crapouillou.net>
 <20200904131152.17390-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p1Od3smaOkJqivj4"
Content-Disposition: inline
In-Reply-To: <20200904131152.17390-3-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--p1Od3smaOkJqivj4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2020 at 03:11:52PM +0200, Paul Cercueil wrote:
> CONFIG_OF is selected by CONFIG_MACH_INGENIC, therefore we don't need to
> handle the case where Device Tree is not supported.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to for-next, thanks!


--p1Od3smaOkJqivj4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9odr0ACgkQFA3kzBSg
KbYJZA//QnuGBJc6iFsU8NJi2BJffyArvPlK6nzELvYMqTPUyRTN3tlD1Zpt22HD
S1kugxYMswtlO1yeB3My22j05ma2qZomoaIQfkiuNp2WIWZGwRPnVyZDIOp5E+Cj
V5MQ6bnO/mrzYsEW/slZww9CfNZCAS/vxn78AkJzBs2khq71wc4J3sHEOMVjuqO3
sm8NO2iKPg1glMVtS87iR3f0Ro4QqEqZpC5ukuINYojy11GxAvNXlzZ66H6NIXdH
eRKVJ4SvnMB1GcTmAZLRcCG7JDUy90KutBCC2+NR/JFO/xK4GNHiVjeSCjD52zIR
cBoQnP019Cazl+ov2Hl7cSi//dXoGU504f9KgCJTHRd5PS1fTvAYgn6QhoJaDKZX
EiOQfuq3SFf93f5VVmttxqQwRZwpYzaOTTeXp2h6JUuaL53BRho1ginP5pI5xn6f
0/pBprkz72WTkK+6DQguz264VvBcC8sUf7UA2hp8jsNeofg9IJbTO/L7LXGvy+7y
nQmjV+YUafJQGOvhvy4RCe42ixFWq86OorzUMsBIADb9E0+SYcHikZvvChVBGZbM
o7BERCw08v5Kyh/lV38uhAk5qbm0nAEbCPnleE8WndAkF2xRHoJdBWL2lq7yxjXb
hCi//VlzeO4uSyvdc87lxx1SmGr1voGRekUbpDdWbYQCMBsNqCA=
=C4Zn
-----END PGP SIGNATURE-----

--p1Od3smaOkJqivj4--
