Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59889336DA1
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Mar 2021 09:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhCKITT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Mar 2021 03:19:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:35020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231302AbhCKISs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Mar 2021 03:18:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9896B61554;
        Thu, 11 Mar 2021 08:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615450728;
        bh=pcPYx32koDPoQYOnqgHXzh5B1hR+EWUWAY4YkutCz7A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FhylOKgCVND8Y9Y2qTErMZIg9mJ00+UGrQGUmieOjOSW5LUWaOGH3h7pggBgVtPM6
         qaWJLoyx9SyhQSOm2amdTZTMFZZJ5NCzmS6kOlMQ/QvdEJITkfJpv79fBqd68P9Stb
         PU12e9hpkKqsSTxjvUi9D71ycfDUZi5XpohwQopGd7U4w+TwGuuzoKeeTXRH/LSQ4M
         7sm3ZXipdFxylhKPtQSkpbebDumT0kKCyn5DFRyxtMOjWHZD0ZkGHHUzJDDXljSaGN
         k1gpUo7jMM0qcYLnnCeRrgSOurn9a1NSfEFeEGQL6UqoXcH3WTEGMehDt96Bljow5D
         15PMBuTs/E1gw==
Date:   Thu, 11 Mar 2021 09:18:42 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Errant readings on LM81 with T2080 SoC
Message-ID: <20210311081842.GA1070@ninjato>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
 <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
 <a67ea323-634d-d34e-c63e-b1aaa4737b19@alliedtelesis.co.nz>
 <5709f180-04b5-09b2-e1c4-53eb5c9345d8@roeck-us.net>
 <d6074923-ee7e-4499-0e54-383a607d3c41@alliedtelesis.co.nz>
 <1aa0dc23-0706-5902-2f46-0767de0e3ad6@alliedtelesis.co.nz>
 <d5045879-45aa-db38-e6aa-4c8ea3e62f6c@roeck-us.net>
 <b41a802b-2833-13fb-58ad-1762a3507460@alliedtelesis.co.nz>
 <d37a114c-fa3f-40e8-4d85-52eb1ff03c37@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <d37a114c-fa3f-40e8-4d85-52eb1ff03c37@roeck-us.net>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Bummer. What is really weird is that you see clock stretching under
> CPU load. Normally clock stretching is triggered by the device, not
> by the host.

One example: Some hosts need an interrupt per byte to know if they
should send ACK or NACK. If that interrupt is delayed, they stretch the
clock.


--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBJ0l4ACgkQFA3kzBSg
Kbbb/w/8DLizM94FZ2EJrsVVPXMLUIQDEIGL3ujBX2GyAsv6HeYmKAJzuE4QhMyE
kE+xExT0T62C8UpKJ5ZHpRYzWXLgiJEucIOS2qlLEjn29rhI+u6bTd3LfPe/YpyB
qMDuUzwLg4KiOPbiyX856rvJ5KOG/EN2owyWxZPXgKuKqqSUe+ewXIaZzu8l9Z8D
qzvSjMhvWdisp976ZCj6ZK1U8j2iHtbijGiOIdmCvtH3TaLid1Tie/BheiwdQMPo
2yDRYK4XkZDwcd8E0qRDN3Ew8Vv71hQH+uSiW5/cGxWSvXO3j16OuQH9TObSI+KI
WAdnpcTyudvinJAnw5xBhm3Jmc/dbTDh0KYFHrPJS09qBg62D2zRKlG0IeFA/p3v
VWmVk6cklvAemFo0iBejL/O9at2ItOZ+M6n3M4zVsuxGM88roenQQ9S74QxXgBKj
roGq1udYl7LJUxDDswBwGyGTsHWcMfjDTVgimEYlvxlPkjJbg7qv0iHnLCl7hi2G
MZMl28mpaWEmkQMAsiQygwezbEgTYGmV1xU7lVxeqDq3ypI51bsInMP3yc3LPalz
wA8Grj0ZQloVpPWyZHu5sAVIKvEafk3NsDvfNj1rOLh/XBsGQRGv8qRuqqjQfecw
YHTA/PJJ3Wn+i31hH9bqVkRVjgyq6iCeEP4STaAu3dCHKQFaXfs=
=FkGx
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
