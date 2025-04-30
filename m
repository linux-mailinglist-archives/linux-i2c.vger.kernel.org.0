Return-Path: <linux-i2c+bounces-10701-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC12AA4EBE
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 16:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EA9D7B7EF0
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 14:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F2C2609ED;
	Wed, 30 Apr 2025 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VZjR+6oJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B1325E821;
	Wed, 30 Apr 2025 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023786; cv=none; b=oQ9F09GjlUKmWJgVj7qVM3RfqwwN8HZYBPQiUV945HrKw/EgQRI+IH8jpix+alcyC83QBYr3s68Fu/OGhH3ZNbD8XhGhvIM1j1khre4Z63HnbiEYSo0kY2WuZmox1uXZ3UROxnpVQx8GEBKAln+gETqR2JLsVUJXg5gIJmG6OV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023786; c=relaxed/simple;
	bh=tjIyv1JFvMFq7wZTL6MfarqYFF/XyielH+6I6/vs7Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rv8mTPgQOLyGqh1rMVY+zUBPcuYrbqKjKQ6WnGwxGiBqa5Mk4WutVTiToVHXfqJ3aalsVRDay0lHqtk5BoNLMLTcMyqzqzR/jRwrmAeuCuAkpYBeJyhZtIyfqXjaX1ncAu4OSSB0kovrH3D0Dh+TFvDG58fs3/tcooAOWMkUDEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VZjR+6oJ; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0177E43205;
	Wed, 30 Apr 2025 14:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746023776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dYMWcJMyVuYfo7Mr2qm5ixxTrlcF5uQVV5ROWedLjYc=;
	b=VZjR+6oJC05R5G5bJ9k2Y7stntPOIBd5w6xyWSACkuXPXv237hd7SR7SiCVFthTGVvkpzr
	zyYk33SQthruY/2XkjydTSBSkAaYJmZm32VCjP8o5Oh9mwhSMkll5QnTUHInSKlevXBcLY
	/gw6OX3OKRG4VcfkCs0zvvJ/wcMv8aTJ9eoRoVrQDtRT4oZhtnw45YYENtmqh6L/rT8qzQ
	LQkyIN/TV04RXlFWQ5rOeQRAlhSTWbU+sG2tQf7KidE3Gp5ukKQ8HQERqTlRinsEEyH1Cj
	WlRxdK+ZFDsfMBoI5u5FwPyHuzK0Vl8K1xl9C4ZJjWtHdLNtQU/IZkUDBvKOJA==
Date: Wed, 30 Apr 2025 16:36:13 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v4 8/9] i2c: atr: add static flag
Message-ID: <20250430163613.187a0504@booty>
In-Reply-To: <20250428102516.933571-9-demonsingur@gmail.com>
References: <20250428102516.933571-1-demonsingur@gmail.com>
	<20250428102516.933571-9-demonsingur@gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeileeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepfihsrgdorhgvnhgvs
 hgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

On Mon, 28 Apr 2025 13:25:13 +0300
Cosmin Tanislav <demonsingur@gmail.com> wrote:

> Some I2C ATRs do not support dynamic remapping, only static mapping
> of direct children.
> 
> Add a new flag that prevents old mappings to be replaced or new mappings
> to be created in the alias finding code paths.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  drivers/i2c/i2c-atr.c   | 6 +++++-
>  include/linux/i2c-atr.h | 3 +++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index e2350fcf3d68..721dd680f2ac 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -341,12 +341,16 @@ i2c_atr_create_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
>  static struct i2c_atr_alias_pair *
>  i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
>  {
> +	struct i2c_atr *atr = chan->atr;
>  	struct i2c_atr_alias_pair *c2a;
>  
>  	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
>  	if (c2a)
>  		return c2a;
>  
> +	if (atr->flags & I2C_ATR_F_STATIC)
> +		return NULL;
> +
>  	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
>  	if (c2a)
>  		return c2a;
> @@ -545,7 +549,7 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
>  	mutex_lock(&chan->alias_pairs_lock);
>  
>  	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
> -	if (!c2a)
> +	if (!c2a && !(atr->flags & I2C_ATR_F_STATIC))
>  		c2a = i2c_atr_replace_mapping_by_addr(chan, addr);
>  
>  	if (!c2a) {
> diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
> index 5082f4dd0e23..7c6a9627191d 100644
> --- a/include/linux/i2c-atr.h
> +++ b/include/linux/i2c-atr.h
> @@ -20,8 +20,11 @@ struct i2c_atr;
>  
>  /**
>   * enum i2c_atr_flags - Flags for an I2C ATR driver
> + *
> + * @I2C_ATR_F_STATIC: ATR does not support dynamic mapping, use static mapping

Maybe add something along the lines of: "mappings can only be
added/removed by the higher level driver via
i2c_atr_attach_addr/i2c_atr_detach_addr"

Other than that, looks good.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

