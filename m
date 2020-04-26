Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889C51B8DA9
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 09:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgDZHvs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 03:51:48 -0400
Received: from sauhun.de ([88.99.104.3]:42906 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726113AbgDZHvs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Apr 2020 03:51:48 -0400
Received: from localhost (p54B33954.dip0.t-ipconnect.de [84.179.57.84])
        by pokefinder.org (Postfix) with ESMTPSA id 0653C2C01E8;
        Sun, 26 Apr 2020 09:51:45 +0200 (CEST)
Date:   Sun, 26 Apr 2020 09:51:45 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: i2c-stm32f7: allow
 clock-frequency range
Message-ID: <20200426075145.GD1262@kunai>
References: <1587394677-6872-1-git-send-email-alain.volmat@st.com>
 <1587394677-6872-2-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline
In-Reply-To: <1587394677-6872-2-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 04:57:56PM +0200, Alain Volmat wrote:
> For STM32F7, STM32H7 and STM32MP1 SoCs, if timing parameters
> match, the bus clock frequency can be from 1Hz to 1MHz.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6lPZEACgkQFA3kzBSg
KbaBtxAAmZcSVuGnytANdDwjJyW5rIZSw1STm4/hxAphX4OZ3O4zfhaQFGson4PB
+t3aWsB+pIFibUCucE17n5WIpPao0wY5FqOtBFOn99DRTDJAniCpk0GmTu4E8tXY
ekC1GXsS4gv1zkcc5urFk3anYs2xetAaxcueEh/twLoj3xrzOIM0OaGOghNB5J/+
hwc31h2RZArl2Rfb9Ek84t576Z5OkY+FAsWrWy3585qKMlSlyoUpYBlfFrIKy/Mn
YmM+xD4hF1CBOe/eF8MsOd3EUOvH2284cv1+P8uCpqdmukWn3V9g0fA9K959MQNn
o6UbTZLxngkgdxVCTEWuSd4V39yn7yId55/BOwLi9QLmXwmAOvOjRSWce6Qlhp7Y
YEuenclYMHLb7B73iBehEfeW3ClBJOm5WoNndpNB/RArIAgAbPeWgNcTq8iD9JsK
QdJ5t1i4ivB+s/Sb3EiHVfyfYfjw63qwMiyXFKvyUTwJMI8+WC8ZPqbEpOnUSPGp
jz1JfSVjjCZQCy4aVLyV8wUZkC5y+CigP7KViC1g5QRGGpP9c1Bbu7Vgu6+n9Tt7
zMKwvsZuXFoBpvUjIRfV63kwpJJay9Hw5NeIMUMBEbECyZwLPQIUA1+IAoO24o0w
rv/Lx9e3z2bpJz7WXjSXKCmBLQGiV3lxEAc2VY8Mq8rE3VGg9Ko=
=Wu/5
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--
