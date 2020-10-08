Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2A528722D
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 12:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729148AbgJHKD5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 06:03:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:46954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725849AbgJHKD5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Oct 2020 06:03:57 -0400
Received: from localhost (p54b33b8c.dip0.t-ipconnect.de [84.179.59.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00FF92083B;
        Thu,  8 Oct 2020 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602151436;
        bh=cdx3nCLpwJjLLgckZ3J66TCOhumn8exh5A11TediQhs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G5K2Fi1n0Kl0+dUovATek37ODj2KnR0h2c2fFi4WVm6rVQrDubjKbxI6hZBNAzJp8
         fVCIP+vT2ACSJ43Y7C2YKuXDluDrz1XM3q4HbhN9a7V6mfez3Bt6EzsgddxjAyvVCC
         G01kWYXwaaU1nMlcuMUZ2dnzKgzv/c0FHx04+nnU=
Date:   Thu, 8 Oct 2020 12:03:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] i2c: geni: sdm845: dont perform DMA for the oneplus6
Message-ID: <20201008100352.GF76290@ninjato>
References: <20201007174736.292968-1-caleb@connolly.tech>
 <20201007174736.292968-6-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jkO+KyKz7TfD21mV"
Content-Disposition: inline
In-Reply-To: <20201007174736.292968-6-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jkO+KyKz7TfD21mV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 05:49:35PM +0000, Caleb Connolly wrote:
> The OnePlus 6/T has the same issues as the c630 causing a crash when DMA
> is used for i2c, so disable it.
>=20
> https://patchwork.kernel.org/patch/11133827/
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>

May I ask for a quick review here, so we can get this into 5.9 if
qcom-geni maintainers agree this is good to go?

> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index dead5db3315a..50a0674a6553 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -358,7 +358,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *g=
i2c, struct i2c_msg *msg,
>  	struct geni_se *se =3D &gi2c->se;
>  	size_t len =3D msg->len;
> =20
> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
> +	if (!of_machine_is_compatible("lenovo,yoga-c630") &&
> +	    !of_machine_is_compatible("oneplus,oneplus6"))
>  		dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
> =20
>  	if (dma_buf)
> @@ -400,7 +401,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *g=
i2c, struct i2c_msg *msg,
>  	struct geni_se *se =3D &gi2c->se;
>  	size_t len =3D msg->len;
> =20
> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
> +	if (!of_machine_is_compatible("lenovo,yoga-c630") &&
> +	    !of_machine_is_compatible("oneplus,oneplus6"))
>  		dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
> =20
>  	if (dma_buf)
> --=20
> 2.28.0
>=20
>=20

--jkO+KyKz7TfD21mV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9+5AgACgkQFA3kzBSg
KbY62xAAinAZbtUf2a8QgpWfrTKmq+EJ5myL9+QoHclmuiErksuj61QUTbV57rpf
yu2KCO95QUl+NKcVO+dgyR/kp4vzOnNzmF17a6EP2Iowi3k9WB4/x8riPjeMvQU7
+bvcMQCrVp9fU4RYjHkMAbmQaJ8z6BciN/uliZCQ0WM1U+gCOh6UmFhuAr1p7HHF
wvbHv90Sus2xwKPP21cDr3aEzu6eYEcUS3D3jXL9wgpvwp0VvQiYel8zoTgnVfmW
gjKG+e3CkY3wBsga+vF4rIUBK5RzuqDzwPB+2qgCU02ZTyYOlB0LVoOpk5ntuYEw
6AP1m0hluyUGhZXN59s4o16iyzQk/ZTQcTAg0/irocvzOCXiKQFp6WjjExRG1KfL
0ybOfumn7TmXUEF5j5m/b4N2SjGY0PioibeQ3n2wGDJ7bTD7638l4bfza7NTw7uY
ufFFgPxQA5ojnx33x5vC1HCFcnVmF3kXzH+UIHXnOp2qHEr2gIT18HwOX4WMM+he
nFpsrnHgTs+qkAkOjxe1p47NTtHn+T51YA0VuquAhpVaD7j3nxa2JgJL5kMP4W2K
hWXgqOrWP2kkur83cMUZ3K754RFDpk3OcFjg+np0qEg9ujAgYB8Flu+7BGfxr3hc
OaGRPdvS/ana/bksc+deR1hBhmyjrxBbFKbBj86mL9xRkw8BESM=
=wLDT
-----END PGP SIGNATURE-----

--jkO+KyKz7TfD21mV--
