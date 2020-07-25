Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0561222D6A7
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jul 2020 12:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgGYKSX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Jul 2020 06:18:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:53578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726572AbgGYKSX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Jul 2020 06:18:23 -0400
Received: from localhost (p5486c508.dip0.t-ipconnect.de [84.134.197.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A9DB206D7;
        Sat, 25 Jul 2020 10:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595672302;
        bh=yYZoeGiaL2Yy7dXLxE3HYWDSogCl38mNwgjNFgnjc+c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qe+QBna9WOi7vzaW7vSPMkaVsYAt9JxYecsoEPWMmLKYqg/JMdWxsrTo+zazQsXL/
         0RXnCdPZ8Gur7V9bNMvK1F4tz0lVrzPaglmJmDTNqZS3wo2YWA+fv/mePMZXtSlNi7
         lBsBytEUNBmTctcB3E6thweZpJCaocz0ystXpo3g=
Date:   Sat, 25 Jul 2020 12:18:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ray Jui <ray.jui@broadcom.com>
Cc:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and isr
Message-ID: <20200725101815.GA1519@ninjato>
References: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
 <116ac90c-8b49-ca89-90a4-9a28f43a7c50@broadcom.com>
 <20200722104128.GK1030@ninjato>
 <5048cf44-e2c2-ee31-a9fb-b823f16c2c7d@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <5048cf44-e2c2-ee31-a9fb-b823f16c2c7d@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I think the following sequence needs to be implemented to make this
> safe, i.e., after 'synchronize_irq', no further slave interrupt will be
> fired.
>=20
> In 'bcm_iproc_i2c_unreg_slave':
>=20
> 1. Set an atomic variable 'unreg_slave' (I'm bad in names so please come
> up with a better name than this)
>=20
> 2. Disable all slave interrupts
>=20
> 3. synchronize_irq
>=20
> 4. Set slave to NULL
>=20
> 5. Erase slave addresses

What about this in unreg_slave?

1. disable_irq()
	This includes synchronize_irq() and avoids the race. Because irq
	will be masked at interrupt controller level, interrupts coming
	in at the I2C IP core level should still be pending once we
	reenable the irq.

2. disable all slave interrupts

3. enable_irq()

4. clean up the rest (pointer, address)

Or am I overlooking something?


--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8cBuMACgkQFA3kzBSg
KbbLAA/9FeHjhGwyMXJIQXFvczJdKOmip+UeBbnpfmqsfpfLCTIt3VsyEN3mW9er
ljA3+RwocPDUJxYpSRqQGZmCP70Aec8z7PJ1criCXG+zUAZuJYABIQrDUaKDEOiE
FzJi6hqJ2nFhwVrforfaotkvlco/F7PcEoIGA1eoAI27Oe9Hem+J1KcWNGFcw4NM
cjQhnZgQSv0zGquTKdLjlI425z5bxUGaIz+EN0CmVp+lLrJ/tjI5yIJIbdBF8nQQ
kDaTv3Q5NlgXsQbRHbvzMsw2UHlBRje/Nqb0KkX7kArS3fRtN/av3tur2wLfyyYY
rNKxDy0d4Z2ltG6gF9ysQyWf+BYSrzeEBR6md+oMnJ7GUR5Q0IB5+LyzTtDLHxV/
eqeX5ZqOz63qpxuBdJfwTUnSFfQ1o3NzzRK05YN+nHu6SUYlwveniaRZmrKwuNpV
vNkOvhQiOD4aiugIh43g/mIPVVPrrnmkbOm0O4XldlG/6LW5636E4GVFmgi2Gi3O
Qe7zRBNrxJ0oA2v5CC+pRanDVGFcWr67EHzObIDE7e/wxd8WdjyjmEPMtz/Ef7E9
JGlO66wXCuxyLydCEdqLkNp1H+0W1A9pzwMSjV052OEW1yCJFfkmsWVMTNKGNUXQ
XBAX3znGu7Nhz9HJsgD+adLfW8hua3nIYC6GJfbRNdn14O8W6FA=
=ol3x
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
