Return-Path: <linux-i2c+bounces-2817-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB30A89B8DE
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 09:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED0221C21D00
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 07:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D20551C39;
	Mon,  8 Apr 2024 07:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hQvbveBu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897C551C27
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712562141; cv=none; b=J3MXQb3tSTZpg98HHD+upGxN9qarhtlis+J+6fKWkPkoGd7AiPnyjXzVQ9YQZ1s5udvJVRWzMfKDyGsyH64q+GVt+cMNRzgbHV6sXQSHlb3akj4TB6Ptc8bE8WWJzQolUywEga8h7WgTHcSRn1ezeLbhbSgQ/LE0BlFeQi3skTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712562141; c=relaxed/simple;
	bh=sQaiKpHQ/grc+S1rrSPuqj/KActdCadp2yx5opDdYKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuxuTTEImoaTrxOPa1lAyfUBnwM9gx/ZbtdqpODeKBb3Ve3ipz21mtalaoPOsrkSeG3faAMpRBbXHoI0suaGVWFNdGEhvWgwQtabFoPxXoi5q5SVMizy3Au8uWEBhpqjY/PqIrtWrY/JRsD6cnktA3EteTNrRGWPy5rOinMUfYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hQvbveBu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=sQai
	KpHQ/grc+S1rrSPuqj/KActdCadp2yx5opDdYKE=; b=hQvbveBuVoSriuHGldNQ
	r5EpTjWwEy6miiD61OCLuyLU/kTCngc842u9z8ZG4vPpJ6xKMN7Eee2GFgXrtKyi
	/GzPEuyV+aNXNaT5L1yhDvgjNM+XMQPCpSeq9ay2/kz6JRupIzF1NJU39vxLv+K5
	KExoQYyF3CssckY42Pwj3ho/hMlP7l7Tl+zJD7FKP+xr9sS+/wayjFUZpdf7Iz/0
	OirizXBamkInzG+6/Hh4yHRw/tlVwLv3ZL8HNavPUC6HkPtOoReFTdC1M1oVZfKP
	7zpM8RiS1K8bbSfWFGjuum58Ib3STriF9BqRfkZTOX4SrmZgPEkYWs0qWBDALCgN
	1w==
Received: (qmail 686920 invoked from network); 8 Apr 2024 09:42:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2024 09:42:11 +0200
X-UD-Smtp-Session: l3s3148p1@Gj998ZAVdNQgAwDPXwE9APSWg5D5lDs4
Date: Mon, 8 Apr 2024 09:42:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: i801: Fix missing Kconfig dependency
Message-ID: <ixtm7tq4lpnaq64lesbgefphk2f7mmfnzarx7bgd4ydxl6ehma@ukzbhugjspvl>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5b43041f-4f97-41dc-87fb-c2da425e7654@gmail.com>
 <4dhfyaefnw2rtx5q7aaum6pfwha5o3vs65iqcrj2ghps34ubtw@b3bw3gggudjs>
 <b31f445a-6f9b-47ed-94eb-b80360846625@gmail.com>
 <ilxot5cgzlivhmxpuiifpnyx3jxymlxy2avnkqjgfzcgmmk3wd@glnv7nlydz56>
 <a4092c9c-372f-4020-9a47-72941b8690b1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mxlsk6prfq5tsb6z"
Content-Disposition: inline
In-Reply-To: <a4092c9c-372f-4020-9a47-72941b8690b1@gmail.com>


--mxlsk6prfq5tsb6z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Another simple solution would be to move the implementation of
> i2c_root_adapter() from i2c mux to i2c core. It just uses
> i2c_parent_is_i2c_adapter() which is an inline function of
> i2c core. What do you think?

I have no objections putting i2c_root_adapter() into the core. I think,
however, that this patch makes the code a tad more readable. What is the
downside of the symbol (despite we have way too many of those in
general)?


--mxlsk6prfq5tsb6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYTn88ACgkQFA3kzBSg
KbYh1g/9G24i1kAH5rnjKB1C3FgZcUiPBwrQc/7PYdV0+vzcgClmZcBkijX39SKS
lbHJyh5DYEHksIvxisidiGYfgxIyMTWUp8EdyB/iNGWbZO2ojTOV6YnfTuVZ5taA
hcVONV9XKgH3yeoudm14/YccKMrgHxFjlZ3dLFXxK9zA8k7dTnmheL2vPnNAclmy
Q3FttvCkgalh6w7sm9SpEi49XxAIZVfIyYyru1BpVJP/zuUVbdm8xzuDqlbMz/qw
zIGzi+rYl/t2r2KgBzmJLfe61fbg6ATXAobi6X/1e4kWelw7BpWEuot1dAGsSU47
LiLScEa0WBbZhWd6WzafAp2MPDs8sd1nJXtxzmkf4J7sshLrxCIoiozWOWuOSyRc
yicsno0/2IoAFAZcPci7Hr89PuTaXbU8wVU8n2fssELaimzObiLFrvrQX9kNKnyw
7uUSyTMePEW04WwDkChkppg56vH+3hQ2qjZWIVPgRaM2rt5X0aFl8OZxXQaGlEqX
sDt1dGf/GTQs61uFMhNeecieLqKvojyJ0KzUb/Uy5BObr6RKyioR/GDs2b6AS3Mh
YO4sgcaufB46eqz8lZ43xGqnEkoCfIZLZUuUP053YoHTtFDPpGe+QVh0j+vzLIJP
iYLJBQrTfE+bSlZXMTxwIfZTsT4/bw/bcpVlyuCXFqYt2PrXve0=
=cpam
-----END PGP SIGNATURE-----

--mxlsk6prfq5tsb6z--

