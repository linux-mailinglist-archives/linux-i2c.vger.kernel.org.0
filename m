Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25A477D1EFB
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Oct 2023 20:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbjJUSpB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Oct 2023 14:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbjJUSpA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 Oct 2023 14:45:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4702F1A8;
        Sat, 21 Oct 2023 11:44:59 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4D3C433C8;
        Sat, 21 Oct 2023 18:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697913898;
        bh=U7YZ7LHKux4WrkPmJ5+OeCogRcj6c+fb/+ZlwkDYgFA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iZ9tHtFyKus3+qKD5jnQLzV6FJbDG2Vf4hG0fKTjhpQD31kpWOG/zaH30zwnEE8Tg
         42dfu1xPd1pi636IL4JJNNChMAiARawEuZAKb5sTGcDSQLvVgQT/5BuKgdjg2z9SBr
         vywRbhqmBgNqabLxPvuka0bfSQ7G82os5hFvXR8fKaHcF5C1HFk7U7S40rSVxJdJ1v
         obpjPoXZSOyhshBx7GHliOdN88lXswdI23ilKYvjf0Aynl404tPTnt2+cwjgwqAdAn
         E9racParcarBcoctuuSDE1mL/Y2EOcYuzoQ1C1khKsx8tcyLLMVDNjqjg0lnooxsb8
         ZRa2xqwuGCBvg==
Date:   Sat, 21 Oct 2023 20:44:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v3] i2c: exynos5: add support for atomic transfers
Message-ID: <ZTQcJ0gixlvWgWiN@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <CGME20231006150811eucas1p1a9e2b98d191bb8093daf38daba14e9a0@eucas1p1.samsung.com>
 <20231006150804.4113844-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZSe3s/CW1plPwvyh"
Content-Disposition: inline
In-Reply-To: <20231006150804.4113844-1-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZSe3s/CW1plPwvyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2023 at 05:08:03PM +0200, Marek Szyprowski wrote:
> Add support for atomic transfers using polling mode with interrupts
> intentionally disabled. This removes the warning introduced by commit
> 63b96983a5dd ("i2c: core: introduce callbacks for atomic transfers")
> during system reboot and power-off.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied to for-next, thanks!


--ZSe3s/CW1plPwvyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU0HCcACgkQFA3kzBSg
KbbZhw/+I+IddjVMqvVb2IJUPgXP00i7HwYYQgOjreVJ0uDIjmp3ig7UW8+1WR7b
817CcjD9veOBTQdNGIMnpJAe8ykAdsnzjNVXazWgMXLLMhLGTQCGPpLDMn0CvoVY
JdbfjnmX1M2WSUHEVaWaper5jrXY24/bXdlIpD+08ioRpB5ErQcgo+5S5bIjavcn
GTRb+HSa3UtAQ1w+9DvDphEH/7Eeobrni1O9/FPbZEDJMdJLVGqAMgRhKkmfmwsS
5r1Crpa6QbuvSwWr4weg37/RU1tx0lPHHmDBTDqTEFjrorYarmYvYfI2tswaJvv5
r8kD4f/r9mUNTt9kYurjOZACgaPGhxmuVJx2KB4i0mJujlgPQakAiUbJeXTO21PH
8/EgEiiaik5wRh8APAb0W0MG+BCFUkBT9aGZQHjpOie42F+MT07hlDnOBcPSGwEc
bxn8f+VyT+134CR69YEiHcXN12FF5PWGHS53gYva7MhAPUiYXjL0CnVOlW+vz7lK
E50jxwDEFvrwfIqHCcb1M7rKSrQ6xBd9rOUxFAx7IO8Z2/bBM4UVfyCwPNTq2Oge
5VBtD6oasHxOdGhJw+xj95RcohUQ9bKCiTl8/HIhlTM+rY10ZN3IyzfH6F8rIwxT
MvFVCOBIIZ3F24s0WHv6UOKkOvV4hZ1KcaK2uJdJB8FI3FTLBTA=
=BhhW
-----END PGP SIGNATURE-----

--ZSe3s/CW1plPwvyh--
