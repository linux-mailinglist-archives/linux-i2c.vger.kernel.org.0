Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC3E4BC18E
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 22:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239622AbiBRVMJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 16:12:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbiBRVMI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 16:12:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10563FD83;
        Fri, 18 Feb 2022 13:11:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 91B4061D52;
        Fri, 18 Feb 2022 21:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1815FC340E9;
        Fri, 18 Feb 2022 21:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645218709;
        bh=Bu4O0hoD4gCdzZCtQ5D13/mnbp6m/o471u7XqAd976M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WHKQBa8yKoM/IqMv3DqlSx0ai1ElZgjEmQXh1L3r2BQKNyRN8Yf0A3Ojd4ZumCV32
         zFlYvNQl/8BoaYoY2wUpaZ97tftXlpu9G6i2LKWzFxyXQVoN5FeL6crErIa8mhRbcj
         fqPMCZChnJt/AngLiMcBIQOiy5e5+NqzUKd4rm9P+5s5Q9Lbg0X+G62kyHPYdrtR/l
         XA7DzskGXnV7F6E01K+3/E2n2tiH0AXIa55kPw40fBroTmDo1JYk5RGBICIITOvo6l
         Eu9VzoYdXIQ8F6++VIwYYIvYEADt/ORViOVGIWza22xfa8F8whImbxeGDATv9tYskd
         jP/zGzL9KJYRw==
Date:   Fri, 18 Feb 2022 22:11:39 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: remove duplicate entry for i2c-qcom-geni
Message-ID: <YhALi4X78OzJbjs9@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>
References: <20220218104904.14405-1-wsa@kernel.org>
 <Yg/c+27yR1P0b+eL@ripper>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m8g2eFA0cUN3Z0Em"
Content-Disposition: inline
In-Reply-To: <Yg/c+27yR1P0b+eL@ripper>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--m8g2eFA0cUN3Z0Em
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> It would have been nice to go the other direction (reducing
> ARM/QUALCOMM), but your assessment looks accurate, so:

I totally agree. Sadly, I don't know who could take over the driver.


--m8g2eFA0cUN3Z0Em
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIQC4QACgkQFA3kzBSg
KbZNBw/+Jd7JLYc1NcMsm+XgNHX6+ScCv0742ERHDPRKThGVrtqHsL+dWltEyd3g
GxiO5Px4k2EMtJZfroY/CMUluxLa/9eHWQlCzod0To+qoIXxHibvs8MBAS1k+JUO
GXcnZQCjPWrXsrXwkth9s0Jr+02cdAF/Rvw6/MmXioV1+S5wnO8mLvsXLPJubnV8
OXxEb7q2gAbu7WO2NpBwsS5p/Tok+rd7CTsenZxcbZFeIaRlgcvAQru5UpZ/snSA
0AAkFgY4P3oaQ6K3okvFpxJRu4o2JPRmkufWzYAO+OwrpalJqbbca9NxDY212o5q
XiQM4PHZ8DVd/HwW79AVTE+TWfSd0AEMJug2Zbj7jvYlTWjE3vT0L12AFEc72Mkj
gqr9Ajum0+6DY8STHOiQCFCtr/oUI572z+O7fVe9PsCuguvmiZyw4vK0eZ221ZCW
q0Rfr4hemGl7qALFEFp6vm6dWZwwEUmPPpiJry4hYltfAbQ/RsGG28ld+tmse5ny
adg1rLglGnTXG+Ej4Yr5kY2uUHYrfV76kjJmQvZmfl/XxQDIWYcPi7ORx87fEH5u
5Ycz2NSDq5PVEs4/hvdvzpCTRzffoiGC69H+v/XyT4yMXpgXM2tLvAm87rl//erf
9U3B03+3R9FmbsTOmllxpnML5+jgShCY2kDkzQqLXKmfhTbdHhM=
=fBvI
-----END PGP SIGNATURE-----

--m8g2eFA0cUN3Z0Em--
