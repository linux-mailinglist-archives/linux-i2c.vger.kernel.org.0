Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1FCA5F5A21
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Oct 2022 20:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbiJESxh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Oct 2022 14:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbiJESxc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Oct 2022 14:53:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A876B8E5;
        Wed,  5 Oct 2022 11:53:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 674636178A;
        Wed,  5 Oct 2022 18:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30E5C433C1;
        Wed,  5 Oct 2022 18:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664996010;
        bh=NV4yrliRpigDhqUD/V7ZmAQ6kOkrJKhgY5byO2H/+tM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o2cIbcYmXMRDP31lt+oPefs4igCJabJD8A2A6I0ZPZklmrnBmqpxC33Ck+WBdjdPD
         qHKELZ7064lGKFQtT/1Z8ikRvOinUEOgE2LBTXLELKkXkXrS41D5YBt7o9HDZqURlR
         Fsi9l8qIF8RMmVxv1Ss8z09UCLmjZSfuVfFNOCxlWDy0EAzld3kDL7QzyH9c0WZLik
         /p4S37++YkgiUYx93CBgSaKuIrSVICF/MpUUc6XJ2I9afoi7kbYr5ptSsXmz7A6K9j
         0RsFqxnJz9fOu55TlMDvgcEkdvzf7zwvGiqZPd+puMieULo11w7DrNN8Fu3s3wtNx6
         f1IDtYh3/UTEg==
Date:   Wed, 5 Oct 2022 20:53:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] i2c: microchip: pci1xxxx: Fix comparison of -EPERM
 against an unsigned variable
Message-ID: <Yz3So27pgqX92viW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Colin Ian King <colin.i.king@gmail.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221004192715.173210-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p4lIDGwMSuwz1i1Q"
Content-Disposition: inline
In-Reply-To: <20221004192715.173210-1-colin.i.king@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--p4lIDGwMSuwz1i1Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2022 at 08:27:15PM +0100, Colin Ian King wrote:
> The comparison of variable ret with -EPERM is always false because
> ret is an u8 type. Fix this by making ret an int.
>=20
> Cleans up clang warning:
> drivers/i2c/busses/i2c-mchp-pci1xxxx.c:714:10: warning: result of compari=
son
> of constant -1 with expression of type 'u8' (aka 'unsigned char') is alwa=
ys
> false [-Wtautological-constant-out-of-range-compare]
>=20
> Fixes: 361693697249 ("i2c: microchip: pci1xxxx: Add driver for I2C host c=
ontroller in multifunction endpoint of pci1xxxx switch")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to for-current, thanks!


--p4lIDGwMSuwz1i1Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM90p8ACgkQFA3kzBSg
KbbhQg//dh10rcAonoYEgC3ZCrAy5sJPECzsGAFFnJeIGLk9p9WMP34uEV+KgOwz
nV6SqBEiwLwSH5ZQKoHRSkQpJ5r75LAnZ0sxib16yLQXI2JgK+llh6DP0xgWqUML
RkxkoUCORrQJAuWZ/ZV5LWltfigjXowWu++QsUHGdMPcDb+bk8sOPFiCbMLo9Y67
PftD2tIVoFDkXuCifEHHG0B7Zi7MwnyXV6vrY07+IeyVYmquEkzoVUSCFQrWQE31
37PHYZlZd2IS0CyZ4UNGYzlYbElzxBtbC00UZqy/ysz9FtFVqfEKwKfnF3zgPyuG
giwnAFm9Ngjcg9pPfIvysVfoNeR6W/R8lS/gxX2H8b67Oaf+xlfQnnKI9YrrgT/9
BGr3z7mqNO05ETaDjhRRgJZqHITH+x4mYeQc7pUSuLYqzsrOviYPAjTeJK1X1HeF
xtnXbR/Wy3uXasbq9PZc/lGo1u+1x4n4RXRLNEjyBNBOQJKvdP8acR2sR+f2ew7o
RB6tDHKbVlcOLgCDMq6b2n5s/IEM3GkmHAMVEGAEiVxUSAwoB95D/xNvVeujrmna
CdtS1A528zXrrGB0w+7amKM7S7aVnabUWETWuHVbU954/L+xMZvWcS1oi8CEP6eQ
JxN0q+e8Xh7UkhyDaoY3SIQr4NPbuwlY6wmoANXrvMYW2qcgS/I=
=c8zC
-----END PGP SIGNATURE-----

--p4lIDGwMSuwz1i1Q--
