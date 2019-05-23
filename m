Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28E8427ED2
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2019 15:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730495AbfEWNxx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 May 2019 09:53:53 -0400
Received: from sauhun.de ([88.99.104.3]:54498 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730323AbfEWNxx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 May 2019 09:53:53 -0400
Received: from localhost (p54B333B6.dip0.t-ipconnect.de [84.179.51.182])
        by pokefinder.org (Postfix) with ESMTPSA id 90F8E2C0398;
        Thu, 23 May 2019 15:53:50 +0200 (CEST)
Date:   Thu, 23 May 2019 15:53:50 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sagar Kadam <sagar.kadam@sifive.com>
Cc:     Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, peter@korsgaard.com,
        Palmer Dabbelt <palmer@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC.
Message-ID: <20190523135350.GA4985@kunai>
References: <1558515574-11155-1-git-send-email-sagar.kadam@sifive.com>
 <1558515574-11155-4-git-send-email-sagar.kadam@sifive.com>
 <20190522194529.GJ7281@lunn.ch>
 <CAARK3HmMVibudG2CFLBoMSAqnraXyirTL6CXYo1T_XJEuGJy7Q@mail.gmail.com>
 <20190523123435.GA15531@lunn.ch>
 <CAARK3H=BPT3aGUGiQvov5aqFRNVTSeyqJ-bNGw6uEoU7c8iiJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <CAARK3H=BPT3aGUGiQvov5aqFRNVTSeyqJ-bNGw6uEoU7c8iiJg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Ok, Great. Do we need to write to him about this patchset?

Nope. Hint: You can dig in the mail archives studying older patches to
see how things work. I do this as well because things may work
differently per subsystem.


--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzmpeYACgkQFA3kzBSg
KbZ50xAAimynxr0PJx8ptAPr43eEclJl1OQihcsB1bfsNnwPm0VKds2AQLP2dYHC
BISTG9B+IPj/7E9E/1D8UnmP1KQU9sYaZUS7HFnx1sSowG3Uy0ppnfhEDphLb34q
Upt3domZHzvBwz2uDM4dI0RCUtB0wM+bGDqYp0PA9XL82KUCLdDOD4mEkwb8GrYd
HKbij71iHnHZymVM1ESn2hp0t9dYOGw8JnPE1SXk2CxjVRJrguLKMR9AMZjhS/eJ
ASDTDStxqRl60v6HrMYgHZEfACZcx42627191pHOp+e12aftKm3jArMyN9oWMLZM
W5tdlvcYHk9zWtBOm9ICQLoUENdzZE0/p4xPqjCvYlWJ8a+RPKdgAYq9jQ8u32qF
VsABTkJV3wMV+LfQxPY9lZ/8VVtfAIzxsFcCb3Z8eRFxXqXm+snIZ36Cd5MCKMXq
iVh/VNvVCfku76W6wcHH0wZwoBacDjkv+it4bR5zVoEOXpgXuw45rzzNroNssxQ9
ITj5IcJh1xQ3CyqxoTCNqLHbznNgdN5cG6ZXVP5P3badfY134i1C7plwLSG4EhMr
qE6pgVZxp/cCpvAKxfq6hbz8XqKmmRDT14ENK9h3uBK2n7nwlm4MhBXpFBzSbJM6
qe2KzVv56JSG61v1tjAFjGgVb7lsGQzlNV+eNsMXeZzZBLbM4Mk=
=171K
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
