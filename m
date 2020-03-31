Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6EA199550
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 13:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730589AbgCaLXz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 07:23:55 -0400
Received: from foss.arm.com ([217.140.110.172]:51458 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730180AbgCaLXz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 31 Mar 2020 07:23:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D07581FB;
        Tue, 31 Mar 2020 04:23:54 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D0D23F52E;
        Tue, 31 Mar 2020 04:23:54 -0700 (PDT)
Date:   Tue, 31 Mar 2020 12:23:52 +0100
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
Subject: Re: [PATCH V3 7/8] spi: spi-qcom-qspi: Add interconnect support
Message-ID: <20200331112352.GB4802@sirena.org.uk>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-8-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline
In-Reply-To: <1585652976-17481-8-git-send-email-akashast@codeaurora.org>
X-Cookie: It's later than you think.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2020 at 04:39:35PM +0530, Akash Asthana wrote:

> +	/*
> +	 * Set BW quota for CPU as driver supports FIFO mode only.
> +	 * Assume peak bw as twice of avg bw.
> +	 */
> +	ctrl->avg_bw_cpu = Bps_to_icc(speed_hz);
> +	ctrl->peak_bw_cpu = Bps_to_icc(2 * speed_hz);

I thought you were going to factor this best guess handling of peak
bandwidth out into the core?

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6DKEgACgkQJNaLcl1U
h9B9hgf5AfEd6Av5eJV6b95BDWCIFAj1+wz2OaVN0NIjeR3P7zOSgWAMdMedmZob
9LpFAExIyjOzIowmVDD87xJhROhY3Iia8tBydoWKw8ti5bHoppSc3K1MtShRhhiA
A/QsZgJ2wzcc79ieuX1MVJTxy8kFu45U7X7r4RCGvKiYQtcTx5xkH093jWWxLMcP
DwTDCdJHBNvJb9g6erGk+bx01d6OnoPksVXY4XKU+eb+PbRhpwQZ0XJEI7Kbd0Vm
3OVvZY3idWN2KgNQVsYizxU4GDBGjKJ2/bNBO9SrUIRxuqqLRGfO3S2SKBxhRlE1
8Dx6OW56nNqySqFehTkxj8IUxmdgZg==
=ZtH5
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
