Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69BAB191BBF
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 22:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbgCXVJi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 17:09:38 -0400
Received: from sauhun.de ([88.99.104.3]:55134 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727088AbgCXVJi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 17:09:38 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id BAEE82C08EF;
        Tue, 24 Mar 2020 22:09:36 +0100 (CET)
Date:   Tue, 24 Mar 2020 22:09:36 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 3/6] i2c: rcar: Consolidate timings calls in
 rcar_i2c_clock_calculate()
Message-ID: <20200324210936.GD7641@ninjato>
References: <20200324123216.78113-1-andriy.shevchenko@linux.intel.com>
 <20200324123216.78113-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rz+pwK2yUstbofK6"
Content-Disposition: inline
In-Reply-To: <20200324123216.78113-3-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rz+pwK2yUstbofK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 02:32:13PM +0200, Andy Shevchenko wrote:
> Move i2c_parse_fw_timings() to rcar_i2c_clock_calculate() to consolidate
> timings calls in one place.
>=20
> While here, replace hard coded values with standard bus frequency definit=
ions.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--rz+pwK2yUstbofK6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl56dxAACgkQFA3kzBSg
KbaUdhAAryCoAGZ5Up+JZeDFwvbWb3OwFVClFVR6zbxZ5MmYC1rULYp05aJyoS9/
2TY4pEM+aamz2I8lCm1TFFkTI04IQWM4xKPL2nQzWJtqmkGSPg5TI8ptFu28vlpp
2LeC4l3zpgFP560dFzAxbO7XtLFT6BKJdbJTr/PmQaiwnoxeQJ0U9/YmNLZGhuHh
iO9Om+gycTfrLt303KV8HeNwqhNbpMWivHYNF9ovQIWtoxfoQ4hB94VF9d0rmwqv
lXyqx+n+znGR/N+mz82EI/qL2bPV5OyczpKWt+a1MBswRTenMG+tVQ2Dq4c1BcxC
XpO/N+crxIPIv7voDrAUU/9YjRP+bdKOVlA5VouxkLdK9XTWaYnmG4YVkcvb28ui
5rYOWd/po05op2h1XpoT0csOBlGX7cgtjPMlgOWBj9RRUbFzipB13AKxIL1Ti/2l
GGt0juhFFx6TklWnQs5/NFTzO3UacXm5B9PX6KrDyVDibqMQtKLifXlmBuyFJGbt
yLA+sqlDBCuFDIxmYWtiW9v6TMY/8NLOxzC0aSdjBqpoiWy7IBml9n8yynSaXOu5
i5aaRYyqvcUpBhJQhaKJiLZ31Au2H4Ly/TecS6mUcQrJWScCNgwYgvZ/gRlB5+9l
cFiWDQi8ujcntFeJuO1+hP7zYP+Z3VBSxvioqjwitEhlw57RtBM=
=x+8p
-----END PGP SIGNATURE-----

--rz+pwK2yUstbofK6--
