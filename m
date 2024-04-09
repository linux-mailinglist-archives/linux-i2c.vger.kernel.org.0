Return-Path: <linux-i2c+bounces-2842-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 645F289D9BB
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Apr 2024 15:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 957651C23B95
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Apr 2024 13:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CB612EBD3;
	Tue,  9 Apr 2024 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="loSgntWi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3359F12DDAC;
	Tue,  9 Apr 2024 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712667775; cv=none; b=j3TBkfdZ/noLwTGXbeve/Ab9kiwQGvPVee1FIwFYD9uSA/nKl8Z8idIOti+ZGzSkx5DtiunrBpBYMe2z+NNq6xOUhtoPptJQcC57ZKaghT9KRyMSFHYLPnKXqwlvgXh0Hs+q6d+Jq0ty5FslnNw7pNpnLtAwU7p4Py2mBVpwLLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712667775; c=relaxed/simple;
	bh=rwIEVgFMh+WGvCOOvQuvcOWk36BBF9LkMcniS2KN8gc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CbK66quHe9lxBgT4a+q3AnG+txzqsCemBUKdyrRpBqhE8hvd4lvNO+OIGJAoF8VskFEKuZuTUVVMJOjfKQaAjhtqjvYoLFqHdqfJ8pGWKJh1Ef62ka98kxxAcCyCoOkKoKKx4M48A26DJ+4G1+mC+EfyLJLH8u3HvyV0ZPWPitc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=loSgntWi; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6C9A1BF20B;
	Tue,  9 Apr 2024 13:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712667769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wI/ZpIDI4NGUd3RjmILBW90z5/l8hvyrNiX1+M7d6jM=;
	b=loSgntWi/p8LDx+CItEXw9eZ9yKjA3dHlUt6vvAPae1dNvyseT60JyRuR0GoQwwvGhFVxu
	hszgjiOJcEPgZonTelWNkeo+Eneh8dvuOt0Xi9kK7EGq/21w83hewARDMQLbCrpVbAV48Q
	urStA675ou8KRt39gZi/mcaMIy90sOURv27Uoop0LcTGYegjV2xDULD9XP4sbwN0IrNukZ
	t0XX/tj6g49hVPRxoeCTmA5ZvV4gfc5nnMIUHlszl3gG0bVcRgHfXEeh66ujA1BO4GtMZ+
	M+jqgzSYgnGpYel//eqUluL26G/7bd6q3O5teGGbmsRTlFe1ZS2iVPP8HMh6PQ==
Date: Tue, 9 Apr 2024 15:02:47 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring
 <robh@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 0/2] fw_devlink overlay fix
Message-ID: <20240409150247.61e30a86@bootlin.com>
In-Reply-To: <20240409053704.428336-1-saravanak@google.com>
References: <20240409053704.428336-1-saravanak@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Saravana,

+CC Luca and Thomas

On Mon,  8 Apr 2024 22:37:01 -0700
Saravana Kannan <saravanak@google.com> wrote:

> Don't bother reviewing this patch. It needs to be tested and possibly
> refactored first.
> 
> Geert and Herve,
> 
> This patch serious should hopefully fix both of your use cases
> [1][2][3]. Can you please check to make sure the device links created
> to/from the overlay devices are to/from the right ones?
> 
> I've only compile tested it. If I made some obvious mistake, feel free
> to fix it and give it a shot.
> 
> Cc: Rob Herring <robh@kernel.org>
> 
> [1] - https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
> [2] - https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> [3] - https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> 

I tested your patches.

Concerning my use cases, they fix the issue described in
  https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/

But not the one described in
  https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
A link is still present between the i2c@600 and the PCI device.
instead of the i2c@600 and the pci-ep-bus.

Adding the patch clearing the FWNODE_FLAG_NOT_DEVICE in device_add() available
at [1] on top of your patches fixes the link issue.
With this additional patch applied, the link is present between the i2c@600
and the pci-ep-bus.

[1] https://lore.kernel.org/lkml/20240220111044.133776-2-herve.codina@bootlin.com/

Best regards,
Hervé

