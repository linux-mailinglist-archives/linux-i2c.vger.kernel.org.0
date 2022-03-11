Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D76F4D69A7
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 21:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbiCKUr2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Mar 2022 15:47:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiCKUr1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Mar 2022 15:47:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650541F1DF9;
        Fri, 11 Mar 2022 12:46:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EEE2A61F72;
        Fri, 11 Mar 2022 20:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5CEC340E9;
        Fri, 11 Mar 2022 20:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647031580;
        bh=1d7yFHm3wcaPcd69G2dLtOCFfYzo29gsXMR8bTpWgSA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jqp4Cfdwk6bmZlNxsmtXcA4SDJBULul7QJ+0uGowFEvIOxGFagg08I0jomB4ylGer
         brXXjLtcS+8AiIhR4C/MWI3RT12XrhTNveWBmpWu1S2naZ8O1tDVfJvj13oGtivvIj
         X4ZYY3j7C+BRkaQ/iabBpYb8UjioUiyNZZR/rcljk+dvt8jfO3wqvn0vr7/lrMSnA4
         MeT8qI+Fid53s/AD+PTfzFBXuF4FchntamTawHNS/Y0ooTf6b9Ql0npy47zEqIk/zV
         jShw6uobxPJiw47JK2HPOsqrwuWEIJkrXl/bm34cV4Ku/Hw0Ofnvi5aT2Q7H5tRxt1
         QFuNNlyWIGz3w==
Date:   Fri, 11 Mar 2022 21:46:16 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Xiang wangx <wangxiang@cdjrlc.com>
Cc:     bleung@chromium.org, groeck@chromium.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: Fix syntax errors in comments
Message-ID: <Yiu1GLEOUNHnqKxP@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Xiang wangx <wangxiang@cdjrlc.com>, bleung@chromium.org,
        groeck@chromium.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211205162752.14066-1-wangxiang@cdjrlc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MKx/StZgcm1EYHev"
Content-Disposition: inline
In-Reply-To: <20211205162752.14066-1-wangxiang@cdjrlc.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MKx/StZgcm1EYHev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 06, 2021 at 12:27:52AM +0800, Xiang wangx wrote:
> Delete the redundant word 'to'
>=20
> Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>

Applied to for-next, thanks!


--MKx/StZgcm1EYHev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIrtRgACgkQFA3kzBSg
KbZYHA//e8ZXtH5u8y9n3Z6p0DvR9q2JoN3W/EK50Hy1rF4He9EThxhq4XytxplO
LS3JlT9SDg4Gf+6yCVB8dD0pwSZSJ1B0X+loIdhQruDCSJ37wudpW700VMO8ZHL8
7vPxftqxnMGBPEIiVYXlyKjev0j9t/JdoyEfS9JcdVlVsOISC6Z5ezIHMdzalj8w
5muYLOzki2vxi127o61lv68UNAk8HbjaQtEaeUrpVr/umSwlGsn6HqZrkYvbgb3Q
pe8wa/rJS5FlVzTaAnFybm7Y3+/ComPrk/hPHOsus+PqybaVzgz21W+Bw0qXUZ1X
eRpK7DNTWD9I+8ZT2nVsVaUf1d6eqze5+3m02QMRCVxFHmGNZh3zkyyIH7CKD/3h
KzmKZei16psbiSD0Z0ORqHWAaU33ciBy6XCufOKj2XijQCRLzbYSJtyFC89sjFbc
qxDWcahkFwbL+hupfxvnfJRE+K+nzhdvy+wjgPnId/3Vw1R0GLbKhB1VBG6/v2l+
zMMlrh97hOcqivSczimAGth4cuIsJK2c+Vi88Mj7W/tWjyPmyB2i1LlCDU6YE1jw
FN/VvctQrEmF9/k1Zqnr+oiiQLc+zU+nOEzEos4Vos2/+xZF9VXg1JjCYul88Eru
6YP5/0+5T4irbdXOpQ6OO+2uY7ZUQNYrAaCyjgP8kqsBxj/G77Y=
=6UPT
-----END PGP SIGNATURE-----

--MKx/StZgcm1EYHev--
