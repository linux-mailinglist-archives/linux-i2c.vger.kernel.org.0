Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 640B914D7D8
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2020 09:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgA3Ija (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jan 2020 03:39:30 -0500
Received: from sauhun.de ([88.99.104.3]:46616 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726871AbgA3Ij3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 30 Jan 2020 03:39:29 -0500
Received: from localhost (p54B33261.dip0.t-ipconnect.de [84.179.50.97])
        by pokefinder.org (Postfix) with ESMTPSA id 943C62C0697;
        Thu, 30 Jan 2020 09:39:27 +0100 (CET)
Date:   Thu, 30 Jan 2020 09:39:27 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH 5/6] i2c: i2c-stm32f7: allow controller to be
 wakeup-source
Message-ID: <20200130083927.GH2208@ninjato>
References: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
 <1578317314-17197-6-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qM81t570OJUP5TU/"
Content-Disposition: inline
In-Reply-To: <1578317314-17197-6-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qM81t570OJUP5TU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2020 at 02:28:33PM +0100, Alain Volmat wrote:
> Allow the i2c-stm32f7 controller to become a wakeup-source
> of the system. In such case, when a slave is registered to the
> I2C controller, receiving a I2C message targeting that registered
> slave address wakes up the suspended system.
>=20
> In order to be able to wake-up, the I2C controller DT node
> must have the property wakeup-source defined and a slave
> must be registered.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!

> +static void stm32f7_i2c_enable_wakeup(struct stm32f7_i2c_dev *i2c_dev,
> +				      bool enable)
> +{
> +	void __iomem *base =3D i2c_dev->base;
> +	u32 mask =3D STM32F7_I2C_CR1_WUPEN;

=2E..

I wondered why we can't move this more up to avoid the forward
declaration?


--qM81t570OJUP5TU/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4ylj8ACgkQFA3kzBSg
Kbb0+Q//eaBISWaovu0/fjF7dgoFWHYguEvUxYTzaNb1jIXCpTrU12BTSrrZOLFc
h6iAjfi0aCQYqlbLomSoHp1n3PgcbdB+tTTbdZ5wjNllQmnsHnDrSh8ybp+mejOp
kG/vpYXrWE130JwFsY/iYAsJ5BSHMb2MoYv/5KYvV8iRlmI+s2tg3GU4fy2QUlpQ
CfOB5AcHT7IYm014VVqkhjrChUVVNbmmxque4UXs2YZnB8UU1TJ1kQfkoTtvfCkc
iK/11FS5XmPzls6f5910QqmaYiT8zEAky9SFXCxWw62D41/1cYO/TkN7gOMC4mOl
X0uWutwDU3OCOdFyj0BRXwuWTB61CZ0zF//j6Fhq2cCdgw6PDjU18XHXIj8OHZtj
RfWic1AJREBjlNTrfQhzEC2gmdT6OTjTxSVJKF3+w++zf2kDDFAGO0YF4QuP1JLV
EcggXX5rFHxDJlMSL9Xn4n0GPg0YhJj6tGmfEbWZGx++TZ2C2cNs98sdtXHcoyCY
l8PNu4GqYkcFyEwtl2WN3WGR4aIH9Wg5UaHt8PU+AILcg2lG0hX6aROuAhOsackv
h71zxFIm4QQ/mZKc5TQ11l5+GUIGhhdhKHv9jNwVA//fI2VNzH/SQIm+i8RRofle
qpoIdShu+NtY4n3OPkLb40egkG1SbD9yUpz09ua13Gj4xYwFU60=
=G8QU
-----END PGP SIGNATURE-----

--qM81t570OJUP5TU/--
