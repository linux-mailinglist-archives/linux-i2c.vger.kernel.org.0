Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28291646250
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Dec 2022 21:22:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiLGUWb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Dec 2022 15:22:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbiLGUW3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Dec 2022 15:22:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A457BC0C;
        Wed,  7 Dec 2022 12:22:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 944C161C06;
        Wed,  7 Dec 2022 20:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC4AC433D6;
        Wed,  7 Dec 2022 20:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670444547;
        bh=7wXg3ixlzsDj71dQRA5g0RkeRfJAGbHsphI84xn5iZk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gShsLQ2rg+sxjtOXLx7GMpnOtS6Y+Sb+E/PCrvvIShd/5oAJYqyPSvsiKK6S8FwQx
         1RLEZGLiRbjL5vOig0GFxhCjnCeTKZdhdW+NAZJXVVxvOEiTrJcX0VQepUYQgC9A83
         ESgMRxJgaHoyFHDmh52ePNb4x2fdtn3RQzbZeqsMmLclGcOx9fFXAVCp/1Kl2khx8e
         tzF0Y5CIi13Z2KNU/bjpx7c9mCelCqjMQDrHW3VDEHYpKckU8jRkKDGeQ1S5GwKlDM
         /MSonAY4hLw3krwi+/x8tJBvbGgoPSPbRZpJEGLFtmfdyn/2oI3WK/t1koj8D1n9pZ
         +suPNsWvG1cTQ==
Date:   Wed, 7 Dec 2022 21:22:23 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hui Tang <tanghui20@huawei.com>
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: reg: Fix possible null-ptr-deref
Message-ID: <Y5D1/54Y5usunN7p@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hui Tang <tanghui20@huawei.com>, peda@axentia.se,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221114004322.257455-1-tanghui20@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dOZsUW65Wy1JpaG1"
Content-Disposition: inline
In-Reply-To: <20221114004322.257455-1-tanghui20@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dOZsUW65Wy1JpaG1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2022 at 08:43:22AM +0800, Hui Tang wrote:
> It will cause null-ptr-deref when resource_size(res) invoked,
> if platform_get_resource() returns NULL.
>=20
> Fixes: b3fdd32799d8 ("i2c: mux: Add register-based mux i2c-mux-reg")
> Signed-off-by: Hui Tang <tanghui20@huawei.com>

Correct, yet I applied this older patch instead:

http://patchwork.ozlabs.org/project/linux-i2c/patch/20221029093825.3425857-=
1-yangyingliang@huawei.com/


--dOZsUW65Wy1JpaG1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOQ9f8ACgkQFA3kzBSg
KbZXnw//cXuxwFW7aeMSCtVVR/ybvahkXABUSQOo9q2vqBE+RR+mozrk6i6BBvPP
AN+5jUDdeCLo6yEjtvoPGEchsCt4ilGR3f6d3RzgTAdScyXvooNOn6flTk1UbgTi
Ns86SZx/GzCWaj7XIsr5YFd3JVpxUjp8SAdEOcJjuFdbCXZ3gb0sZ/+KQeFVb/E7
3I49leMS2ldtjxMFwHtV3IKcCaVGv3epy8WrwOa/+LOw5ex1/4hKTM3PSJB++ZDv
oHWbN92D+24DvbrZazIIof3lpZnyobdrjQfIcx64nx9cBt/+jghogwH/Kzjz19s6
R0X3UD+ckQSWNBD9KMlr3X9OsFb74TXtZppr8zaCs0BfELaNgqASnKYN8I1VrFZK
9AVpGSxMSyeS+RrW3cmhJT4NRAWk+RoBHQydFvFjFEy7GLzNzhyQqtFIVI0tNKtW
91fxWIKaoaXNz3m8GoCLuZaIHLuaqH1n832ILZQRtHotYhnMbb8BbToflyO9ggr7
EV1+Cvb/me39bRBDTPiLjnu/2NSN2kUp9VXEDs7snYFuHdOxWlTFkX5GgJyMcc3L
3Wz1m2WXXn+2NCke0RofDbiV0oKPRHIGUB8FcxDhow6/Mn/eC8U4bQkN4ASxJYMP
U5M6lZBWJ8mEgZoFPUQGcYeXBUKCOlt0+PUpdAoG9hp/+0pm+ns=
=qIj5
-----END PGP SIGNATURE-----

--dOZsUW65Wy1JpaG1--
