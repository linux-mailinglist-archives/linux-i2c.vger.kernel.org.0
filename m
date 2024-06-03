Return-Path: <linux-i2c+bounces-3749-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D30EC8D7CAA
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 09:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8506528111B
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 07:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F70495CC;
	Mon,  3 Jun 2024 07:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5CisiQy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54C647A4C;
	Mon,  3 Jun 2024 07:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717400623; cv=none; b=OHPnB0Bn3CdZsnp7hz9bBJ4HuS20B9Ctp43vVmDmadb4LgTIUWcgWiW/5encBgi1klPj4to3FBgSd79XMy38S5hh7IWVOAi2sI62QgDBFESGtEscEU2G+9fepiYvDuwUyXHVXb2X8/0JGXlGoUbULypnR3CrdCwEgGBA0lRVhTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717400623; c=relaxed/simple;
	bh=m1D/sHfPfHRZFlkY+CEB8mS07gtrCM2m0LDbYaEiwPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7hoZzSJNgkWzLOHLw5PdbgfY1OZ7LYzoF1ZDMTQZQDkwb3LpgTwRTNFmEFl03v/eutuk6nDFWmgjyy44i1wCBX+JGw5OfzPjFOn+0tWz5m6lR92f51ij1UDbX3wY6g3RPrzjhKPnEpgtLq2E4o/oHt12rAA5SI0/zeyLneBPNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5CisiQy; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35dc9cef36dso3226587f8f.3;
        Mon, 03 Jun 2024 00:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717400619; x=1718005419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9+3KpBVqTTJeo965A1KR/YlsEUxQQiOfIdsh4+kRbIs=;
        b=d5CisiQyz5aEuNDdgQYZxzAdrMN7b+Je01hVu17jqWlO/zqC8yKbzff4ySJc4Rb1B/
         BFlUHb7i3bB97TWz3QhDnvA1cvvOWHZBiH/xHeLbojpBW3p+CE2CqDjz1JL0G+H4cjgk
         77HpLgi2EgUrtCyjf3pfFKPysmpCTlnv0pP8zApuVTr5Z6yLeeLra5KsvbQpT5oVJ4If
         s2GyacdrzUGFMtoAETThS/ml1hK1QXK5I4H5Bf9VNtWUfq85rrinXAerjKDh7JW0Posz
         x5cYR3y9bzVDkhcjtk4abC01CTApxnFNMGZleUPMLDoW2e1xRwTYJFGU6cm3tJuO34+n
         pwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717400619; x=1718005419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+3KpBVqTTJeo965A1KR/YlsEUxQQiOfIdsh4+kRbIs=;
        b=UXKWbyVHZVB2uY+KH+qkkTn21Yg0o/lf8SDbIt1E583e+5z+a2taDDA3q5YWeHSJMB
         DRv3M38U1ep/vanSZQTV+ODNHV+Rwf/A3lZsITSvRl33wtwW2n44uHVaff74A+sgtZ6F
         sDsNr3egT46I1IbG/EDqmyCo0A/IlFw3amovbBrPswmmLRatyGQUJ1shfi/L4f9paihK
         fy+YyCqbEuip4u4iGD2DLVJn8TM3BPEWxTtkqTvT8dWpN4ojTc6KNU4J2aYF2roU0K0L
         OU0gg4gkYZ8hNdSx5JZwDQrahf7WkPy53CxuksHpXqpYnlvDLHBqriITqfDjobs3QZz0
         vNWw==
X-Forwarded-Encrypted: i=1; AJvYcCVN+EXTg9sUZWcvgRizGPiGQGoT44Cx5OZnbs+ebUIRCzjimlJHwi6QlKlVPHB8VXGA2Y0uNbeSJa6pnhp2u2CIbLuFnr+leG/ByNxL6MPRHbHZ1EnnAnpv87aFwBrs6l9CL/1SyWpvLaK8lf22W9yYFjOTDjvipt09OD7pxMh1VNQc
X-Gm-Message-State: AOJu0YzIzujgGJkOHZ8QUVOsUDn30D3UK6sYrPZsR+zTnyff3I5bzoCh
	PuW/hVAn/jlbgH8Head7rPqEp+4KT38rcR25Fcho7gN7CpBzr+7f
X-Google-Smtp-Source: AGHT+IEanqGnQyE0VRVI9jQex6bQ4+XQs3Oue5+MhhMZ/CjI0wOwj0rSpqUdBr/gjbzmQgzPke+uJA==
X-Received: by 2002:a05:6000:1944:b0:34c:cca6:3d18 with SMTP id ffacd0b85a97d-35e0f333b6emr5523593f8f.68.1717400619152;
        Mon, 03 Jun 2024 00:43:39 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:2b03:375:843f:be9d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd062ea66sm7981749f8f.78.2024.06.03.00.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 00:43:37 -0700 (PDT)
Date: Mon, 3 Jun 2024 09:43:35 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
	u.kleine-koenig@pengutronix.de, marcelo.schmitt@analog.com,
	gnstark@salutedevices.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [RFC PATCH] i2c: imx: avoid rescheduling when waiting for bus
 not busy
Message-ID: <Zl10J9H+8k0KXAPR@eichest-laptop>
References: <20240531142437.74831-1-eichest@gmail.com>
 <Zlnidi62gEWwdQ3U@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zlnidi62gEWwdQ3U@smile.fi.intel.com>

On Fri, May 31, 2024 at 05:45:10PM +0300, Andy Shevchenko wrote:
> On Fri, May 31, 2024 at 04:24:37PM +0200, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > On our i.MX8M Mini based module we have an ADS1015 I2C ADC connected to
> > the I2C bus. The ADS1015 I2C ADC will timeout after 25ms when the I2C
> > bus is idle. The imx i2c driver will call schedule when waiting for the
> > bus to become idle after switching to master mode. When the i2c
> > controller switches to master mode it pulls SCL and SDA low, if the
> > ADS1015 I2C ADC sees this for more than 25 ms without seeing SCL
> > clocking, it will timeout and ignore all signals until the next start
> > condition occurs (SCL and SDA low). This can occur when the system load
> > is high and schedule returns after more than 25 ms.
> > 
> > This rfc tries to solve the problem by using a udelay for the first 10
> > ms before calling schedule. This reduces the chance that we will
> > reschedule. However, it is still theoretically possible for the problem
> > to occur. To properly solve the problem, we would also need to disable
> > interrupts during the transfer.
> > 
> > After some internal discussion, we see three possible solutions:
> > 1. Use udelay as shown in this rfc and also disable the interrupts
> >    during the transfer. This would solve the problem but disable the
> >    interrupts. Also, we would have to re-enable the interrupts if the
> >    timeout is longer than 1ms (TBD).
> > 2. We use a retry mechanism in the ti-ads1015 driver. When we see a
> >    timeout, we try again.
> > 3. We use the suggested solution and accept that there is an edge case
> >    where the timeout can happen.
> > 
> > There may be a better way to do this, which is why this is an RFC.
> 
> ...
> 
> > +			/*
> > +			 * Avoid rescheduling in the first 10 ms to avoid
> > +			 * timeouts for SMBus like devices
> > +			 */
> > +			if (time_before(jiffies, orig_jiffies + msecs_to_jiffies(10)))
> > +				udelay(10);
> > +			else
> > +				schedule();
> 
> Isn't there cond_resched() or so for such things?
> More info here: 494e46d08d35 ("airo: Replace in_atomic() usage.")

The problem would be that I have to disable preemption during the
transfer, then cond_resched would do nothing if I understand it
correctly. However, an I2C transfer @100kHz for 3 bytes takes at least
240us + overhead (e.g. waiting for the bus idle) which might end in a
close to ms ranage. This is what concerns me.

Regards,
Stefan



