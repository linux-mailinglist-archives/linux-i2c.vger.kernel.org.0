Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E401E901C
	for <lists+linux-i2c@lfdr.de>; Sat, 30 May 2020 11:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgE3Jjp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 May 2020 05:39:45 -0400
Received: from sauhun.de ([88.99.104.3]:59840 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727947AbgE3Jjp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 30 May 2020 05:39:45 -0400
Received: from localhost (p5486c6a9.dip0.t-ipconnect.de [84.134.198.169])
        by pokefinder.org (Postfix) with ESMTPSA id F24502C2099;
        Sat, 30 May 2020 11:39:42 +0200 (CEST)
Date:   Sat, 30 May 2020 11:39:42 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/11] dt-bindings: i2c: Convert DW I2C binding to DT
 schema
Message-ID: <20200530093942.GB1038@ninjato>
References: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
 <20200528093322.23553-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline
In-Reply-To: <20200528093322.23553-2-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Just double checking:

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Rob Herring <robh@kernel.org>

Rob, what about this checkpatch warning?

WARNING: DT binding documents should be licensed (GPL-2.0-only OR BSD-2-Clause)


--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7SKd4ACgkQFA3kzBSg
KbayExAAqA1WC+E/dd+co6XVA6QIbdRoUNcGdXrc5Nz6f69Sux22BY2+SNe7tJYu
56zZZtEftnxeU5s1iGYjbDgIjZoAfn27MzDmr9WwQRjjeOash6o8pHUwdaOabn+Q
ShSHWDf1q4NwvW+SVWVifAIQwvlFbf2J71TQr2Ovn7dIQbuGqYqRnn83c5CDaomn
P3LNoPHHForfyU1KqdoHOZiwPr30a0vW6FMCGtRCgTDceJZPJC99IdPA5EZR4VOB
rU+zF5GUGu33oQ2WVWSxiJM6CYIkotOp4iyzpfD1Vi6AbiKRXwPcvgO4oohslbCN
HCvOdg+FMEEniBAeeGGJ96WYNs+aUWymH7dhVGtsaytgb66KhUTTW7AitScRQhmY
xG4SykbZ94JlZf1Od5bf3biPPa6cepKoqPkdi1dPlFdpCAVsxT65jX/Zc5nPupIo
gBCS5C+PByK8ZgOmt6VzTIz8JBS0cUXcnyQBjasIzUqMv3QuTuMV+vf35bBoPxyT
S4JsLPbno2Chfl9hjEDc8zxYcuAtDFZ+0rALV2IFsvdBs9glJvIUw78C3nM4EHMM
CrMyhWhdd+sE+Hz8HlBsUgod/ssosL2QbKnuZbd4asuR9goA6g+A2psPCllK1YMg
yYum+AcRlgQ0OX0FvbHylBnBhEAKpjyI9P640B73ayd9DvzpC8o=
=tMg0
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
