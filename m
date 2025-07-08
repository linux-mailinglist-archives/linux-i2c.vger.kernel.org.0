Return-Path: <linux-i2c+bounces-11873-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CD6AFC925
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jul 2025 13:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90E733B2ABD
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jul 2025 11:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F72C2690D5;
	Tue,  8 Jul 2025 11:07:06 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F7A219A6B;
	Tue,  8 Jul 2025 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751972826; cv=none; b=g95hzRzvN4yCJQHVXdTL5oTT/Ef81CePLK6tN9gLStbJmorqjPJaGRPIXg8XCJU4Ou2AyTyDkwLn+8xp/gNtERUFPkv45glsYvg0ivTcji7wCZJSBaeUcpkowA0qkO3E23p3zWtdGPJ2VZ51GxRRrzhwNJEtuN1AeEKmfp4JFyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751972826; c=relaxed/simple;
	bh=ytI5InlAc9OnRvhqJh5WkuHYoegFRzHjoPIoJVVR+TM=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CoJiCLcmGBgQ8UgrhE8m8+3H3C92MfH2Jq44/XCzlh4cv5iO5yDLmcSxAIhilym38Yv96a8jVk3FAwJirGmDVnhv8GbIT4m78UXT+uudtx69DtlcG+0v12elmh3WoqiNHspSntz/zfoTf1f0r4S0XHAPg3rJGaErrTXF8M9JE84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbyw66s5Fz6GCR5;
	Tue,  8 Jul 2025 19:06:14 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 19A2614025A;
	Tue,  8 Jul 2025 19:07:00 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 8 Jul
 2025 13:06:59 +0200
Date: Tue, 8 Jul 2025 12:06:58 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
CC: <wsa+renesas@sang-engineering.com>, Patrice Chotard
	<patrice.chotard@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <opensource.kernel@vivo.com>
Subject: Re: [PATCH v3] i2c: busses: Use min() to improve code
Message-ID: <20250708120658.0000668a@huawei.com>
In-Reply-To: <20250708031520.365110-1-rongqianfeng@vivo.com>
References: <20250708031520.365110-1-rongqianfeng@vivo.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Tue,  8 Jul 2025 11:15:20 +0800
Qianfeng Rong <rongqianfeng@vivo.com> wrote:

> Use min() to reduce the code and improve its readability.
> 
> The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
> was changed from int to u32, because the max parameter passed
> in is always greater than 0.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> v2-> v3:
> - added the <linux/minmax.h> as suggested by Jonathan.
> - used i = min(...) as the loop initializer according
>   to Jonathan.
> 
> v1-> v2:
> - Change the max parameter type in st_i2c_rd_fill_tx_fifo()
>   from int to u32
> ---
>  drivers/i2c/busses/i2c-st.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
> index 750fff3d2389..e4b2ed8a9264 100644
> --- a/drivers/i2c/busses/i2c-st.c
> +++ b/drivers/i2c/busses/i2c-st.c
> @@ -19,6 +19,7 @@
>  #include <linux/of.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/minmax.h>
>  
>  /* SSC registers */
>  #define SSC_BRG				0x000
> @@ -422,12 +423,8 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
>  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>  	tx_fstat &= SSC_TX_FSTAT_STATUS;
>  
> -	if (c->count < (SSC_TXFIFO_SIZE - tx_fstat))
> -		i = c->count;
> -	else
> -		i = SSC_TXFIFO_SIZE - tx_fstat;
> -
> -	for (; i > 0; i--, c->count--, c->buf++)
> +	for (i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
> +		i > 0; i--, c->count--, c->buf++)
	for (i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
	     i > 0; i--, c->count--, c->buf++)
  		st_i2c_write_tx_fifo(i2c_dev, *c->buf);

So different alignment form what you have.


>  		st_i2c_write_tx_fifo(i2c_dev, *c->buf);
>  }
>  
> @@ -439,7 +436,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
>   * This functions fills the Tx FIFO with fixed pattern when
>   * in read mode to trigger clock.
>   */
> -static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
> +static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, u32 max)
>  {
>  	struct st_i2c_client *c = &i2c_dev->client;
>  	u32 tx_fstat, sta;
> @@ -452,12 +449,8 @@ static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
>  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>  	tx_fstat &= SSC_TX_FSTAT_STATUS;
>  
> -	if (max < (SSC_TXFIFO_SIZE - tx_fstat))
> -		i = max;
> -	else
> -		i = SSC_TXFIFO_SIZE - tx_fstat;
> -
> -	for (; i > 0; i--, c->xfered++)
> +	for (i = min(max, SSC_TXFIFO_SIZE - tx_fstat);
> +		i > 0; i--, c->xfered++)
>  		st_i2c_write_tx_fifo(i2c_dev, 0xff);
>  }
>  


