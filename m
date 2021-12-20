Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C7947A79F
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Dec 2021 11:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhLTKQY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Dec 2021 05:16:24 -0500
Received: from www.zeus03.de ([194.117.254.33]:52760 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230425AbhLTKQX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Dec 2021 05:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=p0uMsr5IN+RkViSst4tj1wuGEytp
        cXTD9HlPhFcokMw=; b=EvOsun+/22iM+Tu+w8Ec+UO8wpdiYXVqGV+f5dqSHwD1
        t+kMXpgyCd8sDvhD85wLVadGrjTAY5SZ18qpGmEv7BG7IT/1wm0KTrnho0BaIVvF
        2G1ZGG7MSsz2ATvqL1kAVpMp5WHA+jvItiksWyDp5dczNvhK2uw+YHm2L0ueOjY=
Received: (qmail 913179 invoked from network); 20 Dec 2021 11:16:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2021 11:16:21 +0100
X-UD-Smtp-Session: l3s3148p1@fQD1LZHTvuggAQnoAELRALGDYlCZA5dV
Date:   Mon, 20 Dec 2021 11:16:18 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
Message-ID: <YcBX8iLzFaztwkeo@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Chris Brandt <chris.brandt@renesas.com>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0JWEgD6LQTZNclSx"
Content-Disposition: inline
In-Reply-To: <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0JWEgD6LQTZNclSx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

> +	if (!np) {

Very minor nit: Maybe 'if (np)' and switch the blocks? Positive logic is
a tad easier to read.

> +		struct resource *res;
> +		resource_size_t n;
> +
> +		while ((res = platform_get_resource(dev, IORESOURCE_IRQ, k))) {
> +			for (n = res->start; n <= res->end; n++) {
> +				ret = devm_request_irq(&dev->dev, n, sh_mobile_i2c_isr,
> +						       0, dev_name(&dev->dev), pd);
> +				if (ret) {
> +					dev_err(&dev->dev, "cannot request IRQ %pa\n", &n);
> +					return ret;
> +				}
> +			}
> +			k++;
> +		}

Yeah, it is good to keep the legacy block as is.

> +		do {
> +			irq = platform_get_irq_optional(dev, k);
> +			if (irq <= 0 && irq != -ENXIO)
> +				return irq ? irq : -ENXIO;
> +			if (irq == -ENXIO)
> +				break;
> +			ret = devm_request_irq(&dev->dev, irq, sh_mobile_i2c_isr,
> +					       0, dev_name(&dev->dev), pd);
>  			if (ret) {
> -				dev_err(&dev->dev, "cannot request IRQ %pa\n", &n);
> +				dev_err(&dev->dev, "cannot request IRQ %d\n", irq);
>  				return ret;
>  			}
> -		}
> -		k++;
> +			k++;
> +		} while (irq);

In addition to the 'irq == 0' case from patch 1, I tried to shorten the
block for the np-case. I only came up with this. The assigntment and
comparison of the while-argument is not exactly pretty, but the block
itself is easier to read. I'll let you decide.

		while (irq = platform_get_irq_optional(dev, k) != -ENXIO) {
			if (irq < 0)
				return irq;

			ret = devm_request_irq(&dev->dev, irq, sh_mobile_i2c_isr,
					       0, dev_name(&dev->dev), pd);
			if (ret) {
				dev_err(&dev->dev, "cannot request IRQ %d\n", irq);
				return ret;
			}
			k++;
		}

Only brainstorming, not even build tested.

All the best,

   Wolfram


--0JWEgD6LQTZNclSx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHAV+4ACgkQFA3kzBSg
KbbuchAAhJCF0GjgqtIqgwJLJo5A4+l9DFAo6idzSEnJteJwfryAEA3xiR48XCD7
jWiGdFxglAtkPAYz/swax2Rr0j7qTVySoyUoBGf0Bro5t4N/VqVlF0u5BDESL8xR
drolZSx8EDdH75ewl3ygGR1rvJtoerU6YluI2P3Vc8zfi8hWipduKqTKP52ziuQj
CgKaD/TN5V2m/Z3JRyQq8Ycohmb+czWGn3q/6FKNFxmO2jeC8ccxcf9tI6BG4/nm
B4YGZ2qjQfvAcfzDKwx8/uYuOrCVAx0+5Qvyp9DqCasNgNgUTrCXsEraDfACr7kb
pQxXWzVyKN10MSE34MjxgAtBCeM0Q6lFJVFu+Ul05BoK9/vvyO32w61X39ndvtbn
F/mQI5fiZM7ih3oB+J3yq8iKpKqF1iJc6HaIRo8MnudgTWTLbSR3jmnrwZ228BYS
INi4PP8EvCfDAjtZbwYLRFDrPJmFXajxv2JqWKkEJBknELCHsa7ek0zy7y0aasrS
baGLBTV/79znHC7fE/ftUIwES0pDVKPaWjOYn0yUQssnW6Z/uNP8IWIokuPQYxCQ
Ecau+5ZR/i3rM2QPWlp5W1fmEMGiDF2Z1Eo4goTpu1tPvIBkw0HFneaMN27EeZTX
mPBGwfEczLryFNqZrTG/WUSi1UhfSAzWRyJQPzUz+1WcVSciyjI=
=oPoX
-----END PGP SIGNATURE-----

--0JWEgD6LQTZNclSx--
