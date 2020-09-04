Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B08CB25D498
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 11:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730011AbgIDJUh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Sep 2020 05:20:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:42446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729628AbgIDJUg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Sep 2020 05:20:36 -0400
Received: from localhost (p5486cda5.dip0.t-ipconnect.de [84.134.205.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E6D5E2067C;
        Fri,  4 Sep 2020 09:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599211235;
        bh=tfvwXFZiU3UT3uCBI0eVIiaDepEZKUtj+JOTXPnmFsw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JVTj/hYdti7ZOguNrnw2iuzyeMxhWiP8cgeuhOAht8F02N5gmhfh2HxDDvcQj107h
         4ifFx6nxVFzUesF8iXxBLPLKWUAw3BEtopz+mFS72Nmhnet+ySsDq2UKZsnxzsh6UB
         ZLbw9GgVbEuLg/2GWAziBor2k7pJGg1pgBqGVI3U=
Date:   Fri, 4 Sep 2020 11:20:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Codrin.Ciubotariu@microchip.com,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, Ludovic.Desroches@microchip.com,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        linux@armlinux.org.uk, kamel.bouhara@bootlin.com
Subject: Re: Re: Re: [RFC PATCH 4/4] i2c: at91: Move to generic GPIO bus
 recovery
Message-ID: <20200904092032.GA32080@ninjato>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-5-codrin.ciubotariu@microchip.com>
 <20200802170820.GC10193@kunai>
 <65890aab-1d19-7e7e-abff-3c6ee05c8ade@microchip.com>
 <20200826061444.GB1081@ninjato>
 <15466c95-f1ea-63a4-1429-24d9b7567c1c@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
In-Reply-To: <15466c95-f1ea-63a4-1429-24d9b7567c1c@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Codrin,

> The pinmux driver needs to have strict set to false, otherwise the=20
> switching is not available, not at this time at least. Perhaps there is=
=20
> room for improvement here, because the I2C bus is not using the pins=20
> while we are doing GPIO recovery.

Our driver doesn't use 'strict'. The thing is that I can't describe a
pinctrl state for GPIO. GPIO is the default state until another function
is requested. Back to GPIO currently means freeing the pin again, so it
defaults back to GPIO. We are currently discussing it. Geert (CCed)
isn't very happy of describing the same pins with 'function =3D "gpio"'
because the Kernel already knows the mapping, just needs to revert it.
Geert, please correct me if I am wrong.

> I am not sure I'll have time the next week to work on what you asked me=
=20
> regarding sh_mobile and PXA, but I will look into it the week after that.
> Sorry about my delayed reply, I was on vacation.

Well, no need for sh_mobile, this is my todo item :) About PXA, well, I
am still happy that you volunteered to do it, so I hope you had a
relaxing vacation!

Happy hacking,

   Wolfram


--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9SBtwACgkQFA3kzBSg
KbZeWw//e8idK/UaDDNoa1ayZzCtU5zt8qZiIxCEia10pmFsfb1uZkJ4nyybcIT2
FcpsGjUsrDCWvVEu+3hAyILntIJF8949WUK7K7JhqMeH9o3T7ZJeUEgK7cB0o9s5
wrjs2WMvBjP1TaPW2LhcAAlP3q4/Qy+4xQ6SpjLzQsTeNtv643vWo15V5lOUHjuK
0s/VCmZtnrqvRXsbjrzAIk+XZ+m7IhWgNDY6MUfO7gxDCWq8q+KRcncBaHNopCIi
wYGq2KReTYQ/nA+ACytH/SsiQvmXoYdfEiN6K1WnXviu0XwtkG1yTQPtpBetvpS7
obzG2hDmOcN680XFZ9tOYiQdChEI4cqFlWAPpthZ0TtSjmZ+0Jv5spTVbP7M/DFJ
61RCUdzZiPrTJiTwuQt5PGO39BnGbxbG64+x1a0qFrcd96FftmRi1CXwEoEF5dXc
LBS3yE/GmHALiBDKwqK4RN5iF6P4ErdP6WDL0506uW/xFOp198BHOd+auHXt4+eY
a2L4hOuAhl6w7BvjtIXogzX/0pGGqnzk2egyYNXOW1REtCrF/JInnxal+gBQpl9E
v+ErBOZ+1+BRi01Dk0ytbC4mkCNvaMsRFz+O4Msm9PlF03V+utBfeRUzOOC32aMw
2QuyngO580zJt/F8WPTvoH2CHIvtkKh92azHOo95+IPwjPjUYWs=
=qgU2
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
