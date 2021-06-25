Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5E23B45E1
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 16:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbhFYOkZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 10:40:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:36904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231781AbhFYOj6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 10:39:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D06F56195F;
        Fri, 25 Jun 2021 14:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624631857;
        bh=s0cTFYa1JQ99qUj+CFHAo5nxcucVrs3QZObi4WPiC/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Go/Ttv6T23mtBO1LoGP1wA1Zv35YsjeZr9U4WZfwTOQ7XuMUqoqTy3qu1EKkndquC
         QIpeCPS1qxrUW6ADj+GswgHaXoPLBRx70YlCSLaS8C4U0VwAFcKg2SxazjzF7hHWtZ
         WFahy69pmtLoLS+DgmukowRoV89q2N5oAUeM6cb5RFPAOI6abx83NZBgdi280pmLCx
         j0I+z3Bcz4osk7YuOHARzSiN80j+EqmyKp7XnpTnxy/OCKfn6xe7XaFrqtd/9gm/wM
         ltR5WnFvigqf4DV8GCQKpnviVomJkSStnQSV4IZQUgMrqi4e+3Q9lowsuuVDWBvGPm
         /mVyDlnz6NKqQ==
Date:   Fri, 25 Jun 2021 16:37:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     daire.mcnamara@microchip.com, cyril.jean@microchip.com,
        linux-i2c@vger.kernel.org, palmer@dabbelt.com, robh+dt@kernel.org,
        padmarao.begari@microchip.com, conor.dooley@microchip.com,
        devicetree@vger.kernel.org, lewis.hanly@microchip.com,
        david.abdurachmanov@gmail.com
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: microchip: Add Microchip
 PolarFire host binding
Message-ID: <YNXqLviYLPEPXPxR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>, daire.mcnamara@microchip.com,
        cyril.jean@microchip.com, linux-i2c@vger.kernel.org,
        palmer@dabbelt.com, robh+dt@kernel.org,
        padmarao.begari@microchip.com, conor.dooley@microchip.com,
        devicetree@vger.kernel.org, lewis.hanly@microchip.com,
        david.abdurachmanov@gmail.com
References: <20210512112024.1651757-1-daire.mcnamara@microchip.com>
 <20210512112024.1651757-2-daire.mcnamara@microchip.com>
 <1620844516.507815.204083.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="veEwAQT0a0h07yTD"
Content-Disposition: inline
In-Reply-To: <1620844516.507815.204083.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--veEwAQT0a0h07yTD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

> Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
>    19 |         #include <dt-bindings/clock/microchip,mpfs-clock.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.

I'd think this is only because the file has not hit -next yet?

Would you be so kind and review the bindings nonetheless?

Thank you and kind regards,

   Wolfram


--veEwAQT0a0h07yTD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDV6i4ACgkQFA3kzBSg
KbYSfhAAkbaOVn8uRG4od52XRGzsP17fnEGBKfaoQY5/+9E1ujRkWPYdS0QLA52C
UIikhdQYYSGMgX0xUBhKrM3YXEo1wNWEq59bAPjtl46yzPlSPs2h9I9xU1Q3uvwY
aqtMZC3hgK7OXmB2Y5221OHiAf4XAkd3qw+WhSl3BQnSP45C42SZ08GjuXVxcC9+
rEWG7AbzJME6LOWnlYtwjFYfwgF3gjLCsSyeaM8W6ZkndnUfUCRCULEJPFjr2/kY
9RjrSrEfxsHD2pQwC7rTu3AdUvP3vrsxnW5WNfqjlXORlZbBw8/0XgOQZNu51Dhg
gO/UCjfkzDOWe9mDh+rgq+lQ0bN3siV2BJpq72cZ0wjtX6lS0jM9XFXgzIbPsEEs
KWDFs76z6liQ0+dna+C57U1+i5JCePnzw/slJRrVy9oRYPFfYzgb1V/ieUzdBzxX
cFbzlYakr9b3f0sCu7sHqDXgrFXhOVqbH+6s+an9/cyeUGZzOX+ddVAxvMefrD95
SuMWj7WgVf3T4qka12Eq3MIf7cbgzyAqBBtjhnSxZ9MpToZ0cQA/cnvZ/x45/LoE
8XQ+UsdFXXnkEneE7KPYRT0o2YawUXSQvo5AuLThxOu1stDgR2MaMh0q66nHKCap
gfRicwoAsnyF5hJfugRqVByRZE5QkahH6q3Py1K1iE5cOqwOP7k=
=GuOg
-----END PGP SIGNATURE-----

--veEwAQT0a0h07yTD--
