Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52B53A995A
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Jun 2021 13:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbhFPLhc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Jun 2021 07:37:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:36978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229503AbhFPLhb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 16 Jun 2021 07:37:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 558336128B;
        Wed, 16 Jun 2021 11:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623843325;
        bh=PzV2MEWSbQ8RK/gPkQQ7OF/Cwl0iVSmSTAcJaSf9HHM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hcVyna82yqf0QpgsHmlXZCfcqXyqANV2sngCLxXyovF5ec4EpbSaRSBeAZMu3edfq
         fbp7+WZUexMcF0Dduh4K5dTyGyQln3zx7IF92hUn/hntdLwpHGTN6AvPmSUPeVQUl9
         Yyhni9Oob8e+ObQ4tGjUd04d+SzJOijbTv/tqL4pJoqk62pQl1RblM7MQqaO/kE78t
         hSFvjUnso4csJ7qamyHLPszyUu5EykkHjrBHFVQljnc7H1ocRemOaNUmkH78yUZJG8
         g5mf5Lr/I8ordIfwBAN+CJGkBO/PTXA5NM8Y2E/y1vVCqF/4Ws/syEypQgv0hixOBq
         5WP7Gv+nDM7Mw==
Date:   Wed, 16 Jun 2021 12:35:05 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] spi: spi-geni-qcom: Add support for GPI dma
Message-ID: <20210616113505.GB6418@sirena.org.uk>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-5-vkoul@kernel.org>
 <20210111163504.GD4728@sirena.org.uk>
 <YMm7ZWXnJyb8QT1u@vkoul-mobl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline
In-Reply-To: <YMm7ZWXnJyb8QT1u@vkoul-mobl>
X-Cookie: Revenge is a form of nostalgia.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2021 at 02:20:45PM +0530, Vinod Koul wrote:

> Looking at the code, that is ideal case. Only issue I can see is that
> core DMA mapping device being used is incorrect. The core would use
> ctlr->dev.parent which is the spi0 device here.

Why would the parent of the controller be a SPI device?

> But in this case, that wont work. We have a parent qup device which is
> the parent for both spi and dma device and needs to be used for
> dma-mapping!=20

> If we allow drivers to set dma mapping device and use that, then I can
> reuse the core. Let me know if that is agreeable to you and I can hack
> this up. Maybe add a new member in spi_controller which is filled by
> drivers in can_dma() callback?

Possibly, I'd need to see the code.

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDJ4ekACgkQJNaLcl1U
h9Af1wf/XUOdANnfcSkgc6h7gVWBBmYYK7XBQctlluQOJxB4547Z5GJBEqISj560
Fn5NhyLDpooG5dGnHVv9434n1mPZiU7SwUbi1fwwauNe9prWjvZnC4NpUbobm1XX
KFczLzgQZ2QiiVDcry2XQz5+GsmHWDPlcBvN9B2EcM37BUXooUTLoAJmwYbB4kHu
LmY6Su4yZFynekXxcCuZN+8wlCGQEcX89lppEyRH62cyimARLoh4psPJuLBRNwbD
xw+FCLQxBkNVWYZD5v3t2KWCIqewSGUS1YTAAJUCiPftepbsH91CragR2sC6AewR
EXh4LGNP8gNAt38ftvgzwKFGIBC7TA==
=VcFe
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--
