Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04198662509
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 13:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236710AbjAIMHd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 07:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237142AbjAIMHX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 07:07:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E261A3AC;
        Mon,  9 Jan 2023 04:07:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E102EB80D9C;
        Mon,  9 Jan 2023 12:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6A2C433D2;
        Mon,  9 Jan 2023 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673266039;
        bh=Ea0zHBw3gWOQe9HL9bLjzfw57E1fKO7cH9+Iq5PK1pk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V9KVuMdxEpDP8hK3Fr/g2n7VTJMOM9C5zxZo/VDdUf8AmIXWUrHFUfbi9a9t62BcX
         5cfd8hdu5qP+2+lsZRvjvnJwQyLSH+rP4ERDN9w8RUEkMJmZNZhXoXXXTrB0/JQCE/
         JYmbMd1WtNDbW5GRqVPJFba70QAtfp585d9zzPSv2P3FmkI4sTnlRDPRQm8d2UgxW3
         +ORH8HYGngJ/7W21+au6UZLcW19F6EsQcw+cG4/w/xCu2EYQQebV3qgTEVr8GwuV4M
         bWSdM4mBpIxbRF2u+iBaJQIbt031oS+tLwU2nkcB0W6fMpHGtml4PVUihn79gJHanI
         B5Ln5zS7rs2sg==
Date:   Mon, 9 Jan 2023 13:07:16 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] i2c: qcom-cci: Deprecate duplicated compatibles
Message-ID: <Y7wDdF5MP62yjXEg@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221213183305.544644-1-konrad.dybcio@linaro.org>
 <20221213183305.544644-6-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gl00fZOC6PlidV2h"
Content-Disposition: inline
In-Reply-To: <20221213183305.544644-6-konrad.dybcio@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gl00fZOC6PlidV2h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2022 at 07:33:05PM +0100, Konrad Dybcio wrote:
> Many compatibles have been introduced, pointing to the same config data.
> Leave a note reminding future developers to not do that again.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Applied to for-next, thanks!


--gl00fZOC6PlidV2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmO8A3QACgkQFA3kzBSg
KbYfkBAAlnLV2Wum+TCDyGQKuJ+FuADGxk1d/bxHJqymDOogkiX+lU3JfP6pwMkN
20CHBzJn6IzQhuEh0/BewlTxg8YWf/wXRtBuaXZs5BzWZL/vdTBqSq72hsFOJ0G7
SOy/fYXI4syftONiTAsO5bAucNtpiik80WOo9JYifld1QEB3cqrUtMW6BOs/rHmY
nz90VEhBMX3uaOK5ojFa/I2DIlDAGKR1PpYhr2X/m4Upe6pH1QyQC+bov8H94CLC
tUY32/918zMG6onjPM6IQjpA8jx66d8qBXYgZM9L2mXde/hT3hN+tMvjgBgvBvmz
g5y8BP5w8KHS5V7lJOn8++lCaMvPbdVejHQuSO8hGGanwCBKFQeAB/13Y0FNSkFH
Wmy36KdDI23zml01HUMvlfqZBQpKqQtN9bopd42ca3it5k+mr62IbhAETEm+QTnL
Ghvl3TT9fHVgRvM5M5ItAviv3H/md0i5IhH0ap9PkNzoSz+6pAojq9qVhkBkBLam
mgT8JGkTBkFnhRLT7Ewkz74c+NmsDZXLMC7QgY/le1+pl7jbW+mxDzostC1eqasi
ril629JKFCUWfd3ihRIXtzbMXm56Iv2mWwQ8eTcIF4dqsgeSZyU1ESp5GrYG0CV9
pxHUwjeM3cOMaCuPgHj/VccChVNPxiMA9QUV9YKCcEOownggDt4=
=QaQf
-----END PGP SIGNATURE-----

--gl00fZOC6PlidV2h--
