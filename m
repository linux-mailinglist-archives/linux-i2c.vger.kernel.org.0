Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86636AF135
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2019 20:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbfIJSq4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Sep 2019 14:46:56 -0400
Received: from sauhun.de ([88.99.104.3]:50760 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfIJSq4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Sep 2019 14:46:56 -0400
Received: from localhost (234.77.63.94.rev.vodafone.pt [94.63.77.234])
        by pokefinder.org (Postfix) with ESMTPSA id 19EC92C0095;
        Tue, 10 Sep 2019 20:46:54 +0200 (CEST)
Date:   Tue, 10 Sep 2019 19:46:53 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Peter Rosin <peda@axentia.se>, jacopo mondi <jacopo@jmondi.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC,v2 2/6] i2c: add I2C Address Translator (ATR) support
Message-ID: <20190910184653.GB5581@kunai>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-3-luca@lucaceresoli.net>
 <20190901143101.humomdehy5ee73sk@vino>
 <20bac324-c4d3-270c-5175-0a7f261fd760@lucaceresoli.net>
 <51dede3c-545b-b66a-5e89-9e889d784eb9@axentia.se>
 <2d770b36-9521-820d-726a-bc9b52048ef8@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Content-Disposition: inline
In-Reply-To: <2d770b36-9521-820d-726a-bc9b52048ef8@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I still have to examine in depth all of the problems in the i2c-mux
> documented in Documentation/i2c/i2c-topology (thanks for having written
> those docs!), but at first sight it looks like the ATR is not going to
> introduce big problems because of how it works.

Assuming we are using the previously discussed NEEDS_ATR flag for the adapter
instead of the attach/detach callbacks:

Can't we then simply understand an ATR as a generic 1:1 mapping device
which can be setup when registering an adapter?

When we add an adapter using i2c_add_adapter, we have:


              .-----.  Slave X @ 0x10
  .-----.     |     |   |
  | CPU |--A--| ATR |---+---- B
  `-----'     |     |
              `-----'

When we use i2c_add_mux_adapter, we have:


                                Slave X @ 0x10
              .-----.   .-----.   |
  .-----.     |     |---| ATR |---+---- B
  | CPU |--A--| MUX |   '-----'
  `-----'     |     |   .-----.
              |     |---| ATR |---+---- C
              `-----'   '-----'   |
                                 Slave Y @ 0x10


That way we could keep the topology handling solely to the mux-core.

Am I overlooking something?


--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1375gACgkQFA3kzBSg
KbYJow/+JCThTpeS2XICmf9Q3MrO1dOKBMlUgPruJRw4irTMMkrMProjr3EhIYCw
7LuYkhW8Pessu8F9PbIJ9iU6IDb2UC5+Ao16IdbWYauY/Ij3ayhXsUd3ECl19lo4
SjbUynLbxbch6xzw4nitl1Vg8pxH1eVHA+3wi60O2eGBr2WHTouAMHa5YI6a6fw6
5MkxCxS4A08Ss0TUKZhJvl+7WttM5uigTmTsaI8FQLS0T+Z5rlxQIQR0CMP3ZyOR
1Fc/sndLvWOK5lRk/+v76LC7lFYEXa9ePLqql9IqP00u0qTO+wE+l3t51R5oTjpj
poXtKqLcjtfyue7efqfYm+rQDu39I9lEguZsp8OivuYQlCkWzRu/IRYSxQSsBmbd
37XvMAHedHMQy4PIhzRSq9MtprK6RcMgFvUxf3fr/05WW+P2udby4gluEI3ba4lo
MydbdFgf3rJfLkJ0TjC3GplUjDbffGmQ/uLvcwyxC1i3FCsQrK10NsUScZPg/oM9
KJjwa06l9ua0MrwDMq1s/3eqcWXCV9kyaIu1bE9CT6hLmJd7yacadcFRo5WqgVK1
qGBofVZbgsIrerqrYcKdXGS9vFCbsEZP6NQ2JpKHbiEITBy9Cqi1g2Jjo82byCqE
BtyGllOLEvVIpm8938c9epfklbGk+ZIlWVJciamn1gG89j3bI/4=
=3L8E
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--
