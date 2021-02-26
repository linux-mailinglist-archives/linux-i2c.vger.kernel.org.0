Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5412326161
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 11:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbhBZKgz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 05:36:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:48634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230209AbhBZKew (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Feb 2021 05:34:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBC2964EF3;
        Fri, 26 Feb 2021 10:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614335650;
        bh=SIuXvoyqUYnr8BUATfL804vOgzeqKEzaYbFmE6A/AGo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A77r2pQdIXPQLrVw961zech2JCWrRQEFPnXK1ileQ14G59V8oD4zrgn2NLW9kw4kB
         hbvrmNVAiP1kALZVg/ClUDcZ4EC6HqTuCnnCn4SVh29X9my4hruff29O+ia0n7+1hW
         qiewnpk9OrfMdSFJ9LJ5NWMYoH4bMjo/JvRCVhExp5RbZdltaSxdmT8u88G5WTxIHT
         QmKXdtJrjjUiPaAah5o2jt/ucCbyhz1TlmeIE1pTCw5zxQuAGfEmAftPSWTI3/rIiV
         Go5Q9YI0L2gzmKNaWu7UVtUNHVnLOLNe9x4KDLXcljSVemta8PrxV4/8vnxUJW2z9U
         pAP4t7dzIrAhA==
Date:   Fri, 26 Feb 2021 11:34:07 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?Q?M=C3=A5rten?= Lindahl <marten.lindahl@axis.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>, kernel@axis.com,
        =?utf-8?Q?M=C3=A5rten?= Lindahl <martenli@axis.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: exynos5: Preserve high speed master code
Message-ID: <20210226103407.GF1014@ninjato>
References: <20210216222538.6427-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GV0iVqYguTV4Q9ER"
Content-Disposition: inline
In-Reply-To: <20210216222538.6427-1-marten.lindahl@axis.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GV0iVqYguTV4Q9ER
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2021 at 11:25:38PM +0100, M=C3=A5rten Lindahl wrote:
> From: M=C3=A5rten Lindahl <martenli@axis.com>
>=20
> When the driver starts to send a message with the MASTER_ID field
> set (high speed), the whole I2C_ADDR register is overwritten including
> MASTER_ID as the SLV_ADDR_MAS field is set.
>=20
> This patch preserves already written fields in I2C_ADDR when writing
> SLV_ADDR_MAS.
>=20
> Signed-off-by: M=C3=A5rten Lindahl <martenli@axis.com>

Looks good. Is there a Fixes-tag we could apply?


--GV0iVqYguTV4Q9ER
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmA4zp8ACgkQFA3kzBSg
KbauHA/+NmyLBf76UbCWT/9RhQNRyWbVeXT6kyynoPUq9Y4RwM9nCnEK++X2gmyB
8X64UrUUBImMu9zmWS4rKcqYP2GN7dxEyfxuhTALpcC5kvA3FvukIgmtT+8ZsZID
ZkO/zF4z3jm8BMC0hHE8DHah60JQF4o2opItiFEaz7hN9na83dWzyF0OM15h6xh6
k39IkoMgN2ZgzwahqTGA5ohUnakuD4qQdbGDudLyR3+J4KF53WhmTtX8xk3WTr6I
FtWFxr0KjidHMed4tXYJt09vUacjpx4bPSTRe6AcHH8y3uRkzS2Q5OCinytDzN0y
5/yXFUPZ63cDzp9HA/CB0qgSCDrRprpabjlD+sTSC5NWQNqMh7MlgEdVKJJS9Dy7
0QEzi1BUGP5BO6fOZgdti8PAKH+8sUkFJ2Yd+jsxJmG2Z+cutwwN6irNXb1GK8iI
XHss4SYNua5XzDrkuNzOO6Mg/RQ/1wUUJnXrDiDPpX8c394olae4AiSRk4GZJrFf
vys3dBz3MxuAaRNFkNnWg9L3mrfiVagat8Acei3lmlTAlwFMgeIkNh27peFkc/tY
rE/U8uLf4nxOuQcwhw00/RILz4kHNOn4RvIeBVV7wi6B1X4lOeNPBVQKi2Z5YWBR
MsfZcdeydPYjjvTT9UplaMy3HEnUWfOzhALD2Sb8ioFHYtV56DU=
=LEVv
-----END PGP SIGNATURE-----

--GV0iVqYguTV4Q9ER--
