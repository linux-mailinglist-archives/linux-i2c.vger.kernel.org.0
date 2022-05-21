Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56D8652F94B
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 08:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353985AbiEUGhs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 02:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239029AbiEUGhs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 02:37:48 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D82814AB
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 23:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=bMykPHv2PPnGKGVW2ZM+j+OfQTvS
        jDylrLO+e9ack5E=; b=TcS7IUEl7Xfg+I+9wWNFQwy0+TaSeEsisfqDkhYk0XUM
        ghccHSXSvFOxS4w59/tKe8NRTZjjswTjC48dIk7+aWqTNRLgGRQjtFLhk0Ii8OzE
        Orw/9JPtR7CY2QSDx5R+w6FKRdDFy/6LVfCbpiVj38a14NIAKeNRODDPuBP0lco=
Received: (qmail 4065707 invoked from network); 21 May 2022 08:37:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 May 2022 08:37:45 +0200
X-UD-Smtp-Session: l3s3148p1@lzI12H/furAgAwDtxwyXAGMY7IbT6g6m
Date:   Sat, 21 May 2022 08:37:44 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/2] i2c: rcar: avoid race condition with SMIs
Message-ID: <YoiIuBtm2cPcYK00@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20220520103325.81110-1-wsa+renesas@sang-engineering.com>
 <20220520103325.81110-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="e6xPWi79qiLbN3k3"
Content-Disposition: inline
In-Reply-To: <20220520103325.81110-2-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--e6xPWi79qiLbN3k3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2022 at 12:33:24PM +0200, Wolfram Sang wrote:
> A customer experienced a race condition with 'repeated starts' when a
> System Management Interrupt took over for 30us and more. The problem was
> that during the SMI a new MAT interrupt came in because we set up the
> 'repeated start' condition. But the old one was not acknowledged yet.
> So, when it was acknowledged after the SMI, the new MAT interrupt was
> lost, confusing the state machine of the driver.
>=20
> The fix consists of two parts. First, we do not clear the status
> register for 'repeated starts' when preparing the next message anymore.
> The interrupt handlers for sending and receiving data is now solely
> responsible for that and it makes the code easier to follow, in fact.
> Secondly, clearing the status register is now split up to handle MAT
> interrupts independently. This avoids the race condition because the old
> MAT interrupt will be now cleared before we initiate the "repeated
> start" condition.
>=20
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--e6xPWi79qiLbN3k3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIiLgACgkQFA3kzBSg
KbbO/Q/+OHQE+e+Z1EKJWXgbOwBseqOjU6NFc1mOtU9AAYOUg74DksUaZPeJgi7S
X/sqCc14wlm0mgBV2iF4BLqecAq3VS7uFWUftHPc7foH3FaqB0ECyy87gGmHI02T
3wDNhBUrYgCNHsNmG1m5jJWMOsRyMiyfmg328muILpNvuvdtongamTc+psS8sWqX
xiEmhzpqUSpGq0sBjo9ssJ8sXdhx3dcQpXKfQXJnNUtpFm0JRpAr4imlgZJhqZ+H
ElQJzDlafcnTR/KjioxDefjFNafL/DNFaHSHZX/X7P+x8uGhK9IWIbRxDEQyzX4C
D36xT5jRLvIQWY1DGaDGwDZy6csDedfXX3763ncJ9BM+U5n6JFSFzszyrv3xyEQI
QKFIPIY8w0J2KwMaP2TltJF+QyQIiCj9DisMxMimdK6gnIhgqFJ7mHdHoX8sH2Op
Pidy3e78iVDq0JVk4vHBs/wwO5ZjcjdHVkSEmpcJVJyWWiej4CHuGly2mheWCmo9
HYNzL6Md32RG2H+dZng4hA8gbYPldPP3/SrAvoRwch4luCoAq8n12DgnKiIhRMRn
gdafYjaqCzkb/Fev1mhErH3HodLIGHfCOaaQym9IhRbwelq9jjnYe1PMIN0MTZYL
AVLDQiovhA4UCp81SDzPUHTnvhELGiUbQmlmoq98rvRGv8+cMCw=
=8lAM
-----END PGP SIGNATURE-----

--e6xPWi79qiLbN3k3--
