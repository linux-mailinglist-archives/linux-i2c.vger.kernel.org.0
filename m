Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8144CB10F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 22:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245259AbiCBVPC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 16:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245253AbiCBVOv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 16:14:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96BFA27B06
        for <linux-i2c@vger.kernel.org>; Wed,  2 Mar 2022 13:12:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5130CB82232
        for <linux-i2c@vger.kernel.org>; Wed,  2 Mar 2022 21:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F02C004E1;
        Wed,  2 Mar 2022 21:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646255535;
        bh=Ly4x3xiMX4pgufUZDqUO8ZyvoSiDKx9HjALQhwmhk1M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=WuuJ8DZq0e6hvLwmUPa/PFsCmzoF6XLEfcwFnhNEsT2CEhJs19lmqPgWpZUjRGPNw
         myk2MuLgRgr/mgUfUSIDXA7zzENwMGD+FAWIraDLXj3vZCnTkp/qAtzMfXMh0yPAZH
         2J4FzHgS7rihr+i2LJpIIY69GtQhODzz4fhzmcTg8Vq6Mcq/hDUGzEIok3r0TyMmYS
         o4kMJ0LZ18uoYxW13DAJmktb3fYLvyUaYH7Tp2brWNfm8xby+df1goMNzPapK389Xs
         Qy/HtCqvaLJ0NveHLhtgZRNvDHO1l9X4s9TOcb8J66HFJF4iaVFcG05s1R6x0k9DjR
         ysmuJoYxgROOg==
Date:   Wed, 2 Mar 2022 22:12:12 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] i2c: i801: Drop useless masking in i801_access
Message-ID: <Yh/drMSLHC+8hKqF@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qr6eFMpJvImlOU+b"
Content-Disposition: inline
In-Reply-To: <20220301173937.636a21ce@endymion.delvare>
 <20220301172859.5593309a@endymion.delvare>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Qr6eFMpJvImlOU+b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 05:28:59PM +0100, Jean Delvare wrote:
> I went all the way back to kernel 2.6.12 and that masking was never
> needed. I suppose it was there in anticipation of software PEC
> support, but that was never added to the driver (and never will be,
> as this is made obsolete by hardware PEC).
>=20
> I'm also removing initialization to 0, which is not needed either,
> and would prevent the compiler from reporting an actual usage of
> uninitialized variables.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--Qr6eFMpJvImlOU+b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIf3awACgkQFA3kzBSg
KbbwchAAoDA6pNGoGN5Rc6il8mPvM8gGpS61Hk3ZMLQ0VmBhcMH/kuBBJ/vyaqp5
H4zi5FanZBIiu9USDxaQL0CX2nYClkS1spvMo/o0ZMtxPdv3qr/seB+5G6cAAryO
bqnyfygJy7Mcdh0ijeOeP+jYtE63eXZQQV/PAQWYeCLTHsSXI6Us/RBDqQIQ33jQ
L7rNgtTlKONvD6XP8mX0zM0/UgvX7htGc8hujm70jfoaC/wnQ3c3sKcYjw+y1EJp
D+tYO2x29KTWe8KEOr5ZeOxvoG62ZEWUQVr/4sU96fboq1xHKEDwpc7UWKfnnA6Y
fNgvBffHDfKZFq4YTMZK3Y9BoOvYkzrl6CeGkKD7YJIccjxb3t/KqBb6SWmwZYYe
a1j1hu5Dzn5qFqTwMd64X3bpQbR339MpbsRzTHD1y2Oof5+sYvuHDPAG2sxSnSU1
V52JKyPCucgzJFYY0lGNklJMTbBZJjk1HhQWeuGgKNqDXJev49gmrwsx44Kc9F1k
b0Gkj6QXioqdz6f/PQmBQtJmKnDo6OkbF/URpFfntCgcg2fA/vm6dTwPJ0R00lkI
BWd5xe2G5KFdn/F7IK3U2T7c9eA5RfcG7mL+zLPX3rUadqDH6ygE0Zk62LoqUx5t
qgL63wUxPCKQ87VyhALUmLZNS0NfLdQqMme6wdYKy0sB9YM3dQQ=
=t14p
-----END PGP SIGNATURE-----

--Qr6eFMpJvImlOU+b--
