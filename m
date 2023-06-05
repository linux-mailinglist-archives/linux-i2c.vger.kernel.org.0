Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9667D72204E
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 09:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbjFEH6D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 03:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjFEH6C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 03:58:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF939E;
        Mon,  5 Jun 2023 00:58:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 58A77611D9;
        Mon,  5 Jun 2023 07:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D2CC433D2;
        Mon,  5 Jun 2023 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685951880;
        bh=zbCOojbpN/5xsH7NbHIY0TckYS2aMtS0mw5/YPigDoI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ReqWXoI65hxMS9lx7hIF2pJ2ypdxQUX51aNXweshbs+wRQfm7Rbhv6cgKiWCt1kW8
         547gEoaSzSCTiY6ZrUAKO4Tp/acOnfn74gzppCfUQkm3RwUcu8dxpqhoTxJI83Ocey
         vM4iZjlERcwicgyAFhfwn2G+99zfSn+fidNAxrnfdEyxi9d5mEGmjtJ28OTLn+6+kY
         42509HYZXGj6D1kLDjgT9kLFsvsG2tQz2jztEOFq+luTnM/hDMZ0ufmxZNG0MCp9SK
         rvAhqrMmLxKAY/Aplt1TJjV1agV1NZyvfprIN6ljZ+4fgHqjQ+y5SRK8txJ3meQxrF
         WLhrMwscAFo6w==
Date:   Mon, 5 Jun 2023 09:57:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: Add myself as I2C host drivers maintainer
Message-ID: <ZH2VhXA/1l96wq55@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230601190427.21388-1-andi.shyti@kernel.org>
 <20230602012100.1096488-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5jMVypSJ9Wn9opfi"
Content-Disposition: inline
In-Reply-To: <20230602012100.1096488-1-andi.shyti@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5jMVypSJ9Wn9opfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> in this v2 just changing the status from Odd Fixes to Maintained.
> I forgot to set it before.

Great, I noticed this as well in v1

Applied to for-current, thanks!

Thank you very much and have fun!


--5jMVypSJ9Wn9opfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9lYUACgkQFA3kzBSg
Kbbu9w//ezbU7S8/Jkbhu86fSgYZF1qYJNjt7hKmxOuvyDa8IcAOOmTibXnz3wmq
xHRZiawF2o1tKMJZ40u9i7QBLHe+29kSqyRVhwyYsGBM6Xbvxi0MT1RYBfjXvnkC
QrHDxR8Gxey5OJeyRcNZO6gKzwSUk1P+5i6AMCNo7StiI1V18xdBmLLgK8sQxVFy
uy8r7+2+HyP3F8aWV96u01ghQfUjzmzRBb4jS4Rcr5xgZJL6YDXukYP8rvA3Lttg
27uLnP+D4MPna/Ee/vz6cudYEYvFLr/sR/O0B5IVTvpVNwpu+KXSO84OZApKfcGp
LTya66nJVZM2wqDQ6MMPtUjvngnw6fgZsh016iEvtMNd0Ap3+Evz4vp2T6NrRdkc
uBs1+yRn42BYM/dmRxPoRZnNrw58EIi81bBVPIk2cEa9qCJOpvEp0OUa61L5Z50S
UIgtSHqhD+1u8NSyW8koR8wp8xV6INYvPsLBt4l3oZZmsLVgnZuvA3KnN5z62oRa
g8iBpvu/efjXg5vIB7XUYM27k82wQRKkg3479nQwV3eWTDEPRhze447O+wzdjuVZ
tnQZYVUSy+bHr+JIOiaa7bSXv4UzW3T3JjImiBPECDRaJXr8GuuBJeg3p5qGeFgA
2QQjX3Icj3uf4sswYpcRGm8o5v398y0sJiaCcPunCzWy6dIAyOk=
=V+pT
-----END PGP SIGNATURE-----

--5jMVypSJ9Wn9opfi--
