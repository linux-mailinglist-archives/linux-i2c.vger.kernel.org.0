Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B960C24CD72
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Aug 2020 07:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725844AbgHUFyg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Aug 2020 01:54:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:48466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgHUFyg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Aug 2020 01:54:36 -0400
Received: from localhost (p54b332e1.dip0.t-ipconnect.de [84.179.50.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04F5220732;
        Fri, 21 Aug 2020 05:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597989275;
        bh=sfQwMzKqpVq/e+wz+HzlULH4g+NYZKj4aYW2m0QVbm4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DT8Pm1vvhmzuwosIITPXhMoO7XW7E1djHGPgQYb7YZoDeXT+RKoUV9B8tDHL9GvmY
         KAohHpFwo6NBK/xqSLwlr+GqWz9UHoNVZb9gwvY7UvOZ7C9SfH+bWTi9vmCntvt+P3
         vxUnDXvH/WsfFCMSJeWH/4Tst67g1oqLJu22vmVI=
Date:   Fri, 21 Aug 2020 07:54:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
        benh@kernel.crashing.org, brendanhiggins@google.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org
Subject: Re: [PATCH 3/5] i2c: aspeed: Mask IRQ status to relevant bits
Message-ID: <20200821055429.GA995@ninjato>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-4-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <20200820161152.22751-4-eajames@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	irq_received &= 0xf000ffff;

Can we have a define for this? Like ASPEED_I2CD_INTR_MASTER_IRQS or
something?


--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8/YZAACgkQFA3kzBSg
KbbHvA/+LimUqAb7M8S1x9RHr907IxGdPIa8H5nRyXeAN0PhiGmtKHMYwANpCAip
wyZ5LdiYTk3tNqNL3LljLxdoVVRSk3K15Jrqad9kizsVnl/nLTQvjmrJ4TeG1cVK
JjFpzG+x03OJLEMJnFlpi7NhMHdoIh+hq5EI6mDrLI1ZrwZUxQR+MwK3N45muVYJ
8BgObMV5NNBMISWWDVm7QvB7fQVxJCo18BoURhQzDXNqe1NuPBz/H5RPwLVjnnTd
cVewoBvY0+qd/kn+Rt1RUEYJbJwpnJp+XWOUkYJ0cC+ybaGVB8ggoMPWU4Qa6Ru8
vn5YSf/2Kn0L5Jqx7gwPcgEqzcUtsZBfZQZxMdMAezbgQx62IV80976o5m6aeMn4
svWGhKIH3cH6iuZnPJd3TDh3h6pAy7k4SHz+q/kVyb87j91E4RQZb4bf4a4GanC3
+CtynnK0bGpMiti0wnPT2huC3v0MrXwuNem8L/6/sM/rCr038+EWeb7LfgwKx8Oo
5qcjOK0kj7KVVoUNvzGu36v5onZm7PMxDap9xjZkgTulsL3z3xdD3rZFI3M6aEyH
U3tUQYMaE2NfTeSjqs2YWZdMzsGFe2xc1z7o8B2/kYC4S17wBHs10HHlJKXWmrRV
Ng9qE3y8rRyl/JiMztkyr4hshYWZ48cIOzH85FaSuAmXhphrOYk=
=q7yA
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
