Return-Path: <linux-i2c+bounces-10698-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45113AA4EB4
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 16:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C75C16E957
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 14:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B54725E454;
	Wed, 30 Apr 2025 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VHHtHbpw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0883D21ADC3;
	Wed, 30 Apr 2025 14:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023642; cv=none; b=gwMQs0r4QfPrR2Nxe4Bb7DyH0A3kW7P3nkZpVV1U4V3uIBNQTflRfuuIA+m7VV2q9V8tOZMDsg94hT7J36tv4Ccg2ZNLiY/u/p9K10m4pNqxhwYkG20yIYRBRQkfcUBhaE0Oghcr52MvJKtQMnuEFV0yOhZq8SV+xMFiNhOje/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023642; c=relaxed/simple;
	bh=J1LzTukBibRC0BD10rLDBLhy9Rmm6gNXLqtuJNKd//M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tzORbEDIlJpoOZ1Vml9JjpxWRzuekVctRx66cDkaMI05r405Lzb8tQsomkbIrgfY1UdytbgN7IyLiiIYWu/esKuS9GTFfQrEBETM76Lqz6gAV6rzZR+gsrxhgzjAyzUDBbRwTmOxbW7wPDu4KqZYGp7gvJ1MzrAEr+uP3q1gOmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VHHtHbpw; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9313B43A0B;
	Wed, 30 Apr 2025 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746023638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cKmczw7e4appToRSnFjH+ouPLaSXnq3yhDObLxrpoTs=;
	b=VHHtHbpw61wP90hQKAJ7TPX6q7zzNJM6FXOdk7lXjD1YU6kNx43A2VvSNix5qzlaE0UmpM
	E9fVICFCFwziCMYuKFlaKG7goeJmWUhiF2uFkNDVq/qoRLnucy8nrYroys/L/HzpMO2P9f
	sPRj2FvymepLZ41oi82g0IONvj50WfOvBT+iCuU9IeaerBTW9Sqny3XhhS51xfQQLsNA7d
	pzQ8qEySa/z0olyv7xicwvJsL7vougsFU0TTc90NeR5+KJTmYkenfXSAjuHqlSm3jmsPQf
	q8s5mqOcvmhjiqznySlsp/e+lj1TPv3H+cfueWtfqNpz8/XF905O3rv/W9ffYQ==
Date: Wed, 30 Apr 2025 16:33:56 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v4 6/9] i2c: atr: allow replacing mappings in
 attach_addr()
Message-ID: <20250430163356.17eedc2f@booty>
In-Reply-To: <20250428102516.933571-7-demonsingur@gmail.com>
References: <20250428102516.933571-1-demonsingur@gmail.com>
	<20250428102516.933571-7-demonsingur@gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeileehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepfihsrgdorhgvnhgvs
 hgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

On Mon, 28 Apr 2025 13:25:11 +0300
Cosmin Tanislav <demonsingur@gmail.com> wrote:

> It is possible for aliases to be exhausted while we are still attaching
> children.
> 
> Allow replacing mapping on attach by calling
> i2c_atr_replace_mapping_by_addr() if i2c_atr_create_mapping_by_addr()
> fails.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/i2c/i2c-atr.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index bf7b2ac5e9cf..7214a59ddf15 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -543,6 +543,9 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
>  	mutex_lock(&chan->alias_pairs_lock);
>  
>  	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
> +	if (!c2a)
> +		c2a = i2c_atr_replace_mapping_by_addr(chan, addr);
> +
>  	if (!c2a) {
>  		dev_err(atr->dev, "failed to find a free alias\n");
>  		ret = -EBUSY;

Looks like this should be squashed into patch 5, no? I might be
wrong, but IIUC the change in patch 5 is introducing a "bug" ("It is
possible for aliases to be exhausted while we are still attaching
children") and this patch fixes it.

Ah, nitpick: I wouldn't add that empty line.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

