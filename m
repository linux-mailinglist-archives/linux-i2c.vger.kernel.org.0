Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC0052FAB0
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 12:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbiEUK3A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 06:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiEUK26 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 06:28:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A1D1053C9;
        Sat, 21 May 2022 03:28:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A0EF961211;
        Sat, 21 May 2022 10:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA57C385A9;
        Sat, 21 May 2022 10:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653128936;
        bh=RSUo/hdb+FVQEL0K3q6Q4nfnWm+qkD2uvJI2Uca9Bmc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q/x0Npmn5VBdfdFRbsRtt93IVd4doEfqU4LqXBlkij4A+F8XXJejgO96kpyeQ6Som
         4nXO8YaPBXAMalAdGEoYUzFDDR+KbbSUTC+vDXDRJ17DgagO7NKSLshT8DdPU3YbkU
         xmV7E/HJH4PF3l+RN2eto2cBE8hHnZnX/061aRvD++t4UmI/LrrDYnEbjOc2t5viui
         0e10A7+CuoLUYD311APZSLsDVwk/nm/QZB7lmWDOMDSQJPQ7thDAf5yNUpzWzSIam0
         iUaCFuGOCblfudHGaNQDVJirh+356OniEbdbOPpJJPjz+8kevMb7xPR05ueviM45IH
         TfM1frIYT83Yg==
Date:   Sat, 21 May 2022 12:28:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: remove unnecessary conditions
Message-ID: <Yoi+5Fkn7+8whKcm@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20220307125603.GB16710@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="folh36nxpehRSWJR"
Content-Disposition: inline
In-Reply-To: <20220307125603.GB16710@kili>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--folh36nxpehRSWJR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 03:56:03PM +0300, Dan Carpenter wrote:
> We know that "ret" is a negative error code at this point so there is
> no need to check.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to for-next, thanks!


--folh36nxpehRSWJR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIvuQACgkQFA3kzBSg
KbZK/BAAiV6DDTVatgnvmW6bM4q0wIlQsq4rML0w0tmthyskSmhOFki/OFEH4hoW
s3Z8Rrsfm9O4vEVf3YrqyASdfSVFxKxCVKBy5mUHrozBfZa5pbymoBnRnuQTf98/
OVFXje9iDr9GysNSW4E6PWBnyjs4qvsAbQGLLmvDFcokEoJ4dFV4rFz2OMtailFT
XexidptGh04+8twSu4v/8IE10OF2liXrrbCOVVQTY/IOvwy979ILSHtFbn8FMVyY
T/jQ7mLmwOpHProQI8YeVJpd6tXp7X8VJ3HAafLXqfpd393mlHZj3K8Sebf/nqTz
jcA3OkOUrq3FsBw30ObZ7R+2AnHUWkbDtTj74drL9tF925a3zCKUo16lr2IwGUdL
j/6c5zUjIxhkYpPdSRxkZeaAbVKTQBTijP31EqtDcP1oBqPH9pacB7JbdpePznNB
ck3okQ4tHYZqFie+k5oDNdvHJbOp4JUeEM6DK3koEjrDIIJRXJOlBLlWoEPLNsYu
i5QoIR4MDvaVmVXkM/JHXul0/Bd2F/bGW5kc51A7o6CHln+2ucqUTvpG0fx26Kqe
+thWi3Iq+AIsOoOscASu0nJ2tfyt5AXF8Fqg6OGWTckJho8n4bckFJJjQJ7hnFeV
8K7HQqMQTYrNpmMyIgA8U/AR0gsa1AClg/5qqmvUt5sqDe5JWO8=
=QWMR
-----END PGP SIGNATURE-----

--folh36nxpehRSWJR--
