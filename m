Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD88A6F27E6
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Apr 2023 09:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjD3HGF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Apr 2023 03:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjD3HGE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Apr 2023 03:06:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2727719A2;
        Sun, 30 Apr 2023 00:06:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 90E1260E08;
        Sun, 30 Apr 2023 07:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44334C433EF;
        Sun, 30 Apr 2023 07:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682838360;
        bh=nG03ZamBT2oRAqwOft9tIDjMEkOdLhGVnWdGCxwgdRs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VZrMtNX9u1uJcw5MzqcGkTp/yaBXacMDOtLb/kZrs/OY4hA3Ip9PgnYkVc7R9WTZB
         b0rPz8SksH6ZH6MI9uUDJ+pqV+MkkawkubS2YHMwAsw/Nd/bH+W2Ou1oNdmIo21jM/
         zdA6glIpK2ExayWcszoeHBtpck2Juz1T+2nIKUYF4C4dVkiQngyufoG4QJeaNmxHLO
         JHzVytPBD/kGVPBir8YTVS+kuILcRAT5QLQJmRyxXI+4aUOthRGo102qgDtE0HYiNn
         whWuSaf2v4EksGJzJgvYFTn8QNaFZkPM+zecpnBVWzqfRpW55oSU1FAyOZKefsYDmc
         tDL790jpryFtA==
Date:   Sun, 30 Apr 2023 09:05:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Marc Kleine-Budde <mkl@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "A. Sverdlin" <alexander.sverdlin@siemens.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: lpi2c: cache peripheral clock rate
Message-ID: <ZE4TU0rCw9MSwrmB@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "A. Sverdlin" <alexander.sverdlin@siemens.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230310130815.562418-1-alexander.sverdlin@siemens.com>
 <9272339.EvYhyI6sBW@steina-w>
 <20230421-kinfolk-glancing-e185fd9c47b4-mkl@pengutronix.de>
 <4797405.GXAFRqVoOG@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0V48hNfsy+qdyek6"
Content-Disposition: inline
In-Reply-To: <4797405.GXAFRqVoOG@steina-w>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0V48hNfsy+qdyek6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > IIRC this is a general problem^w limitation of the clock framework,
> > clock providers cannot use clocks themselves in certain callback, e.g.
> > set_rate.
>=20
> Well, that's essentially impossible when this clock provider is attached =
via=20
> i2c. i2c transfers potentially need to change or prepare clocks.

So, as I get it, this is not a specific lpi2c problem but affecting any
I2C controller driver which uses get_rate() to setup a transfer to a
remote I2C clock provider? And this lockdep warning is a false-positive?


--0V48hNfsy+qdyek6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmROE1MACgkQFA3kzBSg
KbY9IhAAgLo8PSbFxem7+yW32eqHDssVomd/c07FPtFDLUi2XW1n/roLDv0Q1BWa
NXHyl6RkiW8k25kzh2Q9nMLKvF6NnZKn/yynAIZnAKPK2Yly0V6oPAjA5Wlbovr5
q18FajnSElq9MZBXgmQSUrI/YtuFpDTxSYUgv6yWKqYMt4Z4u05qbcncNe/CTPH9
7MsV+PXRozwQbA2AHZWSFRY6vVTFISFtflf8BSP6JI3WOynUquZCeEzbSDQ/1Q7d
Uw0dolCi3oQTS/7z82fZsHHfeZlyg0q+kaBC7NyHtGUhNF0LdrriJtLkzog5AS8H
3QBa8UvborMCh1ytGb6nU+m1SmnUzYTXkKhz+gScGYuV6puq5BJBC3zj8rFQsyqP
Iz7AoDPTsHtWffVsz1CsakqC0ioXxgD2T7SSMMXKugI7Gt99feVx1Ojgu+AT7fCE
Q+Yi+XiXggjvlnTwg6YP0HtC07JN8v4z+4/WeOANcTT3ZausYyxoUmj6YUE3eJXv
M4jVjGecVKfhdblXpplgG7W6zU3pEcJ6FMBWkwT3/vu7dUtAcZFbdIrMmC3HlrvP
PPaGllJEqlgbFCJUU4BDjF7TQ1yY204FRmNIm+nfSOqMcrTkNMF/jo9/j6FGrz4O
YSeQR7br6xCfGO+yxCEetsB1BWvQc6Ebw+xgX4N3uYSekN/HhyM=
=YJB/
-----END PGP SIGNATURE-----

--0V48hNfsy+qdyek6--
