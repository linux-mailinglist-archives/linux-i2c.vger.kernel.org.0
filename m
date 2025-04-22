Return-Path: <linux-i2c+bounces-10523-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3229A97023
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 17:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D1257A5FB1
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 15:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224C7289356;
	Tue, 22 Apr 2025 15:12:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E67D211488;
	Tue, 22 Apr 2025 15:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745334742; cv=none; b=VypNjc7iuG5RugmbdyH0meovc6G9DwTrsRt/QNa745l/08aTEHs4hnT9dEXzO3uwyUKZIbRR5ijaHWdhYD+epf+38jklQc2/3HqZM9Fn0Lk5GzdnOknnR3tGkr/xI4/oLMZy1b1QWbMrAAqczfqaU8M9UGsmv8TjUVic1hc0Km4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745334742; c=relaxed/simple;
	bh=YPH9lUmW+CZTk7C70D5/ab8R8uD4KZUBGVM3jWOHML8=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m41qgK2YDlJWC/2Wm908UzTAEkFs0SFivyyvm+6WSpfTT8bqrFb0umBA95MTOaCo1tb2CnE5XKqyoaSaIld60xT2pYAPqDGYXNnj1MO1C1lTYQeR9o+Rr/9Dbvqc6IWuj4eqvmTYvrZvHIYPQ0sdiUrL03aB4D8xeDKxY8Mi00E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zhlzb1gQSz6L51r;
	Tue, 22 Apr 2025 23:10:35 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B55E61400CA;
	Tue, 22 Apr 2025 23:12:15 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 22 Apr
 2025 17:12:15 +0200
Date: Tue, 22 Apr 2025 16:12:13 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Troy Mitchell <troymitchell988@gmail.com>
CC: Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Andi Shyti <andi.shyti@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, <linux-i2c@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Yongchao Jia <jyc0019@gmail.com>
Subject: Re: [PATCH 1/2] i2c: imx: use guard to take spinlock
Message-ID: <20250422161213.0000597d@huawei.com>
In-Reply-To: <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
	<20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Mon, 21 Apr 2025 13:36:38 +0800
Troy Mitchell <troymitchell988@gmail.com> wrote:

> Use guard to automatically release the lock after going out of scope
> instead of calling it manually.

Drive by review, but this changes behavior in a subtle way so we
should have more commentary here...

> 
> Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
> Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 9e5d454d8318..cb96a57df4a0 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -23,6 +23,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/clk.h>
> +#include <linux/cleanup.h>
>  #include <linux/completion.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>

>  
> @@ -1125,30 +1126,27 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
>  {
>  	struct imx_i2c_struct *i2c_imx = dev_id;
>  	unsigned int ctl, status;
> -	unsigned long flags;
>  
> -	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
> +	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
> +
>  	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
>  	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  
>  	if (status & I2SR_IIF) {
>  		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
> +
>  		if (i2c_imx->slave) {
>  			if (!(ctl & I2CR_MSTA)) {
>  				irqreturn_t ret;
>  
> -				ret = i2c_imx_slave_handle(i2c_imx,
> -							   status, ctl);
> -				spin_unlock_irqrestore(&i2c_imx->slave_lock,
> -						       flags);
> -				return ret;
> +				return i2c_imx_slave_handle(i2c_imx,
> +							    status, ctl);
>  			}
>  			i2c_imx_slave_finish_op(i2c_imx);
>  		}
> -		spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);

In this path the patch changes the lock release to occur after
i2c_imx_master_isr(i2c_imx, status);

That may well be safe; I have no idea!  You should talk about that
in the patch description if it is.

> +
>  		return i2c_imx_master_isr(i2c_imx, status);
>  	}
> -	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
>  
>  	return IRQ_NONE;
>  }
> 


