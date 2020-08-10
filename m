Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCB7724040B
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 11:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgHJJcQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 05:32:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:41800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726029AbgHJJcP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Aug 2020 05:32:15 -0400
Received: from localhost (p54b3345b.dip0.t-ipconnect.de [84.179.52.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A5592063A;
        Mon, 10 Aug 2020 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597051934;
        bh=rYQETMEuY/Gnmi3nPJ9bLKGcfo7ypYEaqWHmvIY24Tc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZI/odSDLJ46htbJHrtKOR4bSJyXdmSnl+ezLotbpkI4adzDtDDcKnlPwWNvQDfEre
         MWW8hGpZ8+DATaSpJW9ecUCz+MsWwIBtyEpjiJPtKFJBfZ/itGxkbl/4nKiDm62+uf
         bP4Iog99TecSpL6t6saehA78DrIR4ISeI9rL5+4w=
Date:   Mon, 10 Aug 2020 11:32:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] hwmon/pmbus: use simple i2c probe function
Message-ID: <20200810093209.GA1290@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stephen Kitt <steve@sk2.org>, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200808210004.30880-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <20200808210004.30880-1-steve@sk2.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 08, 2020 at 11:00:04PM +0200, Stephen Kitt wrote:
> pmbus_do_probe doesn't use the id information provided in its second
> argument, so this can be removed, which then allows using the
> single-parameter i2c probe function ("probe_new") for probes.
>=20
> This avoids scanning the identifier tables during probes.
>=20
> Drivers which didn't use the id are converted as-is; drivers which did
> are modified as follows:
>=20
> * if the information in i2c_client is sufficient, that's used instead
>   (client->name);
> * configured v. probed comparisons are performed by comparing the
>   configured name to the detected name, instead of the ids; this
>   involves strcmp but is still cheaper than comparing all the device
>   names when scanning the tables;
> * anything else is handled by calling i2c_match_id() with the same
>   level of error-handling (if any) as before.
>=20
> Additionally, the mismatch message in the ltc2978 driver is adjusted
> so that it no longer assumes that the driver_data is an index into
> ltc2978_id.
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>

Still no detailed review, but I support (and even appreciate!) the
conversion:

Acked-by: Wolfram Sang <wsa@kernel.org>


--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8xFBUACgkQFA3kzBSg
KbanKg/7BAf/sKdiycBUflUoB+Aqwr8+6ECBg5faGYiLlco2Ho7OTFU5G3HbIc3+
Ygj/5BON9feshnjbwmDu/0+Mm0T1Vr91XYHPSxq4WKTHuNZa4NiAARWfJQlZ+/h1
a2dxBZlYrv9UT54THde7GIrJa/eScVclPa/QfQetzrEggM1D1Rjl8jlVETe7ZiuM
AuXqLyILQwdfSvuL/sMfQ3LDPhvWmPACGhiwiJE6KuT5BKvRGYQzYVMltwHITX5a
TqTST7AXlasj4+XBCmAbLsS8d4qodXvfSUTHnrsgAYoY6eBuV9ccnkX37TBxCDEL
G8aG2VnEdU0glQ8EiReNZUYCswHXq7hQ9QzJz967qcounKsjchcTM+yR9Rdgj3xR
oe71Mx37jNLozylq3mHX3MflCxR+MhuornB/r3hi76pg+VQbR3KM3o5HQxLwcmhS
NHgUgo7E+ua0cH+/30iHrIWPJC+uVFwb/HL1ZlVOYGoexPt733EdOHRDKPRR5MQb
EGD2WscVZwj5Gfopb+huUQmS+YsbeswH+waNIC7HFVa3lrpm78wEuFrs0rot/5Ui
mmPx+IZBxTRGHP+RQa+dM4TTqk+KFWAul/s/puw928lvyEni5Nyv350F4F/aL8De
Kdl75gR7rDcT/rambE4X9SJbwsqVG4ckR3FOdzu4xELKeCJnZmc=
=P9Vd
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
