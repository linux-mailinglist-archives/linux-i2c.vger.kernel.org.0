Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A60F161807
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 17:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbgBQQfT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 11:35:19 -0500
Received: from foss.arm.com ([217.140.110.172]:38312 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728540AbgBQQfS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Feb 2020 11:35:18 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CF86328;
        Mon, 17 Feb 2020 08:35:18 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A27B73F68F;
        Mon, 17 Feb 2020 08:35:17 -0800 (PST)
Date:   Mon, 17 Feb 2020 16:35:16 +0000
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
Subject: Re: [PATCH 5/6] spi: spi-qcom-qspi: Add interconnect support
Message-ID: <20200217163516.GR9304@sirena.org.uk>
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
 <1581946205-27189-6-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7L9kolmstoDTZ4pm"
Content-Disposition: inline
In-Reply-To: <1581946205-27189-6-git-send-email-akashast@codeaurora.org>
X-Cookie: There was a phone call for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7L9kolmstoDTZ4pm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 17, 2020 at 07:00:04PM +0530, Akash Asthana wrote:
> Get the interconnect paths for QSPI device and vote according to the
> current bus speed of the driver.

Acked-by: Mark Brown <broonie@kernel.org>

> +	/* Set BW quota for CPU as driver supports FIFO mode only */
> +	ctrl->avg_bw_cpu = Bps_to_icc(speed_hz);
> +	ctrl->peak_bw_cpu = Bps_to_icc(2 * speed_hz);

These peak numbers seem like you're just guessing and should perhaps be
handled more gracefully by the core (eg, assuming twice the average if
no explicit peak is provided).

--7L9kolmstoDTZ4pm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5KwMMACgkQJNaLcl1U
h9BYdwf9Hw50ELkLWJ2LbQDxFVRGURfX2RoGEMty2qsXnVdvgKQXlcZbSHBe+PfX
NEA5WNsaeDwLlEpZF6AoaylbTSoooNOqTuyDcMgsBCjfPR/DdWuyRURjhNaJtOHr
PauHaxThkjOihnc3zuFds8TSzCdcOya7BzWJIwW3SxYwjo3reYSjb9j1Lq3x20/T
PjrqpFbyn+R2lIja7tpkI6tAE+O4U0KjX+RQLqqTuwjVF6VZRMKncWaHR1d7mR4g
dQkuKAuB8MXYUrSnHpQ7l+XzvxtmayVECYnE18PXy8qfifJ0GOTc2hgPy5EqoPjU
KCzWIif4ie3eJS/Ofimq2SLzfdKhQg==
=lNdK
-----END PGP SIGNATURE-----

--7L9kolmstoDTZ4pm--
