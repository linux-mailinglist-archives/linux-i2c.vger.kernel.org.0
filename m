Return-Path: <linux-i2c+bounces-10624-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12819A9C6E0
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Apr 2025 13:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 127B79C2D5C
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Apr 2025 11:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FDE242D79;
	Fri, 25 Apr 2025 11:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzfPp44h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E21183CC3;
	Fri, 25 Apr 2025 11:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579634; cv=none; b=P/xzN8flQ+1xwYUZxOvHfnRzrQyJKWMdpWo7ALqvWoDeL+XnJExRC9Q2vgxTW/kIoz0Dth3srfQMCgcAb346ocYBVYAaZH6K/AmW67lDPrq64AKGuZiRfVpzkPxOpifDtuHYnxcLkcxq2WvcQe8ZxzWYtQ7Z9qlh4+dos7ViqyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579634; c=relaxed/simple;
	bh=Ezqd4VS2tdUP8uwDrS78FIFfjyaT1c46Eo4Ie3SLLAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmXDvssfrCBJ67GUorV7XR5WaVsWEz7S/TH462lxmwgR9OaRPfiU6QhnHBfCUuMw133nsiof9McIggVcw7tp5i2rgA5YKPQwWLCr/t8l4+jrLFjf7DSs5z6ihONZlxaGD1SUrupdsZQlMtoD5JqdjuIjWISq+PIbrEaDO5TB3Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzfPp44h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF51C4CEE4;
	Fri, 25 Apr 2025 11:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745579634;
	bh=Ezqd4VS2tdUP8uwDrS78FIFfjyaT1c46Eo4Ie3SLLAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzfPp44hY80vim38LVUi0AJaVzHubxBfSYQh9zqjDYTgTQ+pEa7LzF82G6mkiZ0Wk
	 gHP6U4AFnQML6cW+mEhJ5YqqMn0Ql+q158Onv6pmYnXPJyufAHAnCMj+AQ4Iz7ZihQ
	 7HJSN9CKwHety5cLGSX4G5gxDwFP4BKNoBjPziAJDnUS4gstYvpoNjsXt+duZYlSnD
	 QUWk2MAcn5wdWKjkbA4o+a7mkCSAcc+ZokZs6XaWQmth9mMMSKmeD6CysTl2obgbEN
	 hSVcFqsPomfniiuL5nctH2FuCDX/zr7L7rxp8I9zhrcWMRkt9EvCnCb2uiI5oeUeS9
	 0jkh3Aoavf8Yw==
Date: Fri, 25 Apr 2025 13:13:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: a0282524688@gmail.com
Cc: lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v10 3/7] i2c: Add Nuvoton NCT6694 I2C support
Message-ID: <qalofwnbulbpzl7542l7756radnx5ks7pt6wsbsblyqayxcycl@rl4ety27l27t>
References: <20250423094058.1656204-1-tmyu0@nuvoton.com>
 <20250423094058.1656204-4-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423094058.1656204-4-tmyu0@nuvoton.com>

Hi,

On Wed, Apr 23, 2025 at 05:40:54PM +0800, a0282524688@gmail.com wrote:
> From: Ming Yu <tmyu0@nuvoton.com>
> 
> This driver supports I2C adapter functionality for NCT6694 MFD
> device based on USB interface.
> 
> Each I2C controller uses the default baudrate of 100kHz, which
> can be overridden via module parameters.
> 
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

