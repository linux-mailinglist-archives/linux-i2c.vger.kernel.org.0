Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5D622CEC6
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 21:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgGXTjQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 15:39:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:55668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726455AbgGXTjQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Jul 2020 15:39:16 -0400
Received: from localhost (p54b3305c.dip0.t-ipconnect.de [84.179.48.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F690206F6;
        Fri, 24 Jul 2020 19:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595619556;
        bh=aEsJK/on98H+OBWg+Fvivyaoij+CSyJ7aAWyHCS83rA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eiOTuRbtNrpPuvVetfi8oOZnREKbgxRLyG6liJKI+RarW/ryGKDl0WKv0ewht0HAL
         RrH/HbI3u16u5kBSO2Dh59GpPlvL/N/VukGbfUj6tqPVtN5QXHVGuU303/OGpHuP4D
         3Zy6iiSXfJgy02u8ltSNKLCxpW3eah0D8oRfQvik=
Date:   Fri, 24 Jul 2020 21:39:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, ludovic.desroches@microchip.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        kamel.bouhara@bootlin.com
Subject: Re: [RFC PATCH 1/4] dt-binding: i2c: add generic properties for GPIO
 bus recovery
Message-ID: <20200724193913.GD1227@ninjato>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-2-codrin.ciubotariu@microchip.com>
 <20200705211918.GB1055@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Content-Disposition: inline
In-Reply-To: <20200705211918.GB1055@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 05, 2020 at 11:19:18PM +0200, Wolfram Sang wrote:
>=20
> > +- pinctrl
> > +	add extra pinctrl to configure SCL/SDA pins to GPIO function for bus
> > +	recovery, call it "gpio" or "recovery" state
>=20
> I think we should stick with "gpio" only. That is what at91 and imx have
> in their bindings. pxa uses "recovery" as a pinctrl state name but I
> can't find any further use or documentation of that. PXA is not fully
> converted to the best of my knowledge, so maybe it is no problem for PXA
> to switch to "gpio", too? We should ask Russell King (cced).
>=20
> Russell, do you object naming the pinctrl state for bus recovery in
> the pxa i2c driver from "recovery" to "gpio"?

No response, so far. I suggest now to support the "recovery" naming but
mark it as deprecated. Opinions?


--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8bOOEACgkQFA3kzBSg
KbatLxAAk2OVhHrxdm0fEryvCzcONGEOEuKWTg4HCQ4cut68iX+MXLitGPJ9+vWQ
OtvgHiP6RQ/btXSkdxTdIrybUHke0J1++CzmDnWHkHmwUjECBKbfpxq/1WblwvC5
np+5JNo0yCwuC89MfV5B9P7elybuwro+q2HtxiZuoeDBp040GV/0T0hvV++JOiF6
TMLUYjP3ucaOI2KQEnSk931hVzoZE42uWoN8SdsOA/ieYETISy1cf1ghuq/WLh9A
4tvjCnJ55yAgK4rVIn6koY6hYk9waDRgSn5zdn/XvE0KnzA+9Wm/B+qiH8WLk0IN
DfoXNWMrssgQ11B1l3uhkHM21uTIJSpofhWA1lvi2rgXoXtIptWnNv4BsEg+NEfq
Vh6qOaPpEVG2L0uqToSLLbcRqBQbfS1iUWLSvAjoGVNLdzW7334PFC5DZ8BnVOZv
uXt1kpVFzSRkzPk+lpX4JjWPjMw764cpXlFTQXJRbo7pyQMXEPEf4Om3Uh5eRyiL
uRjlFkwgvOrA9gLaep3WlSRQZmdw+JQbYGDOD6jNya80V/IkjGMrfXQu9k6F0nD/
QLHhAErkdIIXxLczXftQiGvXc1sWp83Wo5wKZvwxIzaPRhvC/d7WNmXjR8WZ76mC
a8GLnQnzsOFN/F8ubjoEB8ABtxUO1x7PYJQk+AFRmz2AUhj9GIE=
=ZcrW
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--
