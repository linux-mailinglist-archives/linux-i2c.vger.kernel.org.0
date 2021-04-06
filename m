Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3A02355CF2
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 22:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236085AbhDFUdl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 16:33:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:36518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231488AbhDFUdk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 16:33:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 658D56120E;
        Tue,  6 Apr 2021 20:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617741212;
        bh=/tQSyf6lKNnRASDqvaUZ3c4udbeNqpK9JjCz5qTiAO4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CjlVHUMvwNwVeHJU8Oq3+dlhK/oQiCtsfvW0c4usLKrFps1uPhVhKogvlyBclPmIt
         ryYLuw0RyBmr+l9DjlG2tma7IyCEEhVScWxpTTU3XgtcFzZbmj0nQAy1fOnSGX1rGV
         ynsxY9PZRyHL2Z2AABvz/ZmKzByDXRZS05DB53k+sIcOkXm+XfGU6RcPhTfc3yNL/I
         Ftwj3jM45GZHEOyfPPucuJp6/tYpqfZIqI/yUcoAkfHgiZXqPBjyd1E0KvNqelI2+f
         V+WeO0Pr60UcpSH5byxsY+Ab92lKkCFtvil4FRk12/l0Tb17VpoQOr4MzI1s4sk3UV
         zCO85KSOR529Q==
Date:   Tue, 6 Apr 2021 22:33:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: exynos5: correct top kerneldoc
Message-ID: <20210406203329.GC3804@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210405181405.52189-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline
In-Reply-To: <20210405181405.52189-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 05, 2021 at 08:14:05PM +0200, Krzysztof Kozlowski wrote:
> The top comment is not a kerneldoc, as W=3D1 build reports:
>=20
>   drivers/i2c/busses/i2c-exynos5.c:39: warning:
>     expecting prototype for i2c(). Prototype was for HSI2C_CTL() instead
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Applied to for-current, thanks!


--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBsxZgACgkQFA3kzBSg
KbYBVhAAjym6TxxRvNuXqy1AqupVyByYVJ5Q+iXJoZst5mz+VeuR3Cmbfxg2viZe
/Qf/xssOwhqdLyIYA/Q/aaoCdR0eA//RlJU1x/KMjBY2ibZwSN8kbSFqbb9R4uA1
vIJqaj6ChkuzY2M27u10IdWmQ5UyYsXtfn1ciPIAp5nxG9HDV05dzwqTnuqXODFK
jWXIOZCs0GMlBqyUDkN+W66KXC6KLIvg/wQ8LZ5BMsRZLzBSbI6RaFBKIcRQkRvy
swSCQhHNPe4FtMzv+CwWxMaDfWdaHwEjhnFn3qMSI18MaHvrlWFH+IzySkDpI/AC
t0eeNTT709KuuUhZVelfHpv64YzBIthXHwqDX/JAHMPCppaDgUrI084B1HKDu4tt
+bUXXvVdTgdqpJ+rPFs0oWnV3QzjbhKPl0ErSMZTOp1FiVw/5cwInTTGMKyMgZHI
2FSY/eP/Dec2Zm0JuEWrdp0Ln2yagd2efCCZyK/uzXDOQPp7lJy/BzKV5XIt52p/
jrHT4I6TOJMDSffQPGVBqtUonSUr9TJ165FEmqC5RkGn74vJLlep34vv9D5k9iVy
dmNfUStCmZDAP9OMO2Slekm1l2PeBk+DhGememCfQJmf1JCQOBwePHobjQz/d/iB
tr3P1nRZSAtD3ITNr2YgR8gvTae7gpDPM5R5xk9YsEaEHSC3aVQ=
=RdZZ
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
