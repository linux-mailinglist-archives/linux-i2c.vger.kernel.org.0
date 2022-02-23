Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035404C14EB
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Feb 2022 15:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236819AbiBWOA1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Feb 2022 09:00:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235164AbiBWOAZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Feb 2022 09:00:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61309B0D01;
        Wed, 23 Feb 2022 05:59:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA49F61637;
        Wed, 23 Feb 2022 13:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78F0C340E7;
        Wed, 23 Feb 2022 13:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645624797;
        bh=Bke8ApiyRMkH98UdJHHP3kEbMKnEWTq7NDJSUsa5F3o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sg92A5NLq8Tajr7dVhN7myJdFwU+RbgVRsX70RkREaYadj8q5FWfs0lJBjsiT6Oti
         TzUyBp1FxADWnvKYry2yPTMr3rmJTxBDBZx8uLrH2AiH86qZgjTaNntcZTWcR/R0BK
         FqxCxFJaYUtyaFLj51vHmVq4ZwcWfHqkm8J7Viy4LtavmVtGKbCOHZz8zraJu7VsmW
         m6cGg+5TQNxUyS6X2A2hLm9EhSexy0m+hyLtWGPXz3IM3BaoUaNYv0iiD3JBxaunAc
         ku/M0TkhT/hE83zxX0iEMGTSw/+4gwcDm4Oh96bed0R4wVmhGwgRNLVtE3g7QZMUXm
         Jd9cmG8H0qDsg==
Date:   Wed, 23 Feb 2022 14:59:54 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, git@xilinx.com, michal.simek@xilinx.com,
        linux-kernel@vger.kernel.org, Chirag Parekh <chiragp@xilinx.com>
Subject: Re: [PATCH] i2c: cadence: Recover bus after controller reset
Message-ID: <YhY92v3ItYdGV2r2@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, git@xilinx.com, michal.simek@xilinx.com,
        linux-kernel@vger.kernel.org, Chirag Parekh <chiragp@xilinx.com>
References: <20220222134632.18598-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Dj3IRKXjHGCl9lf6"
Content-Disposition: inline
In-Reply-To: <20220222134632.18598-1-shubhrajyoti.datta@xilinx.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Dj3IRKXjHGCl9lf6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 07:16:32PM +0530, Shubhrajyoti Datta wrote:
> From: Chirag Parekh <chiragp@xilinx.com>
>=20
> This will save from potential lock-up caused when I2c master controller
> resets in the middle of transfer and the slave is holding SDA line to
> transmit more data.
>=20
> Signed-off-by: Chirag Parekh <chiragp@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

The comment from last version has not been clarified or addressed.

http://patchwork.ozlabs.org/project/linux-i2c/patch/20211129090116.16628-1-=
shubhrajyoti.datta@xilinx.com/


--Dj3IRKXjHGCl9lf6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIWPdYACgkQFA3kzBSg
KbYMGBAApeNCqNYWDYaI9U1cx/3QE8qQSoKuZHN4Ps1URnOK9pvXVMOT9hPkMBNO
7mTtUoHReSI3xg2a15/W6Xnlo3a3p38eXOI8R/W5BC18p3VO4BUcatHwmSzoPbJ2
Z5xr+F7RyIW5LMDGwWO+6Zach8pBYod1scqZ0xzU1gLe+zlXxxKxdG8TBGG0lOEb
u9dY+/vANLl+zmvKBUG0zUhv7iW+qse6aC3zh18EJ96QRXcsxT9cluGfPCTzDOsU
Vj50HGPKhJ1IjYSTUXeC5H4nt4X23tMQqCTiJSrdF0k8NvPAh3D0Gf3cFp0rVWBA
nXwSydUswuWAXfHAfuRVuDRvlvornn2IAJp7js1a2oqrXTgDxP1ari9rQTEPwBs+
kD5uzsNkfBijjv5HtCI/cWYC/NNoBJ1eo3XyVuVnYpUmTgpE0gVeodIKfJI3H/4x
fLwuZfKVt1kaECFIzHLOteERHROPt5fmKJHNZJ2fqHDMPeQyp5CG/IC4fCW7t+kU
dMfh+uxZxk63Dw/5D86L9VnOnTy/Ak02yYEwH/agTJKLHdIvzAgvu6MvC2dmqckx
j0t7ycg/uqkjRjvnV1ciDoIXYRjPEEBD4CffLhPPW3uMlYstYTMptlE5rSY5aYZb
TXP5ROrEa3Wu6/sjt2lxPdKRW0T58sg8P5Abyo2ZnontF/xlOxo=
=eStT
-----END PGP SIGNATURE-----

--Dj3IRKXjHGCl9lf6--
