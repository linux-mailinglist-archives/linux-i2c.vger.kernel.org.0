Return-Path: <linux-i2c+bounces-10762-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12843AA8E24
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 10:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D4213B74A2
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 08:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886E71F12FF;
	Mon,  5 May 2025 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mVtwl5fo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2531EFFAF;
	Mon,  5 May 2025 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433333; cv=none; b=iX2i8sMx/oJnTRhxaeI5JMGTuZrXzX6ru2Up+qkQ0+pNNJfnU6aE28NmEVD1XHuaGyhF42ovl6wkLHpZFZtFefAnR2l9rr3C5na03jXeqfTrlztATwkzh1ZHTBtYH2+9bX7qaCIz8OogC2FIW+x+r3olGfO04v8vscJQI2KD/Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433333; c=relaxed/simple;
	bh=zCrAasw3aT6zagyU+hfu0KLmpivQDVk4DpsxMEgM65k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IPrDhdAQwHelVZhU2u6eOqaA47+WAXSZD5ydDBlYU+cMg49TdE09c70JkyYQjsI43blZXa3iweWHqokcoYcK3dqAtV7WaYeYdrWQj+1XcIA0Iyfo1q9xXu3XF85Zgoav6mVZWoCFt0gEoWTFlKrEG6mhuYdeEZxb1cpywjRxNjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mVtwl5fo; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADCF31FD48;
	Mon,  5 May 2025 08:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746433329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YM3k1ODh/XrTfaviGoaAW5WSeUPQLJS+hciVRusS5Yg=;
	b=mVtwl5foQ/Tm6luhAVmCrNrTxB1YGeVTjiF4WibQSEH4i5AGSKe4AuqPq90zZTB8TdFwWD
	DgXjCeVVoc/zW/nQpbT0tqpiB0/2lhCCBZPIuUdhtNJzW8Xha8Y8fp0yzCSnREF6aFhORr
	op3cMN7xmlf7L/HK3FPQ0oZFFyCJEOyV+NkESvWupHQdJCfDh9kU84EuQWUUOHE3PMWvwG
	NTijzjDcAKYW0zGkpFBgNnX+M5Lz0DjWRPdniq1oar8C27c3QgLrMYXugVro5LrV252bHs
	0gC3lFxa2OX9/IOD04n+1n9d1B7VPJm4oQV1R/+PlZD1EmnWqvDPP72FzGEaNQ==
Date: Mon, 5 May 2025 10:22:07 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Ayush Singh <ayush@beagleboard.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/1] schemas: i2c: Introduce I2C bus extensions
Message-ID: <20250505102207.2c54cbaf@bootlin.com>
In-Reply-To: <20250502160910.448f63dd@booty>
References: <20250430152201.209797-1-herve.codina@bootlin.com>
	<20250430152201.209797-2-herve.codina@bootlin.com>
	<20250502160910.448f63dd@booty>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedtheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com

Hi Luca,

On Fri, 2 May 2025 16:09:10 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Hello Hervé,
> 
> On Wed, 30 Apr 2025 17:22:00 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
> 
> > An I2C bus can be wired to the connector and allows an add-on board to
> > connect additional I2C devices to this bus.
> > 
> > Those additional I2C devices could be described as sub-nodes of the I2C
> > bus controller node however for hotplug connectors described via device
> > tree overlays there is additional level of indirection, which is needed
> > to decouple the overlay and the base tree:
> > 
> >   --- base device tree ---
> > 
> >   i2c1: i2c@abcd0000 {
> >       compatible = "xyz,i2c-ctrl";
> >       i2c-bus-extension@0 {
> >           i2c-bus = <&i2c_ctrl>;
> >       };
> >       ...
> >   };
> > 
> >   i2c5: i2c@cafe0000 {
> >       compatible = "xyz,i2c-ctrl";
> >       i2c-bus-extension@0 {
> >           i2c-bus = <&i2c-sensors>;  
>                         ^^^^^^^^^^^
> 
> This should be i2c_sensors (with an underscore)...
> 
> >       };
> >       ...
> >   };
> > 
> >   connector {
> >       i2c_ctrl: i2c-ctrl {
> >           i2c-parent = <&i2c1>;
> >           #address-cells = <1>;
> >           #size-cells = <0>;
> >       };
> > 
> >       i2c-sensors {  
> 
> ...and this should have a label:
> 
>         i2c-sensors: i2c-sensors {
> 
> With those fixed you can add my:

Indeed, thanks for pointing out.

I will fix them in the next iteration and add your 'Reviewed-by' tag.

> 
> +Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

Best regards,
Hervé

