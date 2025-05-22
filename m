Return-Path: <linux-i2c+bounces-11113-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18008AC0982
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 12:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C62C1175E48
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 10:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD1A28851A;
	Thu, 22 May 2025 10:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BonY2GZQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88828C2EF;
	Thu, 22 May 2025 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908669; cv=none; b=V0fDNGOu5DEayKsBpudmAQfSQBFJLsEb1GC0qhFSkArT2HyFEUP86HyINd7WGfVD6duHA1o3H5jtOfwJEbGylNosNoM8IthtWL0YscvQNE9LSuSS0jAzk5qgbaBh24sgtTkQObMO3zSk2YIY106hTECbpQkrPXo/R8wj1VB1Abk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908669; c=relaxed/simple;
	bh=fWR/juEyTHsQD1NrYSJu/7H9kQS9MO2kkYk6SJDs8Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nDwgLCT36fVw7RQL46fio1aOgsPAu1AHtdOkJyRvg/ym6n1FYyHvcTVzT6hDVC+mAal1u+akq4AZLk8D6vakqI+L2Aq3V1TZLep8PF3FxfEUx8vlggxMzTCIHda+6ABYFXPCvvDMXVjCduFF9QuoD0h+rG+OIfYN//vAYaaLI30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BonY2GZQ; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B3A81FCF3;
	Thu, 22 May 2025 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747908659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vVseXxkZGy7zDZxv+n6mkcP25YSvXNhLwd1kEp9tP3U=;
	b=BonY2GZQN51u4iAJ2gkHL1efROjfxU5dWAxK9upogjKxTAo+rFzIdoRh4UHJBQG3jhXnxo
	K3oknqvafUOIUZSvl4ULUvKDA0tfjpYFeoEYULFMMIT5xm9qDX6PBh5qxYVTQVRdpYPv+D
	3tsNR6aExXhYYAOPDDBJQ96+N4REtm+QOUIeJo1JLWVGxV1hkljQdl5RjecIhRxU7Qy8+r
	PB2rwUCHujb68QhL1/fSwGbQiLvJv+nUIqEcZwDsZ1iA+oMk+MRAwh1JI5ZcfBoYpN+n8V
	zXsBxD/L0Obw4xzezQA8NZzTk1m2iHhuYv942nxReqVKa6uyaWb9IrgabWqUqw==
Date: Thu, 22 May 2025 12:10:56 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Cosmin Tanislav <demonsingur@gmail.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v5 7/9] i2c: atr: add flags parameter to i2c_atr_new()
Message-ID: <20250522121056.685637cd@booty>
In-Reply-To: <aC7lUE4kj8fnVVgM@shikoro>
References: <20250507121917.2364416-1-demonsingur@gmail.com>
	<20250507121917.2364416-8-demonsingur@gmail.com>
	<aC7lUE4kj8fnVVgM@shikoro>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehieelucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtt
 hhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

On Thu, 22 May 2025 10:50:24 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> On Wed, May 07, 2025 at 03:19:13PM +0300, Cosmin Tanislav wrote:
> > In preparation for adding multiple flags that change the behavior,
> > add a flags parameter to i2c_atr_new() and an i2c_atr_flags enum.
> > 
> > Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>  
> 
> How did you guys get it to build?

I haven't :-)

I just reviewed the code, and apparently gcc's parser is stricter than
I am.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

