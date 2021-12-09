Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6833946EA62
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 15:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239003AbhLIO4H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 09:56:07 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:52734 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239004AbhLIO4H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 09:56:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 339A2CE2502
        for <linux-i2c@vger.kernel.org>; Thu,  9 Dec 2021 14:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A24C341C3;
        Thu,  9 Dec 2021 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639061550;
        bh=5vo9dFDfhxGSUsvvT67ykGM+0HnyOXExfj6uPP1FSa8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tpGIdJJd2b3qNfaucaICFKXEBGdurxk5/XLuci1u4JeNl1T0tY2kl2QWhrOXuuH75
         rgzzrBRVRfTKXIgtyXioJjxPc2oPG8DRhPcw7Byj1HYNO5I2TE/4MNGUaOUcEdG3j5
         jCI/hTqMFqWQXdej2ZzJBEqQeXQN2vaIY12HnuwT7aYTiO8QZ+GI4NrPbiiiz/Ltzb
         yNahnvoifF0yB0UF4NcJy8znS5eVF4YcJH2HR//IjmyxD4oLrRJfnUJKt48wvsIUbV
         i5MWE6kDvLlIipMYlqxCeYRvG0bCtghI1ECl7zarLZnA/7xpavKLzCj304/+33qkye
         rbhK/MZmsHl3Q==
Date:   Thu, 9 Dec 2021 15:52:27 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v3] i2c: i801: Don't clear status flags twice in
 interrupt mode
Message-ID: <YbIYK9dVyUOCT85f@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <bd0def53-4e63-61eb-c0bb-9975a308cb1a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QCK0E/vsakPWAxAL"
Content-Disposition: inline
In-Reply-To: <bd0def53-4e63-61eb-c0bb-9975a308cb1a@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QCK0E/vsakPWAxAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 09:04:40PM +0100, Heiner Kallweit wrote:
> In interrupt mode we clear the status flags twice, in the interrupt
> handler and in i801_check_post(). Remove clearing the status flags
> from i801_check_post() and handle polling mode by using the
> SMBus unlocking write to also clear the status flags if still set.
> To be precise: One could still argue that the status flags are
> cleared twice in interrupt mode, but it comes for free.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--QCK0E/vsakPWAxAL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGyGCsACgkQFA3kzBSg
KbaQmw//YfzeKsHI1OHpsNrdJKugunPAAfkq/6Cge0NuHcI1B6hH8JNWkklp7J3h
StOtHqq64/tMkR141U0tIsEd7YRdT39ZzC6O2ArE597yvuH9DG5zTTjJ/oqfr/XY
hhfNUMH44+tHmHCRQlWEXL+AX70ZgOKrwwZbu8QbG2vXGfGu3DO/kud+HJdGsanu
RjW5FKiShbyLPblDawfAyVu3gmNhtQmZUuDGaQsgWq1j61fkK6JmCEIQ7xDaqsw0
Aqy3uwWm0IAt0zeDn+5PZZUns6vUT9pQjFvCaS0deP7q30tZpzWLV1SwS6VO4FxT
adEy0+JuZaNRszzAo30E2hzKO8JtzIxH67wpWnfDE2D5ZxQjOKOmhF95lG4wr7Tr
uxDIhbWQa7u3tePIqEpWUHcsPT/8gLXwY9lXmUv3Sio8PuKXXyOmVaWUqX9tlQU5
7COwF3+AGCIHmWycedpN41szfRCti+krPDzzssB/2EVS1KlSAsJ3urbTfbteDHvq
8EWjqcJGV6ZBlJM/xUOONwsjGZq96Ib4XjoHVxoqYA4+lQeRHQnszqRaxsckbnP7
nAsgzavd/9sE2MPGwNvHqrNg81yuxPibe7nmkv8qDNfeKKRYNe/9pJX57ZjKbDOy
frjSLWwpfM3mAmbDqAhgXCeF/qDtUKCCjAqZxU0toyQHwiajSZw=
=ZKEi
-----END PGP SIGNATURE-----

--QCK0E/vsakPWAxAL--
