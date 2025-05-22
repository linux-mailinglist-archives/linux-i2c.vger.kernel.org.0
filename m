Return-Path: <linux-i2c+bounces-11111-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E42AC0974
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 12:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 243473B2F35
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 10:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44706288C03;
	Thu, 22 May 2025 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KNrHscjB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE3326A09A;
	Thu, 22 May 2025 10:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908442; cv=none; b=dsdv6cW9jjhCW6+CsDXlRqiB6eVu/oIJiA+rPCf0etW1HP/RDfSYvyvCQsG5AjYzBNj9vkWKrJDGp1Y+mDkDRuv0HxQqY18tTWPaBJZoDmsO0+0lnJAdy4/QkvbvfcgnGNdp0ns/gsRjAex0BCIqZsOorCr5uksQUoXqrBsX2Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908442; c=relaxed/simple;
	bh=NiburEsVTch0FnwAH7158kJCqksh9zLSN/Cvo3feDWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWka/QtFH6+nc5LCXRYRS65EOsG1JxDAw/E+SU8VDsXIdWfMfhg6wRvcYMEeXD7NFcmnv8fglpO2x/nt72C//7LO7LDcSD+O/hL5+iaUwAWnfoHLVgG+HIr3iGx2bTr8Pvt5xKvoizHP6mZbwTr1X8iHl3ElDvkiHA5JHfDi0P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KNrHscjB; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3020541DDB;
	Thu, 22 May 2025 10:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747908437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NiburEsVTch0FnwAH7158kJCqksh9zLSN/Cvo3feDWQ=;
	b=KNrHscjBvBbxNq4QoZfAGq12vQ9e4Mv3Jm4STFacfxBxWAP/+MdwX3k/pE0mCfKiw4S95n
	8E+mof7vyH0GiLRIVMmWlI+HyXVCh24Q1FcGFYwGxt5fQhy7xBO4cRjtYH30wE1D/8GzBb
	z0zre+cgnS8W6pv9xigW6pbqXqSVm/EvNgjr35cNrGsarlji1hAdsChOj/DIYO33DfaLwO
	NZQ/T6Xc0+c1+3ZNcCtylts494aqHI/Rwcjq4yd8igT/jFSrqqts1rJvxW10NwqrrnMm8Y
	UWhbBhBTCV84ijnhHRQcX9LIzpU20FHe3llG7j1ytjQM4+JvS03c09lUwAYVuA==
Date: Thu, 22 May 2025 12:07:13 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Cosmin Tanislav <demonsingur@gmail.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 1/9] i2c: atr: Fix lockdep for nested ATRs
Message-ID: <20250522120713.7feafa47@booty>
In-Reply-To: <aC7o_obqzBlhW0tE@shikoro>
References: <20250507121917.2364416-1-demonsingur@gmail.com>
	<20250507121917.2364416-2-demonsingur@gmail.com>
	<aC7o_obqzBlhW0tE@shikoro>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehieejucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetudeugfehheeliefhjeejuddvledtuddttdevledthfehgeeugfetheekgfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtt
 hhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

On Thu, 22 May 2025 11:06:06 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> On Wed, May 07, 2025 at 03:19:07PM +0300, Cosmin Tanislav wrote:
> > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >=20
> > When we have an ATR, and another ATR as a subdevice of the first ATR,
> > we get lockdep warnings for the i2c_atr.lock and
> > i2c_atr_chan.orig_addrs_lock. This is because lockdep uses a static key
> > for the locks, and doesn't see the locks of the separate ATR instances
> > as separate.
> >=20
> > Fix this by generating a dynamic lock key per lock instance.
> >=20
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> =20
>=20
> Your SoB is missing. I will add it for you if you confirm here.

Mine? I didn't think it would be needed based on:

> The Signed-off-by: tag indicates that the signer was involved in the
> development of the patch, or that he/she was in the patch=E2=80=99s deliv=
ery
> path.

I'm not involved in the development, and "being in the delivery path" is pr=
obably not clear enought to me.

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

