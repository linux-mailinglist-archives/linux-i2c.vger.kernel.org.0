Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 598AE66DA96
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 11:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236148AbjAQKIZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 05:08:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236115AbjAQKIX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 05:08:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8193C1D;
        Tue, 17 Jan 2023 02:08:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BE755B81259;
        Tue, 17 Jan 2023 10:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3744C433F2;
        Tue, 17 Jan 2023 10:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673950100;
        bh=3XHpzvDkTY5IzE2OcUV0o1N1DG8hWz6VKkAVlYSBFWU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WLb0MYWI7Owt0XGpHTVzJzQKMtsYiLfB8YzfE8K1BBogMY7fLFVidDaTnfHfhhEcQ
         4CZpPWm3ow798avY/deU2XnyGP7rlI4lqrz0yEJmL5TfzEow0ck37L5FSpqI8t7iVQ
         MZLPekeLBSDWqIvro+mo0owXw1jDQCrktaZ8VAa2btQabt6uLYJaF6ktOsMceJiTWY
         YMzoItXoGTPtQHgDtb2EeJ3hqxPOp9KJlZfRSoxmjU98MWLIp/iY5tLuO+lepQx9Bc
         PQqhgfv539tgAYPFOJ7YQla8hTzvWCyp/b9/wsWMm/nUE0p7AyladMcYeIqyPeez6e
         aMDr7yydL22Fw==
Date:   Tue, 17 Jan 2023 11:08:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 2/2] i2c: dev: don't allow user-space to deadlock the
 kernel
Message-ID: <Y8ZzkfYZgJ54XzdH@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20221229160045.535778-1-brgl@bgdev.pl>
 <20221229160045.535778-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uTNO4o67AjpUZaRD"
Content-Disposition: inline
In-Reply-To: <20221229160045.535778-3-brgl@bgdev.pl>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uTNO4o67AjpUZaRD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> In order to fix that, we introduce a couple changes. They need to be
> part of a single commit in order to preserve bisectability. First, drop

Do you have maybe a branch at hand with more finegrained commits just
for reviewing?


--uTNO4o67AjpUZaRD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPGc5EACgkQFA3kzBSg
KbYtJg//ZGsQCoAjkNkABiDHFufekJ0l/CmfFaNy/2QIQXGW51jw1pY9Axj+j0cL
fDV142E6OuPIWzr6gfxsbPnItapdPdpPSFFTmzaRWquxdKYkYx8oA/CTjzotzG2o
FW2CJssjkWJnWN9Of74fSeHOC0NxYz/elJ/PBGXaVjtD1gfMELYSNY7xovQaY5Y9
IlpWaSFVOKxqdpO9aIuhyrHv5SjbRI/FWjgequ6Ywhm7Vy0axoJ4Vkh9hQI5WqX9
Q6MX2jWHnchKiW4n818ElN85agynL+0rx3dIZ5w0XCDDKz0UhAEvtubDGVNDa6l0
dU+kP6l3SkHYMKSyQmioSUFPxhbRbKe9WM/Tpben3K0zkvr+T0mWiLPCr8Hkb6bT
uSmlFYG16N0JORkgmDUWFHZ/9/ph+kNLeIpVgx5J27CfBF5KHbydNxx8qXGkiC3j
B5+2wrDDggoF5YN2eBtL6KtpZ88CdAYJWrOZCEG6BWjZ8ZETvHSY4xmiC80QHNyB
Pj+g6swDjtjg8625bLD/iz5Z8FaHCyfZSharteFMeDWTyJa68SaX/osiREQayopN
BVfnzmvSH+9gH4WymRpMPhMFL/u2KTOCnpLiuhPn82v7kGtywXlnSiedqISC5kFd
mzjxwRF1rfyU2kKe8R8LH1rYoOtXFb1YiZl6pSQYlKllaZjeiwI=
=p+vT
-----END PGP SIGNATURE-----

--uTNO4o67AjpUZaRD--
