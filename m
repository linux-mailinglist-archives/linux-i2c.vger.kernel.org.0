Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB89543D16
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 21:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiFHTsg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 15:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiFHTsf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 15:48:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6CF277F9E;
        Wed,  8 Jun 2022 12:48:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 189B8B829EE;
        Wed,  8 Jun 2022 19:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E99C34116;
        Wed,  8 Jun 2022 19:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654717709;
        bh=kk0qjQf12LFOoAa+cDngB/o4n64WFp1CDqiEgVUIKx8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N2e04NJKEIh8/oIbK76jWQbOECLN2sja+lUVkxNkdCtNrc3RMBsAmf/PEssyhLokx
         3F0500I1TqS64Q7NT7HesizeIHeWQJmXgrr1bVgxi3ZlEKvc+0yozpZqN0KtYkm7Mg
         f+1nGj0MaU4yy09A4kUwdFJDccyp9ppKvVtXw/kgSGlij9mqVyFNhTM6H4U+KmFWF8
         aMXmj8d0Lok4zXGFD7fh0g3+fWdkWL2IndXimpvcyFXSLvAQESvC8h30NixxtuG8N1
         6lqYtYTgrqXhIXovPXqo/we30rKUC/LpsTPCUDK9ul8HymnK9EKGiCgPyNFJ7ikI7I
         Jkk0I0pWuwHmw==
Date:   Wed, 8 Jun 2022 21:48:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Convert arm,i2c-versatile to DT schema
Message-ID: <YqD9CDkT7OUAFSv4@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220606184339.1058557-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="L78QOlwzIPXdJWWA"
Content-Disposition: inline
In-Reply-To: <20220606184339.1058557-1-robh@kernel.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--L78QOlwzIPXdJWWA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 01:43:39PM -0500, Rob Herring wrote:
> Convert the arm,i2c-versatile binding to DT schema format.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Fixed typo and applied to for-next, thanks!


--L78QOlwzIPXdJWWA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKg/QgACgkQFA3kzBSg
Kba5jg/9HHB3EMSEH6NqJQiya4zkB47d4CarSCyGy3JF78g4lCkTeAv/NbMzfrQx
tE5OOP/UYLPHKjoTRu77qlHw06XO6lDQVN92WWNqg30pKOhDymi9A7jRMfY9hPSJ
qms4CSkfyLOMYj+8G69gl3A0zrSDdu26N0I1U5DDCzgMGg+EioYG8uR0O8IJB7gs
o5d+iZshPawBHobpMreEaA14FJRSeAdr6aTJHfNBrNshLQpYHk11Ma5F6kjyQXlT
dAyGo2ilf+JQrsOJGibq8zWwfyfnZZPgbhq9Ov2lXBXJBgOjhkztV43uBqugBsbt
8w/EW1BtJWVO8CTxqgb4tiR48Aju5BKF7+/GNaSyScA1Yg83y/GQm1ORQlcEfhQL
BuDpcnp7XyrUp6mBwO22mTeb24pohOHsqnvz4obU4vONoGnUUZLwJ73H748Rv7fj
T8i+mjgd89uUXEnlRLFtpKjmG1PwiwjFvsHlDBGxfbzbTYPZaHW8ArKyU8Gj5+cj
igKwvODYmBMgjSOG2sc+rUgBeQD81Eds3bL1UF7OzRzjnWrujhNViKEkpH8atw5L
4XJ1mbpZLyTRfvnoAvTeJQkIui/k/WwUlJGOmLtLItX2VJ0CsXi7loGqsO6LRU6w
oYayjeVsKcJMRZ1LIG3Q+L/Yyc5xeR0oTFlwhawTckPY4dcRgus=
=9ftS
-----END PGP SIGNATURE-----

--L78QOlwzIPXdJWWA--
