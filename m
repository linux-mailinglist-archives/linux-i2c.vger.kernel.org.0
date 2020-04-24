Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651711B7B3F
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 18:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgDXQNz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 12:13:55 -0400
Received: from sauhun.de ([88.99.104.3]:49418 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727050AbgDXQNz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Apr 2020 12:13:55 -0400
Received: from localhost (p5486CE62.dip0.t-ipconnect.de [84.134.206.98])
        by pokefinder.org (Postfix) with ESMTPSA id BEDB82C1FE8;
        Fri, 24 Apr 2020 18:13:53 +0200 (CEST)
Date:   Fri, 24 Apr 2020 18:13:53 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>, linux-i2c@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 01/91] i2c: brcmstb: Allow to compile it on BCM2835
Message-ID: <20200424161353.GA4487@kunai>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <c8c666eb5c82dcb73621930b3fedf5814792bf1a.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <c8c666eb5c82dcb73621930b3fedf5814792bf1a.1587742492.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  config I2C_BRCMSTB
>  	tristate "BRCM Settop/DSL I2C controller"
> -	depends on ARCH_BRCMSTB || BMIPS_GENERIC || ARCH_BCM_63XX || \
> -		   COMPILE_TEST
> +	depends on ARCH_BCM2835 || ARCH_BRCMSTB || BMIPS_GENERIC || \
> +		   ARCH_BCM_63XX || COMPILE_TEST

Isn't there something like ARCH_BROADCOM which we could use here instead
of adding each and every SoC?


--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6jED0ACgkQFA3kzBSg
KbZtQw//Uc4PYUUonN3o9vdnsuv4ID4p7OzoESWkaIHHkfPe4JBvfqW2iWFD0aKc
eebtlPWs93veah4FV2HAJWbAci4wTdPquffZkSFppnOKwYxMXPH7dqprhnJ1ie1y
wE3GmAuijco4Tx4Vcxu2OWZU4C2D4BobfOl7CxFMdpfye6XljwCJ/PFABnPWAxoM
23ur9k86e/Xk6jTnKAvZFSI2PFRGMbV28UQ1iLY0M7FhNA2E32DVg6U5lOaQrtt+
RE/xVQCI0/hEWBimID2K7Dy365BZRJfofHAniCCHmxwsnlwma7uifChHWtP6Apip
p+KUO9CbEU+pqapwH1FbUoL7yTYpKF1q0eTuIRmIbsdXqvFvU0GVJRzl8s20FvJq
V0aaj+B4qfW2tWqn2t4er200m6XWwZ/eFzJCxNv8cdq1Z/aCD3mDNb405o86Ztvn
lM/Bt23upIjuV2imatRrqJgg6qpcBhPQlMJWMjuc372f/wp0Wi35JDiRzPMGJnGp
wPVloECrn8NSBKRSnhvS5c5wa8IuU9EWk3meTLI0tYBInOEBXurgH791capAyrab
KCqmhD6sjqSTUyru93mzHZPwvu5xMvOdPWPukBATQVwwVBM0+emqn68UHeh80R40
yByqFbiHrJLUIZ+3vpfyykuKJWcclQBTjXx+DNbz0xmhEIQRIxE=
=czLk
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
