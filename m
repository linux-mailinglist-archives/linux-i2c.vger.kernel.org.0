Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6384B376BFE
	for <lists+linux-i2c@lfdr.de>; Sat,  8 May 2021 00:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbhEGWEM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 18:04:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:50848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229470AbhEGWEL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 May 2021 18:04:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89DA061057;
        Fri,  7 May 2021 22:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620424991;
        bh=sA09KIpzJKWdrqUAHqp2pecsUq/VpgCkrBtpk2n2z5k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qfZaF/u/tDgFEvGNxz8ZgmCCa7/RHm5wUtmr64NFEwsmyJUzqbztWeyD+UPe6rVEn
         01+wFrnzLSUP0HmyDD+yJOGY6AZ+hqwKO4ESfOLt2p8noqH5sUNSBcWzxkK1CgEgPp
         pRXm131EczNg3m6D5sh6bTYKJ2Idodf+tC17Tk7F2Lu26TEQL/ASJn/ORJIpC//N4p
         U1bFs84qmAY2OFJYdMpR1RLN7e62p6LTNbR70Wl54+g9FOpak4Y6sRUd5Ci+LS1dMa
         ZEJ+AYXX0OTdPftT7F1yvjmqvfiQGNFbhTvuAt4m9ZG0PfxP72Adgid0pnMtPIDNgm
         klFvmEACdyi4w==
Date:   Sat, 8 May 2021 00:02:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: Move i2c-omap.txt to YAML format
Message-ID: <20210507220257.GA1612@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Vignesh Raghavendra <vigneshr@ti.com>, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>
References: <20210506140026.31254-1-vigneshr@ti.com>
 <f7570cb4-8c21-2fa5-bd26-1388f2a4bd6b@ti.com>
 <429a740a-c2b9-1cf8-ed2b-0fb7b1bea422@ti.com>
 <20210507163602.219894f4@aktux>
 <1ef076ac-e0de-a0df-a918-aeb8ed6c5956@ti.com>
 <20210507214323.GB2902038@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <20210507214323.GB2902038@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Actually, for DMA with I2C I'd like to see someone show a usecase=20
> and data where it's actually beneficial.=20

The usecase I mostly hear is transferring firmware from/to the i2c
client. Something up to 1MB sent in 64KB chunks. Haven't had this myself
on the desk, though.


--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCVuQ0ACgkQFA3kzBSg
Kbba4A/5AfdaUQZPGIpeBJPNSHBbtu2x9jxNjT5pOpFqTvuykgjLisJKu648RXZd
fd76I6c4D24T1ja4q0yc0Kh7CGh/xvCduubH0QKrVCaUeB4BX0RVcaPwjE2FEUhg
Ba6xyo2oo8uuQgGmp0VxyroH2l4X9IKTq6zgtnO3Z9gDfsLw0AFVDephvQpxPve+
dFE7wgIcmf5tDk/JwlT6o8z9Rxu0UXWcRX96dni0B4vbQx9QdiORhaz8TRROQ5nY
h15gqfLbaXvTft7qukXey3/obSMXN88bWz68LIrxnyB4NOON0nveOgBApkGTazp3
p9knylPF80vdxSJn6tf+p9RwEEHaNnsR4hUPss0F9Elr6sP5udyFPX5QQ4xDZIg1
5JXRKC3xpuvpuSZXmkbpVyTJ8prACg32lGcPyPnP1TSmxd6jKbWoeC7Q4JHh8Lvi
2QqLBCHTD32XQyd5IHmqQgq1wOKMJ3PyuExqgz+/JY2Mp3LR/sPlXWRA1YNr5+ow
e5aZuzyK3HaN1h+xyeeL1BCeybX+bYc9WbyEu6tWcZLHfGebdUFTckuxPVsUnM8l
fmCXn8A7Z6NFephRBwE1DIaT+fJ53HpvpV8vefJH5DW7Sr+3TACl9OIrR8ZnZB4A
n4WUHN3nn5mlWvyJysmxiADWliCGcZQxCuOc5QMey3z8u0q6mU0=
=w0SW
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
