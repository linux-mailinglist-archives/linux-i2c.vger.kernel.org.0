Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D964666DA8A
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 11:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236201AbjAQKEi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 05:04:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236186AbjAQKEh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 05:04:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7C02D14A;
        Tue, 17 Jan 2023 02:04:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 053F5611BF;
        Tue, 17 Jan 2023 10:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15560C433D2;
        Tue, 17 Jan 2023 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673949875;
        bh=4482lRU+YsDZulJ4Vmn4hx/VB+Ir2+P31zURWXD6DtQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dq4wDexCAFJ38Qurz7MS2ifRqWd8kd5Z+CpQppACptdLQzAlSFuCqDu4S96i9tkiB
         4QmKkQsRU5ZnBIoSe4KRu9DoAFP5Dn4PRVhREffmhq3arrKTOzHMK2woskobSFv2gb
         IyWrDBjKgQ24pVVzz2xifE6tqHuzpWOmmW0YC6dLMLo1/XS+taVgabmMyKHxcGC8d5
         4jg1+/ty2KH8jK89se/khjopbDOInoN8X3U281FVH36YOcrc0WB/ege+k+y5EBz7u+
         1FltXhiJ1I7ifkCEw8xKZ0yGS2+/W/yuJ8OMt+AxyEsBm6nMFTQdamE7N/fnjU+Jvs
         zyoztdPXX9UrA==
Date:   Tue, 17 Jan 2023 11:04:32 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/2] i2c: dev: fix notifier return values
Message-ID: <Y8ZysLbYYN4OurlP@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20221229160045.535778-1-brgl@bgdev.pl>
 <20221229160045.535778-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wKFCulpu1S9Oh88y"
Content-Disposition: inline
In-Reply-To: <20221229160045.535778-2-brgl@bgdev.pl>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wKFCulpu1S9Oh88y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 29, 2022 at 05:00:44PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> We have a set of return values that notifier callbacks can return. They
> should not return 0, error codes or anything other than those predefined
> values. Make the i2c character device's callback return NOTIFY_DONE or
> NOTIFY_OK depending on the situation.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Applied to for-next, thanks!

I start reviewing patch 2 now...


--wKFCulpu1S9Oh88y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPGcqwACgkQFA3kzBSg
KbbQyg//TMUMQUeWYkmj6LE6gQNI7I58OP0RhozuBKJL2kES7VawlkQNmPNjIHWQ
yFS0OVQgOPRfci41s1gQsJzT7aGDYqf+f2P0LPWDzonFhzt2D82GvnIG4XFg8Eqb
wxzaX4fX2MECBJPrWQKXSfYh3ocKkYWzYmUYf+wDQvOw9k7q49xCElpJVUhp/kI/
LwAVwxwjw4ZkoHtNf/uxs8Pv7mHS8mQeLeOXXy1IMB0kvkheWelPoQdyaTJoDEyF
XO3FRwY4l6NMeg9LPIvRXQ0bpc2t5H8WRvI57z6S9swTS/xdehdfTz6HFGhJMQSl
/Ll9wtfAUDblbqMZ8AdYiQY1uIYVjx9kSr2X40Vf6zyLWxBTueh42l9U6IuxyT0q
JeR3KUgdVw0jqvy97QvwUWyf7rgIKUt9PXtbGSvs4KBnZzr0fWad4njU82irmTvi
RII3hZKA2ysSzq/lPe9VL/+Vfjsg14zgrTpNvCwB9sADbiKokaYQCXQEUP5y3cnk
jX21IuA1YA70of9zbW3U5RUFXs9lKe7yzjWy7bEbLQjy/6ScvpT2/5O7aVayRFRJ
9BiGSGtuTl3qEjQpHiyRuUVLcMxfOVyVzSKBhgE82DX6K+SmldunN0cvizt0o7hJ
s5Mv6YTrtWFjrPL0Q992zFdii5roxAwJsB9a2usSPV1fKn7sSjg=
=nQIo
-----END PGP SIGNATURE-----

--wKFCulpu1S9Oh88y--
