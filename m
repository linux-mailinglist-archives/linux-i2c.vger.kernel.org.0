Return-Path: <linux-i2c+bounces-9377-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A7FA322AB
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 10:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2C5D3A3053
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 09:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD7E1EF0B9;
	Wed, 12 Feb 2025 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mHammSSf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B79271828;
	Wed, 12 Feb 2025 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739353556; cv=none; b=CEkGGI5aPGZi88bAA2lCby4q9oIGdf3Dx5bPs7QT94KJz5TBWHeIRM4dpcfqYydGZ+1DMx0kOgwaQrpmKBF/4KyXLYfIyj3AAIS7YcRqH9VjR3sBULvN1NT9cQQJaI1J/W2IOeDKXsoshsxgmqU0rIKxQOzqvV9fGCcnhBQUvAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739353556; c=relaxed/simple;
	bh=kAK1JNEXBVI90rtvbzvhelzR8j2Kk8vnxGVJn1p7bBc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MkvZ842eExKM+/dwU4NVFHBH6MRwW/HezjwdRPzcWTj9AoSKEZItvVZ8Y0gC3+yczqg6S8845YiSdiiOWmMhAeAdGn/C5JaDdUOgUdksuWDbVcmW35grOAF5x5hO5bo93LFwL69NbvQspKkoJJ/KwUHgPwpqgV0tmcVS69gemCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mHammSSf; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E398A432FA;
	Wed, 12 Feb 2025 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739353551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CfitNOlVMCBM5pFcbQFIlvndtGb2TiK3zUMFNWZwgDY=;
	b=mHammSSfAxD36lSKrqFlgQ0FxjGr0GSfooYA6WuHOPvHq9JQbumFr0Ho3U1Q8tbb9rmgj8
	tzyPK6jPpwkd3G3gLk3e1NimGOsnqsuAFerXeIsRKeyGNl/6qLEg3wHBjMGJoqCzuNpIlu
	gG5mm//6DtYFd517rnZxUZIplJuyLTrwTsT9S9iFmFmODq2DPfQlcrRjAFf7c3H6SKPIQo
	cRNPcLf/EXG4VWiBv8ryfwFbhp9vR61Su+ehl48mzUydz6bja2p044wqlsDs8IPX5fY0d3
	3VQ0BUcWlu/pehPCt64yUHk1WP1jizH/rz1hkKhC60ggLigUfumfX2WaRsFFZw==
Date: Wed, 12 Feb 2025 10:45:49 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 3/3] i2c: i2c-core-of: Handle i2c bus extensions
Message-ID: <20250212104549.6b1d8781@bootlin.com>
In-Reply-To: <71468d78-07aa-49b1-8b6d-3d98c6fc9893@kernel.org>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
	<20250205173918.600037-4-herve.codina@bootlin.com>
	<71468d78-07aa-49b1-8b6d-3d98c6fc9893@kernel.org>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfeehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtvdefvefgiedvtedvgedvgeelhfejkeejgefgvdfguedtudeiiedtieejffduhfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com

Hi Krzysztof,

On Wed, 12 Feb 2025 06:54:19 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 05/02/2025 18:39, Herve Codina wrote:
> >  
> >  	dev_dbg(&adap->dev, "of_i2c: walking child nodes from %pOF\n", bus);
> >  
> > -	/* Register device directly attached to this bus */
> > +	/*
> > +	 * Register device directly described in this bus node before looking
> > +	 * at extensions.
> > +	 */
> >  	for_each_available_child_of_node(bus, node) {
> > +		/* Filter out extension node */
> > +		if (of_node_name_eq(node, "i2c-bus-extension"))  
> 
> Where is the ABI documented?
> 
> > +			continue;
> > +
> >  		if (of_node_test_and_set_flag(node, OF_POPULATED))
> >  			continue;
> >  
> > @@ -103,6 +110,23 @@ static void of_i2c_register_children(struct i2c_adapter *adap,
> >  			of_node_clear_flag(node, OF_POPULATED);
> >  		}
> >  	}
> > +
> > +	/* Look at extensions */
> > +	for_each_available_child_of_node(bus, node) {
> > +		if (!of_node_name_eq(node, "i2c-bus-extension"))
> > +			continue;
> > +
> > +		extension = of_parse_phandle(node, "i2c-bus", 0);  
> 
> And this?
> 
> > +		if (!extension)
> > +			continue;
> > +  

I know the binding is not present in this RFC series.

As I mentioned in my cover letter, the binding that needs to be updated is
available in dt-schema repo [0].

When the binding is be accepted in dt-schema repo, I will not be able to
change it and because two repos are involved, I cannot send the binding and
the implementation in the same series.

Before sending a patch to update the binding in dt-schema repo, I would
like first to discuss the proposed i2c bus extension idea in terms of:
  1) DT properties naming and purpose
  2) implementation

[0] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml

Best regards,
Hervé

