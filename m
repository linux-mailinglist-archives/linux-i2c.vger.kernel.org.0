Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACC5204FB9
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 12:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732352AbgFWK5u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 06:57:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:43148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732205AbgFWK5t (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jun 2020 06:57:49 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0558420738;
        Tue, 23 Jun 2020 10:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592909869;
        bh=6wt/+Vt+bq7XfKbTd2BTFYU+/jxu6ucOpuI8JSZHgmE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iPJKGkyZRdUTcwnRxFqIPzNnKGmakA8amVTzv2YzYI+0cdqtCkq+sWQzXv5pJyz5e
         3aXUygT40lmQYPuK87BGULcA1lR4AezxCBhfRdk6cR4OUT3ACRg2eXL0wIzsDJQBo1
         /1LAUlkUYfrTkUIS02eTtz+j7aMoALiQxXCJLfyI=
Date:   Tue, 23 Jun 2020 11:57:47 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@codeaurora.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 7/8] spi: spi-qcom-qspi: Add interconnect support
Message-ID: <20200623105747.GD5582@sirena.org.uk>
References: <1592908737-7068-1-git-send-email-akashast@codeaurora.org>
 <1592908737-7068-8-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Content-Disposition: inline
In-Reply-To: <1592908737-7068-8-git-send-email-akashast@codeaurora.org>
X-Cookie: No motorized vehicles allowed.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 23, 2020 at 04:08:56PM +0530, Akash Asthana wrote:
> Get the interconnect paths for QSPI device and vote according to the
> current bus speed of the driver.

Acked-by: Mark Brown <broonie@kernel.org>

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7x4CoACgkQJNaLcl1U
h9BOYwf/bhyPfFwvPg7mlAQzfs2h7yx4AVfOS0MsvuMWE+wu2/XtlV+oMuw4neAs
i2HCMN/QFY/WmNGWV8e6wGdYEmZBw5c1o9nTPSaIawVYM1OsSz6o7YzZA1wrmS0M
xG4TS82lvy0klZ4agrcQ6Q8gzgaUsXH4+5ftOMP3oqGFauHUjuxCRu8RYbVo7qew
MvlDGqbxm/2cCq+bjEWfDiuMBMzp1KsclKCqmEUig6RXbgAZyw0l1Nw9yhtb92zM
HRasGq2QGfT3/94VqT1xqXrkPAuSanyj42AOeWiHSFMA2sCAQmvToqwvH1hWJMtY
z8es5Xaec/KswpLs/beZ85itrAvFXg==
=OgFJ
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--
