Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4CC74DD897
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Mar 2022 11:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbiCRLAd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Mar 2022 07:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbiCRLAc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Mar 2022 07:00:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1EB194A8B;
        Fri, 18 Mar 2022 03:59:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 55DB16167A;
        Fri, 18 Mar 2022 10:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C39BC340E8;
        Fri, 18 Mar 2022 10:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647601152;
        bh=vyWz3nZcjmadxmmuXhgRCMEK5Ta8y0I/eQrQ/ZUD/3s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NZybcPM1cXdhSey7QtCWKQeMA1AqbBLATP7ZF9VXUHzq8H1vu5Z/dJjhw8Uf/hPeQ
         O1WT9HJGw/LobCGgFLgMUL/11ANxExYV7HNxo8idT5g9/Oi3OhYVMvr1xFxwaLlc5w
         ys45yTeteZ+ngd4ljfqcrCH/0YRn9TrMUIQhDnQO5nKLn4uIz4lDPczrW8tkZkCJEp
         sN6ESEVz8Ecmn60ad0J+t2Ousi+ghaIeo5PkfQBJBRsKGQ3e2raZ6iG3e7m/0I5hI9
         xWyVyu1i4Vy5PBefCMo0ozq14KapkgC7yw4JiGBndDEkkR7ScOr8anNGSFox0y8zRn
         BJl4lkd0zDcMw==
Date:   Fri, 18 Mar 2022 11:59:08 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v6 2/3] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Message-ID: <YjRl/DUeLIJJxuOi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220216074613.235725-1-patrick.rudolph@9elements.com>
 <20220216074613.235725-3-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7Nma04pQlY1cRCe6"
Content-Disposition: inline
In-Reply-To: <20220216074613.235725-3-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7Nma04pQlY1cRCe6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 08:46:11AM +0100, Patrick Rudolph wrote:
> Add support for the following Maxim chips using the existing PCA954x
> driver:
> - MAX7356
> - MAX7357
> - MAX7358
> - MAX7367
> - MAX7368
> - MAX7369
>=20
> All added Maxim chips behave like the PCA954x, where a single SMBUS byte
> write selects up to 8 channels to be bridged to the primary bus.
>=20
> The MAX7357 exposes 6 additional registers at Power-On-Reset and is
> configured to:
>  - Disabled interrupts on bus locked up detection
>  - Enable bus locked-up clearing
>  - Disconnect only locked bus instead of all channels
>=20
> While the MAX7357/MAX7358 have interrupt support, they don't act as
> interrupt controller like the PCA9545 does. Thus don't enable IRQ support
> and handle them like the PCA9548.
>=20
> Tested using the MAX7357 and verified that the stalled bus is disconnected
> while the other channels remain operational.
>=20
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

Peter, are you happy with this patch series?

All the best,

   Wolfram


--7Nma04pQlY1cRCe6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI0ZfwACgkQFA3kzBSg
KbYDDw//bVx/JYczUSag1uZnYX1KcJ+ylu1lZWgyL7TEQc8xeBluNsHUdkYXzway
9uGkQIcB6bLCAymsW88MnLCKGQImGnZT3KIxtCnGwp/K5tTzAxAZkVrvLy6zvnnG
xt+/rokDndBEQA8UThOp4iKlI5zCbpkCeNDXuu+AK95o0PNPP1w6smgCg86AnHzS
BpZM3FscZyFpaNdLY2vwvbEY/Po6E/KwJr12u2IAp3h2VCkmpf9L3cBfmY0A+y5u
ddrIwfTsTowa7rEX4HBzlU8Jo1pwN2NAVkeakMx2YE4Oq51aLO1M8w3LHouCCmwt
jZNMlG2R75eDvQlrggWoUHH+rV/nIPVyE29r9jKu+qiPzkqJjbdnjOzX3ftmPCNF
GmGOzTUITCgeyZVvuOzkK9qSYrK/xykM5C7rUMWKAxfUf0+k+CPJ+GJMEQquJ/ci
YRZsgjDsnvID27TNxhyjpUDGBsjG/tZNi+3wj6lbOURdr/1TgWQUfR38BxxtowG5
Ejm8mbXsQZ1cuIvPv7Swyk6soJSol+Cn5LPoN1dNSJgTMkUmztw34KGS46XRGrnU
PH/9CVeTXX4grWtQnfSc88r/6yrAaDHYnUwQOFxfIUteeaD7z0viVLnSXFWtvXXj
ibGjYU11QyrGp9Z4YAwg5khvGOcLoGNAhrlRy/Ew+TQDlyed7os=
=8TIT
-----END PGP SIGNATURE-----

--7Nma04pQlY1cRCe6--
