Return-Path: <linux-i2c+bounces-11770-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4EAF5E4B
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 18:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C01D172D04
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 16:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6212FC3B2;
	Wed,  2 Jul 2025 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVcxABRO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695E7277CBE;
	Wed,  2 Jul 2025 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472921; cv=none; b=IqC37vJ+90fQIImmHeUPotgDwQAS+11sEyUgVyioSoVb//hLHgoze0/FTINyakQCanPddMNiAmzOsUeWmALkjh5Ht4JsByrnMShV81CcQUiGnkwzK8qh6Fp+cDld1PW8pw/mTbyaYOxs4itgWvMZKaV1oonpIIdN3lYFeO9zkL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472921; c=relaxed/simple;
	bh=Dljx2pfv9tt3uWe2/+5aVkyMUH3mjviIfFBiB+ou/sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLQ6WLW5me1SjyexrRHq6V4aDy+Z9wAhAIUPApoTb5bkC0ZKP4jbf56uxVsMsraqdHtfp0a5eRtzyKzoHBlUQ/p7/AiPCcvlIeIEV2TLeO+d0SjxGUS1j4EZziFa3YumYh6AdwZMp/nRrpnEzjEjDIDtZr9oV0lKh6xL+yCHkAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVcxABRO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B96C4CEE7;
	Wed,  2 Jul 2025 16:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751472921;
	bh=Dljx2pfv9tt3uWe2/+5aVkyMUH3mjviIfFBiB+ou/sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVcxABROauwkgiYFUK0hdy9hZPLhJElp0zPaIeWC/pycblt4/HAe/R7bCshYRi/tX
	 Ko1bKhstV4slOuSRrCq+mZFygsUjSpy+HOTgPqy6A1NxBr1mPBTyucBadkTX1meNh1
	 CF2uJAr2Na0WvKxdOKQeOIwnKEfVrom45NDWTOdrfVaZvrkM6d4XNSaNSMbAF5YhJM
	 P8GyhluFKfuIuhpX5LlzgsEVGFXiT7srQiQER+0i6L9Tpdq6vTz43fffS1HIS8pvtS
	 ZGf36NeRKjHSgYVC47jy7wZdJJQnS1bq/xPkg3nECNGLTuWnt9ylSZ6+sf+QXF0P+p
	 Nl8Vrzvv4AW8w==
Date: Wed, 2 Jul 2025 17:15:13 +0100
From: Lee Jones <lee@kernel.org>
To: a0282524688@gmail.com
Cc: tmyu0@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl,
	andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v13 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250702161513.GX10134@google.com>
References: <20250627102730.71222-1-a0282524688@gmail.com>
 <20250627102730.71222-2-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627102730.71222-2-a0282524688@gmail.com>

On Fri, 27 Jun 2025, a0282524688@gmail.com wrote:

> From: Ming Yu <a0282524688@gmail.com>
> 
> The Nuvoton NCT6694 provides an USB interface to the host to
> access its features.
> 
> Sub-devices can use the USB functions nct6694_read_msg() and
> nct6694_write_msg() to issue a command. They can also request
> interrupt that will be called when the USB device receives its
> interrupt pipe.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

This looks okay now.

Do you have all of the other Acks?  If not, please let me know when you do?

-- 
Lee Jones [李琼斯]

