Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2B9271F99
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgIUKDP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:03:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:39724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726406AbgIUKDM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 06:03:12 -0400
Received: from localhost (p5486cf2a.dip0.t-ipconnect.de [84.134.207.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B71E221D80;
        Mon, 21 Sep 2020 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600682591;
        bh=s6WUFqRoxlMqyPU07x/zquSNmm0tUyvfnjizImEZYY0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2QbptYBNrYGt6pHcUt8MmP79cFuMJnuHbW+YPL4V/t5hAotEHz8CwS30da6N/pVow
         1jbOMa37HMVGRw7QzRlkNahDT+GzTeRtQ4gqNTEpS8mMUd/U2giuIfHNf/k3n2a4Md
         sGH/2UY59udQDPbHDaRQSkMRLWzIHesLAhRWXlms=
Date:   Mon, 21 Sep 2020 12:03:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: ismt: Add support for Intel Emmitsburg PCH
Message-ID: <20200921100307.GQ1840@ninjato>
References: <20200615161001.12817-1-andriy.shevchenko@linux.intel.com>
 <20200828150239.GU1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qd/SZIFVu+MYwfCR"
Content-Disposition: inline
In-Reply-To: <20200828150239.GU1891694@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qd/SZIFVu+MYwfCR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2020 at 06:02:39PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 15, 2020 at 07:10:01PM +0300, Andy Shevchenko wrote:
> > Add PCI ID for the Intel Emmitsburg PCH iSMT SMBus controller.
>=20
> Seth, Neil, any tag for this?
> Wolfram, this is an ID and I don't think silence from maintainers prevent=
 us to
> add it. What do you think?

Only as a very last resort. If there are dedicated driver maintainers,
the drivers are their authority. If I apply trivial patches on my own,
then there may be confusion about what is a trivial patch.


--qd/SZIFVu+MYwfCR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9oelsACgkQFA3kzBSg
KbYD1A//TqLqU50kXNLiBkXd8m6eFf9oq5TdsjauCWlEwLgC0ma/5MEbRCHbk1TH
Yd4yj0H2yPPgRasPfrb5Qt5PxyADMuoxcvk5cZSB8ciFa8gvU0d/ECXI1FC9XAXZ
xijx+VFgTX7SIlwcU+wIwhvilPQ14Mp6SHvqoOOweC6Ou0jmf0NuJa4Dug7vLe7t
Ep3CRg41/xeujXjG6j5puEEZBr2+UT76uDy6BZ3ou4WYIHi3vCDEEZkb3i72Z5H7
sZxVs/Jjzm5oKnNajgPLT3xsuZKnss4aa/PjN4yclogsE6weDrfcPBB1iBRfMBtU
r61+f5h7Ex8xikSvGrfIUb6ijPZkECgTI9snLFR4wMDm2nVDS2YeYufXcsRL15je
3XMPbpnPEBX6SXMehsjQiq/kQr+vmnoMWz6v3xsCKrzXVKLPBlU2EsRImYA0dngt
IDBWxE6t2L13dZ2JIotaH2qUFx/kq/cyxlH/GN2WnwcJvcarqSfBOmkeK4b+8k5n
H9WfoY684+z1PnIan7GE3j58uMMMxXhh1d7hrYG/JeV8Ht8Wu7pir7wEvjCZWQWW
pjptLRAOCHSFfuqNDRg6TwAKfvhyGGz7qIgAHPsAf4yb7Lm6m5/5SV6/LWRDyr9T
TIbvoyMzTYoZyU/WMcu1T8Ee/vgtb1LGqupJfggiRRf1C4IU5P8=
=vpWR
-----END PGP SIGNATURE-----

--qd/SZIFVu+MYwfCR--
