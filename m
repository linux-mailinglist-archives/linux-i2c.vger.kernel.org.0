Return-Path: <linux-i2c+bounces-12509-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C926B3B942
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Aug 2025 12:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F2C1166FD6
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Aug 2025 10:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C6830FC00;
	Fri, 29 Aug 2025 10:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="upOucZnx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB463101A7;
	Fri, 29 Aug 2025 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756464786; cv=none; b=RvPrLYZkAKcjlnFRpG4/S4nMKWk8BNlOo7yVXn0RkYcnMF/urVIzYX796ooa1ec+A6tEorrtkUfy7MPxDyf5jxz5T38r/N10lcHcXQuqOD5wjEV0CVcE738es7xwebJSMK5wKk2fPXNTi/q4mKTtU7i/d29CcpCU8eoAKpU/RYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756464786; c=relaxed/simple;
	bh=mfy+YuX2F4NtAR8pwTND/xpdBP0nizDaFodXwa419jM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X3dKy4m2TRYn/F+Z2p0lEhPMQVFW3PpzN/b8ykuU2VVjlgEs9VFi6hwUMti/SZoPPeuV2Vbi4JhLu7ekVKyYTIk/yw3CxvI6nGrGPHmQ6THolSL4+i6aigSj8tNzQekwSPVhBt+BT1qiP/2OuQCktHlAZGpOEi4z3nWfEwHWf4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=upOucZnx; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 23A9E4E40C39;
	Fri, 29 Aug 2025 10:53:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D33FE606B9;
	Fri, 29 Aug 2025 10:53:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F6DE1C22CEB8;
	Fri, 29 Aug 2025 12:52:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756464780; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/yZivrEaPavxvETAY4MYad6XxcQTsMFNQbbqh28IxHM=;
	b=upOucZnx2+ZWY2gIAJ/ExxOo9ufNMXfABewxDIa/FGZ8ExyjBdYg0C5syIxWldcQA3BYY4
	3Cg6E1AeybYmEsN81IxEIubyubR7LRc3MJnOWArICFGWFM2k3xqXasxlLmDEVvC7YfWeLY
	4Pr6qDUJ1ToPRV5zRoqq5nLpk73MT8OZZs5wQubXGfEbrIvSMb/vVaWUfCbziytHYYiftd
	9UwXdNf+B2G9p3tNw5eqk7oeXc35IJqwL+M5ok4q/Bl22Ui9l2HE9DAe/FyQcccjnnHMkd
	6KosUHcckb940gRxdTBhDa/3MBbhbrs8f6GX6go329p8VtZEFq8fCuQdCso0zg==
Date: Fri, 29 Aug 2025 12:52:38 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Rob Herring <robh@kernel.org>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Ayush Singh <ayush@beagleboard.org>, Andi
 Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 1/1] schemas: i2c: Introduce I2C bus extensions
Message-ID: <20250829125238.4117947f@bootlin.com>
In-Reply-To: <aK2-we94b-x2fgW_@shikoro>
References: <20250618082313.549140-1-herve.codina@bootlin.com>
	<20250618082313.549140-2-herve.codina@bootlin.com>
	<CAL_JsqJ=jmXVwjtNCjRpUKj02dnJEz4GHMX2wMRaWw=M+sZQ0w@mail.gmail.com>
	<20250808180746.6fa6a6f9@booty>
	<CAL_JsqLxsfpaaCvV3AcniMYxAYVir7ddL4umCNY3u-ggVTiZcg@mail.gmail.com>
	<aK2-we94b-x2fgW_@shikoro>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Wolfram,

On Tue, 26 Aug 2025 16:03:45 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Hi,
> 
> > > A different option is to only have the "i2c-parent" phandle in the
> > > extension node and nothing else in DT (no bidirectional link, no
> > > compatible string), without any full-tree searches.
> > >
> > > On the implementation side, the connector driver when probing would
> > > register the extension nodes at the I2C core, which would maintain a
> > > list of extension nodes. This is important when the connector probes
> > > first. Then when any adapter probes the core would iterate over the
> > > list to check whether the newly-probed adapter is pointed to by one of
> > > the registered bus extensions, and then start populating the devices on
> > > the matching bus extension(s).
> > >
> > > A lot of care would have to be put in the disconnection path and while
> > > removing any bus extension from the global list, which could race with
> > > the I2C core using the list itself. The drive core wouldn't do it for
> > > us for free.  
> > 
> > I'll defer to Wolfram on I2C core implementation...  
> 
> One input already before we dive into the unconference. I don't want to
> maintain the above solution, i.e. handling lists with sublte race issues
> which could be (and should be IMO) handled by the driver core anyhow.

Wolfram, could it be ok if this list is not global but related to the
adapter the extension belongs to?

If the list is really a nogo, registering extensions cannot be done and
so with:
 1) "i2c-parent" phandle and the compatible string "i2c-bus-extension" in
    the extension node.
 2) No registering extensions capabilities available

the only solution I see is to parse the full DT in order to find extension
nodes when we need to register adapter children (adapter probe() step).

A matching extension node will be a node where:
 1) compatible = "i2c-bus-extension"
 2) "i2c-parent" phandle points to the expected adapter.

Wolfram, is it a solution you can accept?

Best regards,
Hervé

