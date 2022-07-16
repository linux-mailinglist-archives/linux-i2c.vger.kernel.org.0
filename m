Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8238C576DC7
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Jul 2022 14:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiGPMSN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Jul 2022 08:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiGPMSM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Jul 2022 08:18:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E191F2D9
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 05:18:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA82C60FDC
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 12:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8614AC34115;
        Sat, 16 Jul 2022 12:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657973891;
        bh=oU31rYhlKhmO8cyIWRy3ZTL8beq/I30Os52Oef+lGLY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UGoHVTXZzNjMYbXndbO2610//8v7wZtlRzHVQ31BKYbWZwuuOfJQgEm+9IDD3zeYt
         ntPH0y1VXIWfs8FQtgnYsYN8u8pIAOzyBZt/xiKOQZlMByDJb32KsfrtJuSJrRkSge
         VVYlJYkbUvUg02jY1Vf6C5QL56Ou3nQI2zIUKI4x6ahkHCs46rtX2nVyfGY7lJdHLb
         bbQ/49J+GyKkAb2XkEnTuzq3P4U8bXhNqwYbjM3eRb/tAGsBmynVDpE+HPRGly/WGy
         3Bj07VrlNKUl1dxJRlOkbP/vkcZIgn4mZB2JJSDg0horBAtfJvtF2YuacGs9Q3R0zZ
         Avt9bo4PrLr9w==
Date:   Sat, 16 Jul 2022 14:18:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c 1/1] i2c: mlxcpld: Fix register setting for 400KHz
 frequency
Message-ID: <YtKsblHTiYFvqrQ6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>, linux-i2c@vger.kernel.org
References: <20220713091405.909-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AjO2hj0kja13HeBl"
Content-Disposition: inline
In-Reply-To: <20220713091405.909-1-vadimp@nvidia.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AjO2hj0kja13HeBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2022 at 12:14:05PM +0300, Vadim Pasternak wrote:
> Fix setting of 'Half Cycle' register for 400KHz frequency.
>=20
> Fixes: fa1049135c15 ("i2c: mlxcpld: Modify register setting for 400KHz fr=
equency")
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied to for-current, thanks!


--AjO2hj0kja13HeBl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLSrH4ACgkQFA3kzBSg
KbaQtw/+JQJWfuE2nubSgVhFmGZcIb7nyE+EjehRWVmbiUsFN7yYzofhTYHoXBPi
OsxrPLocPb26kwBgp6bOl6oq7p/B+2rJnndHqiDq30fAYGGo+T8XgOyxODCnZ3lF
6kJwNskTzNa7ETCRBBFYf6cuztL1e0Cni1YLr2pXvqdU+eJZYJRkSrcIZy2mg04m
ZBhOCX/AZtFdH+LsWFb2hbkIb0oU5ChtwczRPpVfYqLqy+vlegs7NehXb3I7Em0C
kUB/PqaetJI0epSq3aMrvEabNWSXGsXyxWa8IiAeYudyJfoU8J1u7WuFjkq2I1nN
OsQWajqi4FGIOW07+nZU2GdIbbUIa4mgC6x6W9jM5Br+VfRaFlWz8omnL4KFareK
kfdBRdH1lzPk/7BYgTUyfs06OhI+LcA8q0bu6Nz+AVO7iBz7ZLgSYrWPgKK6rD5G
mplys8Fv2oCQV5/cPHj3+aewqD8c9qaiOM2b13dEwFVxcEXgHycDf7vPCK/IPAYQ
+ClPTkEIOPXNeWzdOZgqHdEUuHx1q0qKWYnicXXWEtH1tFoFaYpBoL1nNVIoH6xb
/Uw6j0sKkT8W8WSjt8LidUkDjR3Ci9smyPxdAljIDHslyFM9FyiiU0Gbf4evmpWa
0zatVHyPHinLV4zjg2iuF6BBF+UE+5V0WGWd7eaY5gkyFHXB+JM=
=G9fT
-----END PGP SIGNATURE-----

--AjO2hj0kja13HeBl--
