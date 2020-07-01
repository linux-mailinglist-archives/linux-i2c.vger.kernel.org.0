Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A38A210C09
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 15:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730742AbgGANVs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 09:21:48 -0400
Received: from www.zeus03.de ([194.117.254.33]:45546 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730807AbgGANVs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Jul 2020 09:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=8ZVwPNXmNn5BaeeVM5I9ZvG8vOfA
        P8ixdkqHoGpFEro=; b=01Dsiwy57gU+rjdbIK8EOQEO7vNbQLNtRwzxnyKXCFn3
        l4DKDna2TigwCITA2GUqmY1/iCsedSTh+/AfaNS6owSX1jQJ5pLyOWDpdR1QVwBb
        fyGfTiXZ9B3JOOmTwycVa9bk8WuL9fRaSN2/DUTvpUAybeHuy4aE6l+mptCqZsA=
Received: (qmail 559184 invoked from network); 1 Jul 2020 15:21:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jul 2020 15:21:45 +0200
X-UD-Smtp-Session: l3s3148p1@7oFsLGGpat4gAwDPXwRGALjtBlSZf+V/
Date:   Wed, 1 Jul 2020 15:21:45 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Alain Volmat <alain.volmat@st.com>
Subject: Re: [RFC PATCH] WIP: i2c: rcar: add HostNotify support
Message-ID: <20200701132145.GJ2261@ninjato>
References: <20200701080904.11022-1-wsa+renesas@sang-engineering.com>
 <20200701092731.GD2261@ninjato>
 <20200701121633.GI2261@ninjato>
 <20200701123207.GC3457@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZPDwMsyfds7q4mrK"
Content-Disposition: inline
In-Reply-To: <20200701123207.GC3457@gnbcxd0016.gnb.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZPDwMsyfds7q4mrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I got another idea. What about a boolean binding "smbus"?
=2E..
>=20
> I much prefer this solution than the usage of the smbus_alert irq value
> (in case of the i2c-stm32f7). In that case, I'd only set smbus boolean
> to enable both SMBus Host-Notify & SMBus Alert.

Correct.

> In case of a device having a dedicated irq for SMBus Alert, smbus_alert
> irq binding would still be needed.

Yes, that was my idea. Let's use "smbus".

> Just my 2 cents about another aspect regarding SMBus Alert, since alert
> is coming from another pin and not the usual SCL / SCK, when SMBus Alert
> has to be used, there is a very good chance to have a pinctrl entry which
> is different from not using SMBus Alert.
> Indeed, even if we need SMBus, but don't need SMBus Alert, the SMBus Alert
> input pin might be used for something else.
> But this of course doesn't prevent to use the smbus boolean binding.

I am not sure if I fully get this point. Either we have a dedicated line
(your case) or we need to use a GPIO as an interrupt line (my case). So,
either this is configured correctly in DT and added as a "smbus_alert"
irq. Or this irq is missing and then the driver will ignore SMBusAlert
and the GPIO can be freely used/muxed. Or?


--ZPDwMsyfds7q4mrK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl78jeUACgkQFA3kzBSg
KbZF5hAAmqFMUAwr0JT9kbynaGQjBZyIA6SskZkcskZp/12o3Vc8o+NhxAZeT8UB
P6jYgv/fjffA8O0nGtRkAlvHYUBqDYfOGYBVT/zFdoOMN/Gj+vXfVr05PaWknqBQ
ShAT7ke41c7I84qRaobPVruO/YPkuJqOnXjQqg7Xar3hyNYi3zYG4prgbTi9qltN
hvwAkvAxYDQiljVi1wBrjuqo38b3sefb5Wyf9D8iVtQQK09Wzx6rdeKEEutpTr8d
KqsnC20tMHxKj36vjEFAmhKQG+tbIPNcagnvhWy0N1r4yQRyHrCjLxiHqXlWVC+t
n/9enUGTyo4r9PJWy6MnoPmb04EoPVKziOtnK4lbAVA1plvV5csUkhuVMkzLx9FQ
/Oic6mh82iECDPBhAegkcbzgXI/lmzIjKeX/2JSyVmhgxmWiumhgMRhtV0BgqNc7
PdtxZ08T91po9eOffS/SYM0yPuRCqu7X3wOPkTRbDVznDxDqWSoND1DwhAMpWaVO
zt/63YyZthu3zWP2fOm8zwjqHIT4Php35aC2ChEKpfYEK71S0sBxU8noADi/VOoN
utEwal5KWFq1tIkenzwDJk2vmtBpiP1gaHyH0yNcoRZmDsIbedVqWTztv3EbtmMj
gJJWPAUWRngXS+wClMc/Dfgs5ywf+5TcgkHYXLtKkVs3/Ce9gx4=
=U6af
-----END PGP SIGNATURE-----

--ZPDwMsyfds7q4mrK--
