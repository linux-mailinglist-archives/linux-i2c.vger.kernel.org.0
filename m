Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5664C6F5AE7
	for <lists+linux-i2c@lfdr.de>; Wed,  3 May 2023 17:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbjECPXf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 May 2023 11:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbjECPXe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 May 2023 11:23:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 359E9449B;
        Wed,  3 May 2023 08:23:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BFD6F60DE4;
        Wed,  3 May 2023 15:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3C3C433EF;
        Wed,  3 May 2023 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683127412;
        bh=hiXRjnU7wra2TwDm/hHMN+kS2zBswOO3Fxz7JDYTmcE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p11ytUf1uvoxJ7g5SoFSLKpSrx6pXViH99cVlbgaU91sIDSZg8uYw3mncWAYbIadu
         LDMv5FsjApwMmWVFTgl+WsQ25FpM4zzLOd95Obud0e1+qcBvQafSO0lv945w5TRnyy
         BWNLu+CpiD3EKy3j49src+vvWejCUeTBQxghHM/2ULG1IrMoF/k8JP7B3VysAC1KbO
         42keNEzxmAfomnJPi4JBkIy071Or5hlY7AfFS7RGCHTgqRnbGYrlq2m347gXSDqs9s
         Q6ca1QKe2fDTynySHUCA6OWCiF1Y98H6nt7gaonOEz2CX3xQlrMzcb+ffB2xjQ2QiU
         QALOMkLvwR+/g==
Date:   Wed, 3 May 2023 17:23:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: gxp: fix build failure without CONFIG_I2C_SLAVE
Message-ID: <ZFJ8cUK26CqZFSTZ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>, Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>, Joel Stanley <joel@jms.id.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230403074939.3785593-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JPPbTloawUk0fmfJ"
Content-Disposition: inline
In-Reply-To: <20230403074939.3785593-1-arnd@kernel.org>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JPPbTloawUk0fmfJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2023 at 09:49:13AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The gxp_i2c_slave_irq_handler() is hidden in an #ifdef, but the
> caller uses an IS_ENABLED() check:
>=20
> drivers/i2c/busses/i2c-gxp.c: In function 'gxp_i2c_irq_handler':
> drivers/i2c/busses/i2c-gxp.c:467:29: error: implicit declaration of funct=
ion 'gxp_i2c_slave_irq_handler'; did you mean 'gxp_i2c_irq_handler'? [-Werr=
or=3Dimplicit-function-declaration]
>=20
> It has to consistently use one method or the other to avoid warnings,
> so move to IS_ENABLED() here for readability and build coverage, and
> move the #ifdef in linux/i2c.h to allow building it as dead code.
>=20
> Fixes: 4a55ed6f89f5 ("i2c: Add GXP SoC I2C Controller")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to for-current, thanks!


--JPPbTloawUk0fmfJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRSfG0ACgkQFA3kzBSg
KbZmyA//V7gN/9uaQgLI0cBfq9x/4U01NbRtIc3WQjYn9uiMuv/uaByzqhR94rkW
qEg9jzkfaQYthFvPQKn7DdbM46nhvFudYKGLKtyweCvVFPodnppEMO5XJ8LwdbOX
lLG8O7QaiwxLhsGJkb1sJRoiyram3Cw9YTnMKlwLrOvbr87CSccuPIvlqWEj/ORu
5cxM3ZQHlL6VWDMEzn1planNMIHy4lrt31lM81y9RAkS25no6ZPDRPogvZ5iRCTo
SudAUA4mfg3Z3i977IDACzkmbWOakSEGZ0A4GrIIXAkfwrKa4nXM7hPmQqWKZARQ
qCI6gTJLWJJ0wu9WuK3Hn6MQevfE4p/MRcS0aaEbgqynmHx3B1v1mk05BHqKCPaz
zh/ATj4ETLSvJL1jEZtrZzaqYTxWelR83wj4s9AUI/UBK1ZqUip4EzOyttLTYyfe
IA1RGoul5apDXJmcdbSJ3oUGO/D2A6vlfyRMBxvEUXVbX3GghHPmFJX/s8VlGKfU
HMZ9ECRiFGi9iDTXo45e4+Yv00z7p0oM4EOe5nvJj0YYey7Ci9NE8xcHd6asc3DG
4T+YG+M+b5tfs5d1ErSfqxw73ywa83JqfHb7L6kdp3+uotitUlLcCLooDH5a8ZRK
XpQdNFq1HMYgz6Fw7W5S9RFSySOtu2JZbAX/PZihfBRd9Ou6tBw=
=uMcU
-----END PGP SIGNATURE-----

--JPPbTloawUk0fmfJ--
