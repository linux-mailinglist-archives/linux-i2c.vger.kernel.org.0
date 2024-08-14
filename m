Return-Path: <linux-i2c+bounces-5387-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF932951D84
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 16:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7526F1F21C46
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 14:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515001B3F1F;
	Wed, 14 Aug 2024 14:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RwZwsCTY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BBB1B372E;
	Wed, 14 Aug 2024 14:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723646572; cv=none; b=AQMDye7jS2TBf3OlgWMbigCmIpMP+bQs6oTTb7el0Hfkq5JhPjOQVFEOsI0stts0Ji3FzNpS5ivrd0sZ6UMYn1XsV6YS29I3e6wUpIxyLpLMU6ksvA3v87TDgg/WM3aPNykRBSwXSC/b8eTuSM2a5pxrQ76TPOqFMpGpF2BmIt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723646572; c=relaxed/simple;
	bh=FUbY1SpMqbRXeMP/LZen1im+BDgUKZO9g5TId8g/DTU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BUZPH9UYqpAt6REOgRhNXupYq5CLhEFc9ddUWFV3ReyiPaqjBb3NGgdrGgNELQHVowqztTyE3vYC35ORmnDkxYGKAK0fE3Ty536UcUOvwDHQzsFDeNAkanQ6CzYb5Xh1JSvdZRFChx74Ogml+Ft2NX2xzQX+0NmKFhd1s8ra6EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RwZwsCTY; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9C711C0006;
	Wed, 14 Aug 2024 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723646568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mCe2Kac2K1pnqt6534QtxlYkCGpJDN6y+35zQbSjIf4=;
	b=RwZwsCTYIhhY66AzsCf/dIWofDh57t1TnYqLpP0zuRDkXUvGAjgmT/xFwvT8qxDhvS82P8
	Wh7KEWkuvwSt7oqIEnct+74WUjV818QqHvqS+FybWehsgeZt+5r3lP+qYJptRpOms/ENy5
	0hlxH7POiA+QjgixWJrak45FLVuI4SI0a9uB9CtI/45LvpXQypH1KAaGvfJUFK6+C+Lrjs
	0f9Idhlzg3/uTQYolP7HSzWzi2avLrdLa1/2513IhtsR00R13GhOLhATEteT9qKkHpcxPe
	L6Tft1OOp1Yy2fajeOTv8azmQk5d6xTQ9WFhYJ14BYjf27DH4Yzen9LoIdMKPA==
Date: Wed, 14 Aug 2024 16:42:44 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Derek Kiernan
 <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Paul Kocialkowski <contact@paulk.fr>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: connector: add GE SUNH hotplug
 addon connector
Message-ID: <20240814164244.25e9b3f4@booty>
In-Reply-To: <20240813151901.GA953664-robh@kernel.org>
References: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
	<20240809-hotplug-drm-bridge-v3-1-b4c178380bc9@bootlin.com>
	<20240813151901.GA953664-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Rob,

On Tue, 13 Aug 2024 09:19:01 -0600
Rob Herring <robh@kernel.org> wrote:

> On Fri, Aug 09, 2024 at 05:34:49PM +0200, Luca Ceresoli wrote:
> > Add bindings for the GE SUNH add-on connector. This is a physical,
> > hot-pluggable connector that allows to attach and detach at runtime an
> > add-on adding peripherals on non-discoverable busses.  
> 
> Overall, looks pretty good.

Thanks, I'm very glad it does.

> > +    maxItems: 1
> > +
> > +  nobus-devices:  
> 
> Just 'devices'.

Sure, simple enough.

> > +    description:
> > +      A container for devices not accessible via any data bus. Common use
> > +      cases include fixed and GPIO regulators, simple video panels and LED
> > +      or GPIO backlight devices. When not hot-pluggable, nodes such devices
> > +      are children of the root node.
> > +
> > +      This node should not be present in the connector description in the
> > +      base device tree. It should be added by overlays along with a subnode
> > +      per device.
> > +
> > +    type: object
> > +    additionalProperties: false  
> 
> The schema needs to work with the overlay applied too. 'true' is fine 
> here.

Does additionalProperties apply to nodes as well? No properties are
supposed to be added inside this node, only nodes, so I'm not sure what
to do about additionalProperties.

Queued all other changes for v4.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

