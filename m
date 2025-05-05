Return-Path: <linux-i2c+bounces-10766-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 733DAAA91F7
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 13:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A486188B3CA
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 11:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061F4202962;
	Mon,  5 May 2025 11:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dngknP3B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EF36D17;
	Mon,  5 May 2025 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746444176; cv=none; b=tvCpk4URv8aueV8kNj8GhdKdUste2cFpmRwAKBLuGUyS+Z7DFkpUw1Gq26IIH9RICEMmiOYT8qGROc0r17x+C4xwijeVzlJI7aFlCjHFUWj0+1SCVNEcpHdAQxjHO6xkopM2QdwSpjXmVgNgSpvT648bNJLkdQU7QKhVMr2t67M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746444176; c=relaxed/simple;
	bh=X7f/cj2HyCw5T24zVizPuI3ejjSC/I4KfwGIek8QsVE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o7YqcQRSwuFs7Zqfr8QgTGbN95iwsOlY/oQfHzLCob3KTR79CkYAn4SR2vWbek8m0Ryys/Iru9Ntk5fMTCoGQXYOApNQ37TvYrLWEGPZM3gQc80KPvzfZSJR3ChgMxRF9cwgE66sD1ku0dawO3jqHZmngoLgT+0+xYY3IG3XqGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dngknP3B; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8428D1FCEE;
	Mon,  5 May 2025 11:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746444170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjQD6/4ZASrQpmuxOr/8hzy+9Fqcd4Ygjsti998CXt4=;
	b=dngknP3B2/vVmzmsbaZxjuZILonwn1c7s6KP+leUH2BrK41WmAJ3r2zE0ccLwPB4wpBLzT
	JUXW0vkq4VwyeHl3/ucynqrRsnTi85cb3eztsVpv+p4OzzL17kaM2dsaLTtnLxkh6Xc/ON
	clU6u/QuPeMjTz7YdipPU6gbqmxfgQX+ipKfIVjFyyyFkCHwf5ParQX1yatiTBo/obF9nC
	Ou5RRD21tdkElQ9rvlhNgLylZpNhJjsmny3GfYwbTSQvCLifHN++17o8zo67wunEZCHZgt
	JgH0CwAwK+UOKoPI5wri7ICjZoPWrJC2d36EjvwpV1hPU+SCbPyP6aC0i+8Xlg==
Date: Mon, 5 May 2025 13:22:47 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v4 3/9] i2c: atr: split up i2c_atr_get_mapping_by_addr()
Message-ID: <20250505132247.3ba8af2a@booty>
In-Reply-To: <f3bf2c93-31ac-4881-9ca3-ddc33cf3ded3@gmail.com>
References: <20250428102516.933571-1-demonsingur@gmail.com>
	<20250428102516.933571-4-demonsingur@gmail.com>
	<20250430163307.528671a8@booty>
	<f3bf2c93-31ac-4881-9ca3-ddc33cf3ded3@gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedtleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepfihsrgdorhgvnhgvs
 hgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

On Mon, 5 May 2025 13:26:54 +0300
Cosmin Tanislav <demonsingur@gmail.com> wrote:

> On 4/30/25 5:33 PM, Luca Ceresoli wrote:
> > On Mon, 28 Apr 2025 13:25:08 +0300
> > Cosmin Tanislav <demonsingur@gmail.com> wrote:
> >   
> >> The i2c_atr_get_mapping_by_addr() function handles three separate
> >> usecases: finding an existing mapping, creating a new mapping, or
> >> replacing an existing mapping if a new mapping cannot be created
> >> because there aren't enough aliases available.
> >>
> >> Split up the function into three different functions handling its
> >> individual usecases to prepare for better usage of each one.
> >>
> >> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>  
> > 
> > This function has become quite complex over time, so this looks like a
> > good cleanup by itself even not counting the advantages coming with the
> > following patches.
> > 
> > I have only one small remark, see below.
> >   
> >> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> >> index 939fb95fe781..184c57c31e60 100644
> >> --- a/drivers/i2c/i2c-atr.c
> >> +++ b/drivers/i2c/i2c-atr.c
> >> @@ -239,9 +239,23 @@ static void i2c_atr_release_alias(struct i2c_atr_alias_pool *alias_pool, u16 ali
> >>   	spin_unlock(&alias_pool->lock);
> >>   }
> >>   
> >> -/* Must be called with alias_pairs_lock held */
> >>   static struct i2c_atr_alias_pair *
> >> -i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> >> +i2c_atr_find_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> >> +{
> >> +	struct i2c_atr_alias_pair *c2a;
> >> +
> >> +	lockdep_assert_held(&chan->alias_pairs_lock);
> >> +
> >> +	list_for_each_entry(c2a, &chan->alias_pairs, node) {
> >> +		if (c2a->addr == addr)
> >> +			return c2a;
> >> +	}
> >> +
> >> +	return NULL;
> >> +}
> >> +
> >> +static struct i2c_atr_alias_pair *
> >> +i2c_atr_replace_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> >>   {
> >>   	struct i2c_atr *atr = chan->atr;
> >>   	struct i2c_atr_alias_pair *c2a;
> >> @@ -254,41 +268,57 @@ i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
> >>   
> >>   	alias_pairs = &chan->alias_pairs;
> >>   
> >> -	list_for_each_entry(c2a, alias_pairs, node) {
> >> -		if (c2a->addr == addr)
> >> -			return c2a;
> >> +	if (unlikely(list_empty(alias_pairs)))
> >> +		return NULL;
> >> +
> >> +	list_for_each_entry_reverse(c2a, alias_pairs, node) {
> >> +		if (!c2a->fixed) {
> >> +			found = true;
> >> +			break;
> >> +		}
> >>   	}
> >>   
> >> +	if (!found)
> >> +		return NULL;
> >> +
> >> +	atr->ops->detach_addr(atr, chan->chan_id, c2a->addr);
> >> +	c2a->addr = addr;
> >> +
> >> +	list_move(&c2a->node, alias_pairs);
> >> +
> >> +	alias = c2a->alias;
> >> +
> >> +	ret = atr->ops->attach_addr(atr, chan->chan_id, c2a->addr, c2a->alias);
> >> +	if (ret) {
> >> +		dev_err(atr->dev, "failed to attach 0x%02x on channel %d: err %d\n",
> >> +			addr, chan->chan_id, ret);
> >> +		i2c_atr_destroy_c2a(&c2a);
> >> +		i2c_atr_release_alias(chan->alias_pool, alias);
> >> +		return NULL;
> >> +	}
> >> +
> >> +	return c2a;
> >> +}
> >> +
> >> +static struct i2c_atr_alias_pair *
> >> +i2c_atr_create_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)  
> > 
> > I would move the _create function before the _replace one, because
> > that's the logical order in which they are called.
> >   
> 
> Sadly the diff actually becomes bigger by doing this.
> before: 78 insertions(+), 32 deletions(-)
> after: 84 insertions(+), 38 deletions(-)

The diff size is not at all the primary goal. I just epected it would
reduce, but OK, it does not matter.

> If we were to put things in a logical order then should we put _find()
> after create(), or after replace()? There's no specific order in that
> case. I think we should keep things as-is as it matches the previous
> branches of the code, just split into separate functions.

Definitely find, create, replace. It's the order in which they are
executed, as clearly visible i2c_atr_get_mapping_by_addr(). It's also
the logical order in the old code, even though it is visually looking
reverse:

[old] i2c_atr_find_mapping_by_addr():
  - list_for_each_entry()   # then new _find
  - i2c_atr_reserve_alias() # this is the 1st half of the new _create
  - if (success)
    - i2c_atr_create_c2a()  # 2nd half of the new _create
  - else
    - list_for_each_entry_reverse... atr->ops->detach_addr...
      list_move...          # the new _replace

This has of course no impact on the actual executed code, it's just a
matter of code organization which I believe should be intuitive when
doable with a small effort.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

