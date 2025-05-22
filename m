Return-Path: <linux-i2c+bounces-11112-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B7CAC097C
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 12:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B797163304
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 10:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE222882BF;
	Thu, 22 May 2025 10:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="blmLxG9m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7581EDA3A;
	Thu, 22 May 2025 10:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908547; cv=none; b=Zg8WVIzqvqqv5hn24Jnc522QxJnbiPWpMc3IyKPbh9LXhwJ97E6MXQ/x1hWmSoIrvnxONsq9vgTnl1vrVEqHi1KHFFL7YK67zsL1x+z7EwpWgYJT6GtUR4zp63GM2582l9I0TS/pWymyj51ujsCvBX7dJoAt+DqK5yFB8jsAmzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908547; c=relaxed/simple;
	bh=FUPMhN7w1+sRFEiz51xuYdY6abFxywKKibbm+Qe4C9w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BN0trkkKGw1NITUxSdcZZX3lzt3vUds3fraLgVZWBRNX5VROpYBxDpcXu0G8VQYnE4C5XNpglF+uXP7oDeUb0dIYrgQDGZmKER/WueF4NDodTxO3ylEdzEgSpRMVVoAlQb7a4M48MMyCDwhw9BRd6OaT09wS4FSBEFuQNzglonA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=blmLxG9m; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66BEC43978;
	Thu, 22 May 2025 10:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747908537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xlg1V/6l62CyuxVBXPLPLqh5CohQnzmdJ/wKM9A29tQ=;
	b=blmLxG9mdWDa8G+jWbuKDba9+qyP1sjwPtcRiylusAn5AzpxE3PfYF9Tsbmt/iPOMtszGr
	LnXwspVQbIaQ68HI6iKYrg0PhJO/wb4EQBOqf5zwpC54wul/+IPOcb8NdnobLZwHQvM2N7
	SmWFVqUhAznPEPAJyDjjQDBZXSPSS3+uAKKtejnLA+OTOHZZ82f6VyXwK+QGsKnRtxMfEk
	9OpvjcTLe/SF6UMgd1GLiD4KH7M1qMaaM35WRIWh+7nJI5ohCp3hppAk99LTN5NQhrAxaw
	IhhlWDKVbz+vdAmch8JNHw0IL/oGDal3CWk8t8ymmJ3wLuZFIlBKuuNjesSNvQ==
Date: Thu, 22 May 2025 12:08:54 +0200
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
Message-ID: <20250522120854.31b61bdd@booty>
In-Reply-To: <20250522120713.7feafa47@booty>
References: <20250507121917.2364416-1-demonsingur@gmail.com>
	<20250507121917.2364416-2-demonsingur@gmail.com>
	<aC7o_obqzBlhW0tE@shikoro>
	<20250522120713.7feafa47@booty>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehieelucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetudeugfehheeliefhjeejuddvledtuddttdevledthfehgeeugfetheekgfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtt
 hhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi,

bleurgh. Sent by mistake before I finished writing. :-/

On Thu, 22 May 2025 12:07:13 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> On Thu, 22 May 2025 11:06:06 +0200
> Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
>=20
> > On Wed, May 07, 2025 at 03:19:07PM +0300, Cosmin Tanislav wrote: =20
> > > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > >=20
> > > When we have an ATR, and another ATR as a subdevice of the first ATR,
> > > we get lockdep warnings for the i2c_atr.lock and
> > > i2c_atr_chan.orig_addrs_lock. This is because lockdep uses a static k=
ey
> > > for the locks, and doesn't see the locks of the separate ATR instances
> > > as separate.
> > >=20
> > > Fix this by generating a dynamic lock key per lock instance.
> > >=20
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.co=
m>
> > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>   =20
> >=20
> > Your SoB is missing. I will add it for you if you confirm here. =20
>=20
> Mine? I didn't think it would be needed based on:
>=20
> > The Signed-off-by: tag indicates that the signer was involved in the
> > development of the patch, or that he/she was in the patch=E2=80=99s del=
ivery
> > path. =20
>=20
> I'm not involved in the development, and "being in the delivery path" is =
probably not clear enought to me.

However, if it is needed, I confirm you can add my:

 Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

