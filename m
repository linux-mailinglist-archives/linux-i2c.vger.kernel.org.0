Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DED27AAEDA
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 11:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbjIVJzQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 05:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbjIVJzP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 05:55:15 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C3418F
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 02:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=Lkve
        Ayu5qjrfBzi9LS/k1KjzYUJdvORTIG9SGjk4dwQ=; b=iYeWST5PPXxppjfB90Qa
        iy2VLiiDxkg9/cW1s3L63lfUaEao5yVAk54+oa2Sd3ugAWXYKFHz2mb7YLc0eNHP
        oGzYVUemtjUIzj3YIQnv+RmjF1iL0gbPUDg4AztfJb6FcBLC8I9FtzOzFDHkEIwI
        mEIpayKX1A6XX8kqG831tNHhE0LjoMZrt0np7Tkor+99FCryA43IZF3K7PBQB6fH
        UsE1U02Ud2BHAy7sMLzh0S1A3E8sHrFUdMGxjeLaKne8IpcjHDvvGeQQng7raIBc
        seF1pwysl2lTydmd69ZBezxH3WA5tIB/PV81qmX8utHpLQ/TDx8W+ab2idH/xR9j
        aA==
Received: (qmail 1348295 invoked from network); 22 Sep 2023 11:55:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Sep 2023 11:55:04 +0200
X-UD-Smtp-Session: l3s3148p1@iiZKmu8F3JEujntX
Date:   Fri, 22 Sep 2023 11:55:04 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] i2c: rcar: reset controller is mandatory for Gen3+
Message-ID: <ZQ1keNo59Uw8OF9M@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230921125351.3954-1-wsa+renesas@sang-engineering.com>
 <20230921125351.3954-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="on2dnl2nR4TSgbTg"
Content-Disposition: inline
In-Reply-To: <20230921125351.3954-2-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--on2dnl2nR4TSgbTg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 02:53:49PM +0200, Wolfram Sang wrote:
> Initially, we only needed a reset controller to make sure RXDMA works at
> least once per transfer. Meanwhile, documentation has been updated. It
> now says that a reset has to be performed prior every transaction, even
> if it is non-DMA. So, make the reset controller a requirement instead of
> being optional. And bail out if resetting fails.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--on2dnl2nR4TSgbTg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUNZHcACgkQFA3kzBSg
KbadHBAAr9tWRoRXrtwBgjeYIPR53Ls30AxiD97ADKcUbLMXHKLlDwxV+42y5TKq
e7oQZwy3NYe/VkCBMmbK9mP0Cb1jBLGhIA2vZ7qek8x/wDwouLNGmiHJew1SSUq2
h43u3vW3/obSf+kw0uKNoy1cCG1ES0rGI3nkQPRrD63fZ2T5LyNL7/GfXMj9sdwp
EaHGbdfmPJaULo0cpCG1MZJ+Aw3X+BHA8Pgbw4crgzL2l8U5fLibebrvw0WiOE2e
K4f6kLUY3xBLFNH4WE0V737XYAygf3DBeEEqOVZ3BIsW6q1yrmjy5APZsNrcrDRi
ug+bRXFP7ZKyyX3auk0v9vxxL9sG4wCcnQMZshv2QFzfoVN4gyxjWTKA3wh8BhXp
4xJv/v6C83bdbhFc/bsADcC9qzNN6Qs1SLMZexrQeC4siWvAT0keYFLy9q6rXH/U
KGPjQMrjSjs/ywjk5hSnfG2xwdxecmJcQTdRJZVAZPSUWkk4lbeUFZLR8daoSr3d
51jk/dGCU53/hVJ8ZFfpPcWinc2mdZHuLU2pzWRdXoNrEEupO7NCGZXc7P9t/cSY
Xbnyea8jdWbDNfX8Rf0asiFeZ5gfR3LI1bUfAsF42S3SFGD8blfj7BAwmFFPPSo/
79cvudy/VHV7d1glBLj6hIQSA/67k5H7go7EIkBgOFPIDqQF2Zo=
=Sjt9
-----END PGP SIGNATURE-----

--on2dnl2nR4TSgbTg--
