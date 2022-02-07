Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED054AC390
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 16:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244756AbiBGPbL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 10:31:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236028AbiBGPSK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 10:18:10 -0500
X-Greylist: delayed 554 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 07:18:08 PST
Received: from pokefinder.org (sauhun.de [88.99.104.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AA94BC0401C5
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 07:18:08 -0800 (PST)
Received: from localhost (i5E861ACA.versanet.de [94.134.26.202])
        by pokefinder.org (Postfix) with ESMTPSA id 75C9C2C00BF;
        Mon,  7 Feb 2022 16:08:53 +0100 (CET)
Date:   Mon, 7 Feb 2022 16:08:53 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Eric Anholt <eric@anholt.net>,
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: bcm2835: Avoid clock stretching timeouts
Message-ID: <YgE2BbZ29KDcClQO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Eric Anholt <eric@anholt.net>,
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <1519422151-6218-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E0hofHivG5Efz7YJ"
Content-Disposition: inline
In-Reply-To: <1519422151-6218-1-git-send-email-stefan.wahren@i2se.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--E0hofHivG5Efz7YJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2018 at 10:42:31PM +0100, Stefan Wahren wrote:
> From: Eric Anholt <eric@anholt.net>
>=20
> The CLKT register contains at poweron 0x40, which at our typical 100kHz
> bus rate means .64ms. But there is no specified limit to how long devices
> should be able to stretch the clocks, so just disable the timeout. We
> still have a timeout wrapping the entire transfer.
>=20
> Signed-off-by: Eric Anholt <eric@anholt.net>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Okay, it has been years but the issue came up again [1] so finally
applied to for-current with stable added, thanks!

[1] http://patchwork.ozlabs.org/project/linux-i2c/patch/20220117102504.9058=
5-1-iivanov@suse.de/


--E0hofHivG5Efz7YJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBNgQACgkQFA3kzBSg
KbY0PhAAoWXhn76ZXvHh2hCBWXJJ7P+ZU3YOiy0yWlq6vYOF78lxa1vfNp9Tebs/
DU2G00RSNELeYGMHvY7IDh3VeCCiBlBDO48XodGQAl4TQILevqVbZO4+mAGyIdiQ
bYcKH/RZcChe6LT5ggS1hrf0YqDfdyNPfSif3ml8zYoXV7RWU5EJ/GlFSTlng/JE
onnRZi+7nwXVIroU70S0Ao/lQB3idRouFoiogWYdR47se+Ihq5jXJhMMmqc4sS57
hpIeZ/sWFSlCM2aeqRoxh7K48qkMKT6CKEQCbFXtgSmj8s2HIisvyRTrm9Yv1sK7
VmmMIKltbXYj3mf8cGOzC6L4PBhShqhCxos5gXYqs/kkC3MsoHYBGSIC88YPxWZF
GjJauGYcUlY4NAjJ073KxpFcAq8zHg860vupGaKuevAvuOrygl0CZmIhVHW4fkdw
xvEK3DftnvqOoqgKWDWGqL+3jWUVlz2pKczcI/h+8tnThdHSwQZJ5LcXgJwPOmgP
k8G3IttQOKYgy1Mmp1DcFiaPIxpuH/r4UUEYB+c6NsO59bUjMRd5NI6WRdzI6tnX
Hj5ZESK4LdxDYk/1Yn3EqC7wZ74m7HBqF2twr77drDPha95LKn72fXKzL0aMWeCe
fD8u/gI3XCl67D8FLrLsZeopnIct2KD4pnQDj0lx9EMARShoCxg=
=57h/
-----END PGP SIGNATURE-----

--E0hofHivG5Efz7YJ--
