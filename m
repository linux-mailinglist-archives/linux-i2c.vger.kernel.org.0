Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA8073B441
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 11:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbjFWJ7B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 05:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231806AbjFWJ66 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 05:58:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5091997
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 02:58:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D309B619D0
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 09:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F220C433C0;
        Fri, 23 Jun 2023 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687514334;
        bh=tlDt2He2SU+pxK77PijZo/3nxNpJcEGoQ+rm0V18ca8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LPtOBl7itNwyKJFh/R6ctZSjRK4w0FUMCFUJbqpYSl9vrK9kaKNRKPthXX0EuTpPE
         b2/jOJUoinXtrn7wRwiG68DTrNcFP1y8RnNTxRJOT7pqG+7Yrnq8IF/j2trbQlEtRF
         FTMMgwIDIYi4ORVzQp1x9YjzQ2/AhWGo7293Zs7Kfe54a0SaNkB21MSN/ioEgGYu1q
         BLh8MyrM7OPhDiN13w2CPZbN05jErKw4XCAXQQlbj6f7kLqWeQz5GXqU7A1HaOkfIp
         5cg9Cj4wnDVN+QH7hpNYV0WNCeWJ98TlULOL6rqtq1o2MtdEO3kMSopJ5dIu49Nzg9
         O9PHsWV9DqYkQ==
Date:   Fri, 23 Jun 2023 11:58:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 13/15] i2c: busses: sun6i-p2wi: Use devm_clk_get_enabled()
Message-ID: <ZJVs2uErYW4bMN0q@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-14-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l3plSLB+7PDZiFh2"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-14-andi.shyti@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--l3plSLB+7PDZiFh2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:57:00AM +0200, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>

Applied to for-next, thanks!


--l3plSLB+7PDZiFh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVbNoACgkQFA3kzBSg
KbYqfQ/9Ghv+UlIyElpLnW2LtnYh/8zMCBGcwKaT25yFOWAy1rFa7QbL7xqh8yWS
7cDGRI+xWS0fXARt/RtbVGm/pQ3NYVVaxNgAQdX6+m3zU6GR3Yh9ktV7ZdwwW+DY
zHt/ZvRzntmkcBV4kBDqoXcR7pPD7Jj3vvLJSQJje6GUcQzXnf9PAAr0VINfewXs
uTB3htParYKCPj5Q27u8AgVCzZo2L7iYD8dCLXzSgus354kq5kqPSIYFxsrt9eec
iobi++9Tiz64NLGA99wIIA5++2wGGCs+Pe7oGBX3pbdiFolS60NqI4f0/6Si2mHb
/C2oXOn2kFEnyE+NS3uSPNtaCdBVpFvvgXcnuXYpU5qPEvqmsyEHZsx6yP0ghhRj
SrwsyyVbZFwhYB98ieq240cbKIZTLsF9CPGfjieqP4TBEIjIq30wIEl+CNaea5Mo
Y5EIFCsDz8XuGS+Rwcpz5oOByCNAiXgGpSuoVIgQeUXaw/CMgr+lmaEH99rxV/wR
CqzFhNf7lmNvOj3V1+HY1vxs1YwhfX9o7pj1y9EsN9v9JC1WSIKEArt+S8KNPJtm
ZHH5RRBwta/qkcCgt3Y+sbVcOv6r7TdzbCx4SCUAVu0B84O0Mr+IUbD/khAnbcJH
hdZeQtOukG5hevVmgpmuMLPIIZABJ55Sx8dyPSg7mKwvnaNS8ic=
=QWWP
-----END PGP SIGNATURE-----

--l3plSLB+7PDZiFh2--
