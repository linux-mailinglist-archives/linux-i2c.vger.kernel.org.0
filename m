Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C07A139C161
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 22:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbhFDUfs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 16:35:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:36846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229854AbhFDUfs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Jun 2021 16:35:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9F6A60FF2;
        Fri,  4 Jun 2021 20:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622838841;
        bh=prn70jPH40FaWqLyD9hxXxxeHKLoSW33nPc01wxEYoA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SQebSbLxcu/9QPbtm6HRvyQVpZUnDnBQAVJ/dz6dlyGN217CpaUq4Qnr4o5PB7CpZ
         /Qdz805XJqtiM00YcgMV4ow/T8FaxelqFm8VGy2Mgx6sWO1Km/iyeYwAucdGMgOxBQ
         wHFeO7wccfldVzQsG4BiZdkYk7ld0eCCmx3xyj4kwU/CB21kLXGVi71SXn7FKdpYcM
         9ff/fljJCw0MODryiCj7BLnZYYEBFS9qNYmiCV0bHOSASmHMXMUxDCDgipy6hZiSwf
         nOtvdDJcGIREJf4Js1gy7nL8dFAML5rtwHEJhiOyIyWCUvab7PGhOA/8JQ/ZxnKIeD
         dCL+8n2VF1csQ==
Date:   Fri, 4 Jun 2021 22:33:58 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, skananth@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V11 1/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
Message-ID: <YLqONrlcPkOuZM18@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>, swboyd@chromium.org,
        dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        gregkh@linuxfoundation.org, mka@chromium.org,
        skananth@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
References: <20210525131051.31250-1-rojay@codeaurora.org>
 <20210525131051.31250-2-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BValqsbsrpDr7D4r"
Content-Disposition: inline
In-Reply-To: <20210525131051.31250-2-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BValqsbsrpDr7D4r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 06:40:50PM +0530, Roja Rani Yarubandi wrote:
> If the hardware is still accessing memory after SMMU translation
> is disabled (as part of smmu shutdown callback), then the
> IOVAs (I/O virtual address) which it was using will go on the bus
> as the physical addresses which will result in unknown crashes
> like NoC/interconnect errors.
>=20
> So, implement shutdown callback for i2c driver to suspend the bus
> during system "reboot" or "shutdown".
>=20
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm=
 GENI I2C controller")
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>

Applied to for-current, thanks!


--BValqsbsrpDr7D4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC6jjYACgkQFA3kzBSg
KbYZog/+O5j3/Xx4ClIqhhlhEbGhBpe9KGk/evPZr1X0Saw+cCAcQ0pVA9P7ssgm
b+nY8IJ6Iztv+FZ7sQpFaeKIRlsUDDoxAjCwRJMjDv8AnK6IfrfCyBHd0e5EJcya
qxpT9RHPdLj1fMP10G6pP5EfQEuqpEhhmF+08LYeX5HWv7bRuIs11L/UI8Ccjp97
peEsIw6U/2L7vuQH4abPBs2XgBbYoiFP5s0HARg/k1dDY6TWiFnRFE13QGJQouD+
mebqjSILR//iYxDMTJqNQTXWOMSld4QxWrRuJ1iG0GVmpwvb/Blzq6yIDqamHu7x
AVaC1FXDEJuO+PxQPL63ttSfH28fIvhE4tDXpznXh5TXJyPMNmIQtUkuIKAdm2pj
JRQWfDDOTljOCY/v5nl3nAnUWucGnZbaKAcpIIrGfOUKcLP1LQ9fTOlI0XvvcT3B
a7fQFT/H6yyzOtnNzzaNZQ+V1Mr+Jx2pwnYa0rKNZy9cDBBQiZtdL+9cmsHleRO/
mAnA+TqYTDZS8uEABL1M5wS17IhiGHWss9LMKgCEoc9B4khjDAPrH2tjzIraaSqT
SAIoqik7TSSVlKuCeksja5dQ4JP0IcMfhjUvG/u4BbCm6n17lqe3M7+1EQoSLSPZ
eeYCyc0pvHszrEGRha9sVXgQEZ1dTB/M03iUapMoZN1UfVdTXyc=
=oyxh
-----END PGP SIGNATURE-----

--BValqsbsrpDr7D4r--
