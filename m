Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B06FE614AF0
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 13:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbiKAMln (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 08:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiKAMlm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 08:41:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A4219286;
        Tue,  1 Nov 2022 05:41:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 159E9B81CF5;
        Tue,  1 Nov 2022 12:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290DDC433C1;
        Tue,  1 Nov 2022 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667306498;
        bh=O7ATZryO3TjGj7xTXAJD/NietUD1CSnvEvNqQmfKAes=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NrLKkhnZ3ZEUGvc/PlFHT0pVDoRWrAl+9FZIjWkfiX7MwiBULWwakSDlheaC3BGk6
         VBMTe2IiuTjyLrwiGI2lEaIeaLB0wOs3ukKNFlecPpV7HiO5cpbRyH9RFHBe7ixLva
         nrpmyiMiOYRGmlRIUl8TvwgP1FYsAwUD3bKC8sVsJKv4nmWXqJHb9RyQu+9rUyxI0O
         xSNHmrbej1nJ6u0ZR50hejZ4IoxJMTb8O8Scth4vhEWxcSBKLeo54YP+ibVwp+9cam
         r8Au/0hzkr7688XZea3c3UB/vKyNEdVQOi0yzqQMFOLJ8fsSRhlDlGyFYkJVBrpKtz
         YLjb4oq6dFSZQ==
Date:   Tue, 1 Nov 2022 13:41:35 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Frank Wunderlich <linux@fw-web.de>
Cc:     linux-mediatek@lists.infradead.org,
        Frank Wunderlich <frank-w@public-files.de>,
        Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: update bindings for mt7986 soc
Message-ID: <Y2ET/xCCZBnSkify@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Frank Wunderlich <linux@fw-web.de>,
        linux-mediatek@lists.infradead.org,
        Frank Wunderlich <frank-w@public-files.de>,
        Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221009101631.82380-1-linux@fw-web.de>
 <20221009101631.82380-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OVe5jiAChcWLZ5TL"
Content-Disposition: inline
In-Reply-To: <20221009101631.82380-2-linux@fw-web.de>
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OVe5jiAChcWLZ5TL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 09, 2022 at 12:16:30PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> Add i2c compatible for MT7986 SOC.
>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied to for-next, thanks!


--OVe5jiAChcWLZ5TL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNhE/8ACgkQFA3kzBSg
KbbjHQ//e/qAp3S8diQPLa1LMdac1yjF2cy2QHnuH6cG0OgbBSW+kHgLZqP1M+BR
+ZoM8Pba+m/8qs1O3d0cvXBEDd3SbqB9yLJ1RPkyF9inK//TkyGz58YUmvXkexfU
uOt2OGLFyhzfa4jV3V8CFc0vqRKVbbVniFu5D9Nrfqi5ztolKZLgGhCmMIohr8vl
gS/nQmADI3hTW/UP8vOUqCWOHF07bVQ0t0VAjSOb0HWqM09EaH/sFoNypDfAYRrg
C6YJbVzl26qDhArXHTxUsDJkrZFzFn0CulNxlCvMkaQIlAb8cfviCUoqT35tVIfr
tjujcI9Jn9L8I2nHxUHulBfUNnM+3peCrSfWvoDIcIpV8n/ZeaPZaSAurgtbvF8v
CAyyXS1xOyoMHDtLaHyF5wMrwZ5pithjhXRugPa0sQM/Q35BAr0k6xkealJgGzBn
QoYIfsn2uToxmnEPqMGVFEciryr8DEXFY9P75uu2JsJYz7i3Frlmy9QLke/1GD9A
6U1bliJJq5tkRV/EUQMgYp2GrxYOXfRiEPe02DwqcYMiMftCNO8oiFWusJoJw6ga
U+5H8MkrJJ8cHuKOnKJOIvoUDTdp9aKGM31zWi3vfAtLhuF4XrYDTajAWKH9y7yI
RrX+qvH9RpAe1BNb2T5MMkKQj9tQwDDRw5SCZIvfUvXPOVrIf3o=
=qXU1
-----END PGP SIGNATURE-----

--OVe5jiAChcWLZ5TL--
