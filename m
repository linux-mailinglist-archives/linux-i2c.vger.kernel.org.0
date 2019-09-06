Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19345AB8D5
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2019 15:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390346AbfIFNEy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Sep 2019 09:04:54 -0400
Received: from mga04.intel.com ([192.55.52.120]:7641 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730147AbfIFNEy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Sep 2019 09:04:54 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Sep 2019 06:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,473,1559545200"; 
   d="asc'?scan'208";a="383246558"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga005.fm.intel.com with ESMTP; 06 Sep 2019 06:04:50 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] i2c: designware-pci: Remove needless pci_set_master() call
In-Reply-To: <20190906124029.25406-1-jarkko.nikula@linux.intel.com>
References: <20190906124029.25406-1-jarkko.nikula@linux.intel.com>
Date:   Fri, 06 Sep 2019 16:04:48 +0300
Message-ID: <87o8zx379r.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Jarkko Nikula <jarkko.nikula@linux.intel.com> writes:

> I failed to notice the pci_set_master() call is needless in the
> commit 21aa3983d619 ("i2c: designware-pci: Switch over to MSI interrupts")
> due the fact driver don't support DMA.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

NAK (see reply on sub-thread)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl1yWXAACgkQzL64meEa
mQZRhg/9En8X55TEgOpco2g6YJEJjEBNmekUWzwsnXENq9zdcBnTPrqry3PgPNtF
qKliNpOidKKvM+JOU+x0QWcJxuYv8+g/0OOqu1MoGN3c4oUoVwwqInfwv0TrC954
IqcN5sKvpwL2JobbCljA9gxdRednREn6tk1bpnU82VdMK4lG+RsNsxZyaBKOlNHB
+P8DMnVrx+o4zPIFEn/jFdrMUAapRUcN0WRQNyPeo0tVdHf5xb11CvUiY5K8p/Z4
TZ0lSB8YCYTQKGXqnviAB6raLSQfRiHITxDDnu+74NqRxPqqbp2bpz2L2fjJZDCY
52N84uIKvAzRs6V/2Sn5NxEE8mGoy8eR5c7aPzI63I+a9k9DwF0xFn7ws3ZtjNUm
k7GEudzBH5KWc/Zlgasn6lgIBHEZlTmLjY4JKXmlCFIIONNOTYlLQrqNtwwvHpNI
8ddJfxcNT4Yw3Xf4q9WJtm+3e0KbEI2iBfeEvGHAhhVXG2mNaAloEM+uBI7SZ5qR
LpAkmOq9Ng2j6lm7Dqn4yRqkbFK+78+VCCYmGBSfJNUGcboI6UWrxfT4f9Lv2QGU
eySaj6WcN/Jz2LRZmUPyXnr7o6N2DCHc6qW5fczeLUsxbrBxCdw2retCjdMeYSbQ
IZPdrF0krwMaD6X8citwQEiB+nI1XrZ1XcEKQ4vCpVtPders12U=
=qPmM
-----END PGP SIGNATURE-----
--=-=-=--
