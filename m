Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81CEF54D2CA
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jun 2022 22:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243436AbiFOUlv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 16:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232547AbiFOUlv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 16:41:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C75C4EF4D
        for <linux-i2c@vger.kernel.org>; Wed, 15 Jun 2022 13:41:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0AFFCB82178
        for <linux-i2c@vger.kernel.org>; Wed, 15 Jun 2022 20:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DEDC3411A;
        Wed, 15 Jun 2022 20:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655325707;
        bh=tx4N5Wn9//7ee0dPQ2TZCN2LOeQX3EjmLubF5m9zBh0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BMW1kWHRofvW/nS0Rag8DqShjCU+LjAywj1C836QkGcA35bkTfyl5Amle5zqnAocy
         31eGUKYg4Nnk7Mixpx/n2Jv5eVn4+21M+lo4bjhpBtpDwqMb3EuHdP/l4iU8nwL9Vw
         NACEQWWxVUyOgmc8jLghs8PCp17x8vqgUuJPqerGWHNerL0RvzoDQyrusCOVQ6jgjv
         AD1PZNbNd9lDeLFfoSS4FxZTfjjxOk62+N7/PlIa6sAdwwpH+1Rh/FfmbiZkyeQ6uj
         nQLmmSzTbmCJt+SP49bnLIkaf5Xed1NeTdg9z9p7s0o2pAWfbdGbnLcFoiBSFHjcE8
         op6K3ppDtRb5w==
Date:   Wed, 15 Jun 2022 22:41:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     linux-i2c@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        daniel.lezcano@linaro.org
Subject: Re: [PATCH] i2c: hisi: use HZ_PER_KHZ macro in units.h
Message-ID: <YqpEB43xvIDTvpF8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>, linux-i2c@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, daniel.lezcano@linaro.org
References: <20220610075106.56268-1-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="N9QoMlzF90teKyh/"
Content-Disposition: inline
In-Reply-To: <20220610075106.56268-1-yangyicong@hisilicon.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--N9QoMlzF90teKyh/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2022 at 03:51:06PM +0800, Yicong Yang wrote:
> HZ macros has been centralized in units.h since [1]. Use it to avoid
> duplicated definition.
>=20
> [1] commit e2c77032fcbe ("units: add the HZ macros")
>=20
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Applied to for-next, thanks!


--N9QoMlzF90teKyh/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKqRAcACgkQFA3kzBSg
KbbfNg//f/nPuj9l3SbMMS+aVlhU/NrP8orU6s/Ntyc50FJeJ3rCSZQt6f7aVHj3
Bonhtsw1lyHEXjzhXfksEiQDU5T0jrKOtphcJ7+yRsv7Atm93FmNhnSPfF67dglZ
fidUepbpt5EYL5YKxJUy+4I5ahkGiQrrTrmK50VgHzWlb5vH/LiAjNTHLXU4r5dd
i5BD/cnRKQWX9onmmlIeo0dPlLhdTuT2LDQBSf1lqcosc9gIrBaHpowHoOE0ld95
FguXPpXfVZ6MeWx9el7RxJ9ivO7vy3Hr37l7nZQX2mNDhsfsaHfHx1/UQxroDYxg
vpefzyjW3KeIG9Yg1mg9/tzEWnHBdnrHL2tdi2ROBaHnHdMw5gG/JbAA8vKun87M
E+hcapbAhqmmAiytBS/bm0eck6rsj1chVZPeNWWTwn+8ujYvYmFH1UWOZsWhgr3N
D48xaGf4ZUftuYwOPdhZIbhOieqlJXk66Z605nvqUIpm0IpEEorvwnh4bD5IyGjF
1zhAfpIBPMobg1r9wwPrVLCjW7xlm6HguE/q+oqJOSbpAM0B9+2zxAiaK5gFfiGg
MwRHa0e+meK4L5wmvM9pfROY8sfB6jTIcovMRYXMhURNvPXAtW61UWWD9D5drx1l
8Bg4HY3FpyXWxDP9iFHhnnlW0/Yw+3MRthLFgWgn+O0TjufPFos=
=ZRA2
-----END PGP SIGNATURE-----

--N9QoMlzF90teKyh/--
