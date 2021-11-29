Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C387046106B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 09:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244059AbhK2Isn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 03:48:43 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:58096 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349934AbhK2Iql (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 03:46:41 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D04B5B80DFF;
        Mon, 29 Nov 2021 08:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFEDC004E1;
        Mon, 29 Nov 2021 08:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638175400;
        bh=OixLDAXpSBxsXxksHXG7qO5MHN4k5qolbw7dRTlvO6U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ox5RYRKJswmVjrm6oqkS0sNRRi/xiLhfXeHIViF+l+yylNI1L/Iavs+9S7BfiOU6S
         Sp1/BEEbT2imRngMlMTbMVrmZcXX2yY6Ut/i2Vk6gywu9+ccQQqrz1ELWH6rkmaSzt
         anqOT7HJqDGFVQ2r+WZNwYp/IrVYiz44wmtFD9KGNIkr0avPpt+iiSf/KriygNN5Fd
         uJM5h579F8hidbkad4Bcw8TPt3p75R7bBQ7mkGha5RlrN4sSjtFczi3JmIyRqwNTzD
         aW6VdapvsdSqVm4r1gwHG1GdTcjjQwqibi9yxA1XJBVE9IEOaTcLy3KYugOB7p1Yzl
         kxBUm4r6X8niQ==
Date:   Mon, 29 Nov 2021 09:43:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     robh+dt@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, ulf.hansson@linaro.org, broonie@kernel.org,
        linux@roeck-us.net, wim@linux-watchdog.org, linux@rempel-privat.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>,
        Rob Herring <robh@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V6 1/7] dt-bindings: i2c: imx-lpi2c: Add imx8ulp
 compatible string
Message-ID: <YaSSpd9yENnPyxzp@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, robh+dt@kernel.org,
        aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        ulf.hansson@linaro.org, broonie@kernel.org, linux@roeck-us.net,
        wim@linux-watchdog.org, linux@rempel-privat.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>,
        Rob Herring <robh@kernel.org>, Peng Fan <peng.fan@nxp.com>
References: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
 <20211126074002.1535696-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4iqRmJHmds4/+yS2"
Content-Disposition: inline
In-Reply-To: <20211126074002.1535696-2-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4iqRmJHmds4/+yS2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 26, 2021 at 03:39:56PM +0800, Peng Fan (OSS) wrote:
> From: Jacky Bai <ping.bai@nxp.com>
>=20
> Add the compatible for i.MX8ULP.
>=20
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied to for-next, thanks!


--4iqRmJHmds4/+yS2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkkqUACgkQFA3kzBSg
KbbT3RAAikYPcjsi+jX0pSwthDtUkz0JCgBtIprTRsoQxHHMn/3MmgtvC8q3HKCu
5C+u6I2hIZ6Fvi0rt1rH9MCvQzsE8DqQkKI58XCrNO4AbjVhwZbZRSkEsYYCm0ID
Pqj+rkhRKtRHB9XIuuIts7F1UbmztpvLdV0EKC4ItyBzIYSRNkrbRL3zbXKyXs5U
+j6HhIL1PjmbRx1+iUX6yfa9Iz9hh41DCEYvHHIDik14VOjQiO7bUswR+mvOX97W
k0kaulmMlQhok4sLgc2vltz2IucoWBS2jZv/OGXwXCW4X4N0Z3J3ML11JxWkY7pB
3yhnvEnLrDoKMCMyNmXyCEtTDgDfspUX++eN/4vo3qcr7iFFUfTfOiokyJ/w/oPK
SpdDo5IVToA8edoyDWN+NJsC0LjeGZkPVEr07xcsax9xlx5ARDGEZiYzX+Lq70Cp
Ivq0IDQdEjEHgvvwAMUg7ZIozp9k1zB7gpqLBvF8p0liktIWVBKy5RI2fuuGlE5y
ZREl2BW4GN3utcpER/2eB+pAdEicJMWFa80k2DJSSeWF8miB3qLMS2lM4Ms5gQix
aowgCti5aF2oL5vvaCZoVxx3sqwKPEbAad+O2JbGpT3KH8Y+hKbx6257gA9gmEsc
y2SJ8FbCcyY5InCbHvC8+TZ/LqORBgdaDnG/td7tYSuDoMW05JQ=
=eonB
-----END PGP SIGNATURE-----

--4iqRmJHmds4/+yS2--
