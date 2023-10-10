Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B67E7C04DB
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Oct 2023 21:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234258AbjJJTod (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Oct 2023 15:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbjJJToc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Oct 2023 15:44:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFBDF8E;
        Tue, 10 Oct 2023 12:44:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B770EC433C8;
        Tue, 10 Oct 2023 19:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696967071;
        bh=3C++hF0g2xnKijtFMR04daPdF8gMLF1v7H3LnvxMEhg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t7KrsoMcqOmJb1MuzJxoEBEyUaRciAvWD61supcifUDsRdoYMEPuVEuFWTABqJ541
         jxulDs09PYKpUgBhJUj/eA4O0OoR1ai2BuCNy7vlrAdO/kUfSa4q6wu2zEYJ87lUVm
         CsCbcawg9RiP8bY55Tu1sO3CjpZ5hDeWlgK5y4LvP32ngvGyio3Q3o0yJoiCUDCLvg
         z2b4RgpuRZTpxo1dfk7931Jl8D4VHhgcJcoeWIegFeRjdd656UDokKnZ+3ERDpDOzs
         dOk98eBpG9v1IiTiyFmBb12OLpEOa0axyhkB8nsfEBV8h5brrzZSx6WPc4deYS46k7
         g2yP0X3R631ww==
Date:   Tue, 10 Oct 2023 21:44:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        loic.poulain@linaro.org, rfoss@kernel.org, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: i2c: qcom-cci: Document sc8280xp
 compatible
Message-ID: <ZSWpm/7xnoFkUn31@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        loic.poulain@linaro.org, rfoss@kernel.org, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231006120159.3413789-1-bryan.odonoghue@linaro.org>
 <20231006120159.3413789-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t6Aj+rePpll//Dod"
Content-Disposition: inline
In-Reply-To: <20231006120159.3413789-2-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t6Aj+rePpll//Dod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2023 at 01:01:55PM +0100, Bryan O'Donoghue wrote:
> Add sc8280xp compatible consistent with recent CAMSS CCI interfaces.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Applied to for-next, thanks!


--t6Aj+rePpll//Dod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUlqZsACgkQFA3kzBSg
KbYxYRAAr7+ppZOIsAJ24eXrV+W6sJDcUrxv7CSK9IjgX4II8QHuJJPwGW1iUeax
LOgmBQcvDP2hQKG3oaAWcpn0UWly1ny4n6iHLyMK9EDiKIPkXVr64G5sfN/iDRjL
U6lSb5ZRpO9uYvVu7+vFU9JmCoO5p53JnQpdkvZpy89wT8ylMST/Dx/ZHMYr6ySj
s7TsBNizXBo0UXSUYjpXekq7NZHIP124/wK+LWUx3AXq7fnlGsksCAoQen27G05F
U5bIPxhJuNvO4U/1g1xNZFHsOwI6Gb2Jk/dpNmik4YJ7jaiUfzK3QXuH0Yge/vxK
JsWIdmMRMz31UTSePtq49Gd4Q2PFo92fti+TUVzZhkawhgi8jL6aX6u1Z93PMeqv
NnHgVT4ziqKqCCHQQU11CcGcjNaepfawOlWSebqTI1oDk9Z5XAMRyxU0tGVAYQtB
BKiPvnUeQ0kHGhoyfb4V5d3Q5ue9l12aJ2/PAMH2F5w3Q3m25dgRteW0IAT8OuZc
TjxNWAbtDh6I3ZxgfBHR9XR8kdkBHgxv7h/6lYh3fxdUPPPnLHrADCURVscownI7
tJy7FNISwe1O6yHfge2FnzUOFAspZAUL9VBMPU0fL5Z4w5NxTIxPs5tQsDfJQmxj
zAnfTpMqoVsvt05mGusYWetkr00c3RiNG3Yp4P8V0zIGDWH7TS4=
=jtu3
-----END PGP SIGNATURE-----

--t6Aj+rePpll//Dod--
