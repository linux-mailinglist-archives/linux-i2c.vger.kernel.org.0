Return-Path: <linux-i2c+bounces-10607-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DE1A9A2F5
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 09:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5CCA19465E3
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 07:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE461E0E0C;
	Thu, 24 Apr 2025 07:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RRBIE2FG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5659510F9;
	Thu, 24 Apr 2025 07:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478649; cv=none; b=cRbzJAyCmBaE15ZbceoUVU3eVCkPFA3+o6d5NMgSj3n+2pMCu3kOcPXX4i5kFV0d3WOYe4PMEjQanovpCcaXz/dGhM7XNV11YfOYHCIGdzW0QwXD38mVp5HoEJG9PTaWqYnWiU2SSw9kESJwL5WpcWrAa5NgAmsw5YXSl2hfZjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478649; c=relaxed/simple;
	bh=t+K0ESiXzCsl44QHMLJtE1n+4hg/PkQFOPFvd9iGyuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LvQXhNELiZCGjEvlOSsdLDU6OmrMzve0awBIJSwCPy95dXMlh2mdJLCSXJB8cvRMgjPhcX8XPZzlLw+Ny9pq2rL/7XP+pmzQyLkuD4ICyem/vxBw6Ra0lPaV3vM1M26vVpGzuJ0OaHRDNP3SZlOOnRelX8LUFyRkRkHv5tcL+Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RRBIE2FG; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEA6743A57;
	Thu, 24 Apr 2025 07:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745478644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ls6ZOwr4X07+mFxbErQdmry+CO4o/SQ2lrx34X9QQTE=;
	b=RRBIE2FGJdwYRYGLOTx1+qCnf8F/EKYhYO66/Phh3rBBsU7Sm7K3d4FwxTzxfu3pEaP8zA
	N1LaVgnsNvsX5eSgFrkjccYzmxUWQ0tVj7ubeBRvVq2E8rUMVgsf+qHk/SbkIb1oGRkrcf
	36aRsLbmScl4x3KCQCny5ulOX84AI924X01GPoReJDQuPHyKR54IhOatvaOMeG2C96IAsC
	pzh5oR9CuACWcJF35qS9rJTXFVzC2ZGePcT3FKKHQqujSfo7WP/0+0ZadxcyYIRda8XlAd
	ZdiI8dTQM/UvG5r3k2yAr2kx/f3VENswIkuLQVvvf2XXAKuxE9iyTzW9MAOQxg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject:
 Re: [PATCH next] i2c: Fix end of loop test in i2c_atr_find_mapping_by_addr()
Date: Thu, 24 Apr 2025 09:10:43 +0200
Message-ID: <2778486.mvXUDI8C0e@fw-rgant>
In-Reply-To: <9cd0c3cc-9f3c-4a3e-9080-c832def8f317@ideasonboard.com>
References:
 <aAii_iawJdptQyCt@stanley.mountain>
 <a22d74b9-06b1-4a4b-9c06-4b0ff7f9b6c2@stanley.mountain>
 <9cd0c3cc-9f3c-4a3e-9080-c832def8f317@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12651876.O9o76ZdvQC";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeekkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeikeekffdvuefgkeejgeefhfdvteeuhfdtleeiudehieeludelvdetleeggfffffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegurghnrdgtrghrphgvnhhtvghrsehlihhnrghrohdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrt
 ghomhdprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghrnhgvlhdqjhgrnhhithhorhhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart12651876.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Thu, 24 Apr 2025 09:10:43 +0200
Message-ID: <2778486.mvXUDI8C0e@fw-rgant>
In-Reply-To: <9cd0c3cc-9f3c-4a3e-9080-c832def8f317@ideasonboard.com>
MIME-Version: 1.0

On Thursday, 24 April 2025 08:32:22 CEST Tomi Valkeinen wrote:
> Hi,
> 
> On 23/04/2025 20:29, Dan Carpenter wrote:
> > On Wed, Apr 23, 2025 at 05:25:44PM +0200, Romain Gantois wrote:
> >> Hello Dan,
> >> 
> >> On Wednesday, 23 April 2025 10:21:18 CEST Dan Carpenter wrote:
> >>> When the list_for_each_entry_reverse() exits without hitting a break
> >>> then the list cursor points to invalid memory.  So this check for
> >>> if (c2a->fixed) is checking bogus memory.  Fix it by using a "found"
> >>> variable to track if we found what we were looking for or not.
> >> 
> >> IIUC the for loop ending condition in list_for_each_entry_reverse() is
> >> "!list_entry_is_head(pos, head, member);", so even if the loop runs to
> >> completion, the pointer should still be valid right?
> > 
> > head is &chan->alias_pairs.  pos is an offset off the head.  In this
> > case, the offset is zero.  So it's &chan->alias_pairs minus zero.
> > 
> > So we exit the list with c2a = (void *)&chan->alias_pairs.
> > 
> > If you look how struct i2c_atr_chan is declareted the next struct member
> > 
> > after alias_pairs is:
> > 	struct i2c_atr_alias_pool *alias_pool;
> > 
> > So if (c2a->fixed) is poking around in the alias_pool pointer.  It's not
> > out of bounds but it's not valid either.
> 
> Maybe it's just me, but I had hard time following that explanation. So
> here's mine:
> 
> The list head (i2c_atr_chan.alias_pairs) is not a full entry, it's just
> a struct list_head. When the for loop runs to completion, c2a doesn't
> point to a struct i2c_atr_alias_pair, so you can't access c2a->fixed.

Ah I see, in that case thanks for the fix Dan!

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

--nextPart12651876.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmgJ4/MACgkQ3R9U/FLj
286FVQ/8DWmGsioZ0zngygJdrvQPd3X3Sf3Kd/9u0lB5kzV4sTCbc3yY5dug60Jm
ol0peHRedrLQCyudxFWTnjkM/LTgdZ7plaUtOJox8tvPD1lyvcfGLwzl67xM+7Re
PMqhyZNB2tClFQpUC7/buQjJdo5MzOZSmbl3TtLzz0+NB0sCeVw6XwIqvc+KWz92
QfP7Ni8X65mdqWuT4faAAV0PCkZeBknh8v1He6MnKsjXxOaJ0yO/6IUYUl8COJS/
22CIjOHNI3ZgfDzg11bEDI/qaHbuuWv7Ke1np6wLyOhD26sqoCP5TQUGA7Fw/c+H
V0TQB/08nW13SDHdtB6LgbnCvri59paDJM5gMyUwVMxYOLHPN3u+VXIxSpRc/6aC
1N62+xZ7SRf/TkoEfxeZILnQib5m8GyvjR1PRhMi7QIgdXFfbH+g2j/BTNQmup/0
1o7Q+Z90Hi3OSoR5Bviktk8eLh00C0H+pPk7V03b0oh4xx7KVzGXYikeIV9jp/+U
gkzeLCCVAFjM2wm/DYwGos+Ys2zNWUjb1C7KJlCP2Fl/JGCQO9txPO1BZ3pRrRyf
/oXcI5tpTj3x5oZpuIdPZzpOZjS4LvHojFkvUBNFP3JO9r8GHaLeoA4X+UknqN1r
gH73eOfSbUFAPDwDiuOG3hxte9WOdKiIZ8Fcb6pRgk+p9HnCDHs=
=pYya
-----END PGP SIGNATURE-----

--nextPart12651876.O9o76ZdvQC--




