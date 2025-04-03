Return-Path: <linux-i2c+bounces-10094-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B20DA7A15E
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 12:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5754818963C2
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 10:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6CC24BBF5;
	Thu,  3 Apr 2025 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OJKHyaAD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED6D2E3385;
	Thu,  3 Apr 2025 10:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677463; cv=none; b=uvN3L1hoa2rliQu06mP2QwTi/9ohYGqYYIaCJKIfPG9r9KNeFpdY59X1oU2IhR4zl52JFUyqeFq7EDpOf/zQiCJyS1h8TzAC++luH21Eg687kW3L2ZxWF4jqTPhR6ECZZKLkH4QAAvzj9rVfPuki7dO5gUklJ3K6Sblbdh4MXPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677463; c=relaxed/simple;
	bh=i9EmdhvoiVPcex7Jw1yaLP4Y3ydXyOUD92chAaimcKA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mEakpz23Lp9IVE5V0/H0uJjIlrLSh6ahu0ufyiQr5YbPBnlGTcGQQEnGYC+RSn4L+wsbdmICySMBARZN7Q4qnyUdSnyE+HjOvzeKBVX+6ZX5Z3BcKcFzHefdk+MlpPxB+FCb/YdvsX1Pzy3dGzs9voK61B3PVe/638pWggwppDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OJKHyaAD; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DD3C42E81;
	Thu,  3 Apr 2025 10:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743677451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ta0OoQHMv5NjD91P3zHOQWTD96C36PhWHEhzInvgJQc=;
	b=OJKHyaADydSKUjWif/6cbRTP8Dc4Rz6TWy++OS5BNSgWbyDlBwgGXlIfYR7q6/scKcTLvh
	CcfSvqKEWaybw5CDDqiRtZhK7rpQEQirrgyx0rohcCrXuLBP0q3Fh4rRZ5Gdq8LO0TtF7t
	Z0c8OpJHB1sBwNQV1mBqQQIw7tHgDwJKGE27zYu5Z/tcAtmMi3liWqZQInV0VDKySs0Glc
	D/Qj2BCkHcW5yHcVDS3z6xIRWLd/E68IRJnkkCYejDbShBDR+5JcLst4OK6L+eEbJ6neww
	zQELcFyeuMn1L8j5p7ECe5DOWVG8nki6UfekWe295PKxMi1UKX+qN4rsIVcphQ==
Date: Thu, 3 Apr 2025 12:50:50 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 1/3] i2c: core: Follow i2c-parent when retrieving an
 adapter from node
Message-ID: <20250403125050.22db0349@bootlin.com>
In-Reply-To: <Z-5O3-FSsHbn27lW@shikoro>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
	<20250205173918.600037-2-herve.codina@bootlin.com>
	<Z-5O3-FSsHbn27lW@shikoro>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefflefhieduteegffeifeeggfffvdeuvdeutddvfeduudeukeffleehheffkeetnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Wolfram,

On Thu, 3 Apr 2025 11:03:27 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> > Extend i2c_find_adapter_by_fwnode() to perform the walking from the
> > given fwnode through i2c-parent references up to the adapter.  
> 
> Even with the review of the schema going on, here are some comments
> already.

Yes. Of course, depending on this review, things could be changed in the
implementation but every things already discussed here make the topic
moving forward. Thanks for that!

...

> > +
> > +	/* Walk extension busses (through i2c-parent) up to the adapter node */
> > +	while (fwnode_property_present(adap_fwnode, "i2c-parent")) {
> > +		/*
> > +		 * A specific case exists for the i2c demux pinctrl. The i2c bus
> > +		 * node related this component (the i2c demux pinctrl node
> > +		 * itself) has an i2c-parent property set. This property is used
> > +		 * by the i2c demux pinctrl component for the demuxing purpose
> > +		 * and is not related to the extension bus feature.
> > +		 *
> > +		 * In this current i2c-parent walking, the i2c demux pinctrl
> > +		 * node has to be considered as an adapter node and so, if
> > +		 * the adap_fwnode node is an i2c demux pinctrl node, simply
> > +		 * stop the i2c-parent walking.
> > +		 */
> > +		if (fwnode_property_match_string(adap_fwnode, "compatible",
> > +						 "i2c-demux-pinctrl") >= 0)
> > +			break;  
> 
> I understand the unlikeliness of another demux driver showing up, yet
> relying on compatible-values here is too easy to get stale. What about
> checking if the i2c-parent property has more than one entry? That should
> be only true for demuxers.

Indeed, this is better.
I will stop the walking based on this number of entries in the i2c-parent
property.

> 
> > +
> > +		/*
> > +		 * i2c-parent property available in a i2c bus node means that
> > +		 * this node is an extension bus node. In that case,
> > +		 * continue i2c-parent walking up to the adapter node.
> > +		 */
> > +		err = fwnode_property_get_reference_args(adap_fwnode, "i2c-parent",
> > +							 NULL, 0, 0, &args);
> > +		if (err)
> > +			break;
> > +
> > +		pr_debug("Find adapter for %pfw, use parent: %pfw\n", fwnode,
> > +			 args.fwnode);  
> 
> Is this useful when creating the overlays? I tend to ask you to remove
> it one RFC phase is over. If it is useful, it should be at least
> dev_dbg?

Using dev_dbg could lead to issues. Indeed, dev is not given as an argument
of i2c_find_adapter_by_fwnode() and there is no reason to add it (except
for this debug message).

Without a dev given as argument we have to retrieve it from the given
fw_node argument. This given fw_node may have its dev field not already set.
Indeed, the dev instanciation could be done later when the bus this fw_node
is connected to will probe().

For instance
  https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/gpu/drm/panel/panel-simple.c#L606
The panel driver can call of_find_i2c_adapter_by_node() which in turn call
i2c_find_adapter_by_fwnode() without having the I2C controller related to the
adapter already present. the panel driver will return a legit EPROBE_DEFER.

So back to our debug message in i2c_find_adapter_by_fwnode(), either I keep
pr_debug() or I fully remove the message but I don't thing I should change
the i2c_find_adapter_by_fwnode() prototype and update all the callers just
for this debug message.

The debug message can be interesting when things went wrong and we want
to investigate potential issue with i2c-parent chain from the last device
up to the adapter.

I don't have a strong opinion about the need of this message and I can
simply remove it.

What is your preference ?

Best regards,
Hervé

