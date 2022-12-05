Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F071642610
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 10:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbiLEJs0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Dec 2022 04:48:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbiLEJsW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Dec 2022 04:48:22 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF8CF5A6;
        Mon,  5 Dec 2022 01:48:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E057E60FF6;
        Mon,  5 Dec 2022 09:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFE7C433D6;
        Mon,  5 Dec 2022 09:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670233701;
        bh=CjMtCNiSzqVcTrZPKeGy/5zPln3a+DGX1EoUYcoZQ6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=otaMfrIhR1CWMoPrV3mkfYyz1i156Iv08BuGNTh0voqvvWlJg8APV7B9IQseF41AC
         InisWpbiIQrCkcPv0fBeAbPnzyBc18TmSigVVTWtfYJv8Z4LSErhBZKb09mZOP+wi6
         3oM224Zhm8WsmRKLBhjuzJxrzdgaqIgQ4U8BQ8mbPgULaBqAMpxm2Y8qALclwvVs5O
         IWHs8iTwIqkmg3XnrhvCHX0cooTV6KQr11RjMBqokEdT198tkk504R6PeKFePfM1dj
         +QcSvy/KAjJ0rBY8zTd5kKzT0rt7Hp5fjzzaghtz9dL3Fv4cFIBhiafEN8+tmnVJ6o
         +X9yyuJWbNYhQ==
Date:   Mon, 5 Dec 2022 10:48:18 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 046/606] i2c: smbus: Convert to i2c's .probe_new()
Message-ID: <Y42+YrUJEnvWNx4m@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-47-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IoIlWn7kb8MnFBpT"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-47-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IoIlWn7kb8MnFBpT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 11:36:20PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Found an older patch doing the same, but still thanks!


--IoIlWn7kb8MnFBpT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmONvmIACgkQFA3kzBSg
KbbxXQ//ZleXRIKoAMRDsN5MyVpyQCHlKYwsSLEVDkOBp/NroAy+XZvG9RzPWDnE
11dWCoGNOp+RJzjIOkTKdaaid1HQd+PsO1/eY9IHJ/e2AA6Q9kL5tcWKuVFzYWBo
dHgh2PrWeLRXVO9bx0gOpwcExOi2rELiOAOgeOxvSud50xH9NXyx+yQshj0o11M5
byGpowQn7VrnkW+hKTSxYULmtt3Fxn+SQZI+AQkn3tBbRnCo9F3rLrhqOeEFtbAM
UlNewtnjxaoo85DG5Ezm7SjQYHCUNHFWQp288w/qmqynp6uAGkbTnA4351YsAtSR
z+2EbZ04QDQwigIAD0TmxxQbiHGgaJ7jN0hZXeXY51l9+bla6M1BfBNH22Rt9MJW
jASMjItW23vk0FOsnbQMUzZAsMMtSNvCXRAvQlE4Ud7yt3aT3m14CjuLcTbj7A4c
xJJ0EBnZ33ngoBa2ZMUpj0ubvPuKqHrD/KmeaC0nKboNYmpahbTJQSpk+ISehbl7
OMiOdj5xqhmlEP4bYC5WuRyDRSXDFyHunH7w/cUDZIycVBPtJESArgyrpv4JY2ml
Fsur+6oBCEwd8wV9YYZyXk7XpDFXhUA6Wrj21hvtvcdP36KvZi9C07vlKREQDNE9
LvsxH4vxUn0QZj77IYLkENTjaw1AkPsORGo6nKoFUq7udQPy7oo=
=yEYb
-----END PGP SIGNATURE-----

--IoIlWn7kb8MnFBpT--
