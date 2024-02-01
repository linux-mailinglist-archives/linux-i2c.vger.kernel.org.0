Return-Path: <linux-i2c+bounces-1565-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C16A3844EFB
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 03:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E63711C225F0
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 02:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886B1EAE8;
	Thu,  1 Feb 2024 02:07:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074F3EED1
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 02:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706753227; cv=none; b=ma/KSGgOA47inwTYc1hjx6rSGd5l+vgiMPLs3tqjKmFodBc8IvaawpMuyLMgErLrVfv/8FefJkjhikm+prjslEyGGwd+h2JkeH3FKb5f8iRX1hWWNa3DcnMPrZGBjqMkGtyiFRXwe/RVeXuRf0CiWB+n4yUi6IGSd9XbZioAK9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706753227; c=relaxed/simple;
	bh=yjH7y3a4+/MLSOdpA+4NJiJOmoVnbrk9fDKcxJwJKwU=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=f1ykNHJ8e0ZCSCLCuo02e3EzXVaxwmjmqhdkngOsTBthH95HK7y3YE+oR5kc2fF/8TBC/nR640zeyl8eJsfPuX0Vi+FWK0a54/8Gbn0qiM5HqWRQZB+s22a6hZcDyrcqpCrNZZqjJdOaFcaq1GId+fvJ6OGl9GLvhCgD6WBWRWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4TQMhl1M7Rz1vswD;
	Thu,  1 Feb 2024 10:06:31 +0800 (CST)
Received: from canpemm500009.china.huawei.com (unknown [7.192.105.203])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C0DD1A016B;
	Thu,  1 Feb 2024 10:06:56 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 10:06:56 +0800
CC: <yangyicong@hisilicon.com>, <f.fangjian@huawei.com>,
	<jonathan.cameron@huawei.com>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 2/2] i2c: hisi: Add clearing tx aempty interrupt operation
To: Devyn Liu <liudingyuan@huawei.com>, <andi.shyti@kernel.org>
References: <20240123080222.1512009-1-liudingyuan@huawei.com>
 <20240123080222.1512009-3-liudingyuan@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <6ba0e346-30c0-4ebd-3da5-0f88117d9ce1@huawei.com>
Date: Thu, 1 Feb 2024 10:06:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240123080222.1512009-3-liudingyuan@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)

On 2024/1/23 16:02, Devyn Liu wrote:
> The driver receives the tx fifo almost empty(aempty) interrupt and
> reads the tx_aempty_int_mstat to start a round of data transfer.
> The operation of clearing the TX aempty interrupt after completing
> a write cycle is added to ensure that the FIFO is truly at almost
> empty status when an aempty interrupt is received.
> The threshold for fifo almost empty interrupt is defined as 1.
> 
> Signed-off-by: Devyn Liu <liudingyuan@huawei.com>

Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>

> ---
>  drivers/i2c/busses/i2c-hisi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
> index 82a0c739aae4..08f6f97722a8 100644
> --- a/drivers/i2c/busses/i2c-hisi.c
> +++ b/drivers/i2c/busses/i2c-hisi.c
> @@ -57,6 +57,8 @@
>  #define   HISI_I2C_FS_SPK_LEN_CNT	GENMASK(7, 0)
>  #define HISI_I2C_HS_SPK_LEN		0x003c
>  #define   HISI_I2C_HS_SPK_LEN_CNT	GENMASK(7, 0)
> +#define HISI_I2C_TX_INT_CLR		0x0040
> +#define   HISI_I2C_TX_AEMPTY_INT		BIT(0)
>  #define HISI_I2C_INT_MSTAT		0x0044
>  #define HISI_I2C_INT_CLR		0x0048
>  #define HISI_I2C_INT_MASK		0x004C
> @@ -124,6 +126,11 @@ static void hisi_i2c_clear_int(struct hisi_i2c_controller *ctlr, u32 mask)
>  	writel_relaxed(mask, ctlr->iobase + HISI_I2C_INT_CLR);
>  }
>  
> +static void hisi_i2c_clear_tx_int(struct hisi_i2c_controller *ctlr, u32 mask)
> +{
> +	writel_relaxed(mask, ctlr->iobase + HISI_I2C_TX_INT_CLR);
> +}
> +
>  static void hisi_i2c_handle_errors(struct hisi_i2c_controller *ctlr)
>  {
>  	u32 int_err = ctlr->xfer_err, reg;
> @@ -168,6 +175,7 @@ static int hisi_i2c_start_xfer(struct hisi_i2c_controller *ctlr)
>  	writel(reg, ctlr->iobase + HISI_I2C_FIFO_CTRL);
>  
>  	hisi_i2c_clear_int(ctlr, HISI_I2C_INT_ALL);
> +	hisi_i2c_clear_tx_int(ctlr, HISI_I2C_TX_AEMPTY_INT);
>  	hisi_i2c_enable_int(ctlr, HISI_I2C_INT_ALL);
>  
>  	return 0;
> @@ -323,6 +331,8 @@ static void hisi_i2c_xfer_msg(struct hisi_i2c_controller *ctlr)
>  	 */
>  	if (ctlr->msg_tx_idx == ctlr->msg_num)
>  		hisi_i2c_disable_int(ctlr, HISI_I2C_INT_TX_EMPTY);
> +
> +	hisi_i2c_clear_tx_int(ctlr, HISI_I2C_TX_AEMPTY_INT);
>  }
>  
>  static irqreturn_t hisi_i2c_irq(int irq, void *context)
> @@ -363,6 +373,7 @@ static irqreturn_t hisi_i2c_irq(int irq, void *context)
>  	if (int_stat & HISI_I2C_INT_TRANS_CPLT) {
>  		hisi_i2c_disable_int(ctlr, HISI_I2C_INT_ALL);
>  		hisi_i2c_clear_int(ctlr, HISI_I2C_INT_ALL);
> +		hisi_i2c_clear_tx_int(ctlr, HISI_I2C_TX_AEMPTY_INT);
>  		complete(ctlr->completion);
>  	}
>  
> 

