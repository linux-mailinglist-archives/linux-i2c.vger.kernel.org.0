Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6C4260AEF
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 08:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgIHG04 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 02:26:56 -0400
Received: from sauhun.de ([88.99.104.3]:33256 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728917AbgIHG04 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Sep 2020 02:26:56 -0400
Received: from localhost (p5486cc72.dip0.t-ipconnect.de [84.134.204.114])
        by pokefinder.org (Postfix) with ESMTPSA id 2D4CF2C0356;
        Tue,  8 Sep 2020 08:26:54 +0200 (CEST)
Date:   Tue, 8 Sep 2020 08:26:51 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     kunyi@google.com, xqiu@google.com, benjaminfair@google.com,
        avifishman70@gmail.com, joel@jms.id.au, tmaimon77@gmail.com,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: npcm7xx: Fix timeout calculation
Message-ID: <20200908062651.GA1019@ninjato>
References: <20200830213121.239533-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <20200830213121.239533-1-tali.perry1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2020 at 12:31:21AM +0300, Tali Perry wrote:
> timeout_usec value calculation was wrong, the calculated value
> was in msec instead of usec.
>=20
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Reviewed-by: Avi Fishman <avifishman70@gmail.com>

Applied to for-current, thanks! And thanks for the Fixes-tag, Joel.


--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9XJCcACgkQFA3kzBSg
KbZzcg//RR/qIunHGIrcDr5aZXfWTjr8u0f3ccyaBELUPk6kSzUqBufOcKoeRk19
dN74rzsCQr5egfumVCZCl1JP+269Hjtf7ISd4jBU5pJ5R/QovlN6zofK0EZsZJDs
6RA/wNM4KdzvqDi7IS9FhSL50pQ3M0Bl0o/R42m54qDc75JDXDO3qIRaABAU25Xd
V6nX2eUK6WLSsz63cM1ndM0VHxrupzj6w90EFTfSNqwx4ft1+tTDG7Z3kdGMcFd4
F5S0VtPCHMT1Uh+9HR/sk3wUKJHcv6VeU7f/bzus5pGksvX7sRzRq/nXsIVeCZuA
iAzHBOGSdlv/6UR6WKjPzOW8IDOqxctR7MqjiqzuFXUYo8RHK0WXMs+g4bAXZph1
i29CJm+il2t+KnUMje9w/S7bPDTPpU949vvYA5tPbTLYjrEhfLL+oAr7szDDbPvT
tsepc8J5K+rP8GkBGRCfvj4angCuJ6RSihQofwBRHgNh93MVZjQVH9o32Kzn8X9+
nwYl3DNvmC1Nzhnf01Bfa7dyWzeeLlU8ZBYXLx/yqGIRd7W/61KDVDN7Zcz+yGQ6
EkBy1Uxabx7JSDsbCC7lqR4JhPyEbaCwWiUs1amEubZc8VDibrtp1EN2QeHSopbz
BD3pfGjkLmr8rFKfea/ea+wmmI/gW8fQGfcVZfl4kpZReRRsYDE=
=ahmh
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
