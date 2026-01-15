Return-Path: <linux-i2c+bounces-15187-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E34D24E72
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 15:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 618B8301FF5C
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 14:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EBD36C598;
	Thu, 15 Jan 2026 14:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YCHEx58W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4E83A1E64
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 14:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768486588; cv=none; b=Rlgnpm8KSYGBBz8GQYVXLY43ZxITUaRDNRGZ2C1R8foZvm0nWBAkCpbP43BE9lHhybrwj2wj8HOKwzvvWvisi2cHbNUW5bcYcnHlksu7YlpvOOwYqjO5n29ANMRYdqiRZxfczCyj+q0PS5vjkmJqxR1aVbAiCDCQ0SOBMm5sk7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768486588; c=relaxed/simple;
	bh=D+K2A4etlNeroSQ2Ovys55QUK/lQ+5yXwF8QoseIZfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okM3GW3K43ldaIzdzAPyN3M6T5D2+7Ul4cxLMH2GowxZXMZK+Mb00un4GnZueX7zOpBSV41ZVhEteMQOIQyqQActk38mWWduFNNmje841dwxQlDJbOuldoDuLczuTrn44iknHhr5hQIgv4gZ7vg5U0vBXsllM9BnU/1efPx0fwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YCHEx58W; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HFrO
	TLFiVzOjkHSapJmcAyWe5EM1jzgnrCKz4RMxoDs=; b=YCHEx58WzOpXPF9cOQpj
	byv4nz6aVo9dCFVPq9628hqwPZIp8T/lKzOvjKRzdx2U1JW+loXs0wktf1EjrCaW
	20mQmRRvYYoiNHpliABmvCmcOv9MTCADE/Rf+ZR+SafacdVQMctHMCPiCPG5wUIo
	0UBNJ3I2+iUp6vQOCjtE4QvCs+X/Lqx8PQ2jXdBcAx+FQ0Kj2N/tPIbeGHNHamRq
	GA+mQ9UKWvQoOnYOi/1ikJvXMCBTsc//lhUCszv0IdYnrN35NBUA+rsxiZwzp9vd
	zMlpJKfuDMdmLQ/qhDSff+04lGn5P9naR/AAfqBiDQSkAyrquB1e7PwrsEa+uD43
	bg==
Received: (qmail 2569104 invoked from network); 15 Jan 2026 15:16:20 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jan 2026 15:16:20 +0100
X-UD-Smtp-Session: l3s3148p1@QHBh3m1IDMi5aIqj
Date: Thu, 15 Jan 2026 15:16:18 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [RFC][i2c-tools] Accept device-node path as alternative to bus
 number
Message-ID: <aWj2WmYeOrr7YbEa@shikoro>
References: <DE53PTBTBBBY.24N093ZM03IKQ@sevenlab.de>
 <aRIPsOOgs5jtxv9D@shikoro>
 <aUAUAG3KwQHHqgKq@shikoro>
 <aWaDBzAOm86XSZgP@ninjato>
 <DFP7E7BGWMP0.T3BHEX68KHFJ@sevenlab.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8IRwo+Sjj9Y4ngEg"
Content-Disposition: inline
In-Reply-To: <DFP7E7BGWMP0.T3BHEX68KHFJ@sevenlab.de>


--8IRwo+Sjj9Y4ngEg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gero,

> thanks for following up on this and sorry for the late response, I'm
> currently occupied with other work, but I have this still on my TODO
> list. I intend to tackle this once I find some uninterrupted time.

Sure thing. Thanks for the heads up. I will stop pinging and just wait.

Happy hacking,

   Wolfram


--8IRwo+Sjj9Y4ngEg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlo9rIACgkQFA3kzBSg
KbaSMRAAmlNvgDhQOU0NUZdU0fQ3hIvlwKpKOxCWxTw/1UHmzm0k/SrQ66ET5FTL
uJ7Yvh3j19ErIUA+2fUm2H/5WdEmW082rjzUQhK3kmiMGJG4QE1rI+hNlI6LXoHk
kHZWPdDvGUUdApKoTvQSBZPsHOA8uUMnHtyRFvpMCUK2IBafa3wtqVgm89FE7rl9
5A2u6jKdDYxElGW88G93kDewznyyxNQxDD94BD9I9xRUOBe8ExXgeeBBHfK7zAMU
OTGONXNq9ovOdw1dIT02AxIjZL1PEQpL+6vZffMNIJqoVuTMSfDKSN9ox4IhfwNO
Kbfrk+MdmK0EkY9DLR4FV4jBUKEAuz98zep9RANvktW3DJFrUWZFIZXNqhUxiXOK
ItcGzLJGzKkzHyUY2tDbk7v2RX7cxzXQLV+rIn7MRl1iVV1n2H81Bf+y7lE5fam6
kCadxo+FyKLFkoSLRg+tQ//px+HzKqkm9/A8DrH9yk5vuCn4gfEgCAN9DK/64qWQ
PKl8pMA//mP7U9ToFoMudIkfNUbuBJEYgOhcw+hkPECQJLQxBaG+uho6/hjFWw3B
rQJOu47mx/b/liSMlH5xnVvumCAwPBt3jfGHtmbmWj13YOeipmqZmcTXd3fOMhN/
l2ktnWtciG8MCQj2UhlIVUcdwqjlWB4VmPEpaAkmH3rmkkYUoJY=
=qjc7
-----END PGP SIGNATURE-----

--8IRwo+Sjj9Y4ngEg--

