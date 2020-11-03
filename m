Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52D12A56EA
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 22:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732906AbgKCVcD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 16:32:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:59640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732129AbgKCU5W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Nov 2020 15:57:22 -0500
Received: from localhost (p5486c89f.dip0.t-ipconnect.de [84.134.200.159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 90F52223BF;
        Tue,  3 Nov 2020 20:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604437042;
        bh=a7ZH9fyHYZTO/SRArO7XSMg0/aQU+bYIqJmSUVsuhCA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QTtwg4L4/i86DoriZ3tYS9UO8SdYNdPyXWiI6EoauuBTIeuVHWnP26XFh7c0Rq1L+
         GgIz9Uj1tNWnCbVSuQYAtd/ppNMWuddZbO32TkTXv71MqGsLvgzWEgp4k3AeCK16Ad
         iyf6nSlurOM/etk+w2gx0lPk1Gkmv10vscjFFcCg=
Date:   Tue, 3 Nov 2020 21:57:18 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH 2/3] i2c: owl: Add support for atomic transfers
Message-ID: <20201103205718.GC1583@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
References: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
 <1af37112fafd6cf069dfe864560f77996f57d80d.1602190168.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Content-Disposition: inline
In-Reply-To: <1af37112fafd6cf069dfe864560f77996f57d80d.1602190168.git.cristian.ciocaltea@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2020 at 12:44:40AM +0300, Cristian Ciocaltea wrote:
> Atomic transfers are required to properly power off a machine through
> an I2C controlled PMIC, such as the Actions Semi ATC260x series.
>=20
> System shutdown may happen with interrupts being disabled and, as a
> consequence, the kernel may hang if the driver does not support atomic
> transfers.
>=20
> This functionality is essentially implemented by polling the FIFO
> Status register until either Command Execute Completed or NACK Error
> bits are set.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Applied to for-next, thanks!


--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+hxC4ACgkQFA3kzBSg
KbYrHw//euNdIAgM/h+leoIrHtmx4U1t4ASeeDaSMNetrFYOEGWcHtzjDZkYMMJj
3jEzBhFGNGWPMixjn9JTUg3nIhnEMZ7VUklIUaIBRr9Ig/6AU3ymAHk1mFLVVcQo
ZWKC1yCGr6BS910ahG4ydLI9JM4cECwBcxy6uAm4scKX8mqW7AJY8aPxv1bsA71R
9JbDkSYP1PwhslH0NBcubgSwrF8zP93PRGp6nVItqw4l9/7yLYunTNlwR8yNt1F5
t7p3u9Yg/JVBOklJDWyKOVRSqyYgfqzDdutVhXnXtUhyJcu6qf7XyioT1/XmMlmH
3qSemDshe75Un0dAM5a6nyRHoG4CG/Je7j2SQb5XfXO1gyuaUo1TCZOAqqy/BDWw
GLX91vvGu7Y6sJCyHAGyZ5FLB3KOLwMWOTDTauHqzVgSlWFsuPOufvBBBeaAE/HB
IsjK3KPZ+oFi7nAD5zjPi6pHF2/jOl0G6P6AN7vA4w+3SAtz6e9JsWfFWKlFmGV6
BaOexMaHHQ5WlJEGFrwoEwW2+8nFxf1tRk7yRI2GeL7CHykdsyx8vx5MXDmJwwnC
HZA0NShfFaKS9lQAZVNg7NmTdHaJ70xfHCvBWU7oCgqJskhUaWGQ/Bga8Fsn/V12
z8IAa4ixpYWCtjVitRlo8bLDMk5KUCEg0CG9bNk+QVpS8cbA0fw=
=IJ2+
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--
