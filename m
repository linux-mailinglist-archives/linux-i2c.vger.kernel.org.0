Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7C746EA60
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 15:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234073AbhLIOzJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 09:55:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233985AbhLIOzJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 09:55:09 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CC4C061746
        for <linux-i2c@vger.kernel.org>; Thu,  9 Dec 2021 06:51:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8D5D6CE261F
        for <linux-i2c@vger.kernel.org>; Thu,  9 Dec 2021 14:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB950C341C7;
        Thu,  9 Dec 2021 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639061491;
        bh=+BKivEK8TbAOzssPSk5IGPamlrK2VEqnz8nuaj23mFA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KSnDhBiATg4Ouu/2L0CPUsRqZ0yoSTi8isb7bkvC6RMViR8VoJl3TJulmP/WdOYAh
         YCYv+Jx8gzc97E9CsjuHrmc+twIHBEErWwkS5jCeIJijVO+gxWTbdUKBqWeYFD8wu8
         GQ83GWSnkIttALsqUJZUCHz/1LOiv1mkQtjf2h4oB3xb+JH7ahqfjB9RjoO+5RQ7f9
         5H4HXQpkF5yrWKl8YkV7lhBIFlXXK1m5pJhcetRZkRIFwDYpr+Pc+En8qRSCOoYNV0
         Cqz/plAbuyOZzIyRHXo11OYw9OTuwceL5fAhRrTyqhYTXusHq48h8uz0d1dfSkksg0
         t6Peetu8ecung==
Date:   Thu, 9 Dec 2021 15:51:28 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Don't read back cleared status in
 i801_check_pre()
Message-ID: <YbIX8MsNqc1J/nZ6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <f0d7dd91-5b35-d5bb-33b7-dacc632c542a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1E51Cp7T+h2JwkXY"
Content-Disposition: inline
In-Reply-To: <f0d7dd91-5b35-d5bb-33b7-dacc632c542a@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1E51Cp7T+h2JwkXY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 02, 2021 at 10:53:05AM +0100, Heiner Kallweit wrote:
> I see no need to read back the registers to verify that the bits
> have actually been cleared. I can't imagine any scenario where
> the bits would remain set after a write to them.
>=20
> Whilst at it, change involved syslog messages to use pci_dbg() et al.
> to simplify them.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--1E51Cp7T+h2JwkXY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGyF/AACgkQFA3kzBSg
Kba91BAAnoxOXz3lrBANdC5icedKlswlfyyHTy6itoToc+PJ9yemnMHuQlRiFT/W
6+EAAwrb3DNxEUOQbSik7b0S3wzSFxzzqD4I+1GF9EOPUfZmXaEOWuxLLWHDshw5
QyMTQw8mhWIIjq5bJGNZYH3f7njdiSld+eINaTSV/1Iejs1+aMnqBtjI9M2qnf3s
HUFYV1qHRnghAZ0h/7wB2h3hhuIEmyBOcg/e6fM0/v18rKn6BC1K4bNTVnNxRaRk
0r+wxpC3iMp6cm05WSjFleIHRw18blejCxwZ+ikHLnyW0sjYcd4Xv2HBj1ZYXy74
oNYHKihBT3vXv31FjRrznjuAzEpQnZ5Y75lXQXCZ4sQBEcirf7ksyLVqvmJdWkBp
7I026lYj27Bl0iS3ud+MdBCZotN1mwp8/mf4Eu1HLQuUwgmjsNFZ22hT+6tgmigd
BGTshoMh8+qqWFds1G3V8ZPVca3xRgXfDiQT9fjAv+rp0E55lXpQjRKicncQFCZ/
cRSwEs+k4VHBMsSERx/NDmqvWCe7x7IEALiDrx91o57HbafNWzOwpnATEkkZ7776
bYmmaDc4Wgg/qOSzmXYx1tFtN1SGaVRe+AajfJpigNI1GNrnzCeNywfMqI0sf6BP
TYbyztsX9NRA2+Uf8fg9sxGcnd5BSfNrD/uPgRt3kDYXClTW4b4=
=KUGT
-----END PGP SIGNATURE-----

--1E51Cp7T+h2JwkXY--
