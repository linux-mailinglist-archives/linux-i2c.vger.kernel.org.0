Return-Path: <linux-i2c+bounces-10700-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE19AA4EBD
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 16:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B79531BA32F8
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 14:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B461825D1F4;
	Wed, 30 Apr 2025 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TrjaQvgQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5141125C708;
	Wed, 30 Apr 2025 14:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023783; cv=none; b=C2jCJWkzR+XI5i1RPBSU2McPRCMYeQy4y6tw7l/oQJ5eAHPotv1V4uyPb4JYhGJM9NJJXxGz1fi6tAWReCr167HlxPHr4WGfrsCUW5qs9zkp08iQ6U5Kc2r+otrgYht6tKxLpOBHrLEXbUix+Sv+JkJmbKwXxRa9nSKGtvW8rRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023783; c=relaxed/simple;
	bh=YLKEFV8rgH4V/+vebbcVO9OrrAnJRoWbqECIUtvAdbE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xc/OXoLwr42SSBAJwJDycXUZPXg1KeuaE1lAXa2EBiz5zUTxOi/ATHcJk6Ghwpi+BBRD81DzZ7C3PuSPQ61I+DsAaZBedu3L9KsPmNqVr0ld8wjYvsGwW1FRTQ+7lJFGHhoQJie7XIDxId8aNdwULKoTox1/WzrfbzNuL8ak+EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TrjaQvgQ; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7EF643A36;
	Wed, 30 Apr 2025 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746023779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZDg+YU+GItE0RyC93E1xIAYPfA47nge0Vs43IZMexRo=;
	b=TrjaQvgQ+SAQJliqTxD0O3KJ1icfGkr5Yy27dY0DsBvz2PhB7Y7Wc7KMom4LX4IJ67ZBUO
	EYGu5/yExsY0OPWWJ6BdoF3HLNMOcImsCMtwR6ibNSr0MjgFnpyDEQ20xtRZBGe6SfxcCk
	hzY0DPirMZLI3HibFtHPTjxxcXbj+qI3hWFDOtuIE9S6QMgbhBjlEnBWnkWesSEnbPzBTY
	9poI2A7TPHFDHsfcRwSCUGA3MGFdxbx8XjEqhXadQTRFnoFi89HH1JX7hfmXO2XuxWzDWH
	/5GW2k0e78Xc3cEKAd/q23AdreHQN/oOj7QrXhULFndJLZ+y/NmkUM+qhXJLxg==
Date: Wed, 30 Apr 2025 16:36:17 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v4 9/9] i2c: atr: add passthrough flag
Message-ID: <20250430163617.3edeedf2@booty>
In-Reply-To: <20250428102516.933571-10-demonsingur@gmail.com>
References: <20250428102516.933571-1-demonsingur@gmail.com>
	<20250428102516.933571-10-demonsingur@gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeileeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepfihsrgdorhgvnhgvs
 hgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

On Mon, 28 Apr 2025 13:25:14 +0300
Cosmin Tanislav <demonsingur@gmail.com> wrote:

> Some I2C ATRs can have other I2C ATRs as children. The I2C messages of
> the child ATRs need to be forwarded as-is if the parent I2C ATR can
> only do static mapping.
> 
> In the case of GMSL, the deserializer I2C ATR actually doesn't have I2C
> address remapping hardware capabilities, but it is able to select which
> GMSL link to talk to, allowing it to change the address of the
> serializer.
> 
> The child ATRs need to have their alias pools defined in such a way to
> prevent overlapping addresses between them, but there's no way around
> this without orchestration between multiple ATR instances.
> 
> To allow for this use-case, add a flag that allows unmapped addresses
> to be passed through, since they are already remapped by the child ATRs.
> 
> There's no case where an address that has not been remapped by the child
> ATR will hit the parent ATR.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

