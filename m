Return-Path: <linux-i2c+bounces-8488-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD9A9F0AFB
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 12:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9C11188B6FD
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 11:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF211DED70;
	Fri, 13 Dec 2024 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RDUSqa2f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7292187325;
	Fri, 13 Dec 2024 11:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089316; cv=none; b=Ec+S4jCISU1Ovn0UuE9DOCCXSwK1G98tlq4AlzGEIpLFYIkCGEMj4uAvNN2CK+twGkWYTanqHjlrE4zNlOVcLJTRdDseekJcdZZ8T0ap4E3WQ6x7ugupSq4zMVe8+gOAYpbWtELk7ozfmiT+R8LMHbu7DoBs1+mVpf2Fa4J92L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089316; c=relaxed/simple;
	bh=jbyZf0Tgv/RU1fdlBR7iKCTSnMRGD5EA5b3AgB6Qb2I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aqsCBRo0LRgEIm65XLlLixLxKzQEFrACMe7A5By2hp5S8j2Nb2eir89KxOUyb01p4ReZ3uuvogqtGuTn05XXnMD1fVyUNuldZ9GI4J+ieF1nOCQEzGpbhbQCPcPne5DRUwgJCqe0KJICdFt7sFDydXTdcuT/9olrCsA1viyD6DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RDUSqa2f; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10CE5C0006;
	Fri, 13 Dec 2024 11:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734089311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5fFG4vE+vkwACpIop1Zpb8KlDP1HSG6Jo6PWR1GFGM=;
	b=RDUSqa2ff8PZtcbs78wVV5g6G6GweSxEeW37gg/ZzBhEtIEAH1xQAiQbBrxVCFDHQ3SS3t
	auF2eEcz/EtZGAMdYeeSYNEgDrXJAQroWXbFHOPnY1VrSCiyXbUhcIWiIFGlRKTs0qPGeY
	9W9MUdHzEFiXwMRf+MBSogMMDPrSbpXw3VsrHIqd3HCNFcd5JJLrfzL90ImhuSCQbBP90S
	R+pNLq58KKjFQUOm16EjlrsQu32tVuMoJZvqb6qeDCkVecBiFhWmr+NERpKXwOTquXho9l
	BbFcTYVSYse9QBTygwZHtipwZ2348CwcqvfyGJZhhEII6culDLHEPFBqW1/Ckw==
Date: Fri, 13 Dec 2024 12:28:26 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "rafael@kernel.org" <rafael@kernel.org>, "jingoohan1@gmail.com"
 <jingoohan1@gmail.com>, "robh@kernel.org" <robh@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "daniel.thompson@linaro.org"
 <daniel.thompson@linaro.org>, "wsa+renesas@sang-engineering.com"
 <wsa+renesas@sang-engineering.com>, "lee@kernel.org" <lee@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "saravanak@google.com"
 <saravanak@google.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "dragan.cvetic@amd.com" <dragan.cvetic@amd.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "derek.kiernan@amd.com" <derek.kiernan@amd.com>, "deller@gmx.de"
 <deller@gmx.de>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "contact@paulk.fr" <contact@paulk.fr>, "herve.codina@bootlin.com"
 <herve.codina@bootlin.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "paul.kocialkowski@bootlin.com"
 <paul.kocialkowski@bootlin.com>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v4 5/8] i2c: i2c-core-of: follow i2c-parent phandle to
 probe devices from added nodes
Message-ID: <20241213122826.1c01a284@booty>
In-Reply-To: <ad1b0f8a662d748580bef83b6f7d8d24d80bd46c.camel@siemens.com>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
	<20240917-hotplug-drm-bridge-v4-5-bc4dfee61be6@bootlin.com>
	<ad1b0f8a662d748580bef83b6f7d8d24d80bd46c.camel@siemens.com>
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

Hello Alexander,

On Thu, 12 Dec 2024 19:12:02 +0000
"Sverdlin, Alexander" <alexander.sverdlin@siemens.com> wrote:

> Hi Luca!
> 
> On Tue, 2024-09-17 at 10:53 +0200, Luca Ceresoli wrote:
> > When device tree nodes are added, the I2C core tries to probe client
> > devices based on the classic DT structure:
> > 
> >   i2c@abcd0000 {
> >       some-client@42 { compatible = "xyz,blah"; ... };
> >   };
> > 
> > However for hotplug connectors described via device tree overlays there is
> > additional level of indirection, which is needed to decouple the overlay
> > and the base tree:
> > 
> >   --- base device tree ---
> > 
> >   i2c1: i2c@abcd0000 { compatible = "xyz,i2c-ctrl"; ... };
> >   i2c5: i2c@cafe0000 { compatible = "xyz,i2c-ctrl"; ... };
> > 
> >   connector {
> >       i2c-ctrl {
> >           i2c-parent = <&i2c1>;
> >           #address-cells = <1>;
> >           #size-cells = <0>;
> >       };
> > 
> >       i2c-sensors {
> >           i2c-parent = <&i2c5>;
> >           #address-cells = <1>;
> >           #size-cells = <0>;
> >       };
> >   };
> > 
> >   --- device tree overlay ---
> > 
> >   ...
> >   // This node will overlay on the i2c-ctrl node of the base tree  
> 
> Why don't you overlay it right over &i2c1?
> It should have worked since commit ea7513bbc041
> ("i2c/of: Add OF_RECONFIG notifier handler").
> Doesn't it work for your use-case?

One reason is decoupling the base board and addon. A different base
board may wire the same connector pins to 'i2c4' instead of 'i2c1'. We
want a single overlay to describe the addon, independently of the base
board, so it has to mention only connector pins, not base board
hardware.

Another reason is that using phandles to labels in the base tree in the
overlay (such as &i2c1) would need properties added by the __symbols__
node, and overlays adding properties to nodes in the live tree are not
welcome. This is both for a conceptual reason (adding an overlay ==
adding hardware and not _changing_ hardware, so adding nodes should be
enough) and an implementation one (properties added to nodes in the
live tree become deadprops and thus leak memory.

This topic was discussed at the latest Linux Plumbers Conference last
September. Slides and video of the discussion are available here:
https://lpc.events/event/18/contributions/1696/

More info are in the cover letter. Discussion leading to this
implementation started after v2:
https://lore.kernel.org/all/20240510163625.GA336987-robh@kernel.org/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

