Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1E8324D0D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Feb 2021 10:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbhBYJkX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Feb 2021 04:40:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:51450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234250AbhBYJiv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Feb 2021 04:38:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C513064EBA;
        Thu, 25 Feb 2021 09:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614245890;
        bh=5buN3EC107S76JKghAcicRI28n7jlFz14jT62JQaKPU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=euBaOkbadcvUXmfC2VxZUjDjRqbhLRRIGr9iOoFZJ2l82JgzRCpRJBInxlw/tWUJd
         TTBSPZMLXSAccC+6x2QJmEhQNrCwFx+gvBeZBvNHgMUKRwP8OuPTGerA3pYT0LdxBA
         kRJCHjgNqA9y/NKEsCAxUbkq86lQ8UJOEHQcS3yHCICalSLAGdqWxdNIzGR5Zrbcbj
         C5Jf8/8x9yHMliTa7nd0gIsBtmcx8mfv144Vh+jOOjzsiz5MB8fwCJNqYctgvvQ6yj
         q9/R5rlVpQ6OFSY6IyZY/z/okNFF8w8aKrdzmT49zjKr/AGYdHd6jn1E9Gyk2rJHNA
         +NPUW4HmrHUrg==
Date:   Thu, 25 Feb 2021 10:38:01 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Nikolai Kostrigin <nickel@basealt.ru>
Cc:     linux-i2c@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Colin Ian King <colin.king@canonical.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: Need some help on "Input: elantech - add LEN2146 to SMBus
 blacklist for ThinkPad L13 Gen2"
Message-ID: <20210225093801.GA1008@ninjato>
References: <0d1eaadd-5350-63a4-fe6d-f8f357c49504@basealt.ru>
 <CAO-hwJLmByHHULhJF60qOUAqprkqZpSvVh-GFXLZ_ndL0guvPQ@mail.gmail.com>
 <e1fd99ae-8e46-0b21-1011-db73cd75523b@basealt.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <e1fd99ae-8e46-0b21-1011-db73cd75523b@basealt.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> I had a preliminary discussion with Benjamin Tissoires and according to
> our agreement I repost it for wider audience.
> Blacklisting the device was decided to be a bad idea.
> But actually I managed to get touchpad totally operational via SMBus
> using a following hack:
>=20
> providing a parameter to i2c_i801 driver:
>=20
> modprobe i2c_i801 disable_features=3D0x2 (i.e. disable the block buffer).

So, from an I2C perspective, there are two things to mention here:

a) I am in the process of extending the I2C core to allow block
transfers > 32 byte. This is a slow process, though, because we need to
pay attention to not break userspace ABI. If this is done *and* the i801
driver supports length > 32 bytes, too, then it would work natively. If
the i801 can do this, this is a question for Jean Delvare.

b) I don't know Elantech HW but there are devices out there which allow
configuration for the block size. Something like a bit specifying if
block transfers > 32 are allowed. Or the SMBus version to support. Block
transfers > 32 are SMBus 3.0+ only. If your HW does not have that,
disabling SMBus is an option, too. Disabling it in the i801 driver is
too much of a hammer, I'd say.

Hope this helps! Happy hacking,

   Wolfram


--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmA3b/UACgkQFA3kzBSg
KbZgIw/6Amdf7SNeFb/tzaL4tGkVQsJrbp9bEb04NSYN+KcVlsRlXGz4jV6Uup5s
jyGQi3Nv64TdPTm0ASUnBEgvBsmniASxiCbLKpmTwpO6IfMp+U94SbeT0l2B5Ezu
PFrxoRGyX1nnolfi1SL12SlyMJlxPjS2BXtE2ZOnoSGVi8UWTC9hvJ5lNVYIKTQ4
EdBxhS78ptsrGxetlfao40+8pVFRWDSS7GtaXoNoUU5Ih71GVL4f5xWQYtKGWHJ4
6TJjHQLHDhU1r978oqC36TTflQCnuwX1uShHqMIIz3cuqiQRbyHp9s8r1acGaKd0
EtOVlLR0O3bgcdN/pFHzMxJKg6O+l4xQPdX6cD7KA6W8pNAtmRMXCSUvzZeVArO5
dXL6j1uAtSPp55oc8zGjXtvnKDc1rvsNPtLOKlOK1JD6cMPwFZYfxpWVdjeiUpv5
O9Kcf3ZW5w8CqSN5HDIU7rlJZUzYUNULGIvpNPMBp6CAcaQl7rray9QNqUM7iN4N
oraCEkjtF/xa+65wGMpLSN1a03b7iGNTwVwxjNjPEXWT76ikjX6tZM4BXmRdMI/u
FlpPTDWieZyEp+UEzm1a4HOxsnOQ2KpUW1YlEQk/FC3kRBBOn+DMaD21Mfz2uqCO
m7oXTTNAI5w2AYfSvmLSqHrPV+ber09CV1T4i4wZUAqZuEU5X1o=
=ZevR
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
