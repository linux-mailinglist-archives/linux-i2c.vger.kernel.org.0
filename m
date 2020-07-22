Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEA62296BF
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 12:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgGVK5b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 06:57:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:53912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726153AbgGVK5b (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 06:57:31 -0400
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CD408206F5;
        Wed, 22 Jul 2020 10:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595415450;
        bh=3rVSMBD1gzzXHLKsqWttFgERKgZgszb133LgkOiHtCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NhrBWBtCH2Vjlmu9nBGOyyDuHhc4WZv+KvKJ6X6QVQmD/h11Em/9fXveRKCVuJI4K
         QzawQXJjOP4EjfK3C4GMXH3oRJFpSJagIE3k8hdLutIfYoNOXQPqyjHHaeNnexBuxI
         Q23YsFs3UjHUz7jIPnUlgP//NyK7LGI/1vl7sa24=
Date:   Wed, 22 Jul 2020 12:57:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     codrin.ciubotariu@microchip.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Subject: Re: [PATCH] MAINTAINERS: i2c: at91: handover maintenance to Codrin
 Ciubotariu
Message-ID: <20200722105727.GP1030@ninjato>
References: <20200709084233.7846-1-ludovic.desroches@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lx6+J6gHrzwEpYNy"
Content-Disposition: inline
In-Reply-To: <20200709084233.7846-1-ludovic.desroches@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lx6+J6gHrzwEpYNy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2020 at 10:42:33AM +0200, Ludovic Desroches wrote:
> My colleague Codrin Ciubotariu, now, maintains this driver internally.
> Then I handover the mainline maintenance to him.
>=20
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Thank you for all the work on this driver, Ludovic. And welcome, Codrin!

Applied to for-current, thanks!


--lx6+J6gHrzwEpYNy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8YG5cACgkQFA3kzBSg
KbYY2g/9EU6Lk0HiwXxVKBrLRO7mW7t+M/FesYMygIKAdJRiBs2WkI0Brhx5E5XR
71HcMZL2JSr025pmUClWTRwPesO3I4rp/jw4JQhcK2W7IDhlswh/sfb/AYvZ4Hop
K+o3qojtXkoFRsIMO1Ne44dhWQ49bvOv02Bg2ZaUaTwt5zQVyp91MvMRhOLiZq+6
WVRIet50PemaRRIgQ2BSZeSGShNfmcNDIWTUkCv2a5EeT2Tar+idn668KCV9Ejcm
h5jNjwHCAcF0VdIx36W00KDmBOHjSH1QDkLfUhnn7SVGb1ubx2tfF7csR1EsJnwL
abmYn592sj+JgNdvFAYCFzHOPix9hPhKMYl6sRE7QdSEkzXyufd2jeO28pPZwHmd
bdP8i1G4vWrU1sT26DlRZ5LHqXQSR1dhqZECnMpG5RotZjMe3VFmD+P6km0TKRTU
INnF7QTCekAYhiG0kPJ+J1PMiVtQZK7i0Trc4arO98InqX5B8s21DvKk3k2T6NYM
VQ/UQlGXwrhrNIf7c5z9vy0fs9geFhXMKZ4+ehB3+ITepiOR9+Wk7idzWwZzIt7G
/xHGXM418pzrVoROAXTep/Rc/b33PrjFJJBSczrcJA8MOHavDZUiiOFh37W9sbKG
XpP2C2yAgzFktBBdummNfnRkGrXwVXos4G8TnVHSzQpbHlug4ns=
=5CAe
-----END PGP SIGNATURE-----

--lx6+J6gHrzwEpYNy--
