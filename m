Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA3A1617F8
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 17:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbgBQQbz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 11:31:55 -0500
Received: from foss.arm.com ([217.140.110.172]:38272 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727922AbgBQQbz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Feb 2020 11:31:55 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ECE130E;
        Mon, 17 Feb 2020 08:31:54 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4AD13F68F;
        Mon, 17 Feb 2020 08:31:53 -0800 (PST)
Date:   Mon, 17 Feb 2020 16:31:52 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org
Subject: Re: [PATCH 4/6] spi: spi-geni-qcom: Add interconnect support
Message-ID: <20200217163152.GQ9304@sirena.org.uk>
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
 <1581946205-27189-5-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9+VnUxDxRuy97YQ+"
Content-Disposition: inline
In-Reply-To: <1581946205-27189-5-git-send-email-akashast@codeaurora.org>
X-Cookie: There was a phone call for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9+VnUxDxRuy97YQ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 17, 2020 at 07:00:03PM +0530, Akash Asthana wrote:
> Get the interconnect paths for SPI based Serial Engine device
> and vote according to the current bus speed of the driver.

Acked-by: Mark Brown <broonie@kernel.org>

--9+VnUxDxRuy97YQ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5Kv/cACgkQJNaLcl1U
h9C0DAf/ZL04JTosjXBLegMQrmn9rjYoKyenucR6bwhVK2SMK73TkxGKO7vjD/vN
it0Qg/z04vrqX/4Z6Nfbcmt0Y7T8RGK9YxWMGU7mVyup19Dqm0wYFc5qkBV2h3DY
k9/tUYoYmc6hddevcpgWwG38oU0eJJ9UoWVWvkOfCXK4VmjYnyxdUTcG4oRfDUFZ
rTjQlYIfYaqZJebjxTYB6cst1z2cvQ3ccOIYLH5PM5Z9V5BUx7mqz6ZsXQ/8qWZG
mVsA6RTuTPKlRsa3Fw++Y6QSIO4r4wLH96Z2JA7Dl8wVzofTtbrSFuel93qWz0Ny
e/uNxPQ+GY/Nx19wFOrfJ1ErkNi0pg==
=f/E0
-----END PGP SIGNATURE-----

--9+VnUxDxRuy97YQ+--
