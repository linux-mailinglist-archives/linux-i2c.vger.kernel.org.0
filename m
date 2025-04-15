Return-Path: <linux-i2c+bounces-10350-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7A6A8A08C
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 16:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 972427A68CF
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 14:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A791A2C25;
	Tue, 15 Apr 2025 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nWBeVFpW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DAD1A5B96;
	Tue, 15 Apr 2025 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725848; cv=none; b=QHXg3z0MCl8GZkA/NIj2MPLmxi2yPm0UzW6as3ZlfskemSbO5wnxkHLFEvwgLCpStwm3Fj5t0rNW+1moiQuUkaOY4WEIhhBuBk8sflm+6c3A2apXcoaeFpr6bGK5RflBMyT7Xwon40cwp7AJJKPFRwf0rpN6TERmP912IuSpFS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725848; c=relaxed/simple;
	bh=/BkJTTqWOsrC8wFfEl9MAnLF1FNN03g65UG+8JdMtl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FeHZ3Z7yFCQ47GS93cXFz8mFL4+0vWi5tr8ZocTQvMvGVEYKGzrV7wTOCiVCOd/c33j501tE+HecVBEAMj6JUz7vMDJosVZMt7zONLYD4OPSdvd6L0QF1FAsHV4X6fSE+eZzb0qgrKrO0DujJzPMgM/B41Qoiy+0V1uN2e83AsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nWBeVFpW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E56FC4CEDD;
	Tue, 15 Apr 2025 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744725846;
	bh=/BkJTTqWOsrC8wFfEl9MAnLF1FNN03g65UG+8JdMtl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nWBeVFpWAU+mHkDYNdLOJC6rkeYDP3UbrrrcQU1cg1YAbw7cw9cVSw9R7/f+soIMy
	 BZgk66exVj4rRZzuauW6M9VJKfHtsb6kpZFme5fqRt5ByE0fH/3E0ERigQocisTA1K
	 z8qiy/Tcn4BiATsYYaU+LELkLywyD3aZwRdimZdc=
Date: Tue, 15 Apr 2025 16:04:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
	Cosmin Tanislav <demonsingur@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v9 9/9] misc: add FPC202 dual port controller driver
Message-ID: <2025041556-savage-wooing-b784@gregkh>
References: <20250306-fpc202-v9-0-2779af6780f6@bootlin.com>
 <20250306-fpc202-v9-9-2779af6780f6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-fpc202-v9-9-2779af6780f6@bootlin.com>

On Thu, Mar 06, 2025 at 05:23:30PM +0100, Romain Gantois wrote:
> The TI FPC202 dual port controller serves as a low-speed signal aggregator
> for common port types such as SFP, QSFP, Mini-SAS HD, and others.
> 
> It aggregates GPIO and I2C signals across two downstream ports, acting as
> both a GPIO controller and an I2C address translator for up to two logical
> devices per port.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

