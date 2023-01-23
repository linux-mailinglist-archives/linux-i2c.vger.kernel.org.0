Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE7EF678AA9
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jan 2023 23:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbjAWWUb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Jan 2023 17:20:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbjAWWUa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Jan 2023 17:20:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C26EEFA8;
        Mon, 23 Jan 2023 14:20:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C9D34610A5;
        Mon, 23 Jan 2023 22:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF9CC433EF;
        Mon, 23 Jan 2023 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674512428;
        bh=vE9vDG1lgmM0W+FImycOAxYy202gVBcM4X1KoK+6dtE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JgSL4h+R0ju6Nsb3bNzUcg9aFQiQ/dyCymo8/3nNJnTKxp6U3DHiCnPkZmMkvCFzJ
         IeNZu39HDOHu6qZ5oriYwrbBwJjOjINuVHtAuLgltIeys4BfTkDP1Oy1PesTAnNQDx
         sFAJAvWs4uihRNoRQQ1AO2rASwVK1a9vkb6SXnALIMa2aKdP8mwEOhOkaTO2XoMXzQ
         i1hAQBWDBoQILm4XqWvB63/6eA4/sclFtPl9Ojj7HZusRnzodMDubAsENt5WaGbSHd
         Xe4i33AnOl5TIk7anPrpG1iACratOFTQQZ70Zshug1MrUxLpZkuxNp8AsDB2raREIc
         EeNDUknRLPYjg==
Date:   Mon, 23 Jan 2023 23:20:24 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] i2c: algo: bit: allow getsda to be NULL
Message-ID: <Y88IKGn+bngfPuWl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <6f4b54d9-ab6d-a4d4-5142-27c89e03c6d2@gmail.com>
 <83ab7926-2db3-ef60-8356-53bc517a22a8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VJv/kkNYJrWBqEU3"
Content-Disposition: inline
In-Reply-To: <83ab7926-2db3-ef60-8356-53bc517a22a8@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VJv/kkNYJrWBqEU3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2023 at 10:54:03PM +0100, Heiner Kallweit wrote:
> This is in preparation of supporting write-only SDA in i2c-gpio.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--VJv/kkNYJrWBqEU3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPPCCgACgkQFA3kzBSg
KbaQzQ/+LpEOIDSpjFZOHcxunzDd86YaO0INBHoUbZnkZWu+wa0x1P7/UkJvWJRE
NPQthtKj6m8zNjHCbL4qC/7GRPBhDx2vD9EzPN/u3EdsLEH15OdSLtC7ruoAPWT5
FMMQg9i355SJZYIBpkR1qFf//xm40lV45NHsQCD7bKJwdvRNTUv+kJuvHnlPUKHP
hknpsv1NCA//z5pDb1K7NsG+7NkO5rnesz4LibBVzwiYrxYUsaUeCH9qdcSAXPIt
DtZ4EFF2OZOyeMn40OknHodZLFWscVdoNt7mKDjG/G6SA+dpqDTE/RR84hBrGbAO
x9c1ensV7LODeuMwcXzju/BqGWL+GlHA6e2wViOvHEoeu4583mZ8ilXObKywroif
2RZhGF+UnXa9COy9mcTWoE0KYXo9MQbIPNNOVSsHfXiCACIxsYkIpg+hAcaBAav+
7muQ0TSd0xgiXEI9mArWMDkmhNGsw6MfXK/My9camTmhlPlK8bU1OTFJT7TNeE7x
UNKbZnEmW5xz1sBA+VJbJbMWscmByJgnHDAc5zHZ9g4oWyiH6dVD4qHnyBFszar8
G/2v0uA0ETRtzjELIGfiZk3TYr8pLMPoeEpd7mUScihEgBqNRrqDDlIOOecUyajb
kLkouafVBY+C+94zS4Hebml6jjdFJLD4uLntn1lqElaHaubYpfU=
=9qjN
-----END PGP SIGNATURE-----

--VJv/kkNYJrWBqEU3--
