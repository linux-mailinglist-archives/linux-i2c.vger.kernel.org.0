Return-Path: <linux-i2c+bounces-9778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E6FA5C17E
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 13:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78853164EAD
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 12:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1A5256C95;
	Tue, 11 Mar 2025 12:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="K9tMkc4z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E94256C89;
	Tue, 11 Mar 2025 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741696813; cv=none; b=kbGixNhIYG1fnMIgQYsjsgoYKsT7AjxMdLTJVM9jsfjlKhqOnPqSa1Pec/fA8v4/Dhy8nPzWnA5/Z4td5Rs7eXyZvAxeUHXQuF/cAsXCFQ1tI8TXxUX3GRmGeBJP0rvVy/apTTh+gUCREschxp52nGb9+FnraSiRJ8sv1i06OaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741696813; c=relaxed/simple;
	bh=S02jbh8PKO5i/uzetQ+Nll2XWomIcWUHAYwcFP/SNGg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDvfq1Qx8dptaSF5MRgkvvWYecwFKDn/NLLXkE+B9OaQ7KqyYMfgIdRQ27pfGyqzdRIzTVTkccrToWvHO4xPYoKc364NLJHgVD7CTlW2msb/G9yXmN314xDyFQp1XyMsHNn5shlhttSejZZWpX8AO3QuBU9xSSqvDTYzmWTHAkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=K9tMkc4z; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BCdmfD1291709
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 11 Mar 2025 07:39:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741696788;
	bh=dbO2fCpxNxJpEsWSKYH0roYSpPeD9BXytOm6a3W9txs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=K9tMkc4zekntqwUHkZjMLEZCS08yElSK7E+LN0WiYeT3oXIlfww66vL5zICky8y0W
	 TNUNb6O5QdbgDhHvYG9fVA6O2W7Q3OToDh6jYfFt9Qo3+ef+w7BUTAgIzWng4HhEXD
	 au4tEF4oTGQGU0JUOYlURuh0FJvXbTTJQm5KdUTc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BCdm2O032648;
	Tue, 11 Mar 2025 07:39:48 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 07:39:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 07:39:47 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BCdlJ7081396;
	Tue, 11 Mar 2025 07:39:47 -0500
Date: Tue, 11 Mar 2025 07:39:47 -0500
From: Nishanth Menon <nm@ti.com>
To: Andreas Kemnade <andreas@kemnade.info>
CC: <vigneshr@ti.com>, <aaro.koskinen@iki.fi>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <jmkrzyszt@gmail.com>,
        <andi.shyti@kernel.org>, <reidt@ti.com>, <wsa@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@kernel.org>
Subject: Re: [PATCH v2] i2c: omap: fix IRQ storms
Message-ID: <20250311123947.jce4i5heeufzwmji@serotonin>
References: <20250228140420.379498-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250228140420.379498-1-andreas@kemnade.info>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 15:04-20250228, Andreas Kemnade wrote:
> On the GTA04A5 writing a reset command to the gyroscope causes IRQ
> storms because NACK IRQs are enabled and therefore triggered but not
> acked.
> 
> Sending a reset command to the gyroscope by
> i2cset 1 0x69 0x14 0xb6
> with an additional debug print in the ISR (not the thread) itself
> causes
> 
> [ 363.353515] i2c i2c-1: ioctl, cmd=0x720, arg=0xbe801b00
> [ 363.359039] omap_i2c 48072000.i2c: addr: 0x0069, len: 2, flags: 0x0, stop: 1
> [ 363.366180] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x1110)
> [ 363.371673] omap_i2c 48072000.i2c: IRQ (ISR = 0x0010)
> [ 363.376892] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> [ 363.382263] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> [ 363.387664] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> repeating till infinity
> [...]
> (0x2 = NACK, 0x100 = Bus free, which is not enabled)
> Apparently no other IRQ bit gets set, so this stalls.
> 
> Do not ignore enabled interrupts and make sure they are acked.
> If the NACK IRQ is not needed, it should simply not enabled, but
> according to the above log, caring about it is necessary unless
> the Bus free IRQ is enabled and handled. The assumption that is
> will always come with a ARDY IRQ, which was the idea behind
> ignoring it, proves wrong.
> It is true for simple reads from an unused address.
> 
> To still avoid the i2cdetect trouble which is the reason for
> commit c770657bd261 ("i2c: omap: Fix standard mode false ACK readings"),
> avoid doing much about NACK in omap_i2c_xfer_data() which is used
> by both IRQ mode and polling mode, so also the false detection fix
> is extended to polling usage and IRQ storms are avoided.
> 
> By changing this, the hardirq handler is not needed anymore to filter
> stuff.
> 
> The mentioned gyro reset now just causes a -ETIMEDOUT instead of
> hanging the system.
> 
> Fixes: c770657bd261 ("i2c: omap: Fix standard mode false ACK readings").
> CC: <stable@kernel.org>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> This needs at least to be tested on systems where false acks were
> detected.

At least on BeaglePlay, I have not been able to reproduce the original
bug which was the trigger for commit c770657bd261

I also ran basic boot tests on other K3 platforms and none seem to show
regressions at the very least.

Tested-by: Nishanth Menon <nm@ti.com>

> 
>  drivers/i2c/busses/i2c-omap.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index 92faf03d64cf..f18c3e74b076 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -1048,23 +1048,6 @@ static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes,
>  	return 0;
>  }
>  
> -static irqreturn_t
> -omap_i2c_isr(int irq, void *dev_id)
> -{
> -	struct omap_i2c_dev *omap = dev_id;
> -	irqreturn_t ret = IRQ_HANDLED;
> -	u16 mask;
> -	u16 stat;
> -
> -	stat = omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG);
> -	mask = omap_i2c_read_reg(omap, OMAP_I2C_IE_REG) & ~OMAP_I2C_STAT_NACK;
> -
> -	if (stat & mask)
> -		ret = IRQ_WAKE_THREAD;
> -
> -	return ret;
> -}
> -
>  static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
>  {
>  	u16 bits;
> @@ -1095,8 +1078,13 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
>  		}
>  
>  		if (stat & OMAP_I2C_STAT_NACK) {
> -			err |= OMAP_I2C_STAT_NACK;
> +			omap->cmd_err |= OMAP_I2C_STAT_NACK;
>  			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_NACK);
> +
> +			if (!(stat & ~OMAP_I2C_STAT_NACK)) {
> +				err = -EAGAIN;
> +				break;
> +			}
>  		}
>  
>  		if (stat & OMAP_I2C_STAT_AL) {
> @@ -1472,7 +1460,7 @@ omap_i2c_probe(struct platform_device *pdev)
>  				IRQF_NO_SUSPEND, pdev->name, omap);
>  	else
>  		r = devm_request_threaded_irq(&pdev->dev, omap->irq,
> -				omap_i2c_isr, omap_i2c_isr_thread,
> +				NULL, omap_i2c_isr_thread,
>  				IRQF_NO_SUSPEND | IRQF_ONESHOT,
>  				pdev->name, omap);
>  
> -- 
> 2.39.5
> 
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

