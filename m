Return-Path: <linux-i2c+bounces-11853-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D53CAFAFFA
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 11:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ED0A4A178E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 09:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B5E25A322;
	Mon,  7 Jul 2025 09:40:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636FA291C11;
	Mon,  7 Jul 2025 09:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881247; cv=none; b=gMORhATFN9o7GjKyk1YI4hyOmwEsVvcZvdnBwzjs0MS+t+/GOkgI9/iwZ0z8B5OyeWaJ+9ma21BNgPGr4VDsQdihLQjrc30kIH3SfkNKxObYCtIGv67MHSXPPUwImv59XVLksEJqYQ9U1QEUUDMBorNkOse18gD5+t7Vn3tzsuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881247; c=relaxed/simple;
	bh=+YR0CoQ2SiHvd94vawkeyE41xtcRe+pTyxh1plOS2GY=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qzlp0Qo6gidB/oQ9APgJtT1JyD52muo0tQWazF5ncjUFyAuuP2GfCa/aZCF+3O1B1hZ9vyKGB93M4iP/OmZh3JZJ49RuK56Rw4QUggMhOmQKkxrnjnIwBXEK77cHAw7Ehni6xxJ8vHTwPMK11zR1Zgei9MOGAUlB9TWAEi/JuvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbK3549Hcz6L5L1;
	Mon,  7 Jul 2025 17:40:01 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D0C31402A5;
	Mon,  7 Jul 2025 17:40:43 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 7 Jul
 2025 11:40:42 +0200
Date: Mon, 7 Jul 2025 10:40:41 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
CC: Patrice Chotard <patrice.chotard@foss.st.com>, Andi Shyti
	<andi.shyti@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<opensource.kernel@vivo.com>
Subject: Re: [PATCH v2] i2c: busses: Use min() to improve code
Message-ID: <20250707104041.00006171@huawei.com>
In-Reply-To: <20250705114436.579070-1-rongqianfeng@vivo.com>
References: <20250705114436.579070-1-rongqianfeng@vivo.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Sat,  5 Jul 2025 19:44:35 +0800
Qianfeng Rong <rongqianfeng@vivo.com> wrote:

> Use min() to reduce the code and improve its readability.
> 
> The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
> was changed from int to u32, because the max parameter passed
> in is always greater than 0.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Drive by review...

I'd add Wolfram as +CC at least.  May well pick it off the list
of course.


> ---
>  drivers/i2c/busses/i2c-st.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
> index 750fff3d2389..285d8a05ab36 100644
> --- a/drivers/i2c/busses/i2c-st.c
> +++ b/drivers/i2c/busses/i2c-st.c
> @@ -422,10 +422,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
>  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>  	tx_fstat &= SSC_TX_FSTAT_STATUS;
>  
> -	if (c->count < (SSC_TXFIFO_SIZE - tx_fstat))
> -		i = c->count;
> -	else
> -		i = SSC_TXFIFO_SIZE - tx_fstat;
> +	i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);

Add 
#include <linux/minmax.h>


Given it is now one statement perhaps cleaner toput it
as the loop initializer 

	for (i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
	     i > 0; i--, c->count--, c->buf++)

>  
>  	for (; i > 0; i--, c->count--, c->buf++)
>  		st_i2c_write_tx_fifo(i2c_dev, *c->buf);
> @@ -439,7 +436,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
>   * This functions fills the Tx FIFO with fixed pattern when
>   * in read mode to trigger clock.
>   */
> -static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
> +static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, u32 max)
>  {
>  	struct st_i2c_client *c = &i2c_dev->client;
>  	u32 tx_fstat, sta;
> @@ -452,10 +449,7 @@ static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
>  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>  	tx_fstat &= SSC_TX_FSTAT_STATUS;
>  
> -	if (max < (SSC_TXFIFO_SIZE - tx_fstat))
> -		i = max;
> -	else
> -		i = SSC_TXFIFO_SIZE - tx_fstat;
> +	i = min(max, SSC_TXFIFO_SIZE - tx_fstat);
>  
>  	for (; i > 0; i--, c->xfered++)
Same here.

>  		st_i2c_write_tx_fifo(i2c_dev, 0xff);


