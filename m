Return-Path: <linux-i2c+bounces-10273-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDEEA86279
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 17:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC8377A5EFF
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 15:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D732144CF;
	Fri, 11 Apr 2025 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RMmp59T/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05970215182
	for <linux-i2c@vger.kernel.org>; Fri, 11 Apr 2025 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744387047; cv=none; b=Q6VO4Uddf85Ejw4qOMPoK6hgG+jxLAxVGJxeSFNECd5WjFH1Prp9R0XnWPbl8Mw+DpQigqyNbKjP4AWXnnS7LWqE81kwOrxJvXCgP3D3PsbjAUpnYeFKHl2O9z8qMOycwIEvhPn8eCdMtvBTSKqj+hla4oxEBqW170qoqMrYUMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744387047; c=relaxed/simple;
	bh=LqghTYF593CarAugcf79Kj8blCIBi4NI6YInaHVlFng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sz6Kjo6vK7TGzD0bIT0QiafktxRn1L6Www/7+RXABIqffI6j50564U6aodcCbZGc418Dc8DrxPoEzkyBmCzcSO6ef8Z/fRWKdVwTU++YKKCGOmHgxARg14QhyHftekN5l+UzW2bElHEWwqLjRX4qQTO/a4u8YFkX0efoXJFLFfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RMmp59T/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Lqgh
	TYF593CarAugcf79Kj8blCIBi4NI6YInaHVlFng=; b=RMmp59T/8aCi2VNF1ahE
	FX8ON3oJilCNa5faaJV8YMzNPTwHalb+14aJ2Q79+w7azOX3/vVnd46NBl72HARq
	iVhFW2T4IYZrZA4OSKXXdTLMhDIslDKwZPuxoLlNeACTs7N853jrZgiPqd0udQt4
	/J5GJ7d+z+n92zY94y/bwDRq5AmUTcrlymqsMjjz5FZJ+t8PEeWoOjIfgoabTnq8
	L7gNgMS/E/xazgs5n6ZsLldslRHzEXug47cAQKcVVYp5jYBhYsk/4WR0B/WIFQ33
	xO4xtlmBy4h8oSsp6FJv55O7enY9BQQKauulWO/iOL2djwwKZPLkzFBxGw5wvinP
	XA==
Received: (qmail 1350989 invoked from network); 11 Apr 2025 17:57:23 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Apr 2025 17:57:23 +0200
X-UD-Smtp-Session: l3s3148p1@kkYWwoIy1uMujnsS
Date: Fri, 11 Apr 2025 17:57:23 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Anshul Dalal <anshulusr@gmail.com>, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: I2C: can't detect Adafruit Mini I2C Gamepad on Linux - other
 devices detected
Message-ID: <Z_k74yFvIHRy7UpP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Anshul Dalal <anshulusr@gmail.com>, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org
References: <24f08a7b-4a3c-4cd6-82b7-0f2c9ab4bbef@rootcommit.com>
 <8d0c8005-57fa-4883-8a01-343ab9170643@rootcommit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xeKd/KTtUp+o97yd"
Content-Disposition: inline
In-Reply-To: <8d0c8005-57fa-4883-8a01-343ab9170643@rootcommit.com>


--xeKd/KTtUp+o97yd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Plus "i2cdetect -r <num>" shows the device as UU for address 0x50, as
> usually happens with a driver is loaded.

Always. The address is blocked for userspace in any case.

> I thought that connected I2C devices always showed in i2cdetect output,
> whether they are declared in the device tree and have a driver or not.

This is a valid expectation. Since you used 'i2cdetect -r', it means
that the device does not react to the read_byte method. Very strange (if
not even against the specs). Did you try without '-r' to use
SMBUS_QUICK? What driver are we talking about anyhow?


--xeKd/KTtUp+o97yd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf5O+MACgkQFA3kzBSg
KbbIHQ/8DBKKM+xa33mVRwuOqrU50yjBmdaLgUJoCaD1MTwYUGFvzryicCpHIsk/
8CeFZJYi+7JHJi+iqLPQvVVcFERx8CdSO026ZW8+Efp0C8W3PiBuMZDJ3v70AQw+
Ab2WUF4rJvxZdxyPhN0f2loVq6JRMRAu1BiEWALqKhPWp7hLUlLFs259/toJIWE7
JRIDQnmiFLhvCugk7KJFhvX5RcwE8acWbvt6EYIo+GKpAf09v6y9bQTvbBXm/DCK
qAEknsLT4IKe6zYQCpmk2dqgap18Aq9bY34Es1zXqpkeXbTV1E1taSGFYRCvLxnA
7f8krKOPp/ilEGnJIv01dMOpM1Dt9TMAZK7SuFGnqG9IhK7OyJypqK10ew8Upq0h
Lpvf+ksJbLj+anI7jojEd4vYDkui4A8C4fVkKBa4zH6NCkpemETZ8tioP8THh44E
+lhXzNM5qQj7k0HYlavn9DLOwOLzCocKzzwxfHoqq9t5zY/5lSLAyrjFHS4T/NDs
TOqGKvQTV/5B1Av4cllGFZZgb3mV24qNHFmPzUzN3mwFZy7RMrPq1+/dRv22+MPj
fHYz/DloVx3OKBaNP2eMG3QglimY+XIYm17pzHRbK6O5fAX3xxNfKoYYOwjnkiNV
o8y21KIrViPJ+61vpYbbgrMWeDkgJB6vUO2RbDa3UG8QBANJGu0=
=pMsv
-----END PGP SIGNATURE-----

--xeKd/KTtUp+o97yd--

