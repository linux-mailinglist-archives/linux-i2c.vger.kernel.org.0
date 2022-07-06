Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC8F35692A9
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 21:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbiGFTeN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 15:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbiGFTeN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 15:34:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93764275D2;
        Wed,  6 Jul 2022 12:34:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4E055B81E82;
        Wed,  6 Jul 2022 19:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DF4C3411C;
        Wed,  6 Jul 2022 19:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657136050;
        bh=Lc9Jtxr6bDh1AkEa/bqDJMUiPw2aZdu0IbhKtcXXdI8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eaQDJmx6+VBKcGT5zmT9gIJqcW2st61A9wKBlljjA5HHKiVGhY/gZrrBz0HuYD4iQ
         tdNXQMBHCWviExLbW2FNt0/FzHC9uyc/lF6baCDfK5YW+khJtxMW0IDGwVgHt4OB9i
         7coiLW6xxxubluDE4WAa7LxJpwbW+bhuRJXF0fzdsFoBrgO2KGZSv0kwxFLsvnJbDK
         W3sWLNmLueR9y1SFYj5qN+KrSpoxRjn8Y1bTCqRQXWAaxpwQJqjYlLhtHkgh5JYeIO
         q3cXqp/YieNQH/YpDuuA2Q46ASuEGidnE5WNOC2amHQnKcPgobXhvaV6QjbamCwayV
         Ssh0oPzQif2+A==
Date:   Wed, 6 Jul 2022 21:34:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-i2c@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 1/1] dt-bindings: i2c: i2c-rk3x: add rk3588 compatible
Message-ID: <YsXjrUVbGIObUroU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
References: <20220623163136.246404-1-sebastian.reichel@collabora.com>
 <2664d6a7-ee4b-9cfa-800e-e97522e3986c@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yrcvWxnffJQLM1lM"
Content-Disposition: inline
In-Reply-To: <2664d6a7-ee4b-9cfa-800e-e97522e3986c@linaro.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yrcvWxnffJQLM1lM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 26, 2022 at 10:22:09PM +0200, Krzysztof Kozlowski wrote:
> On 23/06/2022 18:31, Sebastian Reichel wrote:
> > Just like RK356x, RK3588 is compatible to the existing rk3399 binding.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
> >  1 file changed, 1 insertion(+)
>=20
> That's still some old tree you are based on...

What do you mean by that?


--yrcvWxnffJQLM1lM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLF460ACgkQFA3kzBSg
KbacmQ/9F97K+u7lxzj+N15bKY8tT6XwlYdmyDUyAt7ZvamCPpmpGwf+r/mGi4DK
OIptUkAkheShb2e8NH475CQM+og3EQXu8DWD2aq5bkVslmndWGmXXKfsFraA20Lv
gKwQr/uWPWmv+1de/iOkTAnr83UmbSEFfBUjZhsKTBaH2ikp5cMC3ugGeA0WaULH
49VveqT395CU+pgHsSEsdx1830GN3UaVpaEviHiEp1ofZJBZB8mz5XZeM1KNuee0
d+JZY3sajEHA+XFWnDH9x88UuqG3PH9Qche8FxuyENgQUBjV+aPaJyCy4oFxkIEX
NLwrRUjMaAG9g21x+bnDcvpgt5tIzpk/EYdN6C84lrj0H8Oe4GCqKxxB7qQAqDvw
Z6lmioUC3Q28/MnbIQqkgLov53ECYp1wlDgLHoZrLKbcbBzfgDBeSSb8YNqtFHGo
3rE5e0O8j4QITfo6CvLzSDy5dwfk+T1/duo2LGkonWFWNCXf2s4QUkmQVyKrtbPE
d6tjj0rIR4/8B779a5MG8KtNWabAIYHCDAo2d2w12r5yQM0qmrKbKaXCxK5qka+Z
WdwYJQbvXh0j9fN7/g1lViiWHL6JI6vyq6iGUByR/duUbrPME1tG9LyZ+0bq/vjU
npSKQrGotMl2GVVpET1/3W9TcJG8cOYqcHJAMHKlFw+jDjikklU=
=gEdT
-----END PGP SIGNATURE-----

--yrcvWxnffJQLM1lM--
