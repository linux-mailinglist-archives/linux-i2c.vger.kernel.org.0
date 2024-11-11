Return-Path: <linux-i2c+bounces-7915-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E3F9C3A4A
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 09:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B81D1C216D6
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 08:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD54316DED2;
	Mon, 11 Nov 2024 08:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iNgfJzXE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAACA158520;
	Mon, 11 Nov 2024 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731315431; cv=none; b=ufbb7aGLpHIEL4vRjPc5POJtpiN0qIxDil4AZjDm3vgPDO3haExTYrRGk1YHyKQAVRkDAVe8bjhsmNTjV8tkT9imhLseQSaxJHkeTK9rZWbKyWG585xVfwobcKH0S7+K0jo2sdYFV3etQEiiL9dVNyNAM1510GiONY+Xpbqs98w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731315431; c=relaxed/simple;
	bh=z9dw0l5UOapbVYHtSh0YgsOlSd/jG78r3YeG/pb3Lk0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTLdOYeW8lT6+wGi/ln3G1wTbQJVbW1Ak5Kx2H2ASTk/jQpR1bsROGB1agShWpJGsp29pyDIr6UR35KEgyD6pIoyLCUiwVBZs3W5oXeWb+GGxWqtzMRE0s1FWC/6r6J7OuleYtsNVtMiXf2BuYl8HQIESLIJVut43llUlkMdwek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iNgfJzXE; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 0587EC179C;
	Mon, 11 Nov 2024 08:57:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B47F040002;
	Mon, 11 Nov 2024 08:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731315418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yy2JIrNqCiMMLqKNKg3du/73cbqDyGd8eMn3yWuGcqA=;
	b=iNgfJzXE70TZMmGXMZxfw6FJgi3PWa2J6ZbOYt1PbRqyEC5X3M3iLXUS8TkzVf1ILCY25U
	aIMJ8zMPIdrY/4DiaTdJ4jZ5pnWPjToktGVdO1aYN1ElTaVFEtgsJsu3uZhKMWRyRAbz5J
	L00X9U6EOOU6NngBiE97TR4Rd3/3YdeE81Dd48vgDICmiPLnbHzhK4CXRz7KUzJrB+l7os
	D/wziWaulMz6C2D2MbI4ulCQZNt/YgRXvoCBpil7HRwVHfguUrmcij2jn44iGPBPBufLWQ
	Yeeax7ymMcRAABlPqHikcmyaOf2Q3wEjYg6T0uAkOPEJ2BT3+DRWIm2hQXL8ng==
Date: Mon, 11 Nov 2024 09:56:55 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: Romain Gantois <romain.gantois@bootlin.com>, Wolfram Sang
 <wsa-dev@sang-engineering.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Andi Shyti <andi.shyti@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan
 Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Kory Maincent <kory.maincent@bootlin.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 9/9] misc: add FPC202 dual port controller driver
Message-ID: <20241111095655.2c77df7d@booty>
In-Reply-To: <202411100412.QeOt1w0W-lkp@intel.com>
References: <20241108-fpc202-v1-9-fe42c698bc92@bootlin.com>
	<202411100412.QeOt1w0W-lkp@intel.com>
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

On Sun, 10 Nov 2024 04:19:43 +0800
kernel test robot <lkp@intel.com> wrote:

> >> drivers/misc/ti_fpc202.c:270:20: sparse: sparse: symbol 'fpc202_atr_ops' was not declared. Should it be static?

And perhaps 'const' too.
  
> vim +/fpc202_atr_ops +270 drivers/misc/ti_fpc202.c
> 
>    269	
>  > 270	struct i2c_atr_ops fpc202_atr_ops = {  
>    271		.attach_addr = fpc202_attach_addr,
>    272		.detach_addr = fpc202_detach_addr,
>    273	};
>    274	
> 

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

