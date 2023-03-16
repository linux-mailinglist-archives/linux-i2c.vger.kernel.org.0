Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7B56BD927
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 20:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjCPT3W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 15:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjCPT3V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 15:29:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DF523651
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 12:29:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E7B85620F1
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 19:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97ABC4339C;
        Thu, 16 Mar 2023 19:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678994959;
        bh=L4Sd+kW6Vus3jDkQDmX6CPzMY8Dmig1fF525k3haOI8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QChlNoeNRP41qjaCp3HYOcZFWN24kEBCuC24WKnnmOjpC+ChZcPY+s+I/h6B7dRMH
         JZiwId0IECEroA6scLhYtrjTz98Avc/lnFXjYBggi05HroxcUQ7YWxBmyfxUwjRg53
         POFqeSvzv4E1D+oLkpqv/fBZbrsOrDPF2hsr/5WYCRgE9SM6dwCP05F5Yd0Feth2J4
         lqkYpLize0qtG2SWb7wYcCNvZyEcpvsKahJV25X78p5wsOsJX85ceiCkrdy67wH4sU
         863UXLnXW6rWn1+G1+oxUYUI3pNoeGkJ2Rm46iaAzgp6N+r9nRL+7jwnHjBrks0ndM
         LwwghWelsSlwA==
Date:   Thu, 16 Mar 2023 20:29:16 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 4/5] i2c: cadence: Remove always false ternary operator
Message-ID: <ZBNuDLfdT59zErjc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
References: <20230107211814.1179438-1-lars@metafoo.de>
 <20230107211814.1179438-5-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/Frffaem+D1inT4L"
Content-Disposition: inline
In-Reply-To: <20230107211814.1179438-5-lars@metafoo.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/Frffaem+D1inT4L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 07, 2023 at 01:18:13PM -0800, Lars-Peter Clausen wrote:
> When selecting the clock dividers the Cadence I2C driver skips settings
> where the resulting I2C bus frequency is larger than the requested
> frequency.
>=20
> If the resulting frequency is lower it will compute the error to actual
> frequency. When calculating the difference it also handles the case where
> the resulting frequency is larger.
>=20
> Since the resulting frequency is always smaller or equal the computation =
of
> the error can be simplified by only considering this case.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied to for-next, thanks!


--/Frffaem+D1inT4L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTbgsACgkQFA3kzBSg
Kbb3FRAAriWMV2+KVOeO39UFhLLq2xQS1mbpZ3+sKhi3KRV8ZE+PjVtwK3+yz0uQ
CZOE9crzZSsnqirBgy/EiDt8djULYn9tbPuXIgRUKknuLB7Fsrq4cjbuYOUV6ovt
hT6dhyN+wduf08HfKctK0n01Vq2090cObUtFgqXPApckvfng5YEEDQiNnPCQqVHb
jQr6fINMutEuYtxwc8L5GBSl+2q/gBGyzgZkonLhT/Xsah3UHv8d8/XgU/lGrYzU
gXuVa/qm5MrvLuxN4IWZMK8g/Dvk9JkiiikAufkCNw9kKWpZxJJ5/lpROAe67Mkc
acuEc0TEWGcQkPCzzsR1gBwRgd2wMKS0aRa+a86UrXBclQnWT5mUR2YBgu1Ch1oU
lFEkBRwgrg6U9T6AQXwmI5D4aUUkyhX2ut2Ff7epYgl+VlWwieHlJzZjaM8aqh0q
tKKhEMA3eq6PwrY1ryKJK4zhorEo9ABg3sEAQqgSCjRAYYGcBCaM8Dg2VOa3t+/6
HFb0N57zlOcD2uOZnIO6SUBMHjyKSvhBimThcmLFUBoAGA09xfZwDL6HyNLXnQJB
u55ZRj9Wk1LaG3dRtKkZkNEAPhF37id+bvmOxBGOQrM4y/Zam870X+fWelL14No1
taFFg3wInaMbfyt8JyUS0mx8nD1LBBM6k3paClhH5MZUv+2eMzg=
=+RUK
-----END PGP SIGNATURE-----

--/Frffaem+D1inT4L--
