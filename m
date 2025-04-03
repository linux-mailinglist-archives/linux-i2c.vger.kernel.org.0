Return-Path: <linux-i2c+bounces-10095-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E1EA7A167
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 12:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419F616FA32
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 10:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CF124BBF5;
	Thu,  3 Apr 2025 10:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hYBYDmKn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7D92E3385;
	Thu,  3 Apr 2025 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677522; cv=none; b=DfVzaZcNsc3mXmcPPT5xyz44kjKlbWXwPOmw4ZesqxrPg3yBfTGqChSdyf6ziZqmi3kLXEtiSJn98ETrIZvWSzdPR3r4slwR5w3teMsFuWK3OtnXc2gkfoe383lDiWPoJ0tvKWIK0KshdnWk0VZQRkHRiYEO4MWIH2E7E/vGARo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677522; c=relaxed/simple;
	bh=k/IxIgOV7W3YmC7j+j0j0hDTjbXnaF/uNP9lc71c2zE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iof97/c5/yDj/C964v/WAQYwJDip45rRerphWDs83qWpNd5/Q0y/ISf8qVXXhpIpvZRP05ScbgWtrLOy3yMRntS2TCFLP40vx5AhcQ2GPcWZwNoUrOBJ0g0/ju0gB9rNRhid1qNsQuTHPFOEZAJGHr9oCw0cKWe4eocNGGT0fK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hYBYDmKn; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7812543290;
	Thu,  3 Apr 2025 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743677518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vcGog+HEjFs2RShLoDBtTb1A6IYq8Q2GnZoRi2cmUyM=;
	b=hYBYDmKn3S0NlJBOqrow/DlOl25r6cdnVdpREyPd/9Frili9tEF/GSASW/d1mx1y2XEDMx
	Sj7XEwwdKPpyfmD/NX1DoFJghaU0K9VJJaahausZY20wY7afG7s1+mYCG/n+55MAJTXDgt
	pErd6p3yhyIGosUF+2pPvzN5D82i2dtEP8rHNlctgO0n1P+yDMx/As54pUpW3vtA0gskqP
	oF1j8Fb/VeSAIwezOkpVkI7FZr/sxisINpJ6NrA+sMFyjjjiaEn8JFkslcvQnu4HYXfWcq
	A6F2hZcU7X3KovS1y4dsSSzQLLpYZ6X4SpSJH3J6sf1afOclqJ5DSg2cOEKEJA==
Date: Thu, 3 Apr 2025 12:51:56 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 2/3] i2c: i2c-core-of: Move children registration in
 a dedicated function
Message-ID: <20250403125156.775cca7c@bootlin.com>
In-Reply-To: <Z-5Pw8qyfuB2leG2@shikoro>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
	<20250205173918.600037-3-herve.codina@bootlin.com>
	<Z-5Pw8qyfuB2leG2@shikoro>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Wolfram,

On Thu, 3 Apr 2025 11:07:15 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> > -void of_i2c_register_devices(struct i2c_adapter *adap)
> > +static void of_i2c_register_children(struct i2c_adapter *adap,
> > +				     struct device_node *bus)  
> 
> Could you kindly add a little kdoc so it is easy to understand the
> difference between of_i2c_register_children() and
> of_i2c_register_devices()? It is not too obvious from the names alone.
> 

Of course, I Will do.

Best regards,
Hervé

