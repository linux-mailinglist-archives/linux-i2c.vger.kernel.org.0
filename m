Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2195907E2
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 23:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbiHKVKC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 17:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiHKVJm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 17:09:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88F997D7E;
        Thu, 11 Aug 2022 14:09:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 947E1B8228B;
        Thu, 11 Aug 2022 21:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D02C433D6;
        Thu, 11 Aug 2022 21:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660252168;
        bh=enND3ZCxve5v3q5oNKf15ZlnO53yfkgBiF9ZmQ8VBEM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aCiyQFe/ycga/d6vYo8I00nSDmg2oTyJE8q+yMO0yK5CJ4TYkVdM2ZcjRSZFSNBcL
         paD1+JD/a6P7hjrfJDamed2TqNqWsajW4QVQX0h0SEQZVS2cw2jtTS6dNMZkk4iD/V
         lCjSJ1TwqtFZ2wa4sfLgmwLASWra2Tak9f6t9cY6qxLoif4U3Yg/p2jx8P7Z79M+EF
         qVgRtz6t9RXJuI392psLybKSXngZqTxKRru5J3GK4GYDidm468lt1bfG6JVbHdnmbX
         0F1X8/s+uVA0xzt25mb9Wc5dk3NTqmXhayF5+dbDzZPHur6krYA+wGIbXKYGKSEFXy
         MZ4NF90DmPXuw==
Date:   Thu, 11 Aug 2022 23:09:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     luca.ceresoli@bootlin.com, Peter Rosin <peda@axentia.se>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] docs: i2c: i2c-topology: fix incorrect heading
Message-ID: <YvVwBPttiau/E/Zg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, luca.ceresoli@bootlin.com,
        Peter Rosin <peda@axentia.se>, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
 <20220808141708.1021103-7-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pcSd5J8a3TpU5ESz"
Content-Disposition: inline
In-Reply-To: <20220808141708.1021103-7-luca.ceresoli@bootlin.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pcSd5J8a3TpU5ESz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2022 at 04:17:05PM +0200, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> "Etc" here was never meant to be a heading, it became one while converting
> to ReST.
>=20
> It would be easy to just convert it to plain text, but rather remove it a=
nd
> add an introductory text before the list that conveys the same meaning but
> with a better reading flow.
>=20
> Fixes: ccf988b66d69 ("docs: i2c: convert to ReST and add to driver-api bo=
okset")
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Peter, are you fine with this change?


--pcSd5J8a3TpU5ESz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL1cAQACgkQFA3kzBSg
KbbqHQ/7BKturcDyCN2rj4sbcG8TmQHpFQVO0oCj6sMm0NXUaDYo+ZJYUmH1SVOp
gIMQ7AzeTuP46wGTDii6qv3U9nxlEEAu9ZMVSQ+AyzP0zNRT/tq5kLvzC9jmD403
egL5Do1elVMJt3wUdImEZvG6iOAGdzGL2m8OnWX4plelOP52mFPi2tOppqbzbnbf
0wXyUtzTUz2LwYPr/PAqX+VAkaNYOci/9g3CM5djbRA2uOBKeF5xeJ4kiG88EK06
otfoE3K6cob/GNXBzEydzdJJwEm3hyll/fXDktBds/GpPxoH+kUVmVekzetZm0TS
QPsjJJHNsqm+HCVrJvRHPqem2gH62mkdaFiVlzoEc8YYBK3LKfzzRxSoWYWZxkBB
v6ipFAhDjzH6ZypVXBH2bzVqMR7uohAB2yv91/ZV1rL5Ndhv9HTzDCFGdfG4+Shi
NRJrpiqmvukRaFTxLAKJEinDghqPxifU+itCnvGHBgtKZYlw+4jmzNLUyfb82JPv
OA4mfoYoCkkbEoMl7xPRNp4hzRuq/bqVtaI35Lsh9lbxsiJIWOwtFRyy/u+Zx5bz
Eul2ODe9ti6IFmmBry2JlueNJBI9SuvM5q7LG4k5udGzGUX71zcckelfzgrg4b8o
hg3xtAVIe5HyzkVcHg9cwi/kUAN8aJlMwL2M39lji4yoPaUJh5Q=
=g9EU
-----END PGP SIGNATURE-----

--pcSd5J8a3TpU5ESz--
