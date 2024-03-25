Return-Path: <linux-i2c+bounces-2571-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB88889BB3
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 11:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE3741C339B5
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 10:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3283D14BFA9;
	Mon, 25 Mar 2024 02:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Du4BbhMN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913C9289DA3;
	Mon, 25 Mar 2024 01:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711328493; cv=none; b=oxH/hDl++jEpzsWuAvJdtAh5ATmXCkVaKfb6qJ+I/bsX04bXyBUBG+0pjTkYK1losIfptiEXYkB4NfyFUIJah9ex+VJ90TfHQdiqiDmH45LwZwgW7iWE7nQKdubfgdg5Ia2CAynjexcXP+FMfbhIgNbB6fJ9uDSgxeJNez65jAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711328493; c=relaxed/simple;
	bh=8Ri/TcnwWROTeTo7/CMOgG9NEBLux/OUQ8AATvx46vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+diA82A/xQQEPmewWjaucg7fUACGaLNK9xFuaKS8YsoqT8Q9RhonNPuWjAIzDimYmoER8tfzURDxoa6JDKNWNOvTsHOQtYI63tuNNAzlVjq6esAUSFwXbKerdqbfHpljf9blnNoRatKpbyIE5AtapYh1HS5Bm3EUUrRR8+MCAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Du4BbhMN; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1711328486; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Olj1ljSfg7IgQmSG+StWQZK2MWnbKss3wMKhzeU0r0Y=;
	b=Du4BbhMNpDTu8vUMiE0mVjHvKtLfM93ce+XXWGCANHBecOtw0M3oYty8Ns2fVBeY6A1q2JFoz1aZUUc0uEafX6oLQaqSGkScrfBkTajVyz0j4hDK1IO8/rMHPbKZRM+cgbIYg6iLu9Dg198UeCF2H1KppW6EiCqadvAZe94favk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0W37sgMN_1711328485;
Received: from 30.97.56.58(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0W37sgMN_1711328485)
          by smtp.aliyun-inc.com;
          Mon, 25 Mar 2024 09:01:25 +0800
Message-ID: <dec01947-6678-43b9-9c83-e1be48e9833e@linux.alibaba.com>
Date: Mon, 25 Mar 2024 09:01:23 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 52/64] i2c: sprd: reword according to newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-53-wsa+renesas@sang-engineering.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20240322132619.6389-53-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/3/22 21:25, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

LGTM. Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   drivers/i2c/busses/i2c-sprd.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index 28c88901d9bc..f1a8375ccc17 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -283,7 +283,7 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
>   	return i2c_dev->err;
>   }
>   
> -static int sprd_i2c_master_xfer(struct i2c_adapter *i2c_adap,
> +static int sprd_i2c_xfer(struct i2c_adapter *i2c_adap,
>   				struct i2c_msg *msgs, int num)
>   {
>   	struct sprd_i2c *i2c_dev = i2c_adap->algo_data;
> @@ -314,7 +314,7 @@ static u32 sprd_i2c_func(struct i2c_adapter *adap)
>   }
>   
>   static const struct i2c_algorithm sprd_i2c_algo = {
> -	.master_xfer = sprd_i2c_master_xfer,
> +	.xfer = sprd_i2c_xfer,
>   	.functionality = sprd_i2c_func,
>   };
>   
> @@ -378,12 +378,12 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
>   		i2c_tran = i2c_dev->count;
>   
>   	/*
> -	 * If we got one ACK from slave when writing data, and we did not
> +	 * If we got one ACK from client when writing data, and we did not
>   	 * finish this transmission (i2c_tran is not zero), then we should
>   	 * continue to write data.
>   	 *
>   	 * For reading data, ack is always true, if i2c_tran is not 0 which
> -	 * means we still need to contine to read data from slave.
> +	 * means we still need to contine to read data from client.
>   	 */
>   	if (i2c_tran && ack) {
>   		sprd_i2c_data_transfer(i2c_dev);
> @@ -393,7 +393,7 @@ static irqreturn_t sprd_i2c_isr_thread(int irq, void *dev_id)
>   	i2c_dev->err = 0;
>   
>   	/*
> -	 * If we did not get one ACK from slave when writing data, we should
> +	 * If we did not get one ACK from client when writing data, we should
>   	 * return -EIO to notify users.
>   	 */
>   	if (!ack)
> @@ -422,7 +422,7 @@ static irqreturn_t sprd_i2c_isr(int irq, void *dev_id)
>   		i2c_tran = i2c_dev->count;
>   
>   	/*
> -	 * If we did not get one ACK from slave when writing data, then we
> +	 * If we did not get one ACK from client when writing data, then we
>   	 * should finish this transmission since we got some errors.
>   	 *
>   	 * When writing data, if i2c_tran == 0 which means we have writen
> @@ -653,5 +653,5 @@ static struct platform_driver sprd_i2c_driver = {
>   
>   module_platform_driver(sprd_i2c_driver);
>   
> -MODULE_DESCRIPTION("Spreadtrum I2C master controller driver");
> +MODULE_DESCRIPTION("Spreadtrum I2C host controller driver");
>   MODULE_LICENSE("GPL v2");

