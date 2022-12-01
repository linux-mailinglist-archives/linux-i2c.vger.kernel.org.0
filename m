Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3226263FAF1
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Dec 2022 23:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231748AbiLAWum (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Dec 2022 17:50:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231730AbiLAWuT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Dec 2022 17:50:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BE7C86B3;
        Thu,  1 Dec 2022 14:49:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 55DB462084;
        Thu,  1 Dec 2022 22:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36561C433C1;
        Thu,  1 Dec 2022 22:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669934964;
        bh=M7nV2gz26gK5iSyAIFMnEJ0Gt4gZXURIaCRJJrGWVxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FHvhp1LgyAA/mE+nZNzb72kPSlTEZL+G4LRNhH/OPMaY8bsZbUuBUGsvPeQ8yX57M
         yf6raFFlzijL/8k0JET2nFa2etTzeyNBZtyIqZhjf6olJI+sINsOf7FcX/mqHIYAtW
         wUwi+/a3sesg5XEpxzPnSNPjbNds/Vz01O1ltVYZf7QABYoUnEl7RY+ylglA2xF6WN
         Z9MFJJS+ShXsqpA8fZWWV5KVwUZKBBoYvEbfa/mDP9A7+zrIUA4UbeaoixLh/V6WcJ
         NZmR/fJGN5t+pwLPJtyYHexFhEP7qmEznDlaXN+x0fggCTsttpIkgj6vgzPaCJFWyz
         YgPUOCLl+Hvig==
Date:   Thu, 1 Dec 2022 23:49:21 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] soc: qcom: add support for the I2C Master Hub
Message-ID: <Y4kvcXTdwImZpaU1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-0-f6a20dc9996e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YX5ttnhQhXaDF07q"
Content-Disposition: inline
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-0-f6a20dc9996e@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YX5ttnhQhXaDF07q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2022 at 03:47:00PM +0100, Neil Armstrong wrote:
> The I2C Master Hub is a stripped down version of the GENI Serial Engine
> QUP Wrapper Controller but only supporting I2C serial engines without
> DMA support.
>=20
> The I2C Master Hub only supports a variant of the I2C serial engine with:
> - a separate "core" clock
> - no DMA support
> - non discoverable fixed FIFO size
>=20
> Since DMA isn't supported, the wrapper doesn't need the Master AHB clock
> and the iommus property neither.
>=20
> This patchset adds the bindings changes to the QUPv3 wrapper and I2C seri=
al
> element bindings to reflect the different resources requirements.
>=20
> In order to reuse the QUPv3 wrapper and I2C serial element driver support,
> the I2C Master Hub requirements are expressed in new desc structs passed
> as device match data.

Is everyone fine if I take all this via the I2C tree?


--YX5ttnhQhXaDF07q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOJL3EACgkQFA3kzBSg
KbbJOg/9GeM6NURU8nhZCAy2JAcAIK8NTfDvJOQzYFEwPYiYhrH6On5gkziryCCL
2/3SO5jAQdN+veFD1oRDLpKN9FdMXtEjw6Sp4WMu6/l8smL/oHrlc1QANfi0c9OR
f2tuU4socvwBZStWWwlCih92Llqz/kz2jb8hYbwQdqJ4MiVJUA0nFWqTR7owGS/d
IQQlyFF4zGK8r53RVekM1ayyul0h3/IX/rP30rL369sIKcS2H111MjyTkOEiKgcF
Gr5qmP7StWauhE6ft9bx5u8ePasd90qfX/OiIof63X7cJADmRHHjwjF0Ceo+DLRT
7c9UAU7i8eivMVTKbjJT6EsG8R53yNPxbR6fX39G72OgbIUf1jo24XGWau95yFp5
nWHb6nk9wt5ECNZ8GWeZxMV/V9NPZV/J0G47rSTtXVtCgEcrywdVm1mEZQb5+0KO
VD2Vp5FQ4SodgWqJQWiIeIxSkY5R+4OXVA6NeTBZw+3koNFyl1hEU759weXIX4MC
UGUm4mpQgJSk2jbRhBCN6ucmSJzcZgzFnqWRp3fphhHEJwOu/A5m9yH7NMc+y4bo
Po3pFZRYYdHhA3ahGdtlsokfIgukR+fii4qn/45bFK1EJ2vzP5YfiOJK97S1TdmN
qrMmMIe1ee/EAxNs4V59guFwfh7pAFAPj9YkUotHHBvwgVuygac=
=QWHn
-----END PGP SIGNATURE-----

--YX5ttnhQhXaDF07q--
