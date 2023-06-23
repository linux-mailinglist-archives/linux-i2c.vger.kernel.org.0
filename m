Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 992B373B4EE
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 12:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbjFWKMN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 06:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbjFWKL6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 06:11:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FD02132
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 03:10:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 05D38619EF
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 10:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0C5C433C0;
        Fri, 23 Jun 2023 10:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687515011;
        bh=aS9o1mb8nWK5N199dnmFCuxzwgq6+TAxr+tfibfkS6U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KCNVVG5lITMp9VD8ZDYLfLpwmM18BEaxGsfrZTpyrDeIG3wAUjIYsTWEfnoxerMdg
         coDI/KvhRNm+5LECghiUYgyVpwLv3pYRu0mGdJ2m/C4cQ+uIAyn55jpcvVcJKrD29r
         nTu9hcuBdYnV+TvYR1ELsA7G51wjQhn+2+NCTtCgCgOnCz2mD1MgWI3/aSE4kOBgKb
         jfCKsXIHB0XUsDaf8CDF0LhighWEfYE1tNXEjZsh6OQ0IrikNWqyNgPSmsGVoRprv4
         WF93LfBs+BXCGVnzLoGz/YXPu9ZnR3jPIaoff84QGbxXkqxY3QofCoUVz+NabVMlti
         WCWKmw1H9I2lQ==
Date:   Fri, 23 Jun 2023 12:10:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Alexey Khoroshilov <khoroshilov@ispras.ru>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: hix5hd2: Make sure clk is disabled in remove
Message-ID: <ZJVvf1vxqeeq+UHW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alexey Khoroshilov <khoroshilov@ispras.ru>,
        Linux I2C <linux-i2c@vger.kernel.org>
References: <20230608225513.1151574-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LlwovOyBLx4vzW2p"
Content-Disposition: inline
In-Reply-To: <20230608225513.1151574-1-andi.shyti@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LlwovOyBLx4vzW2p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2023 at 12:55:13AM +0200, Andi Shyti wrote:
> From: Alexey Khoroshilov <khoroshilov@ispras.ru>
>=20
> pm_runtime_set_suspended() does not lead to call of suspend callback,
> so clk may be left undisabled in hix5hd2_i2c_remove().
>=20
> By the way, the patch adds error handling for clk_prepare_enable().
>=20
> Found by Linux Driver Verification project (linuxtesting.org).
>=20
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

I have now applied "[PATCH 05/15] i2c: busses: hix5hd2: Use
devm_clk_get_enabled()". Can this patch then be dropped entirely?


--LlwovOyBLx4vzW2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVb38ACgkQFA3kzBSg
KbZ65hAAktJdOS8GGvoZ0FBh8xjEH1IneqyToO+M4yRoJUH2eLnruV7pL25RbRDl
M7cYEeDTtZtHoXZO+XA4Nz9vzNM0rL0/yczUBBSc6hkuh1+KXUSVsfCUFR8mUY5K
3CcblxOsyk9DPM8J1vWt2YpJJeg2KDJ8rI1rs2RTZOqp3W/q3c0AntWFxX7ftOhp
Ehm/QPA9PtkWk0vlOjg6QHQQa14GyhDA4rlsbRLxc9LFVcstPWLjIh7zb8N+88ou
5Awah/3gSpomUTY02Md7i9XbpZ/LtsOi2+3Va2WAZ4wzj+0Po3LuhOxWXDqoN3cP
BXKkOUyh4oicl39+lqjV0vMJZXgIX7HqEM/LuKyfofFb7M+nqSQUreW+O5ENt3Ip
XpKH5wkbStUTG0yMOohIEFfJd8uHZZDEEto0TvnpIYN/ovS4D6aoe26Fy5HFbERC
Gn+rg51ehQIvBI0aGxOK4ZvZXsJwXW+gYIm0TDmqHa4EYDQFbAsRoJRrb0wGRz3P
PLqfer0WyukVf/heVLxMrxJb3+joR8NAYJsX6M/cjA/h1oknuyhbvIKtXh4FQZFa
53fxEfQftkJb8G/WnyZpbJj29hSXHV2kZLSrWlGuvmDeIgUTPWNmInv8rHSzVxGG
nE30VwIVhYnFW9rQ0OiAApvdQMNgQ2jqOWJ4guTTuMXPC5jjGFU=
=Hf0R
-----END PGP SIGNATURE-----

--LlwovOyBLx4vzW2p--
