Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613F5271FA7
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgIUKFL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:05:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:41372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgIUKFJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 06:05:09 -0400
Received: from localhost (p5486cf2a.dip0.t-ipconnect.de [84.134.207.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B73D21D7A;
        Mon, 21 Sep 2020 10:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600682709;
        bh=vDkTT0rYCHX8vIEu3yTNlWobHtccXIN+5tPbmvrwhrw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J+uCZssv3jIrb8uQG1jYmrNa7cxFKl1Wog9jTjXGoGKd8sSJnGzwLYVbWpSOXCdrY
         d1C7ZqvByO3h9gClG0jzxsJ5wNumPBPz9RG3SXR/CvP99v0L6L2EAUyNHO+P8VeJuz
         AT/P4HEHNTL6RL7aNJaSN2noa9f3P2cfsLOVm/TM=
Date:   Mon, 21 Sep 2020 12:05:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Seth Heasley (Linux)" <seth.heasley@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: ismt: Add support for Intel Emmitsburg PCH
Message-ID: <20200921100505.GR1840@ninjato>
References: <20200615161001.12817-1-andriy.shevchenko@linux.intel.com>
 <b11640ffc0956412c1cab112d881f569f5e7dd9a.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JKGvNdIvrY8Ovf7Z"
Content-Disposition: inline
In-Reply-To: <b11640ffc0956412c1cab112d881f569f5e7dd9a.camel@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JKGvNdIvrY8Ovf7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2020 at 02:43:56AM -0700, Seth Heasley (Linux) wrote:
> Hi Andy,
>=20
> Sorry for the slow response.
>=20
> > Add PCI ID for the Intel Emmitsburg PCH iSMT SMBus controller.
> >=20
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>   Signed-off-by: Seth Heasley <seth.heasley@linux.intel.com>

Thanks! One favor I am asking: Would you mind using "Reviewed-by" in the
future? It is more apropriate and also for easier for my tools to detect
when a patch was reviewed.


--JKGvNdIvrY8Ovf7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9oetEACgkQFA3kzBSg
KbZ8tA//XlIRK4ZpJcFDfLiuPJehAlyez1A9NWkBw/JrgU0A3+H4SVz/PPxznBF8
iQx38yKRlB6EIlz0wz0L6Ga/TcNwV1cOxunRruksYMfQcOwwoC9WIPHYmR4MzL5M
DmSiDKJ4SNIZvOSePcJfSqKrh8vLTulcL8kTzzAnM7ARoBSz2BcYKyN5jxoAQn1I
nOXjC3qvBpDEZM28ClMlm3FPwKSaDmyAitlJ+0kYqqXXrU6rY/v/NHlK2O9SJAGB
M9Tvl5QHwV+8Lo5dkrMsmUPBky3+csmdoIMQ31i2UW6kyrqg09JzjHWDz2Sizi5t
avtF0hT6TfrdzKPdnhsHA9eOfEmoWiM4BlNhXFbC3tsifUEIL3mRLHqQZSISNrKu
IzKSebIYMf5NGaGbsv0NLwE+/x4opxCMy0rhYLAlpvEjJQlmJxVTBH7BzoPXgoos
Bp+DBO0/M3KaEBz1asVoGkfSz82fiJvXJEJztyj74YgHnP1nQYNIyOpCzSgHohOq
spBZz3vFcpJn74ceGAS+zWMIgR2RjUe0KjBIxzdwU+ErKEZsrFdsEU6d04R7FcTX
yqPxiLlZ5O959+nK8xp73VogVwIpTorHfHW/wBbvFG24S/PyyJE/1A9YPP7tXQqw
W/FGNUrjFOlaUiuoa/7DzBq2XMP3GzzO92jyLzGUea+nizxiqrQ=
=v9bM
-----END PGP SIGNATURE-----

--JKGvNdIvrY8Ovf7Z--
