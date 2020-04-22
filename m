Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2C91B3B82
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Apr 2020 11:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgDVJgr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Apr 2020 05:36:47 -0400
Received: from sauhun.de ([88.99.104.3]:45202 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgDVJgr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Apr 2020 05:36:47 -0400
Received: from localhost (p5486CD65.dip0.t-ipconnect.de [84.134.205.101])
        by pokefinder.org (Postfix) with ESMTPSA id 5DEDB2C1F8B;
        Wed, 22 Apr 2020 11:36:45 +0200 (CEST)
Date:   Wed, 22 Apr 2020 11:36:42 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bjorn Ardo <bjorn.ardo@axis.com>
Cc:     Patrick Williams <patrick@stwcx.xyz>,
        =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: slave-eeprom: initialize empty eeprom properly
Message-ID: <20200422093642.GA1245@ninjato>
References: <20191001164009.21610-1-alpawi@amazon.com>
 <150599be-9125-4ab9-e2a6-e792b41910e6@axis.com>
 <20200420164349.GD3721@ninjato>
 <20200420203146.GC95151@heinlein.lan.stwcx.xyz>
 <20200420205325.GA1693@ninjato>
 <adb03545-88db-689c-dbf7-9f746236adb4@axis.com>
 <20200421121659.GE1241@ninjato>
 <47891236-f1df-c130-0bce-d114523880cb@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <47891236-f1df-c130-0bce-d114523880cb@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I did like this now: If device_property_read_string() returns a firmware
> name, I use that, otherwise init to 0xFF. But if it returns a firmware na=
me,
> and for some reason I get an error when trying to load that firmware I wi=
ll
> not default to 0xFF, but rather fail the probe. The logic in that is that=
 if
> you actively supply a firmware name, you should not silently get 0xFF in
> your eeprom. Does that sound good?

Sounds perfect to me.

> > Yes, that is my idea. You also need to replace checking for an of_node
> > with some equivalent for device properties maybe, but that should be
> > easy to find out.
>=20
> It appears to me that those kind of checks are done inside
> device_property_read_string() so I can just remove them and only look at =
the
> return value of that function.

Even better!

> I have a patch now working on 4.14, will run some tests on it and then try
> to forward-port to latest kernel och see if it works there as well.

Looking forward to it. I will look at it right away then!


--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6gECcACgkQFA3kzBSg
KbaO7BAAkprmKCeDTpWumgvr++hxiBy8n6EaGLoCdbstru5jztnA/eZZ2EvEpezF
dGqIT0FWgVeGLNTedXxSTDLyW/068hFfLSMhYacSBakHe1WsSnf7vteIq61fgxuZ
g2NamfOadsE8zlZjVTpd2WQvb8QkCLji9HvBfYSd1qV5EGmUsMelRbjeL6BNEleK
h5/b6yIbHhCZWnmlke60cxWV9BTd3xu6iuwyQqW14I+QTKLd5A2wg062T62moocu
QoBvLfH3/BoD6mjAb+9Q9F9n5A3pDh90pCWwWvFx/Xvsn4rihPGumjw5Mu7mfdCs
OcNgMdxXxbuQ17aEAuFSdv/K3Ve+TKFaksc9JriAFcxVZ1w5m8D4QpA4dk0mE7qs
XJURvjoSEBhQboadPZYn8DSjr+YJ26W1rqkhBfMIh1ODhnU1H9Mz+WESt8xFSV4c
fEuUQJxgJGSLqzbPhkwgqdU8dK0EZi2ETW9cClbzswzb7JJVqlSpIRAtC4AaJN2y
1yutxyIa+Me52tl9zR5MSqJgL6ylBIlWM1iXg7aaer5lT/74eGimTn7Tk1eHZPm8
Dj9iJ4jFqPhB1g3tHgwYYFVriDIP6X82ft89aGIHq9SPX2P0AfnbMpcEh7CMPGDD
acWjoHmq4uMmD96Md8ZmS0iPAgre14MQgHBbdLUoFaTjs3V0gGs=
=Pfci
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
