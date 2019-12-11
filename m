Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDD211A582
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2019 08:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbfLKH7E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Dec 2019 02:59:04 -0500
Received: from sauhun.de ([88.99.104.3]:47760 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726983AbfLKH7E (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Dec 2019 02:59:04 -0500
Received: from localhost (p54B33103.dip0.t-ipconnect.de [84.179.49.3])
        by pokefinder.org (Postfix) with ESMTPSA id 3F4D72C05C1;
        Wed, 11 Dec 2019 08:59:02 +0100 (CET)
Date:   Wed, 11 Dec 2019 08:59:01 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/17] i2c: add helper to check if a client has a driver
 attached
Message-ID: <20191211075901.GB1161@ninjato>
References: <20191106212120.27983-1-wsa+renesas@sang-engineering.com>
 <20191106212120.27983-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline
In-Reply-To: <20191106212120.27983-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2019 at 10:21:01PM +0100, Wolfram Sang wrote:
> Factoring out something used in the media subsystem. As an improvement,
> it bails out on both, NULL and ERRPTR.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I picked it up myself now, so we can start using it right away.

Applied to for-current, thanks!


--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3wocEACgkQFA3kzBSg
KbZ43hAAqz+5fi6ryOKPqPuTqiq7QeV1g8DyDLaJNKtBdeZfaSWXezGbkF/x3gsb
0jP38WFTqBQn2GrsY0PyCgeAVYrxZfiU7B9yIuOUb/INElibFyvWwGg/ApvHQ0Uz
lzzuFaRNvyNccwmgE96s0TXlrQJLWmIfH3edtAajiOWG0DgxyW0RzuMTiT3Gg8rY
dZfUJYuregJbUZpTSjGlno6ANJp1TYRXtFWbtIBqlV8EwRVuVPzXRrui9+GDQzYs
19cK292jttoBLLHLHMh3JXAgtZfiMSKMk70kC1JZTKZOohscFn6KYkvUqSMR7QzI
jtaytTNhGsiT5tfZZzO0V7vfEE5pw/MBEr5AHxrtpG2t9lcrjGOXnys96P+mei1W
pTPWOkH20+YUPsmgr5Ri2H9AUF0qgsGj+jkThVpO6+iGNS5RavXs/QWXkzDlWkT8
csgR+u3r4xSPGZT/+RxgHbDUIU305kVwWOewAa7A3sYfZIG8qnHGrDbxIqHqnxTD
wMq6MSAevLTBAvF5LDPUOqrofniu9ROHKTMeh64ZlE7qj4cDcD9/Wnz3smmHqi/b
FngQQ6CL4LQ2FszNDPoEchwxfWyfh7pkBwWwBTEITHws1Sl50FXdbV8wU99+MLoB
h73PWflvKagFNtgvsy3gHryPj0gLOtX+aNWq8zWq2JdxQHvBts4=
=l2uc
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
