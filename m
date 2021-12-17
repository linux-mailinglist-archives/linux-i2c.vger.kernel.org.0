Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE60A4789A4
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 12:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235191AbhLQLRN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 06:17:13 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:34924 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235179AbhLQLRN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 06:17:13 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 89AC862111;
        Fri, 17 Dec 2021 11:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D67C36AE1;
        Fri, 17 Dec 2021 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639739832;
        bh=ciizNTJo2wPqNMTxwzDgqHE9JK7q6BV7T+/75cIK56M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nH7GUf5F3DdbIGiqXCbnIQyD6+vj31l6eJTYTXkZyYdWZoHhsGxPu4tRNKxlWgZBX
         1ze42PlgXL/aWXptLdbCn5f9HSAC53k+hN0RkIvTLbpvxCRnLwGFeM2vD0p1cIGNaB
         gs8YL04qGH3GTJLvfI2ek+S7OQ8aC2dgfv/1hNnoQI4w6YhlSNBxU641nNJR6a98di
         CwBjTaadjj4O44/xKIhVmPGlEk2w6umqHhZrb/PaswwDz57nXUIOga54rbiUgEgzX/
         Zq18ObE/m/NYLmLyCNhTX38sTKP4+C/1QvnC9bbb3CDSATqbdJLmaw4qopPC8CPJn8
         DxYqpFpEuWEmA==
Date:   Fri, 17 Dec 2021 11:17:02 +0000
From:   Mark Brown <broonie@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, jassisinghbrar@gmail.com,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        lee.jones@linaro.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, krzysztof.kozlowski@canonical.com,
        geert@linux-m68k.org, bin.meng@windriver.com, heiko@sntech.de,
        lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
        ivan.griffin@microchip.com, atish.patra@wdc.com
Subject: Re: [PATCH v2 10/17] dt-bindings: spi: add bindings for microchip
 mpfs spi
Message-ID: <YbxxrlmYGC3Pg8+j@sirena.org.uk>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-11-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q8nNbUqDPNVQRYrB"
Content-Disposition: inline
In-Reply-To: <20211217093325.30612-11-conor.dooley@microchip.com>
X-Cookie: Pause for storage relocation.
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Q8nNbUqDPNVQRYrB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 17, 2021 at 09:33:18AM +0000, conor.dooley@microchip.com wrote:

> +  num-cs:
> +    description: |
> +      Number of chip selects used.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 8
> +    default: 8

Why do you need this property in the DT - isn't the number of chip
selects in the IP a fixes property?

--Q8nNbUqDPNVQRYrB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG8ca4ACgkQJNaLcl1U
h9CSxwf/ej8wQ0M9Gd+7rtUHtN3BktycYB5ZcTYF2vBKdmrv+nxD7gkrKJ55D3X5
Cq+ccL5v/vEk+7sKFZDtqt1Ro8Nb9xlge9lerzzE9UpRB47Aem2ixXy9LVkDSvJ6
3DEHtrwqqn5sAy0uBgRXNfc7FnGajIjLdBWKBER6cRrUIjaW8laQhkGE+cWq7xVl
vyhFYVIE8g0ffymZ6wCt/sLil+KhtZ5D1po3U0Gkdqf7UGxGUA1a+3mJT+zcoTXy
YDuBPq7dAbVXNu3HjAU2k127FTYkjzI/e7vvit4/0WKNqvUch0E8H0YoTki71DJe
pLmu1B/yykOCwy/UuX1wQ1U17x2Big==
=n9Eh
-----END PGP SIGNATURE-----

--Q8nNbUqDPNVQRYrB--
