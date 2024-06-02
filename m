Return-Path: <linux-i2c+bounces-3744-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A68D7639
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2024 16:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F6621C2197F
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2024 14:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B5D4175A;
	Sun,  2 Jun 2024 14:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="0kucGJq/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45488B64B;
	Sun,  2 Jun 2024 14:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717338704; cv=none; b=EmjDFPHi6rw8AQBLp54J8/qCI0es5XuLi6eZ8K1RrYnZeuVUCXusrTfhUZGd11H3ZTpp5HUh8X994nOdmxtceuiRzlbEdFfTWjBtL2Fe7CK7dJ6P8pAlWFF7T2E3aa4gjMqRg+J5XYxVxG6vVJAwSlMP529mDMInVg2eOf2vM4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717338704; c=relaxed/simple;
	bh=CotbdNz9LHK9WkQCoFQqdqV3uDXLQoDBucayG0hD5MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8fc63TBmsoD2OUzedrwH9nPBC+VB4ykpas16UjICO6HDp8/AIkgMW1yvlKnzb5Siqe4gslhyRYaXZRfWHHq16kZvkhNAjg+GxbuuyLdWZLwZgBRfbnmAEclhy7+u2Tt5JlHo+5kiUIh7q1leVh35QuXe+V8+7G9kNzO3/hCR6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=0kucGJq/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RWGYwTysSvB1AzNEXTEGFJRM12Fxwodp6LFILw+wyVM=; b=0kucGJq/2zFxgbs7FdovI3m/Ll
	zpIf8Am8tEyQf0bBEC4b/ONEn+HRO5v/03B53Vtpg/CpaGoCUtIFF9MOQawlK2wVuOselEUlDvOpg
	II/vCIWvIBW04lULUZbw8wLLKiuxT+s6eHY9EQpNDcuOkeHmmod46dJTxqWNZ9DAG+1w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sDmF5-00Gc71-T9; Sun, 02 Jun 2024 16:31:27 +0200
Date: Sun, 2 Jun 2024 16:31:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
	andriy.shevchenko@linux.intel.com, u.kleine-koenig@pengutronix.de,
	marcelo.schmitt@analog.com, gnstark@salutedevices.com,
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [RFC PATCH] i2c: imx: avoid rescheduling when waiting for bus
 not busy
Message-ID: <f5d537e2-b102-415f-bc22-c949fd859344@lunn.ch>
References: <20240531142437.74831-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531142437.74831-1-eichest@gmail.com>

On Fri, May 31, 2024 at 04:24:37PM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> On our i.MX8M Mini based module we have an ADS1015 I2C ADC connected to
> the I2C bus. The ADS1015 I2C ADC will timeout after 25ms when the I2C
> bus is idle. The imx i2c driver will call schedule when waiting for the
> bus to become idle after switching to master mode. When the i2c
> controller switches to master mode it pulls SCL and SDA low, if the
> ADS1015 I2C ADC sees this for more than 25 ms without seeing SCL
> clocking, it will timeout and ignore all signals until the next start
> condition occurs (SCL and SDA low).

Does the I2C specification say anything about this behaviour, or is it
specific to this device?

> This rfc tries to solve the problem by using a udelay for the first 10
> ms before calling schedule. This reduces the chance that we will
> reschedule. However, it is still theoretically possible for the problem
> to occur. To properly solve the problem, we would also need to disable
> interrupts during the transfer.
> 
> After some internal discussion, we see three possible solutions:
> 1. Use udelay as shown in this rfc and also disable the interrupts
>    during the transfer. This would solve the problem but disable the
>    interrupts. Also, we would have to re-enable the interrupts if the
>    timeout is longer than 1ms (TBD).
> 2. We use a retry mechanism in the ti-ads1015 driver. When we see a
>    timeout, we try again.
> 3. We use the suggested solution and accept that there is an edge case
>    where the timeout can happen.

2. has the advantage you fix it for any system with this device, not
just those using an IMX. Once question would be, is such a retry safe
in all conditions. Does the timeout happen before any non idempotent
operation is performed?

If the I2C specification allows this behaviour, maybe a more generic
solution is needed, since it could affect more devices?

	Andrew

