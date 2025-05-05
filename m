Return-Path: <linux-i2c+bounces-10767-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ACFAA9213
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 13:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D3E43AEF71
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 11:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC26202C3E;
	Mon,  5 May 2025 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h24SwyKt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782C9211C;
	Mon,  5 May 2025 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746444763; cv=none; b=rRk0rcbYek2pd64lcVLxypBZobV5GGLJHMFQh54d4gYiodCdTJiNyd+R57UdQLO075pjE3fATyjXmHdINhcIu7vdRSBo1jnd2cxWzFROZj6ij+K/9UEbMfEuv95tUIIX5+ECnFBOnhPzy9RXkxrCbJwMyyCl87EBIzv6Lmj36QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746444763; c=relaxed/simple;
	bh=YUZ3RROT7ZWDgsgmiogcO2xFKlJxEiqaLDiSUmPzz+s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IT5NttUiJSX6aFVQaV0O/YiqbB2vYJiU6k7BxasfrHVjNL54cdwKiscRXGHtkw8b+D0X33y5L5481sKcuOMaTGgNxQXDNbZt63BWTCf0wsHNYCgleZHBaC4DVgVJBuJXkVOxrUgLVH76ygjkkggplpaCcRBcB43TGEaXh/c/Vr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h24SwyKt; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 723DA4397B;
	Mon,  5 May 2025 11:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746444753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27+frVTZLDavDIgRvyDzEI+SJCigqcipN27s+IWd2+c=;
	b=h24SwyKtbK5m/IuOdOwH4g158yXnBrczfdn/bytXN07d85RIVUujdTeOQ8ypD174enIvfa
	BcnmE14jQd1UsB8aIRzlkPeLuviADzdhp8pMMGS2SFIp+aqTUW7i79rFyRFCL9v9nilgvK
	VCqfJBIaXlI5iryfKvVnbwtYsjHAwkpQw0d0ZN0o3ILxrGvwGGixRTAkhEZN8+9mhXWkJh
	DkCbPqAq2Svp19+V0uZG91P1p91kKWB3mvi2NnZSmGI8WFmcPr1ipk5DZuLfjc/hW2bTG+
	MImw+vDCgUXTBqclaJnLKQZv6QDTRs7dWYNLLWTPimwwbaq3v8lBaLcvVIUQhw==
Date: Mon, 5 May 2025 13:32:30 +0200
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
Message-ID: <20250505133230.57166306@booty>
In-Reply-To: <312c3e05-13d3-46ad-8231-6d60969b4aa5@gmail.com>
References: <20250428102516.933571-1-demonsingur@gmail.com>
	<20250428102516.933571-7-demonsingur@gmail.com>
	<20250430163356.17eedc2f@booty>
	<312c3e05-13d3-46ad-8231-6d60969b4aa5@gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedtleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeehffejffekudfhkeeklefgjeeuheekffelheejgfeijeehieelkedttdfhjedtnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepfihsrgdorhgvnhgvs
 hgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

On Mon, 5 May 2025 13:33:39 +0300
Cosmin Tanislav <demonsingur@gmail.com> wrote:

> On 4/30/25 5:33 PM, Luca Ceresoli wrote:
> > On Mon, 28 Apr 2025 13:25:11 +0300
> > Cosmin Tanislav <demonsingur@gmail.com> wrote:
> >   
> >> It is possible for aliases to be exhausted while we are still attaching
> >> children.
> >>
> >> Allow replacing mapping on attach by calling
> >> i2c_atr_replace_mapping_by_addr() if i2c_atr_create_mapping_by_addr()
> >> fails.
> >>
> >> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> >> ---
> >>   drivers/i2c/i2c-atr.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> >> index bf7b2ac5e9cf..7214a59ddf15 100644
> >> --- a/drivers/i2c/i2c-atr.c
> >> +++ b/drivers/i2c/i2c-atr.c
> >> @@ -543,6 +543,9 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
> >>   	mutex_lock(&chan->alias_pairs_lock);
> >>   
> >>   	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
> >> +	if (!c2a)
> >> +		c2a = i2c_atr_replace_mapping_by_addr(chan, addr);
> >> +
> >>   	if (!c2a) {
> >>   		dev_err(atr->dev, "failed to find a free alias\n");
> >>   		ret = -EBUSY;  
> > 
> > Looks like this should be squashed into patch 5, no? I might be
> > wrong, but IIUC the change in patch 5 is introducing a "bug" ("It is
> > possible for aliases to be exhausted while we are still attaching
> > children") and this patch fixes it.
> >   
> 
> Patch 5 doesn't introduce a bug, this is just how things were before.
> If you look at the diff in patch 5, the error case of
> i2c_atr_reserve_alias() just returns an error.
> 
> The logic in i2c_atr_attach_addr() didn't handle the case where a
> mapping is not able to be created, matching the logic in
> i2c_atr_create_mapping_by_addr().
> 
> This patch adds handling for that case.

Ah, I see now. Makes sense. Thanks for the clarification!

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

