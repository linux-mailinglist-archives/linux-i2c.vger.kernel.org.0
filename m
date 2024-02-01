Return-Path: <linux-i2c+bounces-1564-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 388F9844EFA
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 03:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E975E28A9E0
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 02:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DAFF504;
	Thu,  1 Feb 2024 02:06:08 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B56529406
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 02:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706753168; cv=none; b=Mjgo0yGmnIDYnDguJPBJNFULPWwZ8wKug/s05zk+SxJ6nsNvTQjJAGBsGYvVKQO2vitS9U43d2XWeyW+pyj7M1Akaad4GMQN1pudKG4JjV0J3IVBbjllae0OSyxcVFVeQCEBTKeygi1tchbTSkhr9O2vYs7C7J++P4tvhpjZOSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706753168; c=relaxed/simple;
	bh=951F+J0ektV+0ETEizX5Rp38SNn0bDEwx87yfqSu1dk=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=OO7cc13WTO4NqFeLm2vfRCvZFzkaOVVM4m8IYYTy3icU4HYh/DM0kmNjHQxzfFcfg+q9M/WnKzpZc12ynAYbAWgSNyIV//9p2vScf6n8eADlBZLPOLTyOJadb7AORrDHttihWPpcYzea/UViaBaFUbjcMlNiJcKilUuHihRJXOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TQMf23gSDz1gyJy;
	Thu,  1 Feb 2024 10:04:10 +0800 (CST)
Received: from canpemm500009.china.huawei.com (unknown [7.192.105.203])
	by mail.maildlp.com (Postfix) with ESMTPS id 5506A1400CA;
	Thu,  1 Feb 2024 10:06:01 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 10:06:00 +0800
CC: <yangyicong@hisilicon.com>, <f.fangjian@huawei.com>,
	<jonathan.cameron@huawei.com>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: hisi: Optimized the value setting of maxwrite
 limit to fifo depth - 1
To: Devyn Liu <liudingyuan@huawei.com>, <andi.shyti@kernel.org>
References: <20240123080222.1512009-1-liudingyuan@huawei.com>
 <20240123080222.1512009-2-liudingyuan@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <828dc58a-6c39-c778-9bc6-0421dce40b77@huawei.com>
Date: Thu, 1 Feb 2024 10:06:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240123080222.1512009-2-liudingyuan@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500009.china.huawei.com (7.192.105.203)

On 2024/1/23 16:02, Devyn Liu wrote:
> The driver finishs a write cycle by read the fifo tx full status
> or write limit decrease to 0. The driver starts to write data to
> the FIFO after the I2C FIFO almost empty interrupt is reported.
> The threshold for FIFO empty interrupt is that the amount of data in
> the FIFO is less than or equal to 1.
> Reduce write maxwrite to the fifo depth - 1. Limiting the number of
> data to be written at a time to remaining fifo capacity.
> 
> Signed-off-by: Devyn Liu <liudingyuan@huawei.com>

Looks good to me. Just one nit below. so,

Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>

> ---
>  drivers/i2c/busses/i2c-hisi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
> index dfad5bad5075..82a0c739aae4 100644
> --- a/drivers/i2c/busses/i2c-hisi.c
> +++ b/drivers/i2c/busses/i2c-hisi.c
> @@ -266,7 +266,7 @@ static int hisi_i2c_read_rx_fifo(struct hisi_i2c_controller *ctlr)
>  
>  static void hisi_i2c_xfer_msg(struct hisi_i2c_controller *ctlr)
>  {
> -	int max_write = HISI_I2C_TX_FIFO_DEPTH;
> +	int max_write = HISI_I2C_TX_FIFO_DEPTH - 1;

Would it be more readable to use HISI_I2C_TX_F_AE_THRESH instead of '1'?

>  	bool need_restart = false, last_msg;
>  	struct i2c_msg *cur_msg;
>  	u32 cmd, fifo_state;
> 

