Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8165907DC
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 23:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236649AbiHKVIy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 17:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236412AbiHKVIe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 17:08:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD5F9F1BA;
        Thu, 11 Aug 2022 14:07:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D3819613E2;
        Thu, 11 Aug 2022 21:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A37C433C1;
        Thu, 11 Aug 2022 21:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660252048;
        bh=zlW8LLbZb9w/cdC/x0la32GQJT5FMNE+zhGAaWloQ4A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tYN3jpopYGyInx8P1fH4t4bUtrBWda5Rby70A5x/WgYQUFJS4HA4YFzqIp1NDKVfn
         fYc25EodncdrcKWT4yJJkb7K+P2yaMcUENZRNN3wNCIKhylqTfv0CTn4z7h8wfCjVX
         pYivWYP2wsjxzqX7zk28CucyOKSu9pi76kFqaS46+MTZl5uTRjkAt1IEN5+6QQ0pHQ
         1UOQfKS82R84Vs0BPhE47K3m6zx7py1EljPt0i3sDkB9Ht74CvrEUyA3yVzsopRj8w
         zR2F9gwmYKK9hwMTW7fyYU1R5kR+Y/Zxj6TlA8Gc/iBmnZFWXI74oHvtrU54N/y+C6
         lB8FxgWRwOZvw==
Date:   Thu, 11 Aug 2022 23:07:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     luca.ceresoli@bootlin.com
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] docs: i2c: instantiating-devices: add syntax
 coloring to dts and C blocks
Message-ID: <YvVvjAboUbyRd9dE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, luca.ceresoli@bootlin.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
 <20220808141708.1021103-6-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qxCtugnycnmM6EJg"
Content-Disposition: inline
In-Reply-To: <20220808141708.1021103-6-luca.ceresoli@bootlin.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qxCtugnycnmM6EJg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2022 at 04:17:04PM +0200, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> These blocks can be nicely coloured via Sphinx.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to for-current, thanks!


--qxCtugnycnmM6EJg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL1b4wACgkQFA3kzBSg
Kba0Lg//bW9Wl9lW2fzXvmvUggZkXQ8G7waUN+ZYORtJCqLjt1qp9NqsHR13OH2W
2DcSznP9XMT89eefkEZpOQwKUD367jI3bSUuod99qcoJV/C/4cUF3wBfZN8kkrT3
erwETtZDWdnvW37D6bj0kDrUJu/N5+Ii6plCdY2+RoN82Hvi+GEwYkl1kX40tYY+
ETbzIiBnVkLGHZ0xowB+nkF00/ariGtrDcYv698Ob47SsdKuxagbhPrwETt4LjPT
oG03cZFBZhE540MNrhqFHh+BVWjEJHJ4ORR4EtEvz5jE3hTuvB1BVxKqxEJBoeF3
/QuSDyU9s/2pWVea5h7BxcA/2Rf3Q0zkQmEIVwA6DZmIU/iwmYkFOVLR6/617dTP
nPWf1eBGWLvKhBou1KyZGS6peu1oGWqqIaLHiZ4Ye8kj6UBCrcoHx5eJR1gIDv8f
GdSO7R4nYymxDv8hB0VyIyU+RDaGtCygbpVYx9FKXzT7kk7aHnYBpMalVPVx6LlU
Ltll4Kbx+fxrcDBybo9Vk8m+YwcNl3Tx8ZkR9F2rDkI8cF3iezdkzS7wKQebSf5e
BJyGbQWnntyRo2iXrCIYWYimN5REnaJFqwnUEV3AV7v13EE8iWHfZvH+gGl7Dzbo
iO3dyDopT1iLOv83nm58JU9tWbm8uO7sC1GirsrDwnvPK5OSNnU=
=/Z+r
-----END PGP SIGNATURE-----

--qxCtugnycnmM6EJg--
