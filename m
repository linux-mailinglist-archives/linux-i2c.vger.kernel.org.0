Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655912F1B11
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 17:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730323AbhAKQgR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 11:36:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:42600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728591AbhAKQgR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 11:36:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74E41221FE;
        Mon, 11 Jan 2021 16:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610382936;
        bh=RE1Md8cmppu1xKF0msv57vimbUhlP4+7Lx/7ygdMAPs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cBk+zJJGnYddOl/czcVfF2W4yAH8sy1jqATOCC+tCVJkOywQ7sdsMXZVwnwYbcBdZ
         kR/su628sjS3ApqkD1RtF0xSpksd67XwENPgHCeE6XF7cB/IAhpeUGE+H9sNqBR9oH
         tLgiGSW/OreqsjsafiCgguIaiHPDH+LAIjnjE5HxnwzP25oGf1SQyu9CgiiACIlKc5
         rHWXhXdBrgpRXbmEnGaNDj0Qtof1RJVWfxLWArysRtc2Z1dI2OYX6Wuvj4YF6L8YPp
         QhAwoMEwW/EmmUF13zHi99e8R9ofvHT0iNnCZIT3p2Qft4SFkwGK3fFTi7NBqwnqL5
         aWM53dmIa2gTg==
Date:   Mon, 11 Jan 2021 16:35:04 +0000
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
Message-ID: <20210111163504.GD4728@sirena.org.uk>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-5-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Content-Disposition: inline
In-Reply-To: <20210111151651.1616813-5-vkoul@kernel.org>
X-Cookie: Too much is not enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 11, 2021 at 08:46:48PM +0530, Vinod Koul wrote:

> +static int get_xfer_mode(struct spi_master *spi)
> +{
> +	struct spi_geni_master *mas = spi_master_get_devdata(spi);
> +	struct geni_se *se = &mas->se;
> +	int mode = GENI_SE_FIFO;

Why not use the core DMA mapping support?

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/8fjcACgkQJNaLcl1U
h9Dg7wf6AiVIGMV8fdSxV/+rvHOKoT4lSj+DxPZgO4ziYL6vqk7upbg1Qm7+ipoi
EDQ68FPLAKZky09U0ZK3AP/kMn4hAAezlBysnKqYyNGF6fTbzszOP/WZICjFcWG8
w4ebN0qPW8o1UoC7CUDDdD0GxlFS+rugmEogvdsrhtNiOSodkhn8ibqL5QVYIzYZ
ndVwlAAgW3+WuDNd/vV4nTT8HvKp7a0ZJeoOygXCpX70uzD1Lztd6mA/v0aWIeub
xv5mZJb54rUmooaudUoRI14Zs2xhU4iyo+Zj/SQpDAa5uwdkRT4NxV1zWyvR1Lup
Ro3frvVVNALn6RtdXWhw1oo3GVtJXg==
=SIUq
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--
