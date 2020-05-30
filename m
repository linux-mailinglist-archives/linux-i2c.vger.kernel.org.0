Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1D21E9014
	for <lists+linux-i2c@lfdr.de>; Sat, 30 May 2020 11:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgE3JcB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 May 2020 05:32:01 -0400
Received: from sauhun.de ([88.99.104.3]:59768 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727947AbgE3JcA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 30 May 2020 05:32:00 -0400
Received: from localhost (p5486c6a9.dip0.t-ipconnect.de [84.134.198.169])
        by pokefinder.org (Postfix) with ESMTPSA id CFEEE2C206B;
        Sat, 30 May 2020 11:31:58 +0200 (CEST)
Date:   Sat, 30 May 2020 11:31:52 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     devicetree-compiler@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] check: Add 10bit/slave i2c reg flags support
Message-ID: <20200530093152.GA1038@ninjato>
References: <20200527122525.6929-1-Sergey.Semin@baikalelectronics.ru>
 <20200527141517.22677-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <20200527141517.22677-1-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	addr = reg & 0x3FFFFFFFU;
> +	snprintf(unit_addr, sizeof(unit_addr), "%x", addr);

Hmm, this hardcoded value will not work if we ever need to add another
bit. I hope this will never happen, though.

> +		if ((reg & (1U << 31)) && addr > 0x3ff)

Same here with bit 31. I haven't checked DTC but can't we import the
header with the defines into the project? Or is this then a circular
dependency?


--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7SKAQACgkQFA3kzBSg
KbZlOg//QVOBxervblGxNh6EaaJKJnG8BWawizgJ3J/y+8fLrL5/Jac8F/0I5mBh
j4gopVhrEJ45xp8Z8IyTUZyAc+gtYnL5+2ARrXCv5RWhOzHbym2EahgkAt5tJtfE
j8ntt3onMPaWTUGoEZOnhMT4qlS5R0cFzcE/hic/TXFKUgs5GNFycK/JTuqdIYWy
0nYLkQw3V+fyXHnBI9pssrx+wmJAlXM+pQzoIDlcmXCNbEPf0Yq5w9TD2svmIkl+
y6MxuryziguQ0YeLEaSVQlxuodi4fdAO0igcOlwmGtUTwCvPozgYN9S8lHNVqXMM
kFZ/jrKWdzSjFQwTjz5lc3dybJWMRip9Dbwzp7yLEYVLt4fbqRv4Hl9pFVfWIeOo
ahpJ4J8S+zrcLs16uOJv/G5q8/UyfCRI3TEd/gJlnvsh/surrNdbcagc4xqYIZax
/U0+EP7GEcFKZ3OE6C8xgSbossurkckTl+khtrSbReaX2iOYMrttOezJ8ttAs23A
wo3QdSPlwWJH66/wPmS9SPJITC/IVHYCCCHPBJBA1WqElU7OojMzyLHT7AIKjgHB
zFN0f8jlJhgbb3S97RLAAOWMwJyauKAFzzy3KQ9Lv7pZii7vi2d+9UbHsshyV2Pm
hcQ0zGzrjwEtIN6zcWZqwVqXyO0aGgfErGCK4IWG7IOEwCzKhBs=
=c1F6
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
