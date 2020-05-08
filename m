Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C641CA81A
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 12:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgEHKQL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 06:16:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:50488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727067AbgEHKQK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 8 May 2020 06:16:10 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9444208CA;
        Fri,  8 May 2020 10:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588932970;
        bh=YGEI/+0gDSV2c28r0kRxWh7f8OBuz8IatLkeXFJ3ljU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YoAN7qlLIAZ1T+s5CkQBoIfFHSE181OCTvxRlrMGlReNdRkT29WxPWffsFAKqNQol
         Vo8PyYLWNEnCtxjFgBTrTTS+8hLmFm+mmwmUeIR09d3LBQzj2iwtT4BEz2UChn10i3
         YvD90hpN0DNg6GCbanfROaaXlRrVpVGIP//r3Jfo=
Date:   Fri, 8 May 2020 11:16:06 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org,
        georgi.djakov@linaro.org
Subject: Re: [PATCH V5 4/7] spi: spi-geni-qcom: Add interconnect support
Message-ID: <20200508101606.GA4820@sirena.org.uk>
References: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
 <1588919619-21355-5-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <1588919619-21355-5-git-send-email-akashast@codeaurora.org>
X-Cookie: Give him an evasive answer.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 08, 2020 at 12:03:36PM +0530, Akash Asthana wrote:
> Get the interconnect paths for SPI based Serial Engine device
> and vote according to the current bus speed of the driver.

Acked-by: Mark Brown <broonie@kernel.org>

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl61MWYACgkQJNaLcl1U
h9D2Fwf/YN2kAVjUWmgGjkLy1PIbV8pDp1D4CL5sodjeVkmqqc7ikp/yP0S3pZYd
yUZRdzOhe8VfN3bQaPbffIzBB7+8YTW0pyTbfZ62siyV/tvd6iccyFU2ky6nMP59
RHhKCTHRS7/Wg+Yfa5OsUPLYcWbyTSkXJhaDI/6GBVcZZGpDMQFMo4pwuAUvdrLn
pxWZM0UpOyIyzjA7SrfDgbswMvsqfrP2+UwEH9zS25ikGZPKl3zoMP716OceG1lD
fE3GmFerys88TpXVKnJT1JGnhJl8/D56MplgIOUHB17Z6GJpRnhX+JeEE/WfDxtb
lMOCuM5/EJiTbx/2yHm5WMlH46pS/A==
=LNgz
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
