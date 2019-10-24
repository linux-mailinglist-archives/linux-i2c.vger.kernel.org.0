Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E32FE362C
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 17:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409576AbfJXPHa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 11:07:30 -0400
Received: from sauhun.de ([88.99.104.3]:41692 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407327AbfJXPHa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 24 Oct 2019 11:07:30 -0400
Received: from localhost (x4d0d4399.dyn.telefonica.de [77.13.67.153])
        by pokefinder.org (Postfix) with ESMTPSA id AB61C2C011D;
        Thu, 24 Oct 2019 17:07:27 +0200 (CEST)
Date:   Thu, 24 Oct 2019 17:07:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Codrin.Ciubotariu@microchip.com
Cc:     kamel.bouhara@bootlin.com, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        Ludovic.Desroches@microchip.com, devicetree@vger.kernel.org,
        thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/4] i2c: at91: implement i2c bus recovery
Message-ID: <20191024150726.GA1120@kunai>
References: <20191002144658.7718-1-kamel.bouhara@bootlin.com>
 <20191002144658.7718-3-kamel.bouhara@bootlin.com>
 <20191021202044.GB3607@kunai>
 <724d3470-0561-1b3f-c826-bc16c74a8c0a@bootlin.com>
 <1e70ae35-052b-67cc-27c4-1077c211efd0@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <1e70ae35-052b-67cc-27c4-1077c211efd0@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> So at the beginning of a new transfer, we should check if SDA (or SCL?)=
=20
> is low and, if it's true, only then we should try recover the bus.

Yes, this is the proper time to do it. Remember, I2C does not define a
timeout.


--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2xvikACgkQFA3kzBSg
KbY2xw/9FIdBm3lKLqDZpmKjcsD3wcKioeBhtRCD82gnXZgkMqSlbbQQRf8y8ZKe
KAun1rTcj+rHtvzH20i+alDXQzChwwJAS9ZxORyWPurh0sRTwGDH5z8Bl1Sm8kUp
6dMDTGNrWwFGV0iQmHzF17n545X7ho/QHlTmpQi23SxS0sOJGPz5D8drDlWS0eBq
MFrDt9jqeCRV2u68gntAWoMoTHUr5klUizS+p8Jrt3yMIfriH1uPc3VGa5xuuLVI
al5YrR9bB0zgYZatgoxnZ6Q5KkInb1DkZIZNRmJP+4QoTMo97HHW+ZrsNJUD9mw5
Uuoh2NTgVGkbuCXRDzVsDOoEEMVM1qmmZxNfeXPtIO6jWbZID8ZaWbsgAfV4SXnQ
eeeZkH8ZuO19KhSeS6/El283JSMuvl89njtXd7l6/hcY41ndFOkjtjEDs/7Ed7RJ
SB0dnavo3zYhzyMJ1IjhtIEIc3+cRZRy7HmBxgovyuEYYCF+re6I8HLjvo2/aYuC
+s7J45zgY/9lqcnJRMz6iL7yIAFyoptYVVq5V065QWCyeKDNmVNBg3XP24ETd879
060Xp1xPeZQU/Pe6D+j7fzfYDyg94Hi9a7P7TT4ZwatTm8LCObi5g7FCCuq5OQPM
eY9Z7YHvo7yo4rYM1tqbAoYA0ZUxXj9IxGI8uIr0L3lBjLIJAI0=
=cVZT
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
