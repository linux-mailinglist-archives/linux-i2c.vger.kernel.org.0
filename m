Return-Path: <linux-i2c+bounces-10041-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B17A720CE
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 22:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE6BD18960C3
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 21:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D88253B67;
	Wed, 26 Mar 2025 21:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mCdVDqKC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E835137930
	for <linux-i2c@vger.kernel.org>; Wed, 26 Mar 2025 21:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743024785; cv=none; b=Q2wsJx3yDQX5D+pCfRLgMxzEHbch0O5nVBemO5tz1eRtCWNj17x5XO/q/E6Q4G2Xv0Uqg0S1v7AzsAS/MpiBUxJmS0/SH2P+j6lV7nk8tbFeJastCSMLGqsWXJIFCGKudQij0jqzxvVbNPu4U5yzP8PfodJAmbPwjrai67+1Whg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743024785; c=relaxed/simple;
	bh=leaS4SvSV2zHkFi2/L7bjdXd3fiAwHQgxhILUDyRsz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzBpA7gQ6lETH/efEQIUPXETGuH7T8mfeWKMAcertNdaec+fZc4NelynoC5CJ84vgo90zU5zAXyYoYaHpzQxmz49bJd9/qVZjd48zfxIGsld/x30F9mGMNdmnYvfSZ1wGUVON3A3d2NPS/PLlxCUqef53jqMsJX9cghJOxmnofE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mCdVDqKC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=TVG3
	NrT4nDXRnkvQhvpjCeYgyn37R5QccDFEdP43qZo=; b=mCdVDqKCqgBUB+UzOKnz
	3A8qHGCSutVpubxGowDSyP8aaNB5ir+J/TFHqvI3ABH9wXjISl9RopKb1i6NSk9Y
	nJIZF2yYX3NaNC2lwGPGpjULXr3h/72eRa4wfsr5nBTnvmlIiOgpMyHVKNaVZyDj
	9SHI1NEpN0toEM2/thjXMjyfzmeNN0+mABgHDc64bAvPMei4gVQ7ehrE43ZkzAnh
	lBsQBkjU7plbyVSdsmRkLhj4WNKG5thlFm0qP6alrlivcg2Z+vNWFLU3qXLt47xi
	zLbqA9/QdOdSE83SRZBlUkbtn7UWbu6yLr+Lo+M366lneTEYR4Wfwi7sntMg3cB6
	Zw==
Received: (qmail 3763028 invoked from network); 26 Mar 2025 22:32:58 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Mar 2025 22:32:58 +0100
X-UD-Smtp-Session: l3s3148p1@Vdq7lEUxQsQujnsv
Date: Wed, 26 Mar 2025 22:32:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <Z-RyiI1X9BN43feQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
References: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
 <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
 <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
 <Z-MKiV0Ei5lmWik6@shikoro>
 <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
 <Z-MrfICsY06DZV-2@shikoro>
 <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>
 <Z-QjIRoOWpoWaL6l@shikoro>
 <c6bed13c-38df-43a6-ba5f-0da03b91f3df@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XLbJ/AnYw39ABaGM"
Content-Disposition: inline
In-Reply-To: <c6bed13c-38df-43a6-ba5f-0da03b91f3df@rowland.harvard.edu>


--XLbJ/AnYw39ABaGM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Which maintainer should this go through?  Mauro Chebab?

I'd say yes.

$ scripts/get_maintainer.pl -f drivers/media/usb/dvb-usb/dvb-usb-i2c.c
Mauro Carvalho Chehab <mchehab@kernel.org>
linux-media@vger.kernel.org
linux-kernel@vger.kernel.org


--XLbJ/AnYw39ABaGM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfkcoQACgkQFA3kzBSg
KbZ5bg//ZPEJY6x3slIfjpARKrlSNGopIIdRFX0jToiEJ8TN6IePes7xB+LXy/Gi
4I3KX3Ff+fB5mtClhDcIqrBgMlqBrt+yDh+Dq0F8R+X+EoTFWr2IlJf5VZU50Z7s
KR7+U/0mPmwtedPObZqBLVZTIjoQScxMMilJBoraZFd9vice3vQbQc86yg+MbPW+
cRInfYWjy6WjeKx3RFvjGBXnxNCOiCd/Qebv5TAzldkIeLkXuF7ZIJ4FRqtrmHKp
KAU8FE+Z+PMoFkwPNR5gzYEdaT0INO8xU2ysrHhYpJy3JazLEkQfq7rknwfW+N7Q
Y8KXLcfeMC/k6QfX0Y8thrtDZOnh0xpTOnFf4Gbf4KI7kyWlCL6lf9F7X2jiZJqg
PT3nAmaQ/4r8cStncJR+6e97OpyK6pzQLxBB/a4IQjiZ+7XpwKOoO8NOy8F30q9v
srwZghPqVG4N4llCeKqDexnMQCIjZuVFGH5f5ylzOiG0W0XTjuveb7Hp+IH60amz
2+RkF2QwXhViyUX/kP8MsMhTYAwBXesT1DbKtc+YDEMBzx90BKpQrqsyMj2lRNXC
qr8yWi5HZ9WDGS75eMQHmFboUfezp9dpNxwwhSDMPGxVcLhE5amhkwqSQDBQjSqG
FUtaLbof0/MIYrKDi5BMqLdIu3UWEs+W+At/zxStY8y+ORDTcfo=
=gNyU
-----END PGP SIGNATURE-----

--XLbJ/AnYw39ABaGM--

