Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E780A444A
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Aug 2019 13:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfHaLjM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 31 Aug 2019 07:39:12 -0400
Received: from sauhun.de ([88.99.104.3]:37376 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726062AbfHaLjM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 31 Aug 2019 07:39:12 -0400
Received: from localhost (p5486C98B.dip0.t-ipconnect.de [84.134.201.139])
        by pokefinder.org (Postfix) with ESMTPSA id 4161A2C0093;
        Sat, 31 Aug 2019 13:39:10 +0200 (CEST)
Date:   Sat, 31 Aug 2019 13:39:09 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugen.Hristev@microchip.com
Cc:     peda@axentia.se, mark.rutland@arm.com,
        Ludovic.Desroches@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        Nicolas.Ferre@microchip.com
Subject: Re: [PATCH v3 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Message-ID: <20190831113909.GA1032@ninjato>
References: <1562678049-17581-1-git-send-email-eugen.hristev@microchip.com>
 <1562678049-17581-3-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <1562678049-17581-3-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2019 at 01:19:33PM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
>=20
> Some i2c controllers have a built-in digital or analog filter.
> This is specifically required depending on the hardware PCB/board.
> Some controllers also allow specifying the maximum width of the
> spikes that can be filtered. The width length can be specified in nanosec=
onds.
>=20
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentatio=
n/devicetree/bindings/i2c/i2c.txt
> index 44efafd..a2d31aa 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -55,6 +55,17 @@ wants to support one of the below features, it should =
adapt the bindings below.
>  	Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
>  	specification.
> =20
> +- i2c-ana-filter
> +	Enable analog filter for i2c lines.
> +
> +- i2c-dig-filter
> +	Enable digital filter for i2c lines.

Would you be OK with writing out 'analog' and 'digital' in full form?
The abrreviation doesn't save us much, I'd think, and I didn't find
similar wording in existing bindings.

> +
> +- i2c-filter-width-ns
> +	Width of spikes which can be filtered by either digital or analog
> +	filters (i2c-ana-filtr or i2c-dig-filtr). This width is specified
> +	in nanoseconds.
> +
>  - interrupts
>  	interrupts used by the device.
> =20
> --=20
> 2.7.4
>=20

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1qXF0ACgkQFA3kzBSg
KbbKJxAApyKizr/4AG2mt0cdPc6Pg5Q4whRHl0WPC6X1dG4zB0aR3btEB3esTmWY
FCyB0bqxsn64ZFqHpSfnF6piDxSu7iNrtxh+ltx2j3E8SyaOASeP29gckhaJoSsH
U2vUtPYg+I/9L6bCx8Kl6ZAf3EnXrRDFxIJU1lYGfeWbqXfrLNQgvtpcjx8jnADn
YRDpyeezNLnD8Nz3h321Zt9d/dnkeW2kb6x78Sstg0MVEskiGY97dioCbCzR59C6
QvAl4z/vlSMCOywBDplMKVpzYieCxD3IhE/BlydvvEwEgUmJuZWKfJDxURSuve4K
kll9//TsFaSSDZd4mZICUiTJurdmCskq8GFV4GQQZEO/J9viPfj61lZmtl6diMcY
eXHIWRWns+85mPJuKhdLpsCHv7Peki+u95K4lKOff4oErj9whAt1fEQ93vvz9oXF
2ciZiio4Wx8KokmGl6usNgugA9JMxJtLbJ1sNIUmykCa4Wdso3E02k6vcF0L6Sfx
uMEvNpxULD2zWe3yMX/LM2qkMjfadgloGJWaYI9KymKk9F5J9PjQ4GrXOCO1JmIq
qtYFpzw3sJ5EksYq/p21JOFSAK0x/1Cw/pjTOUcsXVgaRstIwgm5k+Vatl9C111+
JYRETvHiVYuj2qWUIboXY8TWkQuZaFCojPFv6e/kUQ6xgaPIIJA=
=WvKa
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
