Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7A8204FA7
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 12:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732247AbgFWK4W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 06:56:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:42632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732205AbgFWK4V (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jun 2020 06:56:21 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 81C3920738;
        Tue, 23 Jun 2020 10:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592909781;
        bh=GcdPSTmUcdlbjUfE2Yq4Ao5q+WO+t3w2mG4xYnD4PRg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xrLsXbjnLLak6sPIRkEdh3NPbEtXbhTVMJRlRcBWJjteeNgxv7l5thVYSTBTolaXf
         mgIuqRb9QPC3FjxhZrwCaXVTCREVzvp5tQz2L1ZbzR3Jbp2bC3nu9o8jNIQrrKSWMN
         gMuAIu9OxvxvgH6si1jVCJVnFQGGYxIQghXUK/QI=
Date:   Tue, 23 Jun 2020 11:56:18 +0100
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
Subject: Re: [PATCH V8 5/8] spi: spi-geni-qcom: Combine the clock setting code
Message-ID: <20200623105618.GB5582@sirena.org.uk>
References: <1592908737-7068-1-git-send-email-akashast@codeaurora.org>
 <1592908737-7068-6-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline
In-Reply-To: <1592908737-7068-6-git-send-email-akashast@codeaurora.org>
X-Cookie: No motorized vehicles allowed.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2020 at 04:08:54PM +0530, Akash Asthana wrote:
> From: Douglas Anderson <dianders@chromium.org>
>=20
> There is code for adjusting the clock both in setup_fifo_params()
> (called from prepare_message()) and in setup_fifo_xfer() (called from
> transfer_one()).  The code is the same.  Abstract it out to a shared
> function.

Acked-by: Mark Brown <broonie@kernel.org>

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7x39EACgkQJNaLcl1U
h9AHegf9GdXSnZ+4rXpEBgq/XNwTZFM8JsHNOn3DtEe+NzYdU5bX+U8TOu6QfI9E
gaa4dw8m0NgBrMbnh2lrij4efQFe6DfVlNqP6fUJ8eEtIN7g4hMoDWLyxms3v4Ra
hILk8cOv1Vu3FURcHfrsEDyhMzHCVS6hI1Gr/ENgI5gqfvobLoOIKx88xJZI5Ixi
TXqbrYXH0TB+/4KOFxEB33+OWX01M2+Qc9vvoP9E5Phu0LOczxwWE/CjEHokTpbH
Q3ctSTqc5/O/ZlT5dn6EE4VJG0WeKv9VrJQ0fTxye4tJzZEK0sNYzsfWdWWdn19V
PC1qSpXSenBMCj/dmSxo0Jcp8lR7XA==
=boUF
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
