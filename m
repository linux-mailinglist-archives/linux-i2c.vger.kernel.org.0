Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECE052F937
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 08:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237613AbiEUGSq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 02:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233827AbiEUGSq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 02:18:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4886E16D5E3
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 23:18:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 07F54B82E29
        for <linux-i2c@vger.kernel.org>; Sat, 21 May 2022 06:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38F5C385A5;
        Sat, 21 May 2022 06:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653113922;
        bh=jU+XrLaLSh35ziRsEYL9VJuyeCZ/6A5rSA7NXvGhK6E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vKxQVa0RETD3oEF3u590/wRsJPghtVUB2lr+EerBSPF5lKSDl3fVuMVPuIcY8IbI5
         tdvhrH4GGQ/gtN7J3l38NqrQBN6KNB+5CYLScRpG5JPsHO2yxs3ALjxI/1ZDW/So86
         vqqf9F4jPfeXuoP3yH8dA6VeDgyGpQ47n5DfAjaescnhUMQTuprUeFnbRCuWtCGf4S
         yB4WJvv3bOQvp1rj5fVIlRtXr+ZBd+jHUss2p1cbQBuYexWgxyMBBfuOpcNdW7rmmC
         5+iIDL9TNnKo9mPaHvprvFC1TeYM8XyTb/oNsIJJeHIauOdnKZRa9AphmCRVsvGBcj
         4V50+Nr+cYDFg==
Date:   Sat, 21 May 2022 08:18:38 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git@xilinx.com
Subject: Re: [PATCH v2] i2c: xiic: Correct the datatype for rx_watermark
Message-ID: <YoiEPm2RAEaBNU63@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git@xilinx.com
References: <20220517053452.1526862-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NyHtdcaeOEDYPhbW"
Content-Disposition: inline
In-Reply-To: <20220517053452.1526862-1-shubhrajyoti.datta@xilinx.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NyHtdcaeOEDYPhbW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 11:04:52AM +0530, Shubhrajyoti Datta wrote:
> The message length data type should be u16 as per the i2c_msg structure.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Applied to for-next, thanks!


--NyHtdcaeOEDYPhbW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIhD4ACgkQFA3kzBSg
Kba/Uw//YvYolBdKaLFZVER82V7Q/XI0IRuLxM9BsuTi7+u9Du+9YrxGynDIS/2w
IlcWJJxRjOAcZLWFsTtqUT2hWVuKXSYmKwA0EzWkrY/abu9ByZp/tKUwGgk4Ls4x
zqMQAou+JBBAkMPOnv+xmBU/eQ2wKxPlpdHe9Z1542Cdwk0WirdQbqfc8NX8+S2P
cZwNoDXf388fiQ0wuzIbxu6HDP8I2N+f2xlR3pAtmWs4SZYhuvlJGw09BTZLvSFG
ucXL7lhR96nZhVWbKWy/Ki4IgoB7x7sMr5t4s2E+t+i7MvEmLg7HPoMsNNicfYpT
swV4COQz5dCuqaeDDcGa/JYMCYkHMLtjMmkOxskzyEB6ufQA17fEAUO9MXu493lX
mhvmcRz+8jZJJzT/d6a/XeJ/abNHNoPec7IkZwTPdGaV5PNDavEkFQ8yo91hNIdj
uGfZIKEz7ytOJAurGZ7d2Uxy7CRjSEpUbDgmWhrPDj32CviJRKXvOX9zYK9K1BZg
whZIEGMaQ5Q52jfcAtz5Ua/FEyiEwwPRvaeJGcSCFatLeX4ISmp13DI97wjmo+1G
0EJeb2aNZZLG2Q6W7Ur6LLTvQEGiecPF425RV8z8dCGy+fphRJGC0q4QhukiDlF1
VHb5533V1PnW0tylvh2Z+46W2oDhTy0YryIwFWpTegSvcGaj4Fc=
=cyQW
-----END PGP SIGNATURE-----

--NyHtdcaeOEDYPhbW--
