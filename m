Return-Path: <linux-i2c+bounces-10600-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1843A9927F
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 17:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49C719A2236
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 15:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E182900AB;
	Wed, 23 Apr 2025 15:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j3VNi9QB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C09E269B07;
	Wed, 23 Apr 2025 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421960; cv=none; b=tD5zdLH8j+bSPUT/LAxV9z2HpjV84cW9IPlPLjdppJxXqx8rIRX8n/qBOpnJOvKCq3t/382kQn0qyADAAN3hAyqzsAjfcM8OvL7B57561FQsHepg/yCbEa6zVdJPC1FXrEBWnCyFbF0r2FU0rxafm3iF+MAoz9m4XGF9UXqeins=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421960; c=relaxed/simple;
	bh=INrfsL5a4oNfla3t87AtDrtEZA6P9pD3Y1KMeBn8v8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a6osjUvjZXupPRWfaq1eRMQ8kcq6VZWFdnxZh19C0s5aBNiL0e1CGNHZCCadQ+yN51025fXo+7y5A+YSLv++2dswLCbTJqfcvS3zdkR54DevqrykAXp0Hf91XDV+wvGO5YAEJXHLDyS2XBH6uztj5bp3h0AVFbiP1l513WrJHb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j3VNi9QB; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C70642E7E;
	Wed, 23 Apr 2025 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745421950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=st7lZ8Kg7+fFmKzdoX7+TUPm4yX7fggkC5jew7GSJiI=;
	b=j3VNi9QBxYEGcAlKGWWGTzaSDpNqziHkcC1gfJ5VIKnNwW0OGL6wropPwA3i0N343/+JIS
	xbpn5tTExQdJtZNb393GYZQi9ugeVanTj9iw0eAodNMPmo4GCyHK72f+i/09J9hTDhKUgk
	pDSiu3stDrSDKgM3DePvYhMs41Bf7WXfP0JIvJjwEjpQ3KjdoG96OwHk0ciVSkmUHlAf+D
	trH2z/iSUu7uPDr9S2UBlENk+fp+wQEkmuh60yyIPfM9mZTC9h0qbsEHm4i+wIQAQXD2tF
	1vnIk9lMuruo1JEer6aOApGeaFKjviS/8yd/Xegxshx66VGYHs73zWhu26xdMw==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject:
 Re: [PATCH next] i2c: Fix end of loop test in i2c_atr_find_mapping_by_addr()
Date: Wed, 23 Apr 2025 17:25:44 +0200
Message-ID: <2427370.em1n7HOibB@fw-rgant>
In-Reply-To: <aAii_iawJdptQyCt@stanley.mountain>
References: <aAii_iawJdptQyCt@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6847964.XYie2Kq9gB";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeileehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhvdelkeevgfeijedtudeiheefffejhfelgeduuefhleetudeiudektdeiheelgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegurghnrdgtrghrphgvnhhtvghrsehlihhnrghrohdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsr
 ghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghrnhgvlhdqjhgrnhhithhorhhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart6847964.XYie2Kq9gB
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Date: Wed, 23 Apr 2025 17:25:44 +0200
Message-ID: <2427370.em1n7HOibB@fw-rgant>
In-Reply-To: <aAii_iawJdptQyCt@stanley.mountain>
References: <aAii_iawJdptQyCt@stanley.mountain>
MIME-Version: 1.0

Hello Dan,

On Wednesday, 23 April 2025 10:21:18 CEST Dan Carpenter wrote:
> When the list_for_each_entry_reverse() exits without hitting a break
> then the list cursor points to invalid memory.  So this check for
> if (c2a->fixed) is checking bogus memory.  Fix it by using a "found"
> variable to track if we found what we were looking for or not.

IIUC the for loop ending condition in list_for_each_entry_reverse() is
"!list_entry_is_head(pos, head, member);", so even if the loop runs to 
completion, the pointer should still be valid right?

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart6847964.XYie2Kq9gB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmgJBngACgkQ3R9U/FLj
2871fQ//TfmeOZvEIWC6A2EzUO9buEh2zcpMTi0ecsPmxf9aEk80ctJIjMSahC2H
YRh/Asxe4TBJ5J+/e/mpn98MBJeyV3/BDOXTv/GuY8rYoRE9Ypgz5FdY3Wi/tD9W
kOFu9sb/CANhiLE+LxpmNXN+TemxRy9RRnrO7+Dh8fdKCgo+TLKMcUr4dbkstg6y
x07E0u+OFAIdezHlxX2CIJtNLoPLjZ0jN22lZk7ahI/dMNdBDJQBkFVWq80MXVzv
QXtglFL72nVr7kWbmjS99xuMouw1TNAQS/63OqxTxZRj8Y+dHr/dfAQRVD89J0aR
bD0is183oOadueUQD4QnPpXc/PPYNbHSjhipg1b5vvNgbh46x/vw7RGPpCM8RzDH
VC+KoCrIskK5Yg4Wi/g+34MDlhnvU0ADy0nBbvFv6YGPhVKcFt7XuP4BuFsVjuhk
oFya6BFk4jI66itCWTi7+yzY/9c+8uPA7Nh9D4ak2YtoOhR6mI0lxUhvR2nyOkWM
4KDiUty4qaxBGHmguRsg0kXUapxFRqXKyK3wP/NRc4tovcTRU5Xux/1HWcEWhXFh
S4n6H7aYsSO2J3YcjQcxcKP2GD1BtxozvxWMLeauAiRb51jtINV2tgBrk5kdpgvX
AhnN/HLrBAjOm9EQXeEZrpbXT3ddCttlR2+7x2eSx+FBd6uuQgg=
=qIns
-----END PGP SIGNATURE-----

--nextPart6847964.XYie2Kq9gB--




