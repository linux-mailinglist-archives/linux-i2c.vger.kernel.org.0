Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 594BE268564
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 09:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgINHD7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 03:03:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:59144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726132AbgINHD5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Sep 2020 03:03:57 -0400
Received: from localhost (p54b331ca.dip0.t-ipconnect.de [84.179.49.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57E8E208DB;
        Mon, 14 Sep 2020 07:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600067037;
        bh=4QaCxV1ANCdyzQG2uhLjU4WN4uuWbnPoa7joJi15+v4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=x6Lo5MArpn9Rs7aCvAEPjfzyGvmsmGd1BqjG+2uhseL80JDYtleYCptYYCTun/Ezs
         qAy55Qak0dK5LaPgBvXHL/UBusAl4HcurpjAF1PAej9ShopqTCpHJP7D7ihnU93Lys
         6bCthERQ+c4u+ryWK7dh6biC8LtVZKwNPs40qpAo=
Date:   Mon, 14 Sep 2020 09:03:53 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: i801: Simplify the suspend callback
Message-ID: <20200914070353.GC1088@ninjato>
References: <20200901152221.3cea0048@endymion>
 <20200901152837.77bfcaaa@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Content-Disposition: inline
In-Reply-To: <20200901152837.77bfcaaa@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2020 at 03:28:37PM +0200, Jean Delvare wrote:
> We don't actually need to derive the PCI device from the device
> structure, as we already have a pointer to it in our private data
> structure.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

To reduce dependencies, this is also applied to for-current, thanks!


--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9fFdkACgkQFA3kzBSg
Kba5zQ//a/5yPsm8PWfV4c1CR8vJ+cF4WAqGZAxo/WyduAvEA9uw5WWqi6aR4Ubg
ivaesMQm6gg5Bsq285OD1sPCfi0NwPy1PBA5rKMO0NMn4ymLniP4S/D9k0/pu5/L
amAQd1AwSrBQcsPVJVzk3OPPRbqEpaA42F4w/vemdzvcdCSFaZtNS7NyaizVsgWl
OBpJ5eJqhYm7+stYltsadzTJHjscG+sDbQjjrfFwCzJxMTYu+8xFJ59eP34l1SjP
GDo11t7dhOPRQUMaZV8Gy6n7H0EFKjjvidMosP8NZzZ8IUQExbsAZvznBVDJi5NI
a/lGBqk/sBcmlaCMa0UKTl8tHkW0Ndi5Zmea4utSuq0ZfasPCEtuzMXyNJwOWlxv
9wlgf8Bt1DOvbuuEluFyQcAruhyboIujQ9lA3MzlL8TfB0x1V6jIxyXsu9LWeiag
9A5uO9sG9K5wGy8wOBpcTySirFLhKB4eQzsiqQUbIXXLZqKlVjujcOFnud/U2Pm0
QMsKN9hRBvRUv+RFHjL71+pUNAJRAI13L1T/8iKcEH/nxrtuQWFz7N2Hw+LRTeeO
Vq369EwNB9WKk82aB6PeDd4OO5JVDG4JSTiE+MRPoCuIpNZ3DAyM4gIgT6tip2uO
R9A7Cd4SPc8I9zCmjxKruTNDbJXlXlqhy10OCXoK4KUOsQotnnE=
=O+kf
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--
