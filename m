Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F40073B470
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 12:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjFWKEp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 06:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbjFWKEU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 06:04:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BACF296C
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 03:04:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D17C9619E6
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 10:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1EECC433C8;
        Fri, 23 Jun 2023 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687514640;
        bh=Pzpm6Lx/7s8i5QEwDHW4gltNDWDKmWtSx286ifbhAuc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UkHwiQYO7MrhU3R2cJMLwiqywzVtPFsr5V5J27pm4AZM+OkCOkFp/GqzpQw+Uov68
         AF/0wB1WBAonHzlKOeOA8NnwD12c96AUshYXPZjCkTN9bkhMKVojluc0JtXiq9KXeX
         3P3ZqLfpdVb+vQI1t6dg58cInerRbIZwr3kMsGgzxqSOeo32rm/pfpHrmvQqUgV+RG
         vClsOM170tNHf9yfypYeARvdUwnwp63DY4bsxPCMkeXatWiuDGit2dVli0jI7fDTGC
         b7cYtJEAx4LekdDXs6C3d47pJRlFNdIG/eQ5HrxoTtP3XuFEGPEApympK+mRAvkdux
         J22VcDlbKNWlw==
Date:   Fri, 23 Jun 2023 12:03:56 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 04/15] i2c: busses: exynos5: Use devm_clk_get_enabled()
Message-ID: <ZJVuDEa/7IBwAusj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-5-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s9KxN9LuENASnmg7"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-5-andi.shyti@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--s9KxN9LuENASnmg7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -	clk_unprepare(i2c->clk);
> -	clk_unprepare(i2c->pclk);

Are you sure we can use devm_clk_get_enabled() here which calls
clk_disable_unprepare() on remove and not clk_unprepare()?


--s9KxN9LuENASnmg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVbgwACgkQFA3kzBSg
KbboXQ/+LvnwNnopx+PbBM+x/fUitizLJo60PTbfchpvUC/6ygUght83clY4W2XG
x8ZuCC/RH9WLcfj/lsyR4d2HTmJOvruCfFnbRASC9ktKxsm/KSdaB6cBuM2MdC5K
Qocoxnxrt6Ce0QuoSvK7bT5BBijc2G8YHw/JluCxpyrM+8o18kNZW/FobnFfZ/Fa
H1jf6oaaqBQnrF0j+kny4xXu4PBlgLukUZKXlTaANxlggUoW/uAsyCo+cQSH0bZx
mx1DvUlmf8GcGcbnG03TWvU8aIxZhfBAKYxOm3va7/Z53vdV2YBd/KcxpqfSIfS4
oGtEglmaRXjtUtKNIUnCg0QpbYk17pWlqVZrfxW4bmWlmEFgvy/ZOZSQCpWKRH6+
RDZeI8uN5twBdCt6JiwvLf4Qey1iMrjINvUr9foUbcNVuNmj26MNZW5biMRq6UTt
juDForPKh/5/gwBG8Ue3JeoI8mSdSnKGxlMYJDPJWCPA58kI3HZuImjNeEz8lqiV
duOWMlz7c+O1BgnH3xNITJlPIbvYDeLjzXr8xDjZFgfLDxrZFVpnTBn20EOJaFnu
vMD04NLw2ly0cvl8tDgzMUfV1ExJyMV/m7K6O7Ji9XccFRwbfBHhMtNydK+iyYMS
17FvVuP8f6Kc3DESscWptG5mV7vEwzfUzYyOd/MWmcx6nSce5F4=
=WwpA
-----END PGP SIGNATURE-----

--s9KxN9LuENASnmg7--
