Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64B4674A474
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 21:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjGFTgV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 15:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjGFTgU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 15:36:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664A019B7;
        Thu,  6 Jul 2023 12:36:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 007066119F;
        Thu,  6 Jul 2023 19:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B9BC433C8;
        Thu,  6 Jul 2023 19:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688672178;
        bh=/lzJT5FgwDvChrayhIE8uP+Q5Qrf9eUTpgkA05PLe9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nP1N0x4Ii4JSYrh89o8puWKJNSXfMWKkHigRxz3VPBH9RnDrm5H04ME59OIBmEvWH
         cHf26fkZrsM1kbLB6yNrZE7asm/bnzQ2/Smboxotlpslb9zDBZVdCicn7x9Ih2fb5g
         V/y4DPeUyQMLYkW8/5xrY/pS5zgIK0cwdcLcs4Nts7dbsnUtnPFGh5QX1RFwImi84h
         Pr9zu+j/RNKkYAKcsQQ2/f6R9ZyMNICv76xSwZFl+OvQ6rtc/o434hQQyf0GBbg682
         Q6BLgSXTAIiw0GPSfgIAeJXq84tv+KLDIYy+KW5OEbZiisSKiGz9RSFGm6uG9tMwxm
         6GezZlMD9uVLQ==
Date:   Thu, 6 Jul 2023 21:36:14 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     YE Chengfeng <cyeaa@connect.ust.hk>
Cc:     "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
Message-ID: <ZKcXrt3vGzncO/0d@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        YE Chengfeng <cyeaa@connect.ust.hk>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>
References: <TYCP286MB1188708B1CE64D95FBACF9E78A20A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Aw1VKsa6Y9g8S+lk"
Content-Disposition: inline
In-Reply-To: <TYCP286MB1188708B1CE64D95FBACF9E78A20A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Aw1VKsa6Y9g8S+lk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 24, 2023 at 07:36:02PM +0000, YE Chengfeng wrote:
> iproc_i2c_rd_reg and iproc_i2c_wr_reg are called from both
> interrupt context (e.g. bcm_iproc_i2c_isr) and process context
> (e.g. bcm_iproc_i2c_suspend). Therefore, interrupts should be
> disabled to avoid potential deadlock. To prevent this deadlock,
> use spin_lock_irqsave.
>=20
> Signed-off-by: Chengfeng Ye <cyeaa@connect.ust.hk>

I can't apply it, what version is this against? Also, if someone could
supply a proper Fixes-tag, this would be much appreciated.


--Aw1VKsa6Y9g8S+lk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSnF64ACgkQFA3kzBSg
KbYXog//bWuH5tT+g+rfzCtBvU9hPR74K3YyGxSwnQm5JxFA4wyclH0H35sZ6Jnf
87X8j5AcJzmVVf8Px/MKkppsXuxGq1oa8lkwaksbTltZSLzCewlSSOPjWqSKW3sf
CcUHROKMvjGaCnRvEZvfRWx/7Qu2b7b+y0Ly8M5TDEYAqtcYeaXzmeyF5OU9C023
YiLoZTKyQSDvgOz6/+FEJ4d+5mj9+zU6tT3Kc06DuSTrc9mcqF2O5qD7to8CgZbL
CrvLnN2HS4ajHnVBObrYgL98hQsIwjfi5d2QwB6Sa1Y32VFQwZQ1oNrGz5QqXn/B
gmjJg1nOBBfccU1Ik+XqR4tqjiW5HcUGnMkJs6fZabG5oOc/s9x2/5Ob0UdJXxoK
TtEZKFH467ZagVEOgiGgzyFZOSbxFBKuuDvmJ+Nv1wn+PEv0Rov7yC9VjLVN3d8R
Kxme8nhvKYjaYu3geIYgAcrlD8zdjvZXTjqVvMhadz7cITOfOBF8VAGGT/aBu1t1
GlXTgwlB7tG9QEX13kY0gASE5Oll8TDUc3nRkUu1fLPA24sY5AaVEUvqWDN5S5IC
THMfKexeL5PUZeWSBUXQ1jXRjvpgzLz7JWqMpHVGKBN5sKYUyVo4zjbnGanTwBYa
z6jQ541Di84pis+5W9v3IjPSH3P2903DquPgeSbV0dzas52so2A=
=x1Cp
-----END PGP SIGNATURE-----

--Aw1VKsa6Y9g8S+lk--
