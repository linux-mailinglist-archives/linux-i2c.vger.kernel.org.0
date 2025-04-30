Return-Path: <linux-i2c+bounces-10693-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F81AA4EA0
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 16:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9D4B1BC54AA
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 14:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED16C25D1F4;
	Wed, 30 Apr 2025 14:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="a5qG/3vK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EC325A323;
	Wed, 30 Apr 2025 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023526; cv=none; b=it7cDM9ob3k42gqWdjIUUDjsfomrftjjCREpV16eYrbGMxwEQCvMucEuKV8zC3ql8P9CFHJD+1tZ7iiZHA7JoPW8oVWsG5tAp1rySUd/jQ87jhdt0phwakAm1Bz8J2GOuKIxP4E2EleXE3114cOtq+9e644pMx5CZaJvDdMQKOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023526; c=relaxed/simple;
	bh=x8Zyxf3qAOiBO+ner8y9AGHPRbsBT+r2KYaVKPhpVfs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qtd2mNkDYC8TokT4luantXWshTGH8lu6PbTAiXKz+/1Z5qfCK6OphNT99ACrKx6ANSZBEX/EsCOHP6a12XbbO4mJ4Mh+xpG1zACEZzmNKrDhL8W1/m1LJ9y3dI+Ua9stWLBGTPlDnsZAX2I2l4xF8AybU+O5/enrvsW9l5kG52Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=a5qG/3vK; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A05A943A14;
	Wed, 30 Apr 2025 14:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746023522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8qrjxqLVA+MvO12pot+Nu2uRSJsBadIKUx39D7i6TxQ=;
	b=a5qG/3vK+zAkLrBw7RHJZe6KcVhK9Vw1iwni/qHe+3Zz2w+kTWEY0bFvF9M9cKFFzdtGQG
	4VqB9c6Z/KtYdywtOGM1sj9fv9aWGyHHcfadLlAWJsAzMwf6SHQ9YU9lTfV6uMb9l1NhJw
	tpy2pDX36w2Ct8ROfKME23NztWut4k42NKiQZ99AZgPuBBc0Unw13Sp3/ad4Ih7AHZTnJl
	qA511tH29c4AR05L/XOS+KTtYcU4IIABjMQpj3tpXgUoXZEX4W7JX+1BWf5NwTLxjiTHiU
	lFOPVuWznSw2PMrQDdmQh+VB+hzZ/Uc/lFj5nCwqsFUxKQfdNLtyUNlUjzHkFQ==
Date: Wed, 30 Apr 2025 16:31:57 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 1/9] i2c: atr: Fix lockdep for nested ATRs
Message-ID: <20250430163157.15508066@booty>
In-Reply-To: <20250428102516.933571-2-demonsingur@gmail.com>
References: <20250428102516.933571-1-demonsingur@gmail.com>
	<20250428102516.933571-2-demonsingur@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeileehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeehffejffekudfhkeeklefgjeeuheekffelheejgfeijeehieelkedttdfhjedtnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepfihsrgdorhgvnhgvs
 hgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

On Mon, 28 Apr 2025 13:25:06 +0300
Cosmin Tanislav <demonsingur@gmail.com> wrote:

> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> When we have an ATR, and another ATR as a subdevice of the first ATR,
> we get lockdep warnings for the i2c_atr.lock and
> i2c_atr_chan.orig_addrs_lock. This is because lockdep uses a static key
> for the locks, and doesn't see the locks of the separate ATR instances
> as separate.
> 
> Fix this by generating a dynamic lock key per lock instance.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

I'm not very qualified about the lockdep side of the changes, but
regarding the ATR side this looks OK:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

