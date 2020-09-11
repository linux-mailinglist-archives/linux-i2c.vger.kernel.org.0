Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3732F266918
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Sep 2020 21:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgIKTpb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Sep 2020 15:45:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:41962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgIKTpa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 11 Sep 2020 15:45:30 -0400
Received: from localhost (p54b331d7.dip0.t-ipconnect.de [84.179.49.215])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 352EA21D6C;
        Fri, 11 Sep 2020 19:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599853529;
        bh=KhDzw/JcC9c6Hpn0zatd4aAacCM2FHFCt3Co4wR7HKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zJrgjU+9o8PoFLdYlAkMkRglxNWzVJrl3ZwfTgxlf+vSOt7nG6W3sT0buHfxO0YVT
         cHioZWLFoP4WXOFOB/raa93k5RPubuPMzyD/S0F5k1oOkyTl5ZYD1v65Tte/MFweTt
         SE1FDKWL+9a2GGpaZEHbFEyOjGgqfBHgkvy9jeGw=
Date:   Fri, 11 Sep 2020 21:45:26 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Evan Nimmo <Evan.Nimmo@alliedtelesis.co.nz>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "jdelvare@suse.de" <jdelvare@suse.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] i2c: algo-pca: Reapply i2c bus settings after
 reset
Message-ID: <20200911194526.GB909@ninjato>
References: <20200908203247.14374-1-evan.nimmo@alliedtelesis.co.nz>
 <20200909082338.GC2272@ninjato>
 <5410e288-e369-0310-1b8e-061c95e46164@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline
In-Reply-To: <5410e288-e369-0310-1b8e-061c95e46164@alliedtelesis.co.nz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 08:39:50PM +0000, Chris Packham wrote:
>=20
> On 9/09/20 8:23 pm, Wolfram Sang wrote:
> > On Wed, Sep 09, 2020 at 08:32:47AM +1200, Evan Nimmo wrote:
> >> If something goes wrong (such as the SCL being stuck low) then we need
> >> to reset the PCA chip. The issue with this is that on reset we lose all
> >> config settings and the chip ends up in a disabled state which results
> >> in a lock up/high CPU usage. We need to re-apply any configuration that
> >> had previously been set and re-enable the chip.
> >>
> >> Signed-off-by: Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
> >> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> Reviewed-by: Wolfram Sang <wsa@kernel.org>
> > Applied to for-current, thanks!
> >
> > For the record, were you able to test both, PCA9564 and PCA9665?
> >
> Our hardware platforms only have PCA9665 so that's all we can test.

Okay, good to know. BTW, just after I sent out my pull request
containing this patch, I noticed there is no Fixes: tag. So, if you want
this patch to be backported, please send it to stable@ once my
pull-request is in Linus' tree.


--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9b09YACgkQFA3kzBSg
Kba0uw//RtMvIeDghaK34UIo3WUcCFIZBrYjk6JO57BJrq7xYhw4sWpGwngxHrXA
pt7vatc1Qh0lHoRuCkGJKQ9fe1dxBU3IRWbJccKJcEFuz0ltpizCH96M0yE1owcQ
/7+yOGhyl5bwa+p4nv4tmJt3ageZmSsf9LMDACFWALgt6rZMi7ariAo+iJDtPXPG
T713UDx315CYT26sm9XvcwL2uwgNoQiMVsZTBdRMEFrlz/Os9qWixdz5u4ElCov/
tnklVvR1RR58elr6OHpo322lJhNdkpuppERwCgWdjJsUW5R+AtRS5gwDrj1TEbzd
rHzQKRGesETAYfyrCsj0jb/pSH5gx2YQr7ehOQZjLGNWn1OnU7mklVb07QhVbLrg
C8r1IC3ZXgQUpDfPT3copfM144w4II9oD4FY7noszEo8N0aWFCW8Vz5AL0qSEVwK
TK3XpA7WTkWFHbdXSv/aE/Rf5587cr/3uAhQROCSBMPtq8u8x9EIWt/LqL8q1hUg
yXwB3XHzAbYfVEIi4xmbRLp3RS4sPBKSI2VKfev3WirZxGZXyF+GwPqEzhVlekVc
reY3wtAO7C5Zbw3pF5oeZCPRm94V27kiZ6AWy7FS+BHpqelHP1Bxow512VILQHuW
xnu1vRYbV5XZHF87S9XA2HoOVQafY+Trojf3C8AKjs5kzsw7YfQ=
=AZ+i
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
