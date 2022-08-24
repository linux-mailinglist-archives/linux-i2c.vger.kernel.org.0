Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 425AB59F33B
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Aug 2022 07:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234227AbiHXFzU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Aug 2022 01:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiHXFzS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Aug 2022 01:55:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D55E80F46;
        Tue, 23 Aug 2022 22:55:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 07E6D61896;
        Wed, 24 Aug 2022 05:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB4BC433D6;
        Wed, 24 Aug 2022 05:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661320517;
        bh=7Pr8jo6vAqF+ThsxlzbnzWMKHAqg3OsrYlY7SV9GvRU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fcUQXBfwXBb4Zba/4l4AMS/CbcAm6vf/r8RB1nEsMdHdqLULqyyLKj/jkX0tUJyOW
         Tf8g3jr0yzzqcVHVG4J/BfizpOHFgNkamfGNv+56Ud6zm5jhbH5cE6vTwtgJOAh570
         EEM5l5tRjnUy1MscqQ7+YcuZ5X1WWldW4pKu7+IRibZ2s6TUMDnImLT/PNZEbbUzxc
         ttyf1IF5txPuThZjVBjDG1FxJFxWL8MTfVlKYN8bFhQibZZS/rAHrigjGcIrfh7ZBf
         CDcZnOehG7s5opvIhRNy1DblOKRpuXJ/c8KPOJlXP/bQoheMCQAbLAfCDCAVMp2EIY
         8w5GeqKFVC+2A==
Date:   Wed, 24 Aug 2022 07:55:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Weilong Chen <chenweilong@huawei.com>
Cc:     yangyicong@hisilicon.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] i2c: i2c-hisi: Add support for initializing control
 module via DT
Message-ID: <YwW9QVZ3CaLJEvpF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Weilong Chen <chenweilong@huawei.com>, yangyicong@hisilicon.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220822010031.97769-1-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ycFtVXGw3a18ZPQ3"
Content-Disposition: inline
In-Reply-To: <20220822010031.97769-1-chenweilong@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ycFtVXGw3a18ZPQ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 09:00:31AM +0800, Weilong Chen wrote:
> The HiSilicon I2C controller can be used on embedded platform, which
> boot from devicetree.
>=20
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>

We also need the DT bindings documented in
'Documentation/devicetree/bindings/i2c'.


--ycFtVXGw3a18ZPQ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMFvUEACgkQFA3kzBSg
KbYGzg//RSjynEL7vNjhzpwCxN2r2XCRsBY9/L9o+iRu8VIyka9/le26sI3522b8
Y+hzefygXtMzlch60RFJia1APwsOLsctNq7GS6FyIlxFodvGYJwe6Dg+DKCvVrlD
8eYMHCDDTqdpiDaR5o09Pf3UylIYitAPBgDrwsjDPB0SNEw9y3+MnTya+9hT900O
XS29HJ8mBICUaRx2X2g7ySCPrveystUSKKGFDnx+3BHK6+2PQoV7ho3UIj5HxRUd
Isr6jUIjI8nngOC+mukiT/8eZh0l2Kix8cMj3zuyZ1WHGkxozEK8aNXMxxi56o/d
GPAwqlQIMkh5uv5yX4bUqMlYTVV7E3oHCyzMrj2xw4W4J7ox9/f6sBHP33ZWBPTc
nCltuKBQcvpSQj401KqaPokh0eKolRSNza+A2tXPNLK7DnXgPIBGIYA8EAoGCmWP
79qGRv7h4S6NM+PWyfWDZT1enkxP/2oYpoi1XCRdQfPCUSiKJNvHPUhKtfpySTpo
51yOxQwQuEwNMPw+PVvT5QwBriJCg1XrUcM06CRb9ePw1YRbJgUBIgj+8q770LA4
Wwgwaqh0LgiZ05co1SMsnAITB0DP/rLdS4tsEGDlKUWO1dILT3PP8lOH3J+LmmgX
wXpC2E++vUOkWtkcgbFR1B9vJ7bHg4KT/a4duA7nV/s8vwL6TWE=
=camm
-----END PGP SIGNATURE-----

--ycFtVXGw3a18ZPQ3--
