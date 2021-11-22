Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CCF4589E9
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Nov 2021 08:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbhKVHmb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Nov 2021 02:42:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:49250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230142AbhKVHma (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Nov 2021 02:42:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D83C860F24;
        Mon, 22 Nov 2021 07:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637566764;
        bh=PrH4k+ijYl0EiNcq81wenm6pE8vlqEfaCe6ubZeLRF0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oRVijJip2Vhm/aHtlKryCZeGEM57Q8pBsyeqiUn7Xg0L469hLgF7lCmuIbgp2AI3a
         Qml9bV7OuRNozUwkxxQj89BTsDIPOpYeNwgXGvxdo3YSZmh9eVPFnElsvbXAqh9bX1
         rSdZcRXcWSubVIyGxeBmZN2tXgSlK3FS7ZPAmHOgjQzrceMinwq65zYaaNTrOjE2DK
         /5G0hV5t/apFbGXMdaVKwsFxeCtq5zxvcfbUcpd6CoT8zODaFGwmu6lw/YRTBadQ75
         YN2X486t09Le4TQKovHAA/k6aiQ3ktDvNPS/u4eSH4pF2ORyR9DG9gwSJFVsafMY0V
         hKnSQcE8vk6jA==
Date:   Mon, 22 Nov 2021 08:39:20 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc:     linux-i2c@vger.kernel.org, John Keeping <john@metanate.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: rk3x: enable clock before getting rate
Message-ID: <YZtJKAbscSLpmJDt@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        linux-i2c@vger.kernel.org, John Keeping <john@metanate.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211004131539.1253195-1-john@metanate.com>
 <1738891.e3IbIVKTtj@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FQua//j0Vcqc41KE"
Content-Disposition: inline
In-Reply-To: <1738891.e3IbIVKTtj@diego>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FQua//j0Vcqc41KE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 21, 2021 at 07:00:55PM +0100, Heiko St=C3=BCbner wrote:
> Am Montag, 4. Oktober 2021, 15:15:39 CET schrieb John Keeping:
> > clk_get_rate() is documented as requiring the clock to be enabled.
> > Ensure that the bus clock is enabled before calling clk_get_rate() in
> > rk3x_i2c_probe() to satisfy this requirement.
> >=20
> > Signed-off-by: John Keeping <john@metanate.com>
>=20
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>=20
> Do you maybe want to repost and include the actual i2c-maintainers
> in the recipient list?

No need. This is in patchwork and now has a Rev-by. Good enough.

Thanks for the review!


--FQua//j0Vcqc41KE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGbSSUACgkQFA3kzBSg
KbZ5Tw//WaPiD1HnteXBSDEh/wDzH9FDw2N3w6krgcyZ+zjuoV4b+Uk15w6nxhVR
saKWWiaQEmzwfd8zBqf1bJ0f6AprPz+Uypkktmit8GX7YBKccw711sOSLL9pQlOq
A0nflsXcaC3A7CAMqHOxNljPdFZq4v/Pb8nLpdCGz59zY+lt/gyFYvk9HInpQPU6
25T0nDkkamJ0Hej+qjU3X2goR77Gus20Jjg1HiqrkGZziI5CYMqukj/5SB6Z2+SV
GZ/768y9y8aY5Hkmfi/skW81uqHlj9PtIAv7LBesgHG/3eQMsfQx7oWwfE3Zy1RX
lkZPx6Snq4M8BFCaRz/XujCHjY6bp0qBkUOZvAuR0TfW4Ad194IkGGf7F15saXfz
jTOa6HNr13PDrfHaGoTvWiSC2hMSeEjbjj3IPNkaMO5BmffMcDBjku36ooWIvdgM
Cy9YsiVi8EEVdu7j0r8pwMDG8RjMyngSKZRp8BS4XRNR+0mJ339tdu3+jaUyM0hp
8Z4CRWug1ezShDtC+5y0r2cY9qY0xvkGamzMCac7tQGBEK0fTLhXW3zWfWRKH/7o
kXNAFresYzks7qI3o2MbQhsocFjsiNLFhHXri98XpNZSX+KwjZMx70H4BQPViclx
lOZVf36M0LKkuKQHyJybRxiAyXKpyxN2v9MfaXKFI9jMlNUGsX4=
=mSTE
-----END PGP SIGNATURE-----

--FQua//j0Vcqc41KE--
