Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3769461474
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 13:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbhK2MFo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 07:05:44 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:52806 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbhK2MDo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 07:03:44 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9EB7961309
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 12:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474C6C004E1;
        Mon, 29 Nov 2021 12:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638187226;
        bh=t/eWkMM+vjJ/x1jz544HWgaK1u7elz2lMbEpUH/n1nI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G/bEJLBVZPzDlOHae9FqOae/IbnIuJgLI4Y/ddVPI3EE3JibX6A/6jw+WTxJSLO89
         safuGc6btYRQGlI2CdwWV3+awruOH0ZvZYGp/FEQR002R7GYK9AVVwM5a1MzmEWPzK
         KO7q9Mf8zItFOB5/ffusxl04GleszhVI78hMfwp2SvOAMmMNytwJKxBIApyLfOlPlJ
         Nk05K9sJe2OIWDQnIB/aseD2K9ruJYaMOkVuSuo5fVlNDX5SzqsBtp0I42Dz4Vcz0R
         hxIddxwuSG8JOlthoNVFLZ93XGPQ8L5chodPMlfxICA7qW7K31fTNxHjv+aKjV4rTv
         SFWoNBer49c9A==
Date:   Mon, 29 Nov 2021 13:00:22 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>,
        Chirag Parekh <chiragp@xilinx.com>
Subject: Re: [PATCH v2] i2c: cadence: Add standard bus recovery support
Message-ID: <YaTA1j/yrCe1gGOv@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>,
        Chirag Parekh <chiragp@xilinx.com>
References: <20211129090116.16628-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JdFguHgDrJYyfbfF"
Content-Disposition: inline
In-Reply-To: <20211129090116.16628-1-shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JdFguHgDrJYyfbfF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2021 at 02:31:16PM +0530, Shubhrajyoti Datta wrote:
> From: Robert Hancock <robert.hancock@calian.com>
>=20
> Hook up the standard GPIO/pinctrl-based recovery support for this
> driver.
>=20
> Based on a patch "i2c: cadence: Recover bus after controller reset" by
> Chirag Parekh in the Xilinx kernel Git tree, but simplified to make use
> of more common code.

Guys, sorry for the long delay.

>  	if (time_left =3D=3D 0) {
> +		i2c_recover_bus(adap);

According to I2C specs, recovery should be done at the beginning of a
transfer when SDA is detected low. I think this makes sense because
other issues may have stalled the bus as well (e.g. broken bootloader).
Makes sense?


--JdFguHgDrJYyfbfF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkwNYACgkQFA3kzBSg
KbbJgw/9GTxkV3/DzaMGOzke3qZNjUpTfvd7gggz1RFDdflfjCF2BWTphtJNPYkp
C0JWqrSCDViDPOkqfE7AR+SOhCIyAgHPQcqzoRgEBVkbv4ZPn06yZ/72brOPvzlS
7rXJ6OhoOhfV7GqPxiOyL/cudCAWkPlNqOUyQCHzaSuC5ypppFCuPjnBLy0JDoXk
hz+B7EHE2mH1qdDfbWU2e8c/3ssNsaC1A0La/efBLmJu3F/7Ce1sceFu0tGH1+i0
5UdrXaWLcQOfCiaRHtCQn8gvEuqu289LflMc//jloqyj2H/1xnQ/1b0wrwbBWJRl
xdZ6YqbFXLosDkWTdNTg0UkFiRFrywavMi6JeF0YMrI0o8cmYENTm87Du6+ApCLi
apnsLOhHmd62Ea6TG18hXm97SDd1zALgX91TjJfEG0JHuEoQuyy92EAmdMGL2Ek5
Mw60SYfWdahb4FGklKw9AQAgU4DAkdaKWwS2Ovh2lxl5GFiU4EwvCB0YERBiGFFX
s4GLzxU7MU1NweAowXW6rKeeaF25NdqdNQlxSX4VwmzHOJzGishTKw67xYCZ1JLF
U6MoDxFsjN18pcE/0cPU6KYo3NrLfQghkfjD/reBP/ECu3qrqx80BtZElCBY4W4a
xkU9PnO7txMvT2cUCeOdbKJ+UWS93AaVNU3VbdAaCwwxDUiCa5c=
=ub/j
-----END PGP SIGNATURE-----

--JdFguHgDrJYyfbfF--
