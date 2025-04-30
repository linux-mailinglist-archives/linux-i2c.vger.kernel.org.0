Return-Path: <linux-i2c+bounces-10695-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76543AA4EA6
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 16:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AEC77AC5F7
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 14:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636CE25D530;
	Wed, 30 Apr 2025 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cgOWgUUh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C4E22612;
	Wed, 30 Apr 2025 14:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023595; cv=none; b=YUVPoPVDJ/PZRaLS6QeWwLmjP3E5W5aJDx/m2pA2Iah7E9lYALInc3+Nt+CxhQPjNl/hrhVoVWJb9m3K8lJ0VTSyLJ3HIZ/CYpaZFGZM1eVeh/lnOjSVi3YEjbJpLDyahwb+AAaQDYbpuECZgJ+DEtGaepHZ5XL3uaGiL5EPvpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023595; c=relaxed/simple;
	bh=B2IQvEvHbxqmpocz5RL0UxNL3KtxXTryE2WzSeihjic=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Avmrfc4AEn2MbKPY1OKvfusr2o99coJ0Ae05EBt/ni5wEPX2pOf2Jyf4lVkVQ0CGbLrAtoCTMMN/O+gFvNE/pWW0QEIpJke29rZsHfaeDXh6I6vSVFL3spVNASsf5kLKKwJIofdaZm/8N3INKtyhjSe4bBzYz39moY02bt4YyfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cgOWgUUh; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D943B43A27;
	Wed, 30 Apr 2025 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746023589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xeJuegA6Kp8h/k7mdDSuMR87SsPPFX9UGJrHs+seFbs=;
	b=cgOWgUUhLxtqoiYEw/+V8an6KEFIQ2fpvVQxwUMuWGh57tAJLvxXeVSNVI9uQDj9ChD6Zm
	8FahPfYXALDT00pAuPJJRHhavkq8lxVigSjCrME4VhwHGe1oyNr2n0934sbuvDBoS9a0Df
	aZ5w02p9r+t3qfAyixweo0y/qSuhIQHQ/Hpw25WgvOvUhH80Y7ARkELnjz+P7zSiM7e+a9
	pVUsxEekqRVt2Qv9eSDCjlJcN7qlAP4Z7TiQO9AMspKroou9luDTP0sjaXi+c5/XXzKaUI
	QW7vJ9NMFbGioATUb/LARmWZYDqe5qlcCFrn2WzdccY8704bIdXQTb8Px2U5IQ==
Date: Wed, 30 Apr 2025 16:33:07 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v4 3/9] i2c: atr: split up i2c_atr_get_mapping_by_addr()
Message-ID: <20250430163307.528671a8@booty>
In-Reply-To: <20250428102516.933571-4-demonsingur@gmail.com>
References: <20250428102516.933571-1-demonsingur@gmail.com>
	<20250428102516.933571-4-demonsingur@gmail.com>
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

On Mon, 28 Apr 2025 13:25:08 +0300
Cosmin Tanislav <demonsingur@gmail.com> wrote:

> The i2c_atr_get_mapping_by_addr() function handles three separate
> usecases: finding an existing mapping, creating a new mapping, or
> replacing an existing mapping if a new mapping cannot be created
> because there aren't enough aliases available.
> 
> Split up the function into three different functions handling its
> individual usecases to prepare for better usage of each one.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>

This function has become quite complex over time, so this looks like a
good cleanup by itself even not counting the advantages coming with the
following patches.

I have only one small remark, see below.

> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index 939fb95fe781..184c57c31e60 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -239,9 +239,23 @@ static void i2c_atr_release_alias(struct i2c_atr_alias_pool *alias_pool, u16 ali
>  	spin_unlock(&alias_pool->lock);
>  }
>  
> -/* Must be called with alias_pairs_lock held */
>  static struct i2c_atr_alias_pair *
> -i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> +i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> +{
> +	struct i2c_atr_alias_pair *c2a;
> +
> +	lockdep_assert_held(&chan->alias_pairs_lock);
> +
> +	list_for_each_entry(c2a, &chan->alias_pairs, node) {
> +		if (c2a->addr == addr)
> +			return c2a;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct i2c_atr_alias_pair *
> +i2c_atr_replace_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
>  {
>  	struct i2c_atr *atr = chan->atr;
>  	struct i2c_atr_alias_pair *c2a;
> @@ -254,41 +268,57 @@ i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
>  
>  	alias_pairs = &chan->alias_pairs;
>  
> -	list_for_each_entry(c2a, alias_pairs, node) {
> -		if (c2a->addr == addr)
> -			return c2a;
> +	if (unlikely(list_empty(alias_pairs)))
> +		return NULL;
> +
> +	list_for_each_entry_reverse(c2a, alias_pairs, node) {
> +		if (!c2a->fixed) {
> +			found = true;
> +			break;
> +		}
>  	}
>  
> +	if (!found)
> +		return NULL;
> +
> +	atr->ops->detach_addr(atr, chan->chan_id, c2a->addr);
> +	c2a->addr = addr;
> +
> +	list_move(&c2a->node, alias_pairs);
> +
> +	alias = c2a->alias;
> +
> +	ret = atr->ops->attach_addr(atr, chan->chan_id, c2a->addr, c2a->alias);
> +	if (ret) {
> +		dev_err(atr->dev, "failed to attach 0x%02x on channel %d: err %d\n",
> +			addr, chan->chan_id, ret);
> +		i2c_atr_destroy_c2a(&c2a);
> +		i2c_atr_release_alias(chan->alias_pool, alias);
> +		return NULL;
> +	}
> +
> +	return c2a;
> +}
> +
> +static struct i2c_atr_alias_pair *
> +i2c_atr_create_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)

I would move the _create function before the _replace one, because
that's the logical order in which they are called.

As a nice side effect, this might make the diff more readable.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

