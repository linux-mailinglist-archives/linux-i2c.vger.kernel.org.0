Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DB31F3CD3
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jun 2020 15:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729790AbgFINlP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jun 2020 09:41:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:57504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728480AbgFINlP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Jun 2020 09:41:15 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 13DE420760;
        Tue,  9 Jun 2020 13:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591710074;
        bh=LLqWJbXt6QtzWVgvOd2712wAhSrRI95wAZyysVj9bK4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o0ERjX/mDx7TVjKhU7cpUaCWtG5ShegLg/BnxvPntVhuW0ElPicFk1+9q7ch6b5R3
         dehBiBs10JOSIRtVaUKyFlLqhmZhVhLyq1p9RMlF2JiXSAdwpn/CcnJSvh1twlm8QA
         xytLUX9t6pq+8Ko8rsT4Y3P87TVIAGf/OarQOayA=
Date:   Tue, 9 Jun 2020 14:41:12 +0100
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
        msavaliy@codeaurora.org
Subject: Re: [PATCH V7 RESEND 4/7] spi: spi-geni-qcom: Add interconnect
 support
Message-ID: <20200609134112.GI4583@sirena.org.uk>
References: <1591682194-32388-1-git-send-email-akashast@codeaurora.org>
 <1591682194-32388-5-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qVyHzDF4yf4A8jkR"
Content-Disposition: inline
In-Reply-To: <1591682194-32388-5-git-send-email-akashast@codeaurora.org>
X-Cookie: Be careful!  Is it classified?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qVyHzDF4yf4A8jkR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2020 at 11:26:31AM +0530, Akash Asthana wrote:
> Get the interconnect paths for SPI based Serial Engine device
> and vote according to the current bus speed of the driver.
>=20
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

I've repeatedly acked this patch but my ack never seems to get carried
forward :(

> +	/* Set the bus quota to a reasonable value for register access */
> +	mas->se.icc_paths[GENI_TO_CORE].avg_bw =3D Bps_to_icc(CORE_2X_50_MHZ);
> +	mas->se.icc_paths[CPU_TO_GENI].avg_bw =3D GENI_DEFAULT_BW;

Why are these asymmetric?

--qVyHzDF4yf4A8jkR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7fkXcACgkQJNaLcl1U
h9AvBQf/dcXzKa7k8e4LYRPmPnHQosxG01GttTB72c7Y1FpruIDtZ9/AQ1bKF824
68ww6ms6E7s6Yjbv5MCZRorMSzgtX5c6HzltyLfPfNLKUfnji6xOlutircZXZFJc
nRL6s/fhsxuYBHRgj/ridrEzhgmj0x9jx/z1EDUAWSOvvy+ekC2hjJsX86w09S1v
CH0UKzWi8VcdZIAkuTXdwBUvohiMFz+1VcJo2qn8WCIB53JeZvwCyiwmwJTlSEf7
5eq0UhK44xQm4rCZN6HtddJ6HmJAgUNJDwKu6zmDtHFYHEiMRJiElQU2qhJWQlbf
ZdNrJ0S70lYcOAQaIVfRMTaABp872w==
=qbNa
-----END PGP SIGNATURE-----

--qVyHzDF4yf4A8jkR--
