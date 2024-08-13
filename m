Return-Path: <linux-i2c+bounces-5330-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 959CC9500DC
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 11:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FEAC1F21CF5
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 09:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C034D17D8A6;
	Tue, 13 Aug 2024 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YZPOp+Cy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B1F16DEA9;
	Tue, 13 Aug 2024 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723540035; cv=none; b=GSeuWCWZubZC8trEmhTS2RVMS84JHhKaV1zZ8jetNNH3E8EuxkVjXwWt37sq83scEuTbQE6Hauhkhs9xm+K5nsi01YlQg1ydD0iaxpxQZ/yh/9iCl7BXmRly+QDQiK4zcXlosR6pjG3gAXoAXzoPDk1eNYBTLxDepxES9BmDpzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723540035; c=relaxed/simple;
	bh=MhUR2OtEH7deQ3ME11VZl5HWuFTUQGCj7IYjEBrbMgo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TRe/daXbKpeNltCeiclCLEn1s3nKCC/BBN0bYbJELLUXCHcmvtXtU9TnKkIdOvHqp4izvdd47cgHj9hgLbFgUodelkLs6gHXPkq+6Vsw9oQLm+wSfYG+XGmiG+h0kZiMHK/MInoufiaBNXCRxOcdMMo9CtMhi9Ha5ctl048OEW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YZPOp+Cy; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EFD71C0003;
	Tue, 13 Aug 2024 09:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723540025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LuigKssXYiPCEK+V39HggWwcnvNgqn3KueYYJ6PbxGQ=;
	b=YZPOp+CykyQGKIQivmGaH1s94KMe4kQsroHSg2DMg1QzYxPPFCtGrzmcy/NPVmlwc+JLm+
	QBfZiuXK5wp9wocsq/PmUBY5BXSlHr9SKWNe0Lt5ylrJWhFYrLFFpHnE3kBv30gnWtApfa
	gCh0hqzV6qTpCNQluwzKtWm/krKcBKwY/LPD/vVyAdG+MWOiyThyjuaholGs+1bYA6u1hS
	r/BgXMxVnjLADPYxXahdWg628mMIJIjnTZodHt/WJfFVIghKTiuxidM8Bpg0on0n2/Y+Um
	7IQYZbFfzvs9ZIgocR1XRFLbcOLBHHYJ2BfQQk+p5Qzz3elwXDSWlxBW1rylTQ==
Date: Tue, 13 Aug 2024 11:06:59 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan
 <saravanak@google.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Paul Kocialkowski <contact@paulk.fr>, =?UTF-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: connector: add GE SUNH hotplug
 addon connector
Message-ID: <20240813110659.65f2ab72@booty>
In-Reply-To: <20240809-hotplug-drm-bridge-v3-1-b4c178380bc9@bootlin.com>
References: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
	<20240809-hotplug-drm-bridge-v3-1-b4c178380bc9@bootlin.com>
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

Hello,

On Fri, 09 Aug 2024 17:34:49 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Add bindings for the GE SUNH add-on connector. This is a physical,
> hot-pluggable connector that allows to attach and detach at runtime an
> add-on adding peripherals on non-discoverable busses.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

...

> +examples:
> +  # This is the description of the connector as it should appear in the
> +  # main DTS describing the "main" board up to the connector.

The comment from now on has outdated content referring to v2 and which I
forgot to remove before sending v3:

>      This is
> +  # supposed to be used together with the overlays in the two following
> +  # examples. The addon_connector and hotplug_conn_dsi_out labels are
> +  # referenced by the overlays in those examples.

Fixed locally.

> +  - |
> +    / {
> +        #include <dt-bindings/gpio/gpio.h>

I also removed the root node which is not needed and cause bot warnings,
and with that done the #include went back to a correct position.

The above are queued for v4.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

