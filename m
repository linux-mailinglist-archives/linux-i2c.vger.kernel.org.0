Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7096D1CA820
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 12:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgEHKQi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 06:16:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:51582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbgEHKQh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 8 May 2020 06:16:37 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A0012208D6;
        Fri,  8 May 2020 10:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588932997;
        bh=nS2DJCtX+w5i4l8PcByQhOeNMlTOU9+iFfEluOHR3k4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tHAs/lMocaFqIJKctYDJk7UaFhmgEplZL4y8tvUudH+fVLuTvfEOB89Qlp+V9rpXa
         nnGt38Ee/zIIEAT+MPuXG4TpJ4Q+JWBU6EAzH9BkaRWuoAGzctKRz4VNDdV0co88n0
         nzWsuXgd5e4tN18M8pz1gScAtwnML51OT+ljqVUQ=
Date:   Fri, 8 May 2020 11:16:34 +0100
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
Subject: Re: [PATCH V5 6/7] spi: spi-qcom-qspi: Add interconnect support
Message-ID: <20200508101634.GB4820@sirena.org.uk>
References: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
 <1588919619-21355-7-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline
In-Reply-To: <1588919619-21355-7-git-send-email-akashast@codeaurora.org>
X-Cookie: Give him an evasive answer.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 08, 2020 at 12:03:38PM +0530, Akash Asthana wrote:
> Get the interconnect paths for QSPI device and vote according to the
> current bus speed of the driver.

Acked-by: Mark Brown <broonie@kernel.org>

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl61MYIACgkQJNaLcl1U
h9Arjwf+MQ4LQJXdoA+P+XL2usk8PqV3hkVKWimMalsw1Plbzbf6P/PJNMb/iGtF
yUwy73NHCaRqlHzHNLWXOmAARlOUL4vYTddrK42p+Ay3hUzu6sPFF1ZMSkr4qwJZ
hkpd8fpNLBY0l9FsmkBxLkKVTZQwn4u07GzuaLtXWo36ivYNmngu1Dl6LPYRUa76
/NO8s+trO4wXPOgbFgVFt/avRtOolHEB0rLZSwR0NOVVdfDszsEiQFBv5iu467VN
CadV73GRR/xGUYyX24I04hrHhj6AmOiCuqrU58O7+XbqP5a1oR75wAdOGXIF7kWc
TRjqMat80dIRUuYylMoJoNMRu9hAjQ==
=cZ76
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
