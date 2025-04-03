Return-Path: <linux-i2c+bounces-10097-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2F1A7A2B0
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 14:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC1273B2CF2
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 12:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7F124DFFD;
	Thu,  3 Apr 2025 12:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Q8/TYGYP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFC724CEFD;
	Thu,  3 Apr 2025 12:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682881; cv=none; b=WxR/QFVYxGbT0dXoqOZZu0UuT1Ni6s9PIqf5XtPislWvPorLAl/rKLtWwfg/buOPeTaUoUxmPgA5zXr0jOmulz9awvCqO+YyNsZLyl7/DmpnL7IXbs6UtauJu7Q4ZXENKmXx5A2f8xgCuitzYft2+/8UeC62kgxEVVyBLP7gjGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682881; c=relaxed/simple;
	bh=L1M9+DqEkPWzAH4mbo5Bdwgh/m7vQ9ylF1u193HM9eo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ISzEKM+B3b6icQJ//2t2aVfrulmyaHjrh0tZnu/D1XNds0NIE/HSY5wEZVlqaUkgKO5mQ2lJqytC3DFsaYGEbmTVMb8Y9LZUTAg6bYrR6Liq4FN14BFEyK/2ynVoi4Lz4baNglJ3SUOthM4jtSrINVWDRnOY/MyrKFNNHhdGtjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Q8/TYGYP; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 745AF43231;
	Thu,  3 Apr 2025 12:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743682875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b5DITWvhtq18VMzVSHOCV2iIg0K0B/BD1nLhgl2nuEI=;
	b=Q8/TYGYPKz5AUooLVdQNonVxTWZy1BMPqYD2MsAiksQVAHgsa5fwrzPmIds7d0DloXNqld
	w2LOtGQL/xdB2C1V9TAEV+yyNBYSt6OxzUCqRgRj6cyKyzCtP/y488NwRSFFElQ5YdcEOy
	DDLbZBFjyJ03/1BJGieXIAoXbRYTQqOnc+alJM5KCfPM5g1KK45SXU1ITh5MtyUNuC2qIw
	bCT66HELUv3NwVpBl04bBWsKkNUTiTx/b6DTSpGOsVlVH5DHNqZibE3wntoAmuaT7CCLKf
	aegJO4TlaZLsSJxVQaufMbQpUp4yNV99x9VDUp9gf/gdJ4TeUao7O4BkohfgJQ==
Date: Thu, 3 Apr 2025 14:21:14 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 1/3] i2c: core: Follow i2c-parent when retrieving an
 adapter from node
Message-ID: <20250403142114.2ca6722a@bootlin.com>
In-Reply-To: <Z-5u5bAnY8Y1DmFz@shikoro>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
	<20250205173918.600037-2-herve.codina@bootlin.com>
	<Z-5O3-FSsHbn27lW@shikoro>
	<20250403125050.22db0349@bootlin.com>
	<Z-5u5bAnY8Y1DmFz@shikoro>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Wolfram,

On Thu, 3 Apr 2025 13:20:05 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> > The debug message can be interesting when things went wrong and we want
> > to investigate potential issue with i2c-parent chain from the last device
> > up to the adapter.  
> 
> I thought so but couldn't estimate how often this is useful in reality.
> I agree that introducing 'dev' is too much hazzle, yet I think the
> message should have some id to disitnguish potential different adapter
> chains. Either that, or...
> 
> > I don't have a strong opinion about the need of this message and I can
> > simply remove it.  
> 
> ... we just remove it and let people add their debug stuff while
> developing.

I agree.

> 
> > What is your preference ?  
> 
> A tad more 'removing'.
> 

Will be removed.

Hervé

