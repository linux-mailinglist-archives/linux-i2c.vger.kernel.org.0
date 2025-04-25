Return-Path: <linux-i2c+bounces-10622-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C100FA9C09C
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Apr 2025 10:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 418475A56AD
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Apr 2025 08:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB6322ACD6;
	Fri, 25 Apr 2025 08:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UV49zXPx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02E01C1F21
	for <linux-i2c@vger.kernel.org>; Fri, 25 Apr 2025 08:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568988; cv=none; b=F4C8F0Tbvs0emn01q4fcXQeEf/W3G0J8HLMTk0ImlMdl/14lkbpDY8rGUm6iuLe3yFgCzX3DasdsD9nCBhyx0zYXsEl3KzNBbczHfxQdNQxoHzwDzwexU2FkobgAR8CpFIA1EQcwWW7P5JO7wSU7e9LHv0FnfS9/wBUu8fCeHuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568988; c=relaxed/simple;
	bh=ML3MGBjfRvbAejpFL9dhwOfhahD4S1RPqEovVqWw/Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLCnlm3+d6AyU61WJEVwdwftoHYleLAFQbXgCKWWiQPwDyQeuexH/JEscobJQ0uFA4ormo2SAMQ4dkfDRhujryr48A0R/7nsjEljrEGBrk3Pq5VxFbhOuJYz/u2jq7mCkQkCNWelXcYC27NHO2+YUIJnY+aRGlUJoI7XZ5ddJ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UV49zXPx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ML3M
	GBjfRvbAejpFL9dhwOfhahD4S1RPqEovVqWw/Dw=; b=UV49zXPxYP9H9a/3bOKr
	+mv3DiNwt68joTFi0nqvurY2rJXJcxb3kTIBYc7BJg/okV7gvnxZuIfjY1ON8WBs
	0AuhyF/Frpn7JDilKSeCKZX7lT9HLcWVwgyqnkR9fPSQXnbUDJZJdIq5Mh4+cc28
	wExmX6D3SXXwc7k5Cd7fQnvxg7thZ4fS8X1PG2GSdQCWMcc0mTN3bMnX0qi6xn0n
	QRjioTyF3eOr4eakeaguJ4qkFEGkq+M7g+HutK5JT6P+fpp0y4ts3twrQwNJut1C
	RUGx0ORFtjOsCtd4Dfg5dZzBYEA1t96crT81ao11R512/+3O27UqsOZKbMAptIGk
	tw==
Received: (qmail 3742738 invoked from network); 25 Apr 2025 10:16:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Apr 2025 10:16:17 +0200
X-UD-Smtp-Session: l3s3148p1@LD238pUzxKogAwDPXx6JAAunYj8Nf7DC
Date: Fri, 25 Apr 2025 10:16:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Matt Corallo <yalbrymrb@mattcorallo.com>, linux-hwmon@vger.kernel.org,
	Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: PMBus memory overflow
Message-ID: <aAtEydwUfVcE0XeA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Matt Corallo <yalbrymrb@mattcorallo.com>,
	linux-hwmon@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>
References: <336f298f-497f-4dd9-97ee-50b81221be06@roeck-us.net>
 <1b1eccff-a306-4e17-a6bf-fd3203c61605@mattcorallo.com>
 <1edc8396-535d-4cdf-bbb7-11d559d4c257@roeck-us.net>
 <cfc2b3c8-3f94-407a-a4d5-e7d81686eb2d@mattcorallo.com>
 <84258b48-03b5-4129-bed5-f8200996f2eb@roeck-us.net>
 <fcfd78d2-238d-4b68-b6ec-5ee809c4ef08@mattcorallo.com>
 <eb5796e8-de76-4e91-9192-65b9af7a4d49@roeck-us.net>
 <284466fd-39e8-419e-8af5-41dbabb788af@roeck-us.net>
 <d5abeb59-8286-425c-9f78-cd60b0e26ada@mattcorallo.com>
 <00baca6f-8046-46ae-a68c-525472562be7@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NyooYvpGbs6/i7hR"
Content-Disposition: inline
In-Reply-To: <00baca6f-8046-46ae-a68c-525472562be7@roeck-us.net>


--NyooYvpGbs6/i7hR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram, what do you suggest ? Fixing the cp2112 driver is obviously necessary, but
> I do wonder if a check such as the one above would be appropriate as well, possibly
> even combined with a WARN_ONCE().

How annoying, there was still an unchecked case left? Sorry. Yes, the
core can have a check for a short-term solution. The long-term solution
is to support SMBUS3.x which allows for 255 byte transfers.


--NyooYvpGbs6/i7hR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgLRMUACgkQFA3kzBSg
KbZJXBAAm9K4iOcWNqzMkKdgjPwFDLx0s8Fyrez3UpLlfwEVJ6xi65+JT57q0A26
qZV/wOW+Nd7HswosecFy0ID1AnDnBIGM8Z6ZR6xccjTLXy8ovBKKFrr+HkDoe2O0
d+jbI+UrRid9dgYaMwmGNkAAQ1Mu18WQMngYxF2W9zRWidwr7wDsrmVE/UD8Yy/+
F0lY88yThcTaLSQdt33CsGmeaqYg8Wc4hSzxZQ4B/SZpIKHbxHcGDejwMh7oZZzk
GWQ2GTXeUjNclgtEpt9VllY2N449rlabvMB/zbuCK1PmTfI4bsWj3eAvQlUoYEMB
1bMQgi4oD9FlYcddiw1S2eFDl5B8smA5DCMp0LeD0KBvQ146mr+Mnl+jRALmc5lz
/WDoAG2A4yD0XBhCCYaMYkWIsKb33nYKLgJRI/QJFqufPrN9HsjyYjVBM0ra30gv
ImuP++Br3oldmODBMOKMVrBfI4Jtav/Ycih7/wXOdeeVO5xXMX2H4QvbIFL9MWxN
gePnZNuuYCkjqnWeGKKHTNbO58yMtiecJJC8DQ9CVLxuPPkDxZ+FYpO9zTTTUYRJ
wt4mTj7g6MytBml5d9nsYJjHazNfz/tlTsT9s4Lfgtt0DpY+KV6ja7LLhXV64AkZ
4a9rB5W808AXBjRvn3uNvCWyXfrBu+LFTWsc4uNn0BdRhy1ddb0=
=a5oX
-----END PGP SIGNATURE-----

--NyooYvpGbs6/i7hR--

