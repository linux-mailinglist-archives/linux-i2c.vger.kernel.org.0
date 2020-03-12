Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 258AC182EDF
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Mar 2020 12:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgCLLT5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Mar 2020 07:19:57 -0400
Received: from sauhun.de ([88.99.104.3]:41226 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726725AbgCLLT5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 12 Mar 2020 07:19:57 -0400
Received: from localhost (p54B331A0.dip0.t-ipconnect.de [84.179.49.160])
        by pokefinder.org (Postfix) with ESMTPSA id E76E22C1ECC;
        Thu, 12 Mar 2020 12:19:53 +0100 (CET)
Date:   Thu, 12 Mar 2020 12:19:51 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [RFC PATCH 3/7] i2c: allow DT nodes without 'compatible'
Message-ID: <20200312111950.GA1013@ninjato>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
 <e43eaaf1-a294-902f-9a52-ebf8b29acab1@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <e43eaaf1-a294-902f-9a52-ebf8b29acab1@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Luca,

> But the kernel currently ignores nodes that have no matching driver,
> right? So in this case the kernel knows that that address is used, but
> ignores this information and considers the address as available.

I'd rather call it "unbound" than available. See later.

> Seen in this perspective, we should have a "compatible" for all nodes:
> it is just describing the hardware and could be out of the kernel
> control. But instead of discarding all nodes without a matching driver,

And what compatible value would you use if you know there is something
sitting there and don't know what? This is what this series aims to
address because we thought a compatible name like "reserved" would not
be a good idea.

> the i2c-core-of code should mark them as "reserved".
>=20
> Does it sound correct?

With this patch series, this is quite what happens for ancillary
addresses. They get their own dummy device automatically now, are marked
as reserved and can only be obtained by the driver which bound to the
main address (of_node of ancillary addr =3D=3D of_node of main addr).

For the main address, I think things are a bit different. They already
have their struct device. The only thing we gain from reserving them (=3D
binding to the dummy driver) is that they are kinda blocked for
userspace access. The "protection" is kinda low, though. There are
already ways to communicate with bound addresses from userspace.

In kernel space we still need to probe this address until a driver is
bound to it, I don't see what a "reserved" state gains us here. If we
are talking about the pool of available addresses, we are all good
because we operate on existing struct device and don't care if they are
bound or not. Or?

What would be kinda nice, though, is when i2cdetect could show reserved
addresses (unbound but having a struct device) as "RR" or so. However, I
currently can't see a way to do it without breaking compability.

> Clearly this does not fit the case reported by Alexandre: a device
> having a driver which is known to be badly buggy, so we don't want to
> instantiate it. But again, this should not affect DT as it is not
> describing the HW, but only an implementation detail. Probably disabling
> or blacklisting the driver would be a better option there?

"Fixing the driver" is the first thing coming to my mind ;) But yeah,
blacklisting would be another good solution. With only the information
above, DT is not the right place to fix a broken driver.

> My apologies to Wolfram, I appreciate a lot the effort you are doing,
> but before reviewing this patch I have never realized what I tried to
> explain above.

All good, Luca! Talking over code usually brings in viewpoints which
have been missed so far. This is expected. Actually, I am very happy to
have this discussion!

All the best,

   Wolfram


--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5qGtIACgkQFA3kzBSg
Kbbq1g//cGduBAVmcRJ6Vsggj4Ku7GeXkHPmq+ql8nV8hwFA8TL+CLMs7E/uwg7m
cKOtGFlayuUVDPQUNioVeupDTKj35wDbQEXQ9TJaUzqELdDc2oeDYyOnfO/CGc7Y
g32bVMtt/p7G+vvYqPv5yk61q14hSvH4d2+kkhIlD62fHfJEdNtEN0j4avxnNgUz
H2rDXxEAQcSpegYDW+fAytaFqguTW8++Mq8egMucI3t0ol396y7Ils24B21KdqYI
gjOtstIJLcl4NEUJME/Z6YtYQjuXBxgV4tQjkCypm5u+6+13JfiSEZsRD7mP5KGv
QIsU+wlqgMqi2HGB5VtUnDtxkSaQRoMcZ4M5/GqVr0rcAKJKxIeo0AkIkmAlnWVG
1KnFSbLMB0xf6udLt/V5B38xyYvCoohbl3W2kHNRjI1MB1JO1PaaclAu+KNou+i8
jdGKlcc7F/PGGJ50HWqKNlgx45bi5MgGrDOaxru+vVUeBuJJLedPySfxsFJbiZK5
oRY88yHNVzPjtpBOWgQENx2VYEOVrpDdCZjU9S4rCZC/PCFeFm2jvRa9VR5tW2Ol
ovghfXLlzyL/lDjm8eGJxQYk6sqK7JsyYAlWbJp3sNVrgPSm9ufSSN75FBjq7WXk
KLDaK0AY0DXFMpD4Znb3/SMaJrOZ9ZRfx9nnM2JnrNcNd0OgjbM=
=AZPQ
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
