Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC2F6F27E4
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Apr 2023 08:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjD3G6M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Apr 2023 02:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjD3G6K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Apr 2023 02:58:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03ED1171E
        for <linux-i2c@vger.kernel.org>; Sat, 29 Apr 2023 23:58:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8B60960AFD
        for <linux-i2c@vger.kernel.org>; Sun, 30 Apr 2023 06:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45042C433EF;
        Sun, 30 Apr 2023 06:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682837888;
        bh=0BFyDemOuVrbku8aZqdJCA1+RRsfz1qz7J50avUanBY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Or2VwbmTTWO5hm7UhV15Zt1ATx6EeB8v9qNWSSMfACMI8/xhoQN+czmNfBwgVA4d5
         jBCoIRfrloYLhVAmZpt5hS3JzKEKu0Lvvtr31svxeFcx8Lx74/Xiz3iXePs4TovK8K
         cF+s//p3ApSit3KL0wwHozTbymSEB7Lej0PUYW2mCKBhpQ9jls27kSg95mJM1hcwsn
         NY4vHUafXcuKrNoOHjgBrWlYGRofLyiDIT4ViFnud0tXOUVZXTbIQ74FVLs5uHaWNo
         61t9mZGKv9DtesKXBvi/bMqLUYE8GoOTvdGo5Hzk8tzxDJN0eGfMFKnLlEQEzxkwhu
         l7aVwjFt0idnQ==
Date:   Sun, 30 Apr 2023 08:58:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Subject: Re: [PATCH 1/1] i2c: imx-lpi2c: avoid taking clk_prepare mutex in PM
 callbacks
Message-ID: <ZE4RfbOBIPH13YZQ@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
References: <20230424080627.20564-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VPdEtusa+1YW2EIA"
Content-Disposition: inline
In-Reply-To: <20230424080627.20564-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VPdEtusa+1YW2EIA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 10:06:27AM +0200, Alexander Stein wrote:
> This is unsafe, as the runtime PM callbacks are called from the PM
> workqueue, so this may deadlock when handling an i2c attached clock,
> which may already hold the clk_prepare mutex from another context.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied to for-current, thanks!


--VPdEtusa+1YW2EIA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmROEX0ACgkQFA3kzBSg
Kbb+Lw//cve88MxYHVcaR7hnR15CwL8jiiiS1t1WhSumB4EyXTf0koheS4LMbKcN
7+vpyI7dZ+OIvWxZbfjo4gJ62RWRHWTOMnlENa13bP+z7JxHQvyVBhI7gxaoIXza
WslFwLb+OnqkvJ9r7KKVE6mRPpiJflm5p4fUqkl6NyU80lJwG4snjHBy6X+wZWWz
K6qN4mvYwAhdoTeuuS3iozz4sWygt4s0JmQiLZFZK4uRo10ortRgtW85d/4af51j
qEVpsCTOGyq6nO4dT8tXkhu/V9NVL4+27L5WMFwbUec3v+DWpwM6jvjP263Wqgea
gY0iWmhUqLfEBHUIR8H7xlAsK3r00jN9zrQuLfZln6t0QAHDaVXWDUcfCTXc1t6+
4Lqc7t/B1sbs7QftnbMqFF2raHLFUpXZJbaMNXicoUaBICTjQZxsZHXv57vX7RpI
ARiXyqCgE+U3fVEoeNdZQEz8ZvUQhhCk3Gt9ezdJPovw0g61zOYHHk7cKzJjzTL5
UGt+qrfLcF0ImXzeHCq6EI23Pgv2wtJFSAvlIC/WzFQup1G2pAbwHXzGPcTozJcy
d9IJPHqgaxGc8t/UCgdvARYwRtUBxAAtv0aWHlESSAIRaEhK2ym3Xg2M4/nzw4Hp
2+ngeyzSG0HCdwNq9Bgd/AzdWgjpKw/1FaUydPvlUsA7jfbhWrI=
=frIW
-----END PGP SIGNATURE-----

--VPdEtusa+1YW2EIA--
