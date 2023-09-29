Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B83957B2D20
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 09:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbjI2Hjp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 03:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbjI2Hjo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 03:39:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EDA1A8;
        Fri, 29 Sep 2023 00:39:41 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527F2C433C8;
        Fri, 29 Sep 2023 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695973180;
        bh=yAYLz3ukdJtNvf42OO+RRKZ3YtBH+Khh5W18AjODGKs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EEV1O/OrowYxwsT7xTRih0qWIX7q1hjm5Ayp0pZO2vP6t9NZEYYSn2dIQZjBhoMyZ
         YR49YoxePkb2gTXXgMb9TzBuAX6wuNqtQXG1Ye1TyTwuHU695VfqN97JaLxmBFmPBt
         RtWcF3OkpBUAkeMc0TxS4r/iQBQSTD1cC61qFiXVg1d2ONNtYhZ5BeANSPE4/btAux
         TVQCkjxUVDkfDThiGACVsn9i2umC77hcIrAWiuaIaZ8LYm1ZUd67fUVWIiIIm3lZj+
         Uv7JhPU9Pp0RP15drIFjgKE4x2m8UhG2pKklx1E2DHGSZvG2bGG4RiCYjdHOuhDeLK
         y8m6T9k/g4V+w==
Date:   Fri, 29 Sep 2023 09:39:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jian Zhang <zhangjian.3032@bytedance.com>
Cc:     brendan.higgins@linux.dev, benh@kernel.crashing.org,
        joel@jms.id.au, andrew@aj.id.au, zhangjian3032@gmail.com,
        yulei.sh@bytedance.com, xiexinnan@bytedance.com,
        Andi Shyti <andi.shyti@kernel.org>,
        Tommy Huang <tommy_huang@aspeedtech.com>,
        "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
Message-ID: <ZRZ/ObZmntMLw2r+@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jian Zhang <zhangjian.3032@bytedance.com>,
        brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au,
        andrew@aj.id.au, zhangjian3032@gmail.com, yulei.sh@bytedance.com,
        xiexinnan@bytedance.com, Andi Shyti <andi.shyti@kernel.org>,
        Tommy Huang <tommy_huang@aspeedtech.com>,
        "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+myms6uqEERuj8CP"
Content-Disposition: inline
In-Reply-To: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+myms6uqEERuj8CP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 11:42:43PM +0800, Jian Zhang wrote:
> When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
> as a slave, a situation arises where the master sends a START signal
> without the accompanying STOP signal. This action results in a
> persistent I2C bus timeout. The core issue stems from the fact that
> the i2c controller remains in a slave read state without a timeout
> mechanism. As a consequence, the bus perpetually experiences timeouts.
>=20
> In this case, the i2c bus will be reset, but the slave_state reset is
> missing.
>=20
> Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeout =
occurs")
> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>

Somebody wants to add tags here? I think it should go to my pull request
this week.


--+myms6uqEERuj8CP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUWfzkACgkQFA3kzBSg
KbaStw/+P9lKIzk5K+HPzW686R3QSD4c9L86eK6C7qSbz3dR8WCLARees+FPn7KK
SLQxjQzUToKNe8bfW9QnSs65v0koPIADF83FOloDj9+0R3+mbsqVohFn7wcPM5t4
NtAzODYxDYOCQP84m25UZC5A+G7zDXxqHM0gE5Y+cbptMCaSVyzRK4/1gBIeuos/
H++dJ0wJ86ozY69MUjCNA0lQPGooZKiuZ81F9NaGRx6yxHO0aKI6ZLkLHpZ/c2G1
mNbtgy2zR1UbahtKUHmfwmT8XuCOOlpTVCnMfjXl1BaElI4unm3F52ZvaHg375eq
7IDpAO5QC4LNEQEmDE90OgvLa3eS4SvEkHeZ4wgr/iTiBicMrqEYATxka4mnjdfV
EyDQIIWgMMaZqpsf0ngjN978y32byRy+IiN47aY2Cn7IeXJxruZ76Cqj6T9Pq4bb
Zeqe/xs5Zt2B2wRsxD/fLSbls6gxHRR8yn0mBZD4XgcCxxsxllP5yQ0pukP13v8F
WPHGoob7CewyIijzwuI64R0I1dkBRecC7WkD2eRnzL0o33N7ct3VY62qgFX2xmIS
AG39798UYyZ/Mecx/hp4/mMnOhXgcPPyYgbmqu9+MGNEG03eHsGumshUOxQIRSnI
d9q4OxxEDFTj3/tEMhEtYDkwKnIwEkAnvKYQGmhfYMZOUXFGBII=
=00HN
-----END PGP SIGNATURE-----

--+myms6uqEERuj8CP--
