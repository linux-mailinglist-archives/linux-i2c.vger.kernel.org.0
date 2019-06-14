Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1E0A46BBB
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 23:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfFNVRe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 17:17:34 -0400
Received: from sauhun.de ([88.99.104.3]:57240 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726030AbfFNVRe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 17:17:34 -0400
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
        by pokefinder.org (Postfix) with ESMTPSA id C6D022CF690;
        Fri, 14 Jun 2019 23:17:31 +0200 (CEST)
Date:   Fri, 14 Jun 2019 23:17:31 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.or
Subject: Re: [PATCH v4 2/6] i2c: i2c-qcom-geni: Signify successful driver
 probe
Message-ID: <20190614211731.GI17899@ninjato>
References: <20190612142654.9639-1-lee.jones@linaro.org>
 <20190612142654.9639-3-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PWfwoUCx3AFJRUBq"
Content-Disposition: inline
In-Reply-To: <20190612142654.9639-3-lee.jones@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PWfwoUCx3AFJRUBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2019 at 03:26:50PM +0100, Lee Jones wrote:
> The Qualcomm Geni I2C driver currently probes silently which can be
> confusing when debugging potential issues.  Add a low level (INFO)
> print when each I2C controller is successfully initially set-up.
>=20
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Applied to for-next, thanks!

Alok, are you still there? Your ack is missed here...


--PWfwoUCx3AFJRUBq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0EDusACgkQFA3kzBSg
KbaF5A//eOUYXPdT2ti6Q1bKBj1UFPE+GDDgTGN5/r9/yp/CvXDI2rmQRzYZ4Hzw
gu+c+ZlfvgufyiS3nOri6r8RgiSRqWPRUCKK+PZNGdiYg7bjmHGSzYj3QwprXu6Y
vorDbXJ8AsnSr3/LAqO+vwzxwJIUdUNu51svi+IYKw0t+v7mbxfSKbl6vTCmrums
DepavKTDuQKnoLD6RX7E89ffTw/wvnR5kR/kGlIeAmcOHYCWyNZhdmrNLSqhZdmf
Ki1TTIq8D0dHoVKia0GdkcCBeegTHBpfwkiDzRl9ubpPaZen6T3ny5mrbyTWV2wF
Xn3H7nYSiT2jbY35k09RINb1G2YSc6zHClcgIAdx0OO9Zs1OXV4s5sdHvjzHR1ep
SbpBxZ+ndXOt+Eyo4aXSpK8In3noXs0RZiw+kf7DxUKQWOb465hHb7aX7cCwp2Fv
kjHYMgizH6agnT5ApVTa4GLF/NQ2uTj+EmWjgwhFmPWsnfjS1rCOrvWkizGx1dpn
55ROyQ1sS8fIRk4lhKJa0H54up9gg4ql07O0qMvkwRUkLvBnEedob5AapJp2jg2b
FKH9EhHky3pgSWkrlChUiNcRsBtF9IKORupVYGjhDfKGo+dQMvrEhgFIpcPINk2E
1zRvv6B2/eRrDN13n6Kztrfil3fRYOEYmbSn01W7loWGu51o2LE=
=OtA8
-----END PGP SIGNATURE-----

--PWfwoUCx3AFJRUBq--
