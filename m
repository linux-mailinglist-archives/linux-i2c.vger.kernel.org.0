Return-Path: <linux-i2c+bounces-862-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C4F81854C
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 11:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27BD82817C3
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 10:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1010A14A90;
	Tue, 19 Dec 2023 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTDprkVl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D055914A8C
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 10:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9A7C433C8;
	Tue, 19 Dec 2023 10:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702981624;
	bh=+ONJy9Tyv2VAX0kG9k574Z+jA2LozIwM4akoFgekI+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VTDprkVlLqxfWhJ9Gt3WcelTke1ef/WSdZJKN3wYnZ4HR6uTAW8qXuhQhatRZpA++
	 Zvd0XdoDEqP8O3p7g9XKAHUeFYUQ6MDVvZdqiG/lF/i46UkH4nzr9kFEaHX4/l/gNG
	 ucy2Cs5vnCo9a0zXo685kygfz7HBFFMTKPSY9Z3Hu5R0i2PSXPKEZFybcHdAGy0BlT
	 sN5ApH7NsLoedSQzOyf9U8Rfx7UEVd1Vz4Z3ZYvDQUYPNNGITQ5k1DQ8AU61PccslE
	 ucc9pfQHPQ4HELFJjqgHWNlepdgBp3LewMkN+yY/Gq+PI1S/HIL7Olaq4/5Tm7JkvP
	 QemIN6O5sNmhg==
Date: Tue, 19 Dec 2023 11:27:00 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH RFC] eeprom: ee1004: add support for temperature sensor
Message-ID: <ZYFv9C2177as70lR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c295881f-77aa-4f54-b06c-d48031d76339@gmail.com>
 <5ae9cb9f-cb56-445f-903b-9b6139c11bf2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wt4fTMWGC6Du3Qgr"
Content-Disposition: inline
In-Reply-To: <5ae9cb9f-cb56-445f-903b-9b6139c11bf2@gmail.com>


--Wt4fTMWGC6Du3Qgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Also not sure why this patch is marked "superseded" in patchwork.

Mistake on my side. Should have been "RFC".

Now on to your other patches...


--Wt4fTMWGC6Du3Qgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBb/QACgkQFA3kzBSg
KbaE3Q/+IkEPJLAlF3agIPFmPuCpFSi+gLwYQhQzdjIxRD1NL/Uz4v0G912bCnq0
XaYcvuLt8LLdV5Z2PI5XnkWWpqegQKXgTFGDY8hvZIyaLD14MKxf68idfwgGwCZQ
PbueOH8jdlCevhpx7k4EBkfbmwYn3YqO/oVyFYVyU8PAqRXfx7/w9e4FJe5OmhkA
nhcSPzfCbtiFECv35RRw3bojLCG9Sv1Ou0+dwIur0m5sSiWxUjJYcUr9oAid/BsM
jGcqzUFGPW8F9j87zdtnDRfMX1nEI83BdrGYqlQxTOmkrb7SRAUfDZmKMylhEONN
QeKUq2r7W83Fdpl8T1qppJR86cCD9b+SF1aFAldHTU9vAsbUfv59EsWemD5z6R+L
/EDhtezGFuki1M0h+N1nESj8kiSpysgsIZyH0cbE4rfrymNgpaqGAf/RconjAMhV
dfk7SW+gPj6wXZt8rrj9eFXnaNIaCCsp2iLpf+KsPTBV6+06XO1NZvAyHAIw8XzA
3eJ2A5fI014cSsPywK5pOvowJfdnC9BWFPK6zkCTZ7u42m2Bnif9mcSM6pqTsgY3
rlkzKssSPbcKTW42mW8JMtLV3C07yDbvwUJQJRcEkXS99V0dmCfA3yV94m0CKaHI
AbI0vyYKWH8PTKO8X7hgmOqzhNxQ9v5mriCJIMfezeLuSzcFm3s=
=F+fc
-----END PGP SIGNATURE-----

--Wt4fTMWGC6Du3Qgr--

