Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920021A9BA4
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 13:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393912AbgDOLCU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 07:02:20 -0400
Received: from sauhun.de ([88.99.104.3]:52524 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896701AbgDOLBy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 07:01:54 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id DB0512C1FF1;
        Wed, 15 Apr 2020 13:01:45 +0200 (CEST)
Date:   Wed, 15 Apr 2020 13:01:45 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH] i2c: stm32: don't print an error on probe deferral
Message-ID: <20200415110145.GN1141@ninjato>
References: <1584642136-15418-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ggdAeHltlv4tpqCr"
Content-Disposition: inline
In-Reply-To: <1584642136-15418-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ggdAeHltlv4tpqCr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>  	if (IS_ERR(dma->chan_tx)) {
> -		dev_dbg(dev, "can't request DMA tx channel\n");
>  		ret =3D PTR_ERR(dma->chan_tx);
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_dbg(dev, "can't request DMA tx channel\n");

dev_dbg for tx...

>  		goto fail_al;
>  	}
> =20
> @@ -44,8 +45,10 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct dev=
ice *dev,
>  	/* Request and configure I2C RX dma channel */
>  	dma->chan_rx =3D dma_request_chan(dev, "rx");
>  	if (IS_ERR(dma->chan_rx)) {
> -		dev_err(dev, "can't request DMA rx channel\n");
>  		ret =3D PTR_ERR(dma->chan_rx);
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_err(dev, "can't request DMA rx channel\n");

=2E.. and dev_err for rx? Intentional?


--ggdAeHltlv4tpqCr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W6ZkACgkQFA3kzBSg
KbaJ5g//Z4m5gD84GPP6vg6sSjL/LyJ6CZd/w08+hP95Uk1K82LELeWPmlaK1ibg
vSJRO8GeZLYFOYY8LgLc7rzQkHpkvB9xN2TW1wzZlAycvsjBvQtg5Ka1hHfASRuW
vR90ZA8G9eV5x8mpjEzNLEshHh4vkQlQjzgoO80v/r9ssHKHLDCwn0LAVr0hUEtR
ewHUTG8UwBsUguxGbnOwmiSdICGw/F46P2i+9LHLgp/2r6QYnjA7f31dWZ8hTOsR
HExpW9MoEmA9Kz4WeiNrSof/YXKh8I2z1ONzyeRDk+0IuBpHdF9MmY/Lb3wuQB2t
k9Vx4MF+2uBYS8R/Tv2ivxjxFmh74Zo2tCMXAj1P/AXhXlMtABXTCWNnmREyz4pe
lgskBVxJtwgybB+2r9RjWBE1uysnlG6GEJe82JP+yhPZfA8huDIGSG63+t5KVE5Y
LpcWFfEtXiPio2dvsOYCif4kHaCM0eARpY+83NwAokleUbIsovR2jDvvX3IJMtRt
SZWbMsW99eClAhSfLpxxA24OpgJoXRyhrhKqLPPil9/NucxWNgU1SbRqdmaA4LK2
inY4gaMa7Nixi1+4efMZYKl+Jqm6z2ayVhjZqONCu57lpoHFx9/wzQtLoOihyBT/
kObtfYnDh30/N8/6Btj9vpb5pA3NBMLuOKacj9sKZXdA5ipEGNQ=
=mwAo
-----END PGP SIGNATURE-----

--ggdAeHltlv4tpqCr--
