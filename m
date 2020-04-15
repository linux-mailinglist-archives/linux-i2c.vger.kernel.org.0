Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A67B51A9CD5
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 13:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897295AbgDOLjP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 07:39:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:59078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2897287AbgDOLjD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 07:39:03 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC96A20768;
        Wed, 15 Apr 2020 11:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586950742;
        bh=DhilV2LGjOn6gl5KU5PoNhKIEfaaPV1J4VIyQKZ1zVU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QSW4csO/lzL0+++NeIP5apIz9UXvOMrwUJzFbUcMJkQV3Dzwax5rfFSrigbQVSYmP
         D52NhrGUiQ2j2lkSVX4laTA0+Py/5VoNzjnkF60vvGUAaMKHnz7WZo8qZY9meWyzRX
         NJc2v6ypYK30LwkinlCgfU+/A4wT1OZkz8phDdvQ=
Date:   Wed, 15 Apr 2020 12:39:00 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de,
        mark.rutland@arm.com, robh+dt@kernel.org, georgi.djakov@linaro.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org
Subject: Re: [PATCH V4 6/9] spi: spi-geni-qcom: Add interconnect support
Message-ID: <20200415113900.GD5265@sirena.org.uk>
References: <1586946198-13912-1-git-send-email-akashast@codeaurora.org>
 <1586946198-13912-7-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Content-Disposition: inline
In-Reply-To: <1586946198-13912-7-git-send-email-akashast@codeaurora.org>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 03:53:15PM +0530, Akash Asthana wrote:
> Get the interconnect paths for SPI based Serial Engine device
> and vote according to the current bus speed of the driver.

Acked-by: Mark Brown <broonie@kernel.org>

--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6W8lMACgkQJNaLcl1U
h9ALhAf+LSYOHFhnvd51g9KqXmq4MWJ/4WJ3CyCeJfrLwmHC077oaiBT8uI+nwAw
ryqlhyzHhYhQycNDTAbEVON72KCQuHrc2cjO9FPiKnvZ6fxcfDE/fq0G17v2y3UO
4OXDoYkpYbnBK/cA1D9O1kIh3YxD3H926UfjBowT43Vc5mrTTdb4TheyZsGYXNuW
bcGVnXNFVfdNcqKT8mJ2is6EhfIU0417YR9YaFnmRsCivRxR79y4K5wg8DWSALfy
oCfm8pWX3ivmbQ7utQShrc4gnACwK2zlO5v10LupYTKQJBAbFUXntqyJ3U6PcAmh
QyjDriQmcqykA2os0xc1CftFuoMgVw==
=NU9L
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--
