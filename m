Return-Path: <linux-i2c+bounces-9511-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303B0A3D994
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 13:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BBB37A6196
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Feb 2025 12:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504131F4E21;
	Thu, 20 Feb 2025 12:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M1EUOTwB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA1D1F4626;
	Thu, 20 Feb 2025 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740053588; cv=none; b=My21RlElZSssFkiPG4nMBTUmMLKxjrxMdckiLf9HbNbxXaoUKb4H3anNp4QdPjfY9a6cubnnIZz0n65RH0MKgrCt2Ye/xO0hP5m0OYob/FnP8KWOIus/5oGhX5X735aRW3bW/jqx4SfonSzl8FigxxagY1WD542gkbPuEDcJ2D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740053588; c=relaxed/simple;
	bh=F/ZhQptyqhlA1rUIjafEGjNVjIHdHZ613QjmYwbyorU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKtpgzz2ExpH4pBFRORTovlOwViGRPdqQpCB4N4e4ISNasWN3+OG50IBYrMfx1uxP/7hvA1tVba4pYnIswoWGRbRH9uTyUJ+DWrwyND7FV5c8/VMs8u1LAh3fz3dFknKIkJXxmq1pJ63fuc0+MVg3nIO53S9/sUAjL1UkAnC6tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M1EUOTwB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE504C4CED1;
	Thu, 20 Feb 2025 12:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740053587;
	bh=F/ZhQptyqhlA1rUIjafEGjNVjIHdHZ613QjmYwbyorU=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=M1EUOTwBvT5J3sVQKbSteoOHUc7tnfah3gfKK7ulq2DVmbGjK4OJ8DpHVSuWDzNDU
	 xabfsuWAuPG7wNyj69S08HXtJRLUYEoXKqSdAdblbrtPB8DeNQeo6Np47FZFVMx3SJ
	 c/sp7HIRrrv0CIilOs9R92lLD+HobkohAUeFsrC0=
Date: Thu, 20 Feb 2025 13:13:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 9/9] misc: add FPC202 dual port controller driver
Message-ID: <2025022049-shrink-worrisome-2872@gregkh>
References: <20250204-fpc202-v7-0-78b4b8a35cf1@bootlin.com>
 <20250204-fpc202-v7-9-78b4b8a35cf1@bootlin.com>
 <2025022038-hangnail-rehab-c145@gregkh>
 <Z7cbX5jX3NL4C2GR@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7cbX5jX3NL4C2GR@shikoro>

On Thu, Feb 20, 2025 at 01:09:03PM +0100, Wolfram Sang wrote:
> 
> > as this is a i2c_driver, why isn't it in drivers/i2c/ somewhere?  Why
> > misc?
> 
> Because drivers/i2c is only for I2C controllers and this is not a
> controller. Other address translators also reside in their respective
> subsystem, e.g. media for GMSL (de-)serializers. I don't know this chip,
> maybe it has no "respective" subsystem and, thus, misc?

Ok, but that should be explained in the changelog please :)

thanks,

greg k-h

