Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53405478A46
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 12:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233484AbhLQLoI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 06:44:08 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:50220 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbhLQLoI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 06:44:08 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C2676B82789;
        Fri, 17 Dec 2021 11:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E106C36AE8;
        Fri, 17 Dec 2021 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639741444;
        bh=N4SLJbonmm8jBnFacqm9G6G41H3dlxGpaFVouOO8aLE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Aijgx0ZIQWQAeb7gNbL6SpclY57lW1QH0Tjj3lrF/XSwEDWHugwzvn5/s/1FKJOQZ
         pMfarvCtO2n6TMepMbTJta2l2d2dBhZ30HsQGQnNMkZbX+M9wjvCIP45pe7ip0Jb6d
         t1L4C3jdIyEZW4kIbK3N3eDfMSl9TMsVzWRs1icIJfjNRHDeum0xEfwgvz93MG4d6z
         awp9XipBLcVyB2cWVHPejEh53NMcYLIPkxvC2cJ0CCKJZ+uBhrSnAe/auux+I3KTD5
         xFRHR4vdmElgOxACGGACl9xld/yXnMVUL0Yvx2S8kxsPIfrWy8hEFEej6h92auURX4
         Fm/jKx8mARyyg==
Date:   Fri, 17 Dec 2021 11:43:55 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Conor.Dooley@microchip.com
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
        Lewis.Hanly@microchip.com, Daire.McNamara@microchip.com,
        Ivan.Griffin@microchip.com, atish.patra@wdc.com
Subject: Re: [PATCH v2 10/17] dt-bindings: spi: add bindings for microchip
 mpfs spi
Message-ID: <Ybx3+3QaVe2lCcQP@sirena.org.uk>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-11-conor.dooley@microchip.com>
 <YbxxrlmYGC3Pg8+j@sirena.org.uk>
 <606633c8-6cd6-af3a-4d6a-bb3058a64026@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AfGRrf1crhTWT0mA"
Content-Disposition: inline
In-Reply-To: <606633c8-6cd6-af3a-4d6a-bb3058a64026@microchip.com>
X-Cookie: Pause for storage relocation.
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AfGRrf1crhTWT0mA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 11:40:29AM +0000, Conor.Dooley@microchip.com wrote:
> On 17/12/2021 11:17, Mark Brown wrote:

>  > Why do you need this property in the DT - isn't the number of chip
>  > selects in the IP a fixes property?

> Nope! It's an IP that's intended for use in FPGAs so the number of=20
> selects may (and does) vary based on implementation.

That doesn't explain why the number is needed in the binding - why do
you need this property in the DT?

--AfGRrf1crhTWT0mA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG8d/oACgkQJNaLcl1U
h9BGLgf/SiqoIpPFvZymGI+lV8cyTUm+CuIWdAYRxHOotUpqpCdFDWSt6ungnucf
L+CKgnigBiPYJ3jZs9yRuC1kaIDnha4hNFuGs8nlVgdVOd5k+PhGI3B6Vtz9sjv7
UKnkHSHk7yEcMB1CKjrgWDs5d7dcaA9vwNNrQNLd0TaqtSPR8VPUuW4uM1/gPVbt
g8MxN6GRUTiGKG8GIAVFXNQ1NFuGXti9FrbYZHelZQM811Gjua3bqRY6RfPGoaSu
2AudboDMa+HNohXPvKaRolBubzwtXw2zX3GABTZSHaG9/X/3C9LeJFR53x1Avmib
ak8CKqa7Sou8MLRP9OiktJGz1dPYTA==
=9ef7
-----END PGP SIGNATURE-----

--AfGRrf1crhTWT0mA--
