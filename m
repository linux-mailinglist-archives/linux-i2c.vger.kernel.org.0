Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDFBF2D4BBB
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Dec 2020 21:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388446AbgLIUZ4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 15:25:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:37294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388444AbgLIUZu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Dec 2020 15:25:50 -0500
Date:   Wed, 9 Dec 2020 21:25:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607545510;
        bh=m3LxZH9XcfS3CgURbBcXuC07Vw+hs+QvtYswn73EEcI=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=vOSxtVbI0PR95veLEF8t2bpNEGM2ymuYIbAWHficC6/8TlB2D72/cz28ZcvdVTxjd
         Z+3SCke+JnGs5kGl7It7NkYfausQtcX8ZGigmusrgqx34uS8K6OTGQIARv+87RTjMQ
         vJvuS9L3TQiBcBpbscUFER9TBFJH2i3PdB4m4pRD5pWG9aEPhkap0CFFrIAD/xvLNS
         2gZUkrKOWX7JVrhcp96yzUeDNzb2k5TptDiRCFan4nsPbRosSB8sz7NoL/fkLQPbde
         QtoCPLjQkrWU78RvQhQkFWysZ9M+3P2Jdeba0736kIbmdgn28rW4QS9wMHU+SXCc61
         S1JbP1f9LAUxw==
From:   Wolfram Sang <wsa@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 13/18] arm: dts: owl-s500: Add I2C support
Message-ID: <20201209202506.GD3499@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
 <99e81f582b19d0e13abf506c1d7dda0f0a857fd5.1605823502.git.cristian.ciocaltea@gmail.com>
 <20201128073516.GZ3077@thinkpad>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Content-Disposition: inline
In-Reply-To: <20201128073516.GZ3077@thinkpad>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2020 at 01:05:16PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Nov 20, 2020 at 01:56:07AM +0200, Cristian Ciocaltea wrote:
> > Add I2C controller nodes for Actions Semi S500 SoC.
> >=20
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
>=20
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

DTS changes usually go in via arm-soc, so I am not picking this unless
there is a reason to do so.


--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/RMqIACgkQFA3kzBSg
KbaoPxAAnyZm/hMYK8JaK77JkGWwkak3rGWt1eJBUq+W+f+tDh3NzK2ksearCm2+
Cj4EtYWHR7qi+h7YtiEvEkpxe/8z1wZ/F+x2xkHAeunahRq9aCiVypLLxPIwPiO+
xRugddMf+AmY9G7HOhhOeHoZ+0enRVPHIdteTsewVJEZEg4aqtYoIOBZLcl/3gds
j5WjMEer4rt0whAl0wjLb07Q18c00ug3oNAkq8l2SR14SzD0GspksXDIJOOUcuFz
5tGjGDb5ZT+OGBZoSm84ykUwHsNwASnyThFbo5zBYe7/RotpcyimbL6QuIiS201R
aiOpYk7HkHmCpBaHsFufzkvqfN/w6nyJ1D4j0kvg7KLL0b5G6w8D741o04G1ydWI
CdgsOHobFZTb1Pkb0nzkWoKdQublmHUQtSNiCJ1vxDZbq1rWgWsAKHRTLXu2P376
1JbnKpvVPvjif5efAb1hpL7xmnCI3XmK9SiLjwsRRbE914ABMF/zi9T5ZDV71LS1
c06/OVBOh6KLd5nk/HKV4qjOqvDLlWaqIQC811Ffi1kYUFrZ4z+hCP5TZANRqaa+
MqbJz/aMJ02hGUqqadaaBp1Y2cOx4csFa1BMsaartC/NjhHUHuSxtyBDRkaGXe4T
YjtfhGHKX6fCMCsJnS0RpdFD812dadwjEkT8t4uKgHn86UeGMTQ=
=GUP5
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--
