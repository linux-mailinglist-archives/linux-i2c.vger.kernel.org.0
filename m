Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44C024BC846
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Feb 2022 12:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241374AbiBSLqd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Feb 2022 06:46:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbiBSLqc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Feb 2022 06:46:32 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15721DE896;
        Sat, 19 Feb 2022 03:46:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 24007CE336D;
        Sat, 19 Feb 2022 11:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A40C004E1;
        Sat, 19 Feb 2022 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645271170;
        bh=Oqu419qxOv8gZAIPRvo46hkJGLdHrFlglHZLftVSSuM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ByCdrQMX8AOc3qZx3saXAaZYEzq1UxERWeDgxPBC6LtSc8nOYDZW3QkxApAtoC+SZ
         XO5URtiMBcbLSAm0gm31q2Z5w64qhb4UDrwgnSKTYS714YGnj26O/SH0guny7p6t+g
         fHwjKHt0tYZ9Rg19DriZhlR2uMJ2PSgytCUtoPBHDSFOuTghV3HkiGCUuFMsnzKtBY
         ymeO8fwqYwYRdxIDyKQWG3phHUd3cpoZHJfg9ZNjruIVn2vRUdhIBFlfQsj0vxHEjG
         ZT45XkHHCK0linPSzQeoMWU0BlgBwjeEiLHR/Tw2jFyYUNmAz0q4id46jBvu7Orkw5
         NnDOjjReGA73Q==
Date:   Sat, 19 Feb 2022 12:46:04 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: remove duplicate entry for i2c-qcom-geni
Message-ID: <YhDYfLRIqSjI6nWz@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20220218104904.14405-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="I00yFJWdktcckeXg"
Content-Disposition: inline
In-Reply-To: <20220218104904.14405-1-wsa@kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--I00yFJWdktcckeXg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2022 at 11:49:04AM +0100, Wolfram Sang wrote:
> The driver is already covered in the ARM/QUALCOMM section. Also, Akash
> Asthana's email bounces meanwhile and Mukesh Savaliya has never
> responded to mails regarding this driver.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-current, thanks!


--I00yFJWdktcckeXg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIQ2HgACgkQFA3kzBSg
Kbbo8w/+JYFkbvmUcKVLrbm4+GH1S/vpAOKeSMgQ0Qzz9lwACjKmTgzJON+rZUZL
wgeUQPvmakK/DhXoi3c8Y+8aqj3miAt/7VyWufZH3QTHop82oQPn7csFEv+HGTrz
SvIMckV1cR5icGmAfR4akWZq0tnwIX4BXDNZY3Y+JI8xCUgoHZyWGiBzPwUvzFnG
F4i/Wt7ZddQNCn2yZIeJsfhMvWgxTvMJY//qhlav31DDDbr4j8cNh9x5oS3R+Brg
5BFvOGscwUjCQjrbrJ0eA5pSPiJOCgbQfm6j+32kAdWpS6KXihOn0Dp+x323/UQm
JuSioqYE50uhHBcl0YsEuVykDfQWEZbABjilMuLRnaATrgHU3WfnX3hRwtA3Gk6Y
Y89pIqNJtgIELpLFt5h3ld1z20oJ1Z7EVBcVankegqkKAsQ4QMd09ZfaGv/YffSw
QhaXJUh7WCtQmFgbUPQZt3nWIYZFdVa2KQHiZXL3jGV6nVXLPCLoKyPiqfGRtygH
dK2/EIC1x8H48Che8WeCrS0KCGGX/pQP/ypsTR1FZlIBs4P2FrBvPekgDD9exvHl
p6wUb8RRKdubimS4uJj+cRjbiW2++YYGZInYYHE4CSWcUSIxSjUgAgGUn3BJPYAg
YHxIxl69wu8w5cPvCtFShyjdJOx248obMNSB5Mv3oc2xZMa1Lqc=
=OI1H
-----END PGP SIGNATURE-----

--I00yFJWdktcckeXg--
