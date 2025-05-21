Return-Path: <linux-i2c+bounces-11093-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9487ABFAE3
	for <lists+linux-i2c@lfdr.de>; Wed, 21 May 2025 18:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 435319E6699
	for <lists+linux-i2c@lfdr.de>; Wed, 21 May 2025 16:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C3E22A4E1;
	Wed, 21 May 2025 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I5ELHjt1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C59220F3B;
	Wed, 21 May 2025 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842999; cv=none; b=DQxlCaMk2jFtORrguUGh5goB898z1Sye0ucFyIjT4++sBlFyWC5xtGER1999eJ4FKg4ptoUnSrYd0bKT10QDVVr1h6R3Hn6SI0Rc3kl+b+7flv3Z5ScffiROo+0NkANXdJRMDfZiGS2ODK3UU7cxw9iB5y+mTEtvnTN8pHk5IPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842999; c=relaxed/simple;
	bh=5Doh5G+A/5vZANC2hFIuj+z2N+72ML0y3weAUvUWF60=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XytLvjt13BGAbVFdGR14vp06hY7pEH+leIfZZ3EpdWEEBodDNW9Cp2c5AnhO6SyqYwpzdINVF0QFnyfuOt+QJwSu7Rox/EXfTycAPJQZYFpW42IP9Vleu+5Zf9DuCwB0JMlC1voTsNKLUpje52pyKMoXAssH+cHq/4awWouOY0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I5ELHjt1; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D9E41FCF1;
	Wed, 21 May 2025 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747842995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMt3+zKh8MFrX6ZVemx3nyqzynGMPwR2F6IMelQXdhA=;
	b=I5ELHjt14Y9TpOPAjHO+Oh5J98liJodWmTRQNUrZu0Cx9jwLUagLp+R7iHi/P0Y46kTirn
	vfbVifyDkwPfL2ZEfrbdOizwsS8cOnLgjKdMXvDfIaQ/8GTlsyd5K6IRnj+cE1vcKN4Rb1
	FKzfTjS+NcvppGVsVCpLIp+4cv58yzPOgeWE0roMetS7Rt6LVP+fjkY1EsHVKxbE3wWtMV
	Z0lX83KE6wcdaxODTlPLjgsMoKthXhybWYnzrzJQ01KOCPQDH+jCv1IzWosVTWGygYmrp9
	t3B+ME+MXbneoHM6v6jJryrmMuvEbZ4N2yYrTX4sIpZ1B+RayOFavfkzw7gkVA==
Date: Wed, 21 May 2025 17:56:31 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v5 8/9] i2c: atr: add static flag
Message-ID: <20250521175631.0af904e9@booty>
In-Reply-To: <20250507121917.2364416-9-demonsingur@gmail.com>
References: <20250507121917.2364416-1-demonsingur@gmail.com>
	<20250507121917.2364416-9-demonsingur@gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefgeelucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtt
 hhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

On Wed,  7 May 2025 15:19:14 +0300
Cosmin Tanislav <demonsingur@gmail.com> wrote:

> Some I2C ATRs do not support dynamic remapping, only static mapping
> of direct children.
> 
> Mappings will only be added or removed as a result of devices being
> added or removed from a child bus.
> 
> The ATR pool will have to be big enough to accomodate all devices
> expected to be added to the child buses.
> 
> Add a new flag that prevents old mappings to be replaced or new mappings
> to be created in the alias finding code paths.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

