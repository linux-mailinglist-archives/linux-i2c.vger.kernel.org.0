Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0912F22CEAC
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 21:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgGXTcV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 15:32:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:52564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726085AbgGXTcU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Jul 2020 15:32:20 -0400
Received: from localhost (p54b3305c.dip0.t-ipconnect.de [84.179.48.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CDB1C206D7;
        Fri, 24 Jul 2020 19:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595619140;
        bh=CIKV06fVC1al23ktbLe7XFNDjxC8fXwDlBIIF9iSBhE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OmAprnUeFYfp+XccilpYlly2ecP/7psudeVcm7GsVXZN0MkvriqoAEteDpU3Q+Lzv
         8kibv22KlNtT82PFcOw3hqnPsv+WHDwFxHK5hcZdSuknhYoK/HbBP+uyPWm/OE1Las
         TzR+ADTQSFJGIQirtZPEXNUh83k+5ELAmRA9G6YI=
Date:   Fri, 24 Jul 2020 21:32:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, joel@jms.id.au
Subject: Re: [PATCH v2 2/2] i2c: fsi: Prevent adding adapters for ports
 without dts nodes
Message-ID: <20200724193217.GB1227@ninjato>
References: <20200609201555.11401-1-eajames@linux.ibm.com>
 <20200609201555.11401-3-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline
In-Reply-To: <20200609201555.11401-3-eajames@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2020 at 03:15:55PM -0500, Eddie James wrote:
> Ports should be defined in the devicetree if they are to be enabled on
> the system.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Applied to for-next, thanks!


--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8bN0EACgkQFA3kzBSg
KbYYMw/+LT5qtoKj+tlGbO2ItH5SFl9NpOLtKvssPen5gNBCNzOzorJmQL324Rrs
r8B/A69Sj1uom8HjYHEsGZj4pPeodOxjduVrrXxFbeo2zaPxqC6+DasyPlBSZPrI
WHVqZxZyZ26MGhUjGV9m5v17pyqzU6LbYCzaQsTv9av2+EMPd4f8rEKdYbr7y5KN
G405UaSj0Gfa2x5U53WlaSYXJvycXIIKG5gdyjXFgjD8FjhzGEnqPjLKGENI5hUe
SKUBpqqZrVFDMTPk5PSH/jWnEKnFg7LBSnkMq/lV0JXQEaEYbYrAlfIH7Xta0S9J
k/H0/d5yp0FNnEnunBfATtVfj2Mk5zgfPwzkqlqeypbcu5t1m2avQ2SwmbamVRva
Tiss65kQ8ashAdgw/m05Bj8RDVd8nqCC7r4UFIMo9xyEPGKOlufyx0jXU6m/5PTk
3lQRHKUXQZHF5Wfy2LGNvQ3SE+AIvwNS7EPt7khx87YfLv+8qHipm8txLYF6G/pP
P77kiLlGA4gmlunG9QcBJZx+h7J17Q8gDhfYO0drexIz8WwUYMQu3ptWL4MxXUW0
pAoDzXQH+g5sIRSPKZ4Wij/EYRzPxQjuzWsGzejDug0y8W5KJ+yxq5v//v9GBpgl
D17OgiHDcVg9fhSIgMbSX82VJ0zr0JXN7XX8KpB2BP/Al5sdeSI=
=8mtd
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--
