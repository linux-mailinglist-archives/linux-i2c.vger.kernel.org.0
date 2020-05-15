Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870FC1D4A5B
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 12:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgEOKDf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 06:03:35 -0400
Received: from sauhun.de ([88.99.104.3]:34080 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727927AbgEOKDf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 May 2020 06:03:35 -0400
Received: from localhost (p5486CC07.dip0.t-ipconnect.de [84.134.204.7])
        by pokefinder.org (Postfix) with ESMTPSA id 28BC02C1F6B;
        Fri, 15 May 2020 12:03:33 +0200 (CEST)
Date:   Fri, 15 May 2020 12:03:32 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org,
        georgi.djakov@linaro.org
Subject: Re: [PATCH V5 3/7] i2c: i2c-qcom-geni: Add interconnect support
Message-ID: <20200515100332.GI2077@ninjato>
References: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
 <1588919619-21355-4-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zgY/UHCnsaNnNXRx"
Content-Disposition: inline
In-Reply-To: <1588919619-21355-4-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zgY/UHCnsaNnNXRx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2020 at 12:03:35PM +0530, Akash Asthana wrote:
> Get the interconnect paths for I2C based Serial Engine device
> and vote according to the bus speed of the driver.
>=20
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>

For I2C:

Acked-by: Wolfram Sang <wsa@kernel.org>


--zgY/UHCnsaNnNXRx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6+aPQACgkQFA3kzBSg
KbZ4Ow/9H8DI9BmwLT6wo8CaAXuEc4HPabJpTZa5hSBoaXfHI0PRldtsm5zlNn3s
abVjwxQCwj4X6ZweLao7wKo+jbmGfBRlevwijLNiZm06Vafv+WP0DplBvt39idjR
SoNwtPzqEFGo3UFR9mNwEqguBnt2UtsjHSDMimurgZBqXGHHl4/2QnQBXfNf3IAs
tg1LsQc/Vop7NlL9Q1zpNSJiCaGRmmZH9DnZEbSgQVqXhIRS7mDawGR10Qr+4ShG
iOvllXjLuEkXJsrLz5/umvNDVtS4jau3TqYUKcxJk4DGz/ZVB/7NMy1/vKoDoCP3
GDK/pvHpSLHAftlr8A79KPw7MMBb9yc3GcVl1TvEXavm3jl+8f2fzQIok+UHPrlI
bfqsXTdeKnseBEZug+SRp091KjWgmjebY4g8GWIFGYCavKGUdsC2BfcLW73kbT6J
a7yWDfQjxVHggzUt7D4cIY7xPKOguXkv8E8xkodSyb/DtooDQ539jRvC39Dy94Wm
BzZbUpLWGR9Xu4L7c44cZxd4vhmqu7BePwxb+E5wD7lQXyCgrTh6FjzQZNNFV9UX
Pcstp+fT4Bpm1ixx4tbWUiXXQ2mnFm26J7UuoxITXOJF6jqjbsAGl61NizI29KNe
BhpKuAnBnMFvi2q38lpmDrB6v2CtZ7d9bPTK6JpzPJyD/RwxmB4=
=l3+d
-----END PGP SIGNATURE-----

--zgY/UHCnsaNnNXRx--
