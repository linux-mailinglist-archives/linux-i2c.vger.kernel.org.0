Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2ACF139C1A
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2020 23:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgAMWDS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 17:03:18 -0500
Received: from sauhun.de ([88.99.104.3]:43048 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728769AbgAMWDS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Jan 2020 17:03:18 -0500
Received: from localhost (p54B332D5.dip0.t-ipconnect.de [84.179.50.213])
        by pokefinder.org (Postfix) with ESMTPSA id 02A7E2C06DA;
        Mon, 13 Jan 2020 23:03:15 +0100 (CET)
Date:   Mon, 13 Jan 2020 23:03:15 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/8] i2c: tegra: Support atomic transfers
Message-ID: <20200113220315.GB2689@ninjato>
References: <20200112171430.27219-1-digetx@gmail.com>
 <20200112171430.27219-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline
In-Reply-To: <20200112171430.27219-5-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 12, 2020 at 08:14:26PM +0300, Dmitry Osipenko wrote:
> System shutdown may happen with interrupts being disabled and in this case
> I2C core rejects transfers if atomic transfer isn't supported by driver.

Well, not quite. The core complains about it nowadays, but does not
reject messages. It will try the same behaviour as before. It will just
inform the user that somethings is tried which may not work. I probably
should update the error message printed saying that the transfer is
still tried.

> There were several occurrences where I found my Nexus 7 completely
> discharged despite of being turned off and then one day I spotted this in
> the log:

Given my reasoning above, that should have happened before the warning
was printed as well? Because same behaviour. I'd be surprised if there
was a change...


--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4c6SMACgkQFA3kzBSg
KbYdthAAktOJQ5liEIA8J0/p6JdKT4r55B/YAQUW+Vd92Za2knjAl4G08A+jI5m9
yY+R3VsS8liSafqyrpYJayW3MjBr609srwUidjT466OnnbrlHNUWP++bMwc2bd4r
D5GJnDeVtjroIHk5pFj4558MS/a4sNkw91dxl/17f4/pyUQknD3mECg9riV+fTx/
jCMJC75pbI/fc8kbfE67kNUUs9sXZqgfvnJkwtAQ9fwv1k00qD9WH9Hh5dhI2Hra
H6FInqMrsW+bGYXIK4L9WlNejumo7nPjP1sv3pbq7pjt+EXzHwRO4oNwHWGm41jL
7nZg42H5wRYislDFUdxjQgTnwHa6zUdhQONt6i7ZPYoTOSh9nm/jWpLJBvKki9BI
sdslfOHTvrIKcWtDwb77Afv57//ZRX1nMUk0+qun7oIGORjFtCT4QyB1gAWdehTw
Wh4hiTLQrAmUj7l8XeVjiKjtcqHxJn2rG8MK/mQgjskdpH9wrb1l7n2Ckyyk8K0y
y59nhZkDlEdamuwYcmQKrmw8UJGWASoG45ULHkwKKb+I90Jp47H9ShlB13Lja0a6
/+/FWKMEXNR9bRQ3NStOswfPMPJM2gzgm2YEbXLkaBCmz6i6zztuBzX8WIHPhmwx
4OtSMUKr51lY88iBWl2XtTr819iMR8C+ewU1I2R309Q7W5Wr18Q=
=ZZXy
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
