Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE4F4C8EDF
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 16:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbiCAPYm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 10:24:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232250AbiCAPYl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 10:24:41 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0DA3EBBE;
        Tue,  1 Mar 2022 07:24:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8BC45616AC;
        Tue,  1 Mar 2022 15:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CA6C340F0;
        Tue,  1 Mar 2022 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646148239;
        bh=H8InDEF3XW6EnD8MeXWjCxgu9Q/FK190kWhwHDJaj8A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H6NUanA3HRwo76slofFpH8WtqTE7X4VRtO7hJwxJN/dD3yGpAS2448XRbvQ5S9Elw
         cePWVe+ZbMX1//lJDNGuyV06OcZDcO1NdRX4mK/JtUVAVBapV9jhGFzP7qXv5Kpk+y
         bUYT5sQSs3MMDMHjRZudslLo5LvKiSVyuGvXsukPU8xAKqfc3RbcAX31xEaSmlYS8z
         JDYkdFLD6OflOPy8ufdbzbCHBQXf4qK93l7rvKlF2Zjzspt+Y0DrizeVb1sgP8zFPg
         98skrXArzQ40TadadRjBM2DEBSBM48bSHGximsaylrQnLj4/8+Yh82xPoJwViCyIrZ
         bpDK6YGPmFz1Q==
Date:   Tue, 1 Mar 2022 16:23:56 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Xu Wang <vulab@iscas.ac.cn>
Cc:     qii.wang@mediatek.com, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mediatek: remove redundant null check
Message-ID: <Yh46jPyQaExz0Xua@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Xu Wang <vulab@iscas.ac.cn>, qii.wang@mediatek.com,
        matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200930084233.53085-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DFAqbdottttrwCWu"
Content-Disposition: inline
In-Reply-To: <20200930084233.53085-1-vulab@iscas.ac.cn>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DFAqbdottttrwCWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 08:42:33AM +0000, Xu Wang wrote:
> Because clk_disable_unprepare already checked NULL clock parameter,
> so the additional checks are unnecessary, just remove it
>=20
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Missed Qii Wang's ack so far, sorry. Applied to for-next, thanks!


--DFAqbdottttrwCWu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIeOogACgkQFA3kzBSg
KbZfxRAAqkBiWxzxphWUAK/0YEAg5hksVJDpRGzv+KQzCLt4VxeOS0fcltsz4PlS
+1zF27icgR2bd6KdMoHO+AoKUhyUwUYHV8m5FAhGyiYdJKEiYMiY9pgxc3Gp1NeO
JXiU3KrBKYu4LsuzG+SEsRlU9CRHvSZoRiDcLwwsZwhZkgatq5bXASphmCAWjOif
TgpRBDyICwm1HwHxlf0wuQzTTRxCHc7s49ntiwRUnDa1jcAjeJ+JC7oGwWXmDqa0
UBewHULIn4QirpU//eLI/sJIMmHGIzeaOe2UYGr1cVYL0bs/wOWtx/yxr1HcgUpz
CljWQtmCUNuJRXsmgCC85NrGJDZXI90fCvJwfQW3eV44XLVeQdywqpvKo7kL5Agx
J5lt3dXNbukqJR8a0kzeUVgVsV0feujgggnpXLxIw+K7+jXfh7Cq+0tZsilKdR5x
3oyz3bTNksE2HCXvjtDlyn0fLoHkc50eX4YwRXyVmcQCC2+rziBD5JvCKtuKZ+jb
w8Di73R66Rt0TKzmUsxIV2467wUEnv65WZHTcleWUhlk6IRa1jRj1OB5VNgs2IMX
ChgXAY9RRTAO/O8S/2IPfP/lTWmdDWGSUrTJ/0FjGIUCS8+4lQdEmuXj2BcJwCzY
sVBNjKgwEVnWaB0aF8kBkIDJ4zCZYwwBMkZrN41AjKj/OHdk2a8=
=IYnt
-----END PGP SIGNATURE-----

--DFAqbdottttrwCWu--
