Return-Path: <linux-i2c+bounces-6119-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7246896B495
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 10:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A66CD1C21562
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 08:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CAC01CB300;
	Wed,  4 Sep 2024 08:32:06 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5498D1CB12C
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725438726; cv=none; b=BIfSjRdvqL0BkFI7I0l2YDjhodI4GHQRAxzfLiWwJ6Rbed2PX4MQEJbxpBPj4ktkL4QnlGjhUaRdfVfG52435xJMPw5QszSFrOtCzaiE0KwHZBFyrIwIe1L+crxmxDfU35UJopmRfrMGsARUfAEJYYQXqRCXjsj8ViblO++G9nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725438726; c=relaxed/simple;
	bh=WBKAsoLfzoFNp15UQuj9A91GbaF3jKHoBhxpYHc344Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bnEuwlezRYuQAWvVFJQP+dwKNDITOF6fG9eCkiRsh65IBtPj5JrGE3JoobajuOegD564GwD69MBggq+lJQeAIY4xMtjggPqajO2BuUfjsrVbVL9hWmsWzsc5l882Yb493VNHK2dnpXEZSYvvxiRygJILrnl0GYopDcYMdwr/HVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WzG1S1RWqz1j82s;
	Wed,  4 Sep 2024 16:31:40 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 3A7FB1401E9;
	Wed,  4 Sep 2024 16:32:00 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Sep 2024 16:31:59 +0800
Message-ID: <9ad1e3f4-b09f-4507-8d6a-2dee1a73fdf9@huawei.com>
Date: Wed, 4 Sep 2024 16:31:52 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: mpc: Use devm_clk_get() to simplify code
To: <chris.packham@alliedtelesis.co.nz>, <andi.shyti@kernel.org>,
	<linux-i2c@vger.kernel.org>
References: <20240904070435.102768-1-zhangzekun11@huawei.com>
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
In-Reply-To: <20240904070435.102768-1-zhangzekun11@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)

Sorry for make noise. Please ignore this patch, there are some mistakes 
in the commit message. I will send v2 to fix it.

Best Regards,
Zekun

在 2024/9/4 15:04, Zhang Zekun 写道:
> devm_clk_get() and clk_prepare_enable() can be replaced by helper
> function devm_clk_get_enabled(). Let's use devm_clk_get_enabled() to
> simplify code and avoid calling clk_disable_unprepare().
> 
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>   drivers/i2c/busses/i2c-mpc.c | 23 ++++-------------------
>   1 file changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
> index 41d6c8ed163a..236d6b8ba867 100644
> --- a/drivers/i2c/busses/i2c-mpc.c
> +++ b/drivers/i2c/busses/i2c-mpc.c
> @@ -88,7 +88,6 @@ struct mpc_i2c {
>   	int irq;
>   	u32 real_clk;
>   	u8 fdr, dfsrr;
> -	struct clk *clk_per;
>   	u32 cntl_bits;
>   	enum mpc_i2c_action action;
>   	struct i2c_msg *msgs;
> @@ -779,7 +778,6 @@ static int fsl_i2c_probe(struct platform_device *op)
>   	struct clk *clk;
>   	int result;
>   	u32 clock;
> -	int err;
>   
>   	i2c = devm_kzalloc(&op->dev, sizeof(*i2c), GFP_KERNEL);
>   	if (!i2c)
> @@ -809,18 +807,12 @@ static int fsl_i2c_probe(struct platform_device *op)
>   	 * enable clock for the I2C peripheral (non fatal),
>   	 * keep a reference upon successful allocation
>   	 */
> -	clk = devm_clk_get_optional(&op->dev, NULL);
> -	if (IS_ERR(clk))
> -		return PTR_ERR(clk);
> -
> -	err = clk_prepare_enable(clk);
> -	if (err) {
> +	clk = devm_clk_get_optional_enabled(&op->dev, NULL);
> +	if (IS_ERR(clk)) {
>   		dev_err(&op->dev, "failed to enable clock\n");
> -		return err;
> +		return PTR_ERR(clk);
>   	}
>   
> -	i2c->clk_per = clk;
> -
>   	if (of_property_read_bool(op->dev.of_node, "fsl,preserve-clocking")) {
>   		clock = MPC_I2C_CLOCK_PRESERVE;
>   	} else {
> @@ -876,14 +868,9 @@ static int fsl_i2c_probe(struct platform_device *op)
>   
>   	result = i2c_add_numbered_adapter(&i2c->adap);
>   	if (result)
> -		goto fail_add;
> +		return result;
>   
>   	return 0;
> -
> - fail_add:
> -	clk_disable_unprepare(i2c->clk_per);
> -
> -	return result;
>   };
>   
>   static void fsl_i2c_remove(struct platform_device *op)
> @@ -891,8 +878,6 @@ static void fsl_i2c_remove(struct platform_device *op)
>   	struct mpc_i2c *i2c = platform_get_drvdata(op);
>   
>   	i2c_del_adapter(&i2c->adap);
> -
> -	clk_disable_unprepare(i2c->clk_per);
>   };
>   
>   static int __maybe_unused mpc_i2c_suspend(struct device *dev)

