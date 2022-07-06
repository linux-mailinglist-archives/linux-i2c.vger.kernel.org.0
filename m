Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D021568A41
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 15:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbiGFN5g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 09:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232623AbiGFN5X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 09:57:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EFE917A97
        for <linux-i2c@vger.kernel.org>; Wed,  6 Jul 2022 06:57:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B6B4361E0E
        for <linux-i2c@vger.kernel.org>; Wed,  6 Jul 2022 13:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F983C3411C;
        Wed,  6 Jul 2022 13:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657115842;
        bh=MRHVMy1SYo1u+h7rXPbpn7Jqw+ZG3cMfzMr19jvspGg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lzpUSHrh4X9mDcvFl3RDvUbGZKKAesEocag9IbVe2IbGk+geOoSZqv/PDkw1KVSU7
         /1SyhSdz696mNDtPDbVLTQyRMrIvxW81ZvuawhJjwS94K3HYYyh96uEMkBEi/XQQDk
         +oxsLxHvzeEf6hhirm4wSlqvqkkfQJf/EqEXYIsfrTrfGJPDEThjBfUyAnG+i5UbLd
         M5iake594SX6I0xaOE3oeG9tagc9/9W5nbV6KR5kciUWdNaFCAwPcux6hz7i15uhEh
         P5eEZ/I2dSvW0mm7Egx1dHsEA4ZAe2Yue4lRsXph//fCIl5C5oDcHTOSvbAi2tKVx8
         4nCPwQYPvSzdQ==
Date:   Wed, 6 Jul 2022 15:57:15 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: Drop unused voltage supply from example
Message-ID: <YsWUu/0mcSXUMfoJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <20220701224136.808991-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BZRzmYHgftkJcsNW"
Content-Disposition: inline
In-Reply-To: <20220701224136.808991-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BZRzmYHgftkJcsNW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 02, 2022 at 12:41:36AM +0200, Linus Walleij wrote:
> This drops the pointless v-i2c-supply from the Nomadik I2C
> example. This is a leftover from before the use of power
> domains when the power domain voltage was attached to a
> regulator.
>=20
> The unused property in the device trees will be removed
> in a separate patch.
>=20
> Reported-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Added "nomaid" to $subject and applied to for-next, thanks!


--BZRzmYHgftkJcsNW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLFlLcACgkQFA3kzBSg
KbayBRAArcuQmORkrXwW78pthMMzhfNX4jhgV1W26aix334JyjoA8WExSdn74tk+
eqc9o/ary4CeQqzAXh+euyOYNnacftR6klpV7ajYlgLLbknDF4O3yrQ/P5LdlbyA
JgCLc+e1JmpFACDtw1Jh8ut+lL0V1tavSdOZ0P+k81G6G9Hx6BkNb1nclSn0oaIZ
biSI0weC0FK3xCHuDTyrOAFk+alZESYnyVIGrn1xbwu3NRa2o7u+jWzXd+kURy7L
uCotWPy1buFy65fTC1BZi3FRrYxXJ1vv1gL4Gp6xn8xC7oSPmk17jbgrj+3su571
KCIjerDrHhmauURHHXJsnerOb8zAkJtJ1B5oDN21LEIQC2YPx2Sca1bktbfpJIlm
p7x0Aj8w/h5pmB4N4uiOkP3lXB3YCxndePQTwXjAT6bW8D51Ta5di4u5F+awssAE
i0LD9/Om9I/sYZQ3VGkSqkSvEC+6I0JwKCi6wxjufKudOWCVT2nB4jroKNzv61WF
Y+WgVnkmeQCUtOB+89b2rga8tarWSLLrEv4dJ9KKnVL8YdK06oYxf04ZcxMn3nEX
bvY9U5RxQY/vbUNnsq5+jjR4BZLIsIrYbiXJH6wLeHBe8rMV9fK+zGJ2LN+qltXM
FjXWIOaMBcEcDRukBOtIJa7/S5ytq8llhDJFN0K171lfUwxAe0o=
=G2+X
-----END PGP SIGNATURE-----

--BZRzmYHgftkJcsNW--
