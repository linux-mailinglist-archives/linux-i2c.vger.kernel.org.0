Return-Path: <linux-i2c+bounces-10696-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA057AA4EA9
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 16:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CF593BFEAE
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 14:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D7925D557;
	Wed, 30 Apr 2025 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HhKPQ1Xv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C9421ADC3;
	Wed, 30 Apr 2025 14:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023613; cv=none; b=W1XOxsnFTSfCn6j7ZSdyxb6Cjs2UC2fxq+1v8St2sbymIQejbdMbBr7meHQgV5soVZUmCg9Z1/iCScT6Tys4N3H7KnLikGOTlnY0Zm+ob/cSpwhY+69ydQ7PQcq+GysZcW0c3YluKhiuk2RIiLc4/mcHpyd3KbdSlO+yji5gGU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023613; c=relaxed/simple;
	bh=rIG4X8T5hisSdfcxylEjXUOHlfVJPidU/UJXL8KUOtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nbzzwKfxjRDbCvfYYIJCqE3K2RKDAJi0dZU74ygvmVMX1n9kU02k355C59EsGkBMtQjCW8mgXyrtLW/GwmuUOZZdk046Se51CvBsIRx/p51pF0L5hh/TjtCpT50UC8M83NaFxh9zKbMc6zvniYDO8Hr2izM2THQ86wwVU/AuNBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HhKPQ1Xv; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 663E41FCEA;
	Wed, 30 Apr 2025 14:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746023603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3kG7l8Jm3NnzauFXBNZWY+l2ggxYR7tFnkbc9t1x5o=;
	b=HhKPQ1Xv4Mk5O+izjoY9JlFuzYYiI7JhZ4sjxlCYRizrUohd5iLMyWtUBQClo4VvEEo2HD
	CwkqfrfMymtaUECEBBsZ8DKEumMAoI1JidaFaYt0LHgnqr6r56BbeVuGuQLi+wgyqgtC/S
	Zbk1aCxm8rRktXI0xSySe6PHT8etxYapOeY7PIvmP+DMyvJ1pzeH5HtMJRA0FR/aRqFni+
	LmDBN3CY7tsZec/qU96U7gxe9xsO7fMxpyOmbm0K+iXFX0KPBfgGrN3wNSGEhbDKFuIsJ7
	FsfUdRWr5T6zb39I2hSVNs1448os4lWKgz1UPab/85BUr02yKcbep0X0VrS+bg==
Date: Wed, 30 Apr 2025 16:33:21 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v4 4/9] i2c: atr: do not create mapping in detach_addr()
Message-ID: <20250430163321.661fd825@booty>
In-Reply-To: <20250428102516.933571-5-demonsingur@gmail.com>
References: <20250428102516.933571-1-demonsingur@gmail.com>
	<20250428102516.933571-5-demonsingur@gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeileehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepfihsrgdorhgvnhgvs
 hgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

On Mon, 28 Apr 2025 13:25:09 +0300
Cosmin Tanislav <demonsingur@gmail.com> wrote:

> It is useless to create a new mapping just to detach it immediately.
> 
> Use the newly added i2c_atr_find_mapping_by_addr() function to avoid it,
> and exit without logging an error if not found.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

