Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B740D1EB6B9
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jun 2020 09:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgFBHqt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Jun 2020 03:46:49 -0400
Received: from sauhun.de ([88.99.104.3]:33610 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725907AbgFBHqs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Jun 2020 03:46:48 -0400
Received: from localhost (p54b33192.dip0.t-ipconnect.de [84.179.49.146])
        by pokefinder.org (Postfix) with ESMTPSA id E9C232C0845;
        Tue,  2 Jun 2020 09:46:45 +0200 (CEST)
Date:   Tue, 2 Jun 2020 09:46:39 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] check: Add 10bit/slave i2c reg flags support
Message-ID: <20200602074639.GB1453@kunai>
References: <20200527122525.6929-1-Sergey.Semin@baikalelectronics.ru>
 <20200527141517.22677-1-Sergey.Semin@baikalelectronics.ru>
 <20200530093152.GA1038@ninjato>
 <CAL_JsqJeod3Rm4K_7c3AcH8A4aMKKmT97CcbGpRbG4b0yWzrXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJeod3Rm4K_7c3AcH8A4aMKKmT97CcbGpRbG4b0yWzrXA@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Easier to just duplicate the define here which Joel's patches do.

Well, seems this case is closed then. Thanks everyone!


--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7WA9cACgkQFA3kzBSg
Kba5rhAAtFm93l4Or8mq+zo1DkRIE7Z/3zeLwXUh7tD5yttU2KvArfm2GLRHTqwF
ussdD/AA+DmLFF8TlPMs3GCwhwzWYib9uEAslEXn1VmUdGuW71jJZoSbsHX5/h4n
VaEEXbWpvXsJUsKOJAQlNt/deXxI5syzQ8QrXm0Kz3SlzA1UxhBaHqf6eCMWr/TD
dSX3PQE8mcfSfI17xGiCdGJoTqZXM6ZfNPc5zGGRoJ5gaK4oBNgw2+2guZkscQl7
bNh9RSNwAXn5U8qiI+M35k1f4ybOwkqIeFymbYGhPqz5/3g4lN4A+OAJ28WRBKm5
P2uJzyqrTTp+T8gYSqmJ8EgN4wXbRgTp+lCuFLrJs+XUZngaAoNMQXdq+2VCjVAq
5MyoU5Vg5DQgAp+MjuaWkWE/9ukT1M82553UtIiCLmmc57YldRxTj1bobfnUl/eU
0qBkN+3G/eQmyg6a/tYDTi7VzH+JGvlJ0ZSIr+Rnh5ECPolThEE6Z5ZLN7IIcXJ3
huGXVgXSi44Ey6qaXk2bbZxTDF7wnm4STZEZe6kAkNvNnPaQRlmAZLfVvLzaEgGU
roy6Jd+UCBCmZNxmqpO+lV+GlupeWebH5NEN6eswBbmWwzRU0QQ7g4Huk4DqqQdg
exzvrT9AX/03EgooScuus7sBtNDXfXFlYWI45o6dQWhkSWgthkw=
=ojt1
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
