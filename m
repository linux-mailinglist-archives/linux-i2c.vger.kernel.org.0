Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4937EE3BC0
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 21:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392411AbfJXTEK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 15:04:10 -0400
Received: from sauhun.de ([88.99.104.3]:44100 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390604AbfJXTEK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 24 Oct 2019 15:04:10 -0400
Received: from localhost (x4d0bc9de.dyn.telefonica.de [77.11.201.222])
        by pokefinder.org (Postfix) with ESMTPSA id 4C7302C011D;
        Thu, 24 Oct 2019 21:04:08 +0200 (CEST)
Date:   Thu, 24 Oct 2019 21:04:07 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Beniamino Galvani <b.galvani@gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: meson: convert to yaml
Message-ID: <20191024190407.GG1870@kunai>
References: <20191021140053.9525-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="df+09Je9rNq3P+GE"
Content-Disposition: inline
In-Reply-To: <20191021140053.9525-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--df+09Je9rNq3P+GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +  - Beniamino Galvani <b.galvani@gmail.com>

I need an ack from Beniamino for this.

Also, do you want to maintain only this file or also the driver? The
latter would be much appreciated, of course!


--df+09Je9rNq3P+GE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2x9aMACgkQFA3kzBSg
KbYdvg/+I66+7PaxoK7MBHF/nRgJqPVDLQhjQDooZshe6FUVx8HXsHSFQDULtRqi
tIw9QoVOtDxrcF+Z+v6XqdOXEZhN1d8pai4kIQqwT1v3xoAcmxIubyws2E8YqCGp
IXaQmA8BY/cDVmPzTlbJwFVGoMWMsNCCAJV4iwJtwAlVUZIrxTsvg768wgdW5LIf
NVhBmLpzL/Hsq5G21rQA2oYk4FNZDCSjFARRTxGRVC05mzqRHTmyM3SMC94HKDS9
i5X37Hxxa/0SlrdE/33pg6mqULeZ87tP8BADAsKpbAuCFQqZ2OrUNbZwn8wajOLE
E4Z4svOFOhXryo7N4T4wWW7wcOAXhybE65YrHFrLcqfTrYaXqc4gKDdOyC0ve5g+
EtYxDjsJe+7YGIl/HDw9/YiGglcCwAYnIKAtVn+RFwtCWvfJWJ+mBQcOj4B/GWl2
zaOhW6y4mAgiFezJg2B6j7BbZKUYI5usECiGU2QCI862/OTicX5nliEO1KYl4XXi
BIPVmSdQSgjT/OqzrzgwsZlhRIzH1ON/aFKI+BaWC4a5vuUmB0vJa8/x5wnDQxNU
RUWY2dmH/3FeBpz2h6lqBfIJZmxYxRopUJyPsXe/rR+11Hgch/zjyt2LOvCWlcP0
sPNMJmBFnW+hFz2fGNdlIlzzOTP3zNX6pJftw2lROMWtn6VhDT8=
=GtGt
-----END PGP SIGNATURE-----

--df+09Je9rNq3P+GE--
