Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA86E3B05
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 20:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394140AbfJXScA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 14:32:00 -0400
Received: from sauhun.de ([88.99.104.3]:43660 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726155AbfJXScA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 24 Oct 2019 14:32:00 -0400
Received: from localhost (x4d0bc9de.dyn.telefonica.de [77.11.201.222])
        by pokefinder.org (Postfix) with ESMTPSA id B37FF2C011D;
        Thu, 24 Oct 2019 20:31:58 +0200 (CEST)
Date:   Thu, 24 Oct 2019 20:31:57 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 1/2] i2c: i801: Add support for Intel Jasper Lake
Message-ID: <20191024183157.GB1870@kunai>
References: <20191024105726.10802-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
In-Reply-To: <20191024105726.10802-1-jarkko.nikula@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 01:57:25PM +0300, Jarkko Nikula wrote:
> Add support for SMBus controller on Intel Jasper Lake PCH-N.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2x7h0ACgkQFA3kzBSg
KbYF7A/9HgfqtCUKRvAsbE/JlnAQQKO4RU6w8adnfBgENHiNY/9VV+cqDRt9jTeB
z910NRkO25LYHq1Ofohy1GAhVg8ch6P1awIcH2zbl0WKxcjq09zVs9pSrl4u7V9x
3VmxcM/e2bD1dZuuLHK0GDfGHbyEhLUBTI+f0f/GSNVGTcf6Y4R3rFZYBCdQ0xNm
Bn4ILMQ6X++4iK6DXFqL0AqGK3lNTdcbV8FGX+EoUJXFNURUNCtZZbkeBPfCmlaV
BgyLwmnuo7E0+SVUOZARWbkDggyFLmt+0xgAXMg9fZXnR/pMDQnLS/jqDpwrafCU
BULSe/2CJbrxq0QnvTQInkiUR7kjNbFbhCBOockYgdKvbzC32vr0fNsR7Y5Se4dH
17Wn0LTck1W93mjKeuGPpd0B137JHahgoFTKDAhkou1n++4wV7WvbjFj8XyrX288
EYkfsHkarR43InrfuJ2Z+GHe1WDOUpN09i6wVb6b0s7nVneLZkIc+86HUpEBjY3m
wt/9ARgObYElLZaRxJKO67RCS7usK84YqPcEsvtUQITKaiPjlFy2BWRN9dWcLzqE
sihVWqywo5FQIcxw3DOI4ptNkn/dTwe5SIWKhhbD84ueRXn3Y+YWURhP5w1smH/5
BoK0cI0KDJgBCcGmxle8CcwDAIrYFzvBHsXQh7CLNkQHq8lfLxk=
=IdfO
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
