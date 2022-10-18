Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33A4C602E2F
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Oct 2022 16:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbiJROUE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Oct 2022 10:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbiJROT6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Oct 2022 10:19:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92AED34721;
        Tue, 18 Oct 2022 07:19:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 45F91615B7;
        Tue, 18 Oct 2022 14:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29293C433D7;
        Tue, 18 Oct 2022 14:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666102787;
        bh=UwmPyOiwydUIdoR7qtf/m6yxy1stYEPyZMeeo4TZY14=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R036K5fJI9bW6k3F8MXTK0o6oXd0L9l0JJIuXDgvJRQ+DpELLMrnQaskuGzQ3PNpl
         5SrOaU0RImyCgy32sfxC5eRRZkNEp6CCLBW25aO6x1Bkln65rxCmf2mpg9TCz8kk9K
         49nf3vSPxpB+mdHV2ZtAVD3BEBnCBh7pwwRRqLSzYJO7BjyixoCxxzoTaYPiDq+78S
         iXL/ctAVdWpKPxyEKulq9MR5haIiI0mMw/eriYtqI2GRCtgocVOI8ygVejKRrEr0CY
         G18dGkYqF/f23stp1lqmkQTbEwj7EgOANQq23OrqgNibEnsHfKKVxnzI31IUVj6WEO
         H7UcJvj2YRQqw==
Date:   Tue, 18 Oct 2022 16:19:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Michal Simek <michal.simek@amd.com>
Cc:     tumic@gpxsee.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Lizhi Hou <lizhi.hou@amd.com>,
        Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Subject: Re: [PATCH v3 1/2] i2c: xiic: Added platform module alias for the
 xiic I2C driver
Message-ID: <Y062ANTWvCy4e4XT@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Michal Simek <michal.simek@amd.com>, tumic@gpxsee.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Lizhi Hou <lizhi.hou@amd.com>,
        Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
References: <20221018140338.7080-1-tumic@gpxsee.org>
 <20221018140338.7080-2-tumic@gpxsee.org>
 <611cd6ff-e6f1-ceed-b2eb-7dcbbf18b36b@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Dgrm/z4i6fDpduV7"
Content-Disposition: inline
In-Reply-To: <611cd6ff-e6f1-ceed-b2eb-7dcbbf18b36b@amd.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Dgrm/z4i6fDpduV7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> You should likely send it separately because this will go via different
> maintainer tree.
>=20
> Not a problem with this patch.
>=20
> Acked-by: Michal Simek <michal.simek@amd.com>

I'll pick it, no problems.


--Dgrm/z4i6fDpduV7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNOtfwACgkQFA3kzBSg
Kba/nA//bRwF+nTsr5x6lTTadUjNVu/UZ30i4nbf4nmtXG6YyQIkO8uQctkW0x7B
DD7Cquhh+7Ub6L0PQm/L1L4eaevdtpo/5mMzrbSO4pNkzkyBtTSGYYTxlJJtE+Tk
APLHphVmBeMcObGyP/MElkjUMPCjyTcBHiKKljMa0M4Uqn0K3vPmJbppGVVAb00W
U6AksjJbjVJGX+1TqhW/I6/+oZ+GXmtd03MUfxh17bkw0ZU1HGnQwex+0FcypFur
32mlhl3M5ASMr/xe2kjA+2UPfaRXAWBlT+mX20bWcel70kIYMFX1LF/B4kntR3HY
xaLd3qnbwez/hfGNukcScXIgZEOZEPSDbAB9rxZAlfUOsJIMtmy4f+ijDJiy2ddZ
FOawoo09Hxyucu9GnzYeOajAXIWP52wsBzBNYuC3QVfCC4cGtKQ9NzxcpsoReAZw
D3FJAQ/U5Ty6OnQ2IyLOm+TigJ67w0eEV4xOXl89z6Rznd8WpbYraoVgxrktTZ5a
2O6jwZyklrZNZ9oRny1WYsgZ6jRiU9ZkNZYfLer9+EN1FA0rmGaIo3hNtZAjaSNK
icr9shXMj5bs/azDko7ZgRO7TTcIuVluypfZz9Q2XZIjfUlR84adH8BEKsz90xGw
ZLfH6atu+u4M5FoZ+KelDHwQ98c7qmHeqUqTIHNrD0mHDcgW8oE=
=vNmL
-----END PGP SIGNATURE-----

--Dgrm/z4i6fDpduV7--
