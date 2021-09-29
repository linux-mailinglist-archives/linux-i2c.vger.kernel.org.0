Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 133D841CDB9
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 23:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343814AbhI2VF0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 17:05:26 -0400
Received: from www.zeus03.de ([194.117.254.33]:47436 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237372AbhI2VFX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Sep 2021 17:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=qNDVgogKsAve+SdXmpiix6RvGn37
        Dw9NRQ0dUuB7eWE=; b=dNvgP7Je9RQy3oxx7cnQv/6lS320feKNgKt9duZCJpLE
        6XVWvS5vzj1QrsHB8AfK46BhyozM+cDbMHknt79SUks1HJ5ZXojqBKhv+jl+UVnE
        k+Z4b00YgM1oNJ9fZ32CLr69olZYEwCBVBxraIdGA/4KMkXR+peiWbBGa0jsZR4=
Received: (qmail 1802299 invoked from network); 29 Sep 2021 23:03:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Sep 2021 23:03:39 +0200
X-UD-Smtp-Session: l3s3148p1@A+0RqijNEuEgAwDPXwj5ACKF5hhAYpZw
Date:   Wed, 29 Sep 2021 23:03:37 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Ryo Kataoka <ryo.kataoka.wt@renesas.com>
Subject: Re: [PATCH] i2c: rcar: enable interrupts before starting transfer
Message-ID: <YVTUqQVlmB2Pe8B+@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Ryo Kataoka <ryo.kataoka.wt@renesas.com>
References: <20210915134827.13043-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0WE1ricZrn/U+nmo"
Content-Disposition: inline
In-Reply-To: <20210915134827.13043-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0WE1ricZrn/U+nmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 03:48:27PM +0200, Wolfram Sang wrote:
> We want to enable the interrupts _before_ starting the transfer because
> it is good programming style and also the proposed order in the R-Car
> manual. There is no difference in practice because it doesn't matter in
> which order both conditions appear if we wait for both to happen.
>=20
> Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--0WE1ricZrn/U+nmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFU1KkACgkQFA3kzBSg
KbYXkw/9GOcYNtCYE3I3BnCh8AFRhxa//HW7r4lcxvEpua9ezEcR1oq7YRpURsEh
Lu/XpgmxjiaenK0l3UuES8loeXpfBssiOHJ3DCtM1k7FJV2m5O8n10JoVJa7Br0k
mO+MN35zSqN3rlTU00ZO1Yv49OgVId1bBitJ4iD2r4Zg+vSA8OPZFB+05+WGNatX
gc9lvFROMyPaTD8GorH730tE2eaxBoz1El/LPvVbKSHSBb+catKSxQeVN6K570Jt
gXlwqsyLzbANpqRy48izY5csoDJaS0Pg9471Z+o3jdRx3Y73W9j8vlaQU0qa1NLN
fuTf7Wf+7MKQLLBfpYThFXhOtgNRZEU3kMrTzqDCwbiIgjYAd9ZXHDg2AeE42gYW
gS76os/eawyMOoTAMXVGYh8r5iffQAc0BmyMLml7WFJkjB11K+BwrNhe/LBWF20K
uHkEKdDLoQEqMlD77C35fh2JAD82EUReGxyFJ4gpRiNEQIwZ3a038jPrNF0Gj3Xi
Qyor61cauh3O6K1Pp+LQ0QYJVelraFN5KalfUqBpXhHo/kAxqC2bVcFhpPNKoPTl
sTExNpMbqih9CcGFSS+2hhkIO/1MAoo49495mffNYWIOgs9qO4Al8L0XSd3aXb1l
FERCjiEw1bhpxH5gEwWXNfSibjSaLU6CMIJX+EOwdpxOMRkI2ZA=
=oH9w
-----END PGP SIGNATURE-----

--0WE1ricZrn/U+nmo--
