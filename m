Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 977EE51AF6D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 22:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiEDUmR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 16:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343785AbiEDUmQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 16:42:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D1F4F9EE;
        Wed,  4 May 2022 13:38:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ABD8E617A8;
        Wed,  4 May 2022 20:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C861C385A5;
        Wed,  4 May 2022 20:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651696719;
        bh=bAFjKvIBpiguiHw0d8TsEXxAy/N7r3y3izCenwfFfsg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HQcIy0Cpc0WIWw79MFGyRtF2UFkbh6oPmE77mgArpyx9hDC+t3r7H1i9fK6FyVpZj
         jp3l7DzRcUnAc4pGRJiQxGKY/cc99nO4pW/I4lYmJ9C9ZR7RNzuabNQt5TX2f/BFYZ
         0Mz/GurO2PecTtBVP9resMh11+pws7dsA52nym3h0frQzDiFFABOqgNL+wYn1hXR/H
         IUWLzs3WMQLonKw/AuomuGs/zCuOf9Tv12STZNCOfL0VUvY/O6r2x55OacmNWwgIYP
         4PMuMUPCZmlJP/nMzeRbJ73+aPy8dhC6WV8Z3i+VnVZINEofDj6WoRiYzAAMs4pufj
         LG2DBehl+3iGQ==
Date:   Wed, 4 May 2022 22:38:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        narmstrong@baylibre.com, tanure@linux.com
Subject: Re: [PATCH -next] i2c: meson: fix missing clk_disable_unprepare() on
 error in meson_i2c_probe()
Message-ID: <YnLkS+/oT8qeL75s@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        narmstrong@baylibre.com, tanure@linux.com
References: <20220421090042.2278081-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+8ScGLI3M/D7Ttui"
Content-Disposition: inline
In-Reply-To: <20220421090042.2278081-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+8ScGLI3M/D7Ttui
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022 at 05:00:42PM +0800, Yang Yingliang wrote:
> Fix the missing clk_disable_unprepare() before return
> from meson_i2c_probe() in the error handling case.
>=20
> Fixes: a57f9b4dd6f5 ("i2c: meson: Use 50% duty cycle for I2C clock")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to for-next, thanks!


--+8ScGLI3M/D7Ttui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy5EsACgkQFA3kzBSg
Kbb9JA/9Fff1+jTo+deKplfTktFDn0s8+w4imP4ghlpLhCfwpa0P0R4GQzJD7Nch
Z66l9/oYE3Xx5OLU3NeRPg6SEoLPvlxuCHj9EoUX2Pu8v9e26TTUir8+dDOrfBuR
Q3Rs9jzVyKs/MXV85o6lS0n2oDd6AZZPWpOFR1Zh6HYMZT/T3+l2Xs6bwS0G9oQn
ONS8rABeZeUV4cziYCo0mDaFdafJTGBq2SAH7m8OVuPqBbSNM2oDZ3yZCRL2Hd/x
/t7YYW6KHh3oW5UHS8WyJEAzsdh11YSVl3VORTYOLG1Efd+AWZwigiCHI3zmrQV2
irm0mFxkimkPcKlTjiZD471ATBHhv1FQgPKXMHomMWA/ui1bhO4BuAk0bPf5n5u+
m6QDvip+SR1v1bDnRWC8yWzDhORKhveCVAU3WOUhM67ycIzbeX6yaIgfvDneupTc
cR2PCChAlmnVvBev13FAHpwTah3+yTTzx4pbNJJBloOCPoQC8FFbcOfRKckSKJZx
zmfJeo9f4Mm12mMbcaUK3WmTg9Lt4AfNnA0uluOt2bl0T7SHh+DTqp/J+20Kb91Z
supznEKa92FFzmL2sHu8ETGHLaSgMHk30Ua+dIVkkqOgVAKS5jMQNIbAnIDQk7QF
lkdW6ggvS0Rn9t1TPmaWhN2VjnD//M2ZPaSrWFMYOvRR8HUvQAA=
=WE8/
-----END PGP SIGNATURE-----

--+8ScGLI3M/D7Ttui--
