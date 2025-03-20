Return-Path: <linux-i2c+bounces-9955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C241CA6AB1D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 17:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 427A7188CF55
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 16:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B487A1EB5E0;
	Thu, 20 Mar 2025 16:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NI/UKGMa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13421E3761;
	Thu, 20 Mar 2025 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742488323; cv=none; b=FdBaXzqVNWxIPr4Lweigr9V1h97v6THsySXXyMJyzVxZ1S6jgEq6bww+buzgEetmMTR+/thgCYGQi3m6OLKZahaPj3FIgvaYrpA4V08u6kMg2sSIijVuVsUO6KB4DvnlQH0mBXLLmVWhcrHhGYCxKKyBvF8BfBkDlDXALTmEm18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742488323; c=relaxed/simple;
	bh=7QIQt67dFnk4LfBRaQPs3oTOyzM6wp4K58w/lk+tz78=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=syDBWmxWGFi+hXM0wxkTwfB1Jtcgdd8RijLN3Z37EF7SH2ajoY+2PJ7OJEmo6Z4m12h796KaHsUOt9AUzM31lpQq+zfvOtawdZ0nVwzw7cQ13QCvSJNOLvv10yjn89KdNUsmH7v5jUhfcdVEqtIov7nVhyHvR6CyXRGosMkTknM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NI/UKGMa; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C0A52048A;
	Thu, 20 Mar 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742488313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IJNUHg58A8IzCz3yY8NhVwvy7UG5mwQu4dYKEqkdPVc=;
	b=NI/UKGMaKhqxUFsKcpg4V5nvSrCI/FZDIkkppD5Bf6N3xO60upR52Mi2eZ2p5NAEhVk/Lf
	MWdSVlk2fouqaukEdu1t92DCbyL/95rdoeavGG8faeuIidkTP14It6DvStrvalUEdgW4ME
	bdyWOoWL+OohPYrTbknbZZo+IiIKvDiYg1k27LXZR6ugS4A0bwPp8+LtueEaWHBhV/+hyD
	Yxnl8voiEyMDt61imxhi3ovm2JuiJkgNIT83DsxKMh4RTztWxcZgK78M+lK9jtrPN+bqtp
	MdOuC0VDb6fd4dTaw39oupKAgcS2gbVoe56sxx6C5I6jM5GB8UB7oq25jnTHNA==
Date: Thu, 20 Mar 2025 17:31:50 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 0/3] i2c: Introduce i2c bus extensions
Message-ID: <20250320173150.2c823635@booty>
In-Reply-To: <Z9wO8SIy1CcfO0bZ@shikoro>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
	<Z9wO8SIy1CcfO0bZ@shikoro>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfekieegtefhgeelieehhefgtdekffevgfegvdeggeelkeehjeetteethfevudfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrt
 ghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Wolfram,

On Thu, 20 Mar 2025 13:49:53 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Hi Herve,
>=20
> > The related big picture has been already presented in
> >   - the 'Add support for GE SUNH hot-pluggable connector' series [0]
> >   - the 'Runtime hotplug on non-discoverable busses with device tree
> >     overlays' talk at Linux Plumbers Conference 2024 [1]. =20
>=20
> Any outcome of the Plumbers meetup? Was this "double-link" solution
> agreed on or so?

The i2c-parent was proposed by Rob [0]. The need for the double link
is what you, Herv=C3=A9 and I had agreed during our discussion after LPC,
based on having realized that the forward link is insufficient for some
cases (see "Second case" in the cover letter).

> I mean the code is the easy part here, but I would like
> to have an agreed approach for handling all kinds of non-probable
> busses. I really don't want an island solution for I2C. So, the key
> question here is what do DT maintainers think?
>=20
> You sent code without bindings, but I'd think the other way around would
> be better for the discussion.

[0] https://lore.kernel.org/lkml/20240510163625.GA336987-robh@kernel.org/

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

