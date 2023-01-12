Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 059A7666DEA
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jan 2023 10:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbjALJRa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Jan 2023 04:17:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240024AbjALJQx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Jan 2023 04:16:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C08654D91;
        Thu, 12 Jan 2023 01:09:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CB727B81D93;
        Thu, 12 Jan 2023 09:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215B6C433D2;
        Thu, 12 Jan 2023 09:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673514565;
        bh=Go8OUlNc3WMdaAhoIRqEwx+/G8bzkIBolQ4hnEZqi84=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TU2GmYj38X4wYrBwsgT6zKE2KtuPPo1nVsRkAL6NjiWidYnBFBNYt3hZtZMbNk7jc
         355AOvWtsEkjsnj5bZMMUqe/xHUenJCPuWYOekFQJvUD0pDB42bzFxvJMY3rPF92Qk
         b/ULqSCgmJ4sb9Noy7cgpxM1FO6TU8Z0ycDS0DUB8yZxscmWyXnMxWpnmukyGNHblT
         0o6W5o+GoWpXIx6zamNIStio+xXf86gMUD7GZakwFj/S6P4wM0BhJD508xPOmcb8P6
         CnSSXF0gAOwBU59C1/yLOpOPJdvJquiweFhC7i80/idFyKKqnGgWu+TdrS52uhs2d7
         tNGlqn1K2mVww==
Date:   Thu, 12 Jan 2023 10:09:22 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/2] i2c: fortify the subsystem against user-space
 induced deadlocks
Message-ID: <Y7/OQiJCFzgnMnaG@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20221229160045.535778-1-brgl@bgdev.pl>
 <CAMRc=MfhVVN+W0Th8jdzTBHu6reFNpkm_cst3jMQZij0bDD=jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rTcZkrIOar0qQDYF"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfhVVN+W0Th8jdzTBHu6reFNpkm_cst3jMQZij0bDD=jQ@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rTcZkrIOar0qQDYF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bart,

> It's been two weeks without any comments on this series and over a
> month since v1 so let me send a gentle ping on this.

This series has a priority for the next merge window. I love it!
However, patch 2 is difficult to review because I need to dive in deeply
into the topic. Hopes are that I can do this next week.

Thanks and happy hacking,

   Wolfram


--rTcZkrIOar0qQDYF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmO/zkIACgkQFA3kzBSg
KbaS6A/+N2T3z0zQrtJz7yqsYu1oQJhkokjev29EmQ2/LNauGTZv2S8XU2R9+2Cv
U1usyeBc+pEjZj3LwRiShp3Yjzbv3wmsW63Vz5Dcu07zLw09YDBnidBYwr/4JYun
QpxykBRYDghNNKpBW9xTXXn4y4Y5PRA1pnVvU9xHl22OYSP7DXxTSuF7AncVJGH/
wulEt3SgE02NdD8tJ4/k/taOmgaUvIAe98f1LYWsIMHA3iZBJTfov7W2SvlUDz+b
gYiQ6q6gWAQJshzGajoKGYO6nnd97BZN8LAdmKfnT7ZeVpsWt5ZvfE0sZTqhEw83
hLsA17rmu7UI8zQyPVpQzzO5nrQSonEkTy3b6PcbLv6sTb86F87YqXZICZ2Vm7mG
BLOkAvMDaMoC7ngeg9EemIPr2Iciuf1aLAAftdR9GkgFLKo1+9C1KtGmgNZr22if
Ba+PuULwU+FyU46E3vDPK3qmsgJ7bqF/15x2TWGvLsU03hpB77yVy+vw0PALI/U0
weExlSsiX1D9fd50CLwoHTyX/Scw4bS/rVeyWBLEIUkBKmqAlL13/Q/m3pgGLOSL
SNkL3SyMMLMliHQPwMGyrOibrwUPUKwOtgs2AB0KX8909Tl5i54ehQ75U+bMvaKF
LuMk1yL9Ia0LWSQ+jh7i5vwQM5Un5IAV/5StmbMKfodgRtR4asA=
=m0i0
-----END PGP SIGNATURE-----

--rTcZkrIOar0qQDYF--
