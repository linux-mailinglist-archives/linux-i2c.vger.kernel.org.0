Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7900D6CF28E
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 20:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbjC2S4j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 14:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjC2S4i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 14:56:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFB65251;
        Wed, 29 Mar 2023 11:56:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AD8C2B82420;
        Wed, 29 Mar 2023 18:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE72AC433EF;
        Wed, 29 Mar 2023 18:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680116193;
        bh=IjCbx7Dak828Qr6GBiJPVIJav6MqEupomeNBGVuefLo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iQKL6dfKbYI0ydDvsBYiAJiJ1XL3G/FkEiPmG0WxAQtD5suvAZ2N/8UPj97JsRdCo
         i0FGfRI5fK0+iXBm6oEdXaPmkWWRAPAG7Ol+3bf2pi0nzniUGuZmD7pbRz6mi2FjLi
         6gZdWyEnlDuQj0890o44ohpndz1rPrcpi6x1Ds0ujtOapdN13DQh3Rl0Hzs5UGpX4p
         eDaPWWQais4F88/Q3WZ83gMgf+RV+pLBjdbNorbC33BWJPqxIK+T4/fuxnCauZWf3t
         BjEgZOk6BdiEprbjqsy3YoLnHx+YhS9JaW31h/1MkbKEGjsp37HlopgRDjUm4PUoAI
         O4tmJNxLEzp6w==
Date:   Wed, 29 Mar 2023 20:56:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-i2c@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH 3/5] i2c: xiic: hide OF related data for COMPILE_TEST
Message-ID: <ZCSJ3p3HauCklNnp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>, linux-i2c@vger.kernel.org,
        chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-actions@lists.infradead.org
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
 <20230311111658.251951-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JxFtao8vYFYMVGkV"
Content-Disposition: inline
In-Reply-To: <20230311111658.251951-3-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JxFtao8vYFYMVGkV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 12:16:56PM +0100, Krzysztof Kozlowski wrote:
> The driver can be compile tested with !CONFIG_OF making certain data
> unused:
>=20
>   drivers/i2c/busses/i2c-xiic.c:1202:39: error: =E2=80=98xiic_2_00=E2=80=
=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-next, thanks!


--JxFtao8vYFYMVGkV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkid4ACgkQFA3kzBSg
Kbaj9Q/+J7QTkzaelWV3lsjG/8AjUFOE50mNQpN07tk30lx5IlVNVoVCdmsSpENw
Bpg2z6NDbYz4DaGv2+YzSd98zQOs2+IRHAgP1bnOSf8V0e4TsUa+e5OZk2x+s/B1
psYmHHaRyZM9p7Pf75S+osiHhSuYVCQayFh95r4LUUk5tLlz/0uG8bdcsjaqyL8E
eDkVMh41FVozhC19fsLADtYPY8qVmWDKaACvwc9ssSPDNkd6+tMk5xV3tbMlnqSD
wyoZv8tUB4ETMhEz2F4fWDJMrBPfZIZ3FBiF/yydiJixaSzk95c1MSJ9MzGu32HH
J0qq6V9Glq1sC2w60KmX1GUgBIDz0/4+5nP7yfAXbhDSoysU4BL64LSRkMjmQWE3
PGsuG5NF1uAJI7re1Y+kPbQGBVbQ0Rlx1pSiOQA4NT7Srm5+RpQONgE4f4xhX3N7
e3EU56tKRVKWW/K39GmcD21QD+lJ6D6OsOAoGxiRj5VXHbUGzHlrPlyKY5OUv1me
NTCT5oyzSHujFxeYcDmS4DDJDNXveG0eSGNzsqAu7Ts5ucw5uWRPmx9FW7YUCE83
Z9MAHEi5kST2pxoo0hFkxthjvEYA9PYTBLqox4jnGxPmhPrX9nXL1xvPcghFFiAV
ZzkRFzAbja6ZyuZftMYKP+hDPzD2qDZxq1T/IyrM7zFXb+LM2xM=
=CvaY
-----END PGP SIGNATURE-----

--JxFtao8vYFYMVGkV--
