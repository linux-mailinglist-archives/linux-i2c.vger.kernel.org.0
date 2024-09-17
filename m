Return-Path: <linux-i2c+bounces-6825-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E42F097B1A7
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 16:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 733E8B25C3B
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 14:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C4717839C;
	Tue, 17 Sep 2024 14:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XGnm3fEP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201BD171099;
	Tue, 17 Sep 2024 14:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726584914; cv=none; b=kKgHC5FJvJ+fh+wT2e8MNC2caMt1L+Esvkmpg0mirMdUm1ny5fpnHH9m89vMx1mwep0p8kWraa6dRQV8Y4geuezHqap8OM0OIIxRVkmrQT0YZw45UG7xgvIUfNWH/JOOSPYfXVAWHswiXV0NVeMNENOZh4ZaG30ZcXR3iHZw0nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726584914; c=relaxed/simple;
	bh=MrM4KY5V6r6qQxEIXH+YdWmSsKXHfHiyt9kfZ0SpjDo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mj4ALCP2KPvwUy35bVKmiYoZozLrNpKX6mx2wRk5xmRgVhLZgATJuM4lKQylErQXiusaduCHWCXjZ74nqiooq0bykHwoAxF4pcPsmNDGqAvbxeFatgRg8j1lAJR2572lXysMlsM0tolO6YsRV252d7PlDCciEspg4ltWAv70PPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XGnm3fEP; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74DE520002;
	Tue, 17 Sep 2024 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726584902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y9y4PhvPPYKJA/AewGxCFBNSuD776TKUVC2KAG8adeQ=;
	b=XGnm3fEPbAKuxZk692s1diXeawdOArDgn4ol9Jc3J3gM8u3beWr6l6cxp+w4pLt74NPCo3
	yYnA+Oo1NnLB8OsA1kAltKs56qbbGdbFiMYwtg2GdtGhaXRx1GMScDwgt6NjzNUiwC5sWZ
	4gzvjAGOLoZ1Hcxnp97oVJacEkGoYgXYf6+dDrfoPCTzs2QXq2P8TEf5fJrfKICbGUlgbW
	hdVy0bJLVHvXHrsf4HYLiU+OQ3BcXJSzFfkQPdOe6xm9Qr6cXiA6YvPfgLcfDGXtykMtjI
	NgbZE1joQw+eyac8RKDZb4AT/gOW3VVU7HWPHwttZaiR7oZhoHidQlk2oX0tww==
Date: Tue, 17 Sep 2024 16:54:53 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, linux-fbdev@vger.kernel.org, Dragan Cvetic
 <dragan.cvetic@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Derek Kiernan
 <derek.kiernan@amd.com>, Maxime Ripard <mripard@kernel.org>, Robert Foss
 <rfoss@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jingoo
 Han <jingoohan1@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org, Paul
 Kocialkowski <contact@paulk.fr>, linux-i2c@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Saravana Kannan <saravanak@google.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Daniel Thompson
 <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 devicetree@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Herv=C3=A9?= Codina <herve.codina@bootlin.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Lee Jones <lee@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>
Subject: Re: [PATCH v4 1/8] dt-bindings: connector: add GE SUNH hotplug
 addon connector
Message-ID: <20240917165453.7aef4fda@booty>
In-Reply-To: <172656899099.2713363.6775764159513105143.robh@kernel.org>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
	<20240917-hotplug-drm-bridge-v4-1-bc4dfee61be6@bootlin.com>
	<172656899099.2713363.6775764159513105143.robh@kernel.org>
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

Hi,

On Tue, 17 Sep 2024 05:29:51 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.example.dtb: addon-connector: Unevaluated properties are not allowed ('powergood-gpios' was unexpected)

Ouch, a leftover from v3. Fixed queued for v5.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

