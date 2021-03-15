Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021FD33C5B3
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Mar 2021 19:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhCOSbx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Mar 2021 14:31:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:53318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230434AbhCOSbV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Mar 2021 14:31:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E54D64F26;
        Mon, 15 Mar 2021 18:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615833080;
        bh=+bNW4tM03wG3GqUjvhy7MlgRbIQV6NWi7TGZg9R+tkE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T6OumFgeimavxs5L+gE55cTVVQXF0GMGK+I0Qxk19V2BT8hr21N+kSPRRWOtRGSVq
         vYCLprtzEpBBx5cWg0B/2Ra1gZhSiptFdOeaxRCoMY0wJZWllCTXORKkE3ZylDmXnY
         h43j19kD/nesEzzQDXd84AgMVQT5gaANRXtR/hwfv7+1iq09gUCfb7Zg8CWCLLTvsz
         thSV3J+hESybxV2q25C3J0F7lO6rGMlANQwoYuwnwCdE/BC5dlNTlzhwD91nG045Mi
         QVo4RL4F3ctqLH74/lfY7pgkrlD5Q2Uki3rJTMsxGfgPC9uauHlRrfJ/YR91KAIqwZ
         F341mT6QtcuNQ==
Date:   Mon, 15 Mar 2021 19:31:15 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Mark Jonas <mark.jonas@de.bosch.com>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Adam.Thomson.Opensource@diasemi.com,
        stwiss.opensource@diasemi.com, marek.vasut@gmail.com,
        tingquan.ruan@cn.bosch.com, hubert.streidl@de.bosch.com
Subject: Re: [PATCH v5] mfd: da9063: Support SMBus and I2C mode
Message-ID: <20210315183115.GA2343@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Mark Jonas <mark.jonas@de.bosch.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Adam.Thomson.Opensource@diasemi.com,
        stwiss.opensource@diasemi.com, marek.vasut@gmail.com,
        tingquan.ruan@cn.bosch.com, hubert.streidl@de.bosch.com
References: <20210315160903.799426-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <20210315160903.799426-1-mark.jonas@de.bosch.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 05:09:03PM +0100, Mark Jonas wrote:
> From: Hubert Streidl <hubert.streidl@de.bosch.com>
>=20
> By default the PMIC DA9063 2-wire interface is SMBus compliant. This
> means the PMIC will automatically reset the interface when the clock
> signal ceases for more than the SMBus timeout of 35 ms.
>=20
> If the I2C driver / device is not capable of creating atomic I2C
> transactions, a context change can cause a ceasing of the clock signal.
> This can happen if for example a real-time thread is scheduled. Then
> the DA9063 in SMBus mode will reset the 2-wire interface. Subsequently
> a write message could end up in the wrong register. This could cause
> unpredictable system behavior.
>=20
> The DA9063 PMIC also supports an I2C compliant mode for the 2-wire
> interface. This mode does not reset the interface when the clock
> signal ceases. Thus the problem depicted above does not occur.
>=20
> This patch tests for the bus functionality "I2C_FUNC_I2C". It can
> reasonably be assumed that the bus cannot obey SMBus timings if
> this functionality is set. SMBus commands most probably are emulated
> in this case which is prone to the latency issue described above.
>=20
> This patch enables the I2C bus mode if I2C_FUNC_I2C is set or
> otherwise keeps the default SMBus mode.
>=20
> Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>

=46rom an I2C point of view, this is the correct approach:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBPp+8ACgkQFA3kzBSg
KbYLyg//RdbejCi8uxJlc9yGJINfkArzbk6XTpiX2oqxEu4RgO7Bap9ocR9zzpOb
hm8+Gp0mVYkfDfvUsw/m6AvJnNakGruKTcXE2ix+KtVj7IKVHvAVoQFha2pG7ACy
7HwbVRKGrltA6lth/idAbv+jw4mW/lvAHA3Wz2jv7YSXY0ZW7p3joSTLPqFQzrVH
0FfccQs1yncfTPQ1cu7daBAAJmhugyQ5GPIHQn66uYqu6FZyyn7PrI+Qs06Bk5yB
eztFzB3aupqhvFtzuWjyJdV1tR7VSi4+JfCaN+mfgtRaH1NqdyRgwioEhVYO/iQe
2BJevhVk1+j+XsNq4g8YpOOqwjtddg3Mq/D+LDVms6qKkhVzryL6CorkFtR1BOM3
1Zcu4QOu5NjzkMiELI644G3hU54Jhl6n8MIcWKJcgpkJX0wbVTC0uLbHTf1sS55z
7BDZbKOYTu8cdEOmzfUVaOox7BUVBomgXWkEHyrI1IW7oerrl6opwNYApA0g8G99
qzaa+P9+vYQnLQ1xzqoHJlCy2fEDgSQzuVjZZ1pVz0b0Us5IL/h37Eg7eSCT+wVu
ekASG/JfgsRXGL9E6Y+RbWazazZqkqefwLQwd7I8R6TrMRfkIxDqwe1CgqsT589u
l6VbxNvVKglu3NPrMWFVR5xRw3akkQociwrMgIgNS+++QQRqE8Q=
=/8fn
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
