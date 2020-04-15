Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03AC31A9BED
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 13:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896823AbgDOLPY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 07:15:24 -0400
Received: from sauhun.de ([88.99.104.3]:52900 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896825AbgDOLPP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 07:15:15 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 440C52C1FF2;
        Wed, 15 Apr 2020 13:15:13 +0200 (CEST)
Date:   Wed, 15 Apr 2020 13:15:13 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: designware: Calculate *CNT for Fast Mode Plus
Message-ID: <20200415111512.GS1141@ninjato>
References: <20200407133439.23422-1-wan.ahmad.zainie.wan.mohamad@intel.com>
 <20200407145610.GI3676135@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oJFDFiWc3BlD0xT/"
Content-Disposition: inline
In-Reply-To: <20200407145610.GI3676135@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oJFDFiWc3BlD0xT/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram, for the sake of clarification, the series has been reviewed
> internally, that's why it has my tags already (though usually I ask
> to Cc me and give them explicitly during external review, not everybody
> follow this way).

Thanks for the heads up! I prefer the latter way, too, but here all is
fine.


--oJFDFiWc3BlD0xT/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W7MAACgkQFA3kzBSg
Kban5A/8DJ83A5beMh8GwXPnFMUbzAaT9/FfUdZjnqXKVfxm+YdlyZWY5sYZ7qNA
7rNcbMa2WKyPx2zqwiMJWMR8sPey/4RwDL20ZNyC7KlPgo+fxgRMzBtVs4dDePR1
YGzwFAmbjqiOqxKWQA5DtxwPmsBY+hIz1vrzSvYGesSnvx88dSOxt2wsGZygSTLL
sd90Z1yd5FX0OnWHDtQncES1mm9xMI4ZetJ7UdrdENj/7H9lvUfRv9gPuYJg1lYj
FJNSMCdxg5eiCQgk8adOePuvAPytlD73gw3jQaIuTrFr6tRUnEq+C9SSf5BxdS0o
I1G5dTwPoDM43Q1GG8E0Mw59WPvSYRJH8g36DBbwfmE0vYDyfSRFMB7qFKPDgetH
U61lKOp8oT5LTUHLTQcJ05tSCC+k6pnW70y+saY7HKn+WA92g83mVVhSWDfzP2so
85TyLaKm87th2Tz/BdvK6p8N3J/ZQVV7pWHHLKg90d9WimXPxOGhvQsKKPIU3hVN
1k15kY9LY7xQCk5ScXYLio/NjyMQ6kLhsSr4ab4vjbB3m3hMnrtMlEX2nqZlm0oD
OfaPW4YvhmxXoBnoKwU3I8HCOGhStXC0QGWxfwBBrD28UEBh6sHF1kTHtm/LZv3h
fHqq+NyHKE+P4RSPtJTkOO373/fRnN2B8fhTB/euZyeo+evhdXA=
=pSbd
-----END PGP SIGNATURE-----

--oJFDFiWc3BlD0xT/--
