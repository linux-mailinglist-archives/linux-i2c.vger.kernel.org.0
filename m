Return-Path: <linux-i2c+bounces-10691-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7E6AA4B15
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 14:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55A561BC2FFE
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 12:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D189325A331;
	Wed, 30 Apr 2025 12:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RppvKdCq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F31F1C173F;
	Wed, 30 Apr 2025 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015936; cv=none; b=M4whI79ThanZmS5JQn4XB7wWm/GsUkq6Q6SHC/VnkClLMc+JDHj8LgqlO9BSfPpXFyELPm+HZI68sUExwO0fCdTw5a4Ly/aTCpAuJdl8JxtpkxhsadXzsqjwcxuVT2qpMQlESu7Gs6ULjE92t61ESVQSROqeNTx4rRRCqeJbLJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015936; c=relaxed/simple;
	bh=+9/PAdkrDSDqpHYeIfDrz2L4yaVxct43eEk6fcpaB+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jO6L7DshPVco4xqCsxGkT2E1kxN83fnkLid4J8nBJd6607DUBToRJBEpzxbT6hNEaycMo69r/XwuUL8YbtrXXfrpaY6nCPhlneOjRtQw6//JY/Obz8IPIEi8fDZU5ewO/bsCNHU9YF8SDNa15IM0Tv2l0gi7lI1PsGY5iR9BPBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RppvKdCq; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2499943B05;
	Wed, 30 Apr 2025 12:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746015926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnxkKMiK9jWlWadYD48cBMF6FzVo3oyStOXi6SWjg9k=;
	b=RppvKdCqXCV9/hK3z2ydxaKP8etv6srFQ9bDgPS28xeXT3aRB22YLp0ufsPBSJe2sqghZI
	ZyAPdNSU5OqMZLv/fafjKPfLZK+m4iYGMMn2CYhUNHP75BukturXSLUhsM/SwDwjxsvgnL
	DrhE/QfF6lgf/UTT/5/j7qipgf9ipuoMJfV2nGwQA/S0DLZG+2JUdhVUdptYGqxGBsWEXd
	WogXIG4MF+nOzTUzGV/Ro4o/hH190zsnJJJBSimX/1QICK4zzk7Wx+ahSREw4iys/RNhDi
	sYAusSyCGWnn1Yzmv7O3YXAsX2/Cka4cWRSygMkKCsgOrlcaCV4u+qgkKhMXxw==
Date: Wed, 30 Apr 2025 14:25:22 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] i2c: Fix end of loop test in
 i2c_atr_find_mapping_by_addr()
Message-ID: <20250430142522.6cf327c3@booty>
In-Reply-To: <2778486.mvXUDI8C0e@fw-rgant>
References: <aAii_iawJdptQyCt@stanley.mountain>
	<a22d74b9-06b1-4a4b-9c06-4b0ff7f9b6c2@stanley.mountain>
	<9cd0c3cc-9f3c-4a3e-9080-c832def8f317@ideasonboard.com>
	<2778486.mvXUDI8C0e@fw-rgant>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeijedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghnrdgtrghrphgvnhhtvghrsehlihhnrghrohdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghin
 hgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlqdhjrghnihhtohhrshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

On Thu, 24 Apr 2025 09:10:43 +0200
Romain Gantois <romain.gantois@bootlin.com> wrote:

> On Thursday, 24 April 2025 08:32:22 CEST Tomi Valkeinen wrote:
> > Hi,
> > 
> > On 23/04/2025 20:29, Dan Carpenter wrote:  
> > > On Wed, Apr 23, 2025 at 05:25:44PM +0200, Romain Gantois wrote:  
> > >> Hello Dan,
> > >> 
> > >> On Wednesday, 23 April 2025 10:21:18 CEST Dan Carpenter wrote:  
> > >>> When the list_for_each_entry_reverse() exits without hitting a break
> > >>> then the list cursor points to invalid memory.  So this check for
> > >>> if (c2a->fixed) is checking bogus memory.  Fix it by using a "found"
> > >>> variable to track if we found what we were looking for or not.  
> > >> 
> > >> IIUC the for loop ending condition in list_for_each_entry_reverse() is
> > >> "!list_entry_is_head(pos, head, member);", so even if the loop runs to
> > >> completion, the pointer should still be valid right?  
> > > 
> > > head is &chan->alias_pairs.  pos is an offset off the head.  In this
> > > case, the offset is zero.  So it's &chan->alias_pairs minus zero.
> > > 
> > > So we exit the list with c2a = (void *)&chan->alias_pairs.
> > > 
> > > If you look how struct i2c_atr_chan is declareted the next struct member
> > > 
> > > after alias_pairs is:
> > > 	struct i2c_atr_alias_pool *alias_pool;
> > > 
> > > So if (c2a->fixed) is poking around in the alias_pool pointer.  It's not
> > > out of bounds but it's not valid either.  
> > 
> > Maybe it's just me, but I had hard time following that explanation. So
> > here's mine:
> > 
> > The list head (i2c_atr_chan.alias_pairs) is not a full entry, it's just
> > a struct list_head. When the for loop runs to completion, c2a doesn't
> > point to a struct i2c_atr_alias_pair, so you can't access c2a->fixed.  
> 
> Ah I see, in that case thanks for the fix Dan!
> 
> Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

