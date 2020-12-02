Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDD92CBDBE
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 14:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgLBNGG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 08:06:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:40814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727102AbgLBNGF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 08:06:05 -0500
Date:   Wed, 2 Dec 2020 13:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606914323;
        bh=H/0q95DkccdCRUrw4XH+vTeIYaOMliOk5cchInyn50s=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=XN4iwfS0e15JIk6QbbRWo06n83/17cHOf1EB50auZeul+QGtc/13lfbgtv6+wW0Is
         Szfq7wPy1Fs1ozKlq6gWjB6qyzr37tkyRdpgHjzw5V8eWgDd+QwMnWfbFhnKKNczc1
         6gbGvGbLNXfummISxh5gdd4ayEeG7bU34nc4LRp4=
From:   Mark Brown <broonie@kernel.org>
To:     Yash Shah <yash.shah@sifive.com>
Cc:     linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        gregkh@linuxfoundation.org, aou@eecs.berkeley.edu,
        lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
        thierry.reding@gmail.com, andrew@lunn.ch, peter@korsgaard.com,
        paul.walmsley@sifive.com, palmer@dabbelt.com, robh+dt@kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        sachin.ghadi@sifive.com
Subject: Re: [PATCH 1/4] dt-bindings: riscv: Update DT binding docs to
 support SiFive FU740 SoC
Message-ID: <20201202130452.GC5560@sirena.org.uk>
References: <1606896236-62780-1-git-send-email-yash.shah@sifive.com>
 <1606896236-62780-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline
In-Reply-To: <1606896236-62780-2-git-send-email-yash.shah@sifive.com>
X-Cookie: Sauron is alive in Argentina!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 02, 2020 at 01:33:53PM +0530, Yash Shah wrote:

> ---
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml     |  4 +++-
>  Documentation/devicetree/bindings/i2c/i2c-ocores.txt        |  6 ++++--
>  Documentation/devicetree/bindings/pwm/pwm-sifive.yaml       |  9 ++++++---
>  Documentation/devicetree/bindings/riscv/cpus.yaml           |  6 ++++++
>  Documentation/devicetree/bindings/serial/sifive-serial.yaml |  4 +++-
>  Documentation/devicetree/bindings/spi/spi-sifive.yaml       | 10 ++++++----
>  6 files changed, 28 insertions(+), 11 deletions(-)

The driver bindings for the various subsystems would normally be sent as
independent patches to those subsystems.  Driver changes mostly get
reviewed by subsystem maintainers rather than architecture maintainers.

--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/HkPQACgkQJNaLcl1U
h9D+bAf/RB0pMK5XXva0fPJseHnvrYMw0AwuOBd006M10fxLWLou777VnMt6gMI3
oDXTEO2BXZU5QZ/QoKhAKqi2lsLUNrHZ94cii76pAe/eU18sRIDl146RkxGX0FtZ
zcqLnhbpbS55c8dEDr06w5AEMGvEEQ9cir6/sOHCYnEc3Rd5UR1XunrviLyyxqhG
MofmAaxxj+zqvd5e9JJxqfhpaw8dd20uKpcDoqdQnxeTqZ22yKbf0/NmysqI6kig
WuO5Pr3X1S/NWKTAdz6m12kTRf2XhvI5pPJ6FM+yXb+qV7sp9OlyXknL1OKC1DUG
fb8cYgkuBUdiyfcB+lBrsqrqDT3FAg==
=b00E
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--
