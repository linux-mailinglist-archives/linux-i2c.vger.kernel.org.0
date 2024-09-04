Return-Path: <linux-i2c+bounces-6214-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3D96C995
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 23:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5BC41F26625
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 21:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE54B149DE4;
	Wed,  4 Sep 2024 21:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="cRHyM89/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D227C148310
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 21:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725485621; cv=none; b=sFLbRON6hbhnCNLPldO4VH0FjWjEJ3sTKj70YH3ITXRX+vy/Bedxg3ZCcaHnE3AmKju4hkOaZB4W/qLDZ8n5kmcQmbK8KmtGEEknZ+9c1oS05S67Be/bVIFvuHLzjRkrfJXiyoWzkb0fMDHm4AW7KOSdIp+rYgvzn4Wq+AooTxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725485621; c=relaxed/simple;
	bh=KJKfbQ/xtkdZYtwyiH1ICtQF2bgb6JWqYyuAvKbeyJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RsWYEOs/Kj8NQxAP4erju1sfodG5JPdg9iQcgiiNdG+fH7NC7kxJAZyBVSXksW63l0ZShbRmF4ybKf7jU2/c+g7aEE2Wr/3cp5RsLPOas+Xw78bJ0zi2VwYbaaFe66cAIKe7Dkcc1G4/lKzTJtH81HCsg3d5s55rKPi9irjCMVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=cRHyM89/; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B2D3A2C0272;
	Thu,  5 Sep 2024 09:27:06 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1725485226;
	bh=P5y7GJFE+/Nb9HgomHSo3eoWWfaA241afm+csejWIhA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=cRHyM89/+0S07xYGkyy5mDVs0ndLKcSnGQYKHHSiLS9eXRpmkLYI5/e2I/yWiesnE
	 vUe421OsXK50KxfymJukmhMw3COkXkRe0nhmxRLjbSNg283o6o3DKFjFIbNKMVchMq
	 eSd3CPEu2btOuUvKpStaKCzGg5o974IXA1CWpPCprIs9GBTGx3KPcfxY+sy5Z0Grb9
	 nidsLpy4LSVzvt+ITGkEI3xhLOBwTTAnu0G+rRDdJvd/bz0pxLK4Qz0Ot7fpQI9P02
	 UWZa4nQokLGYAvsMYzv1/2UqiZA2w/GgklIOjWRmOE7GO2Vyfpa+FZ9e2xW39aPcMa
	 VT8xFELUpraSA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66d8d0aa0000>; Thu, 05 Sep 2024 09:27:06 +1200
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id A2DAC13ED8D;
	Thu,  5 Sep 2024 09:27:06 +1200 (NZST)
Message-ID: <6922b27f-a6af-4ec1-822b-6126eae16185@alliedtelesis.co.nz>
Date: Thu, 5 Sep 2024 09:27:06 +1200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2] i2c: mpc: Use devm_clk_get_optional_enabled() to
 simplify code
To: Zhang Zekun <zhangzekun11@huawei.com>, andi.shyti@kernel.org,
 linux-i2c@vger.kernel.org
References: <20240904122226.85377-1-zhangzekun11@huawei.com>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20240904122226.85377-1-zhangzekun11@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=KIj5D0Fo c=1 sm=1 tr=0 ts=66d8d0aa a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=i0EeH86SAAAA:8 a=VwseRY5TbiShT-LIgjgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Zhang,

On 5/09/24 00:22, Zhang Zekun wrote:
> devm_clk_get_optional() and clk_prepare_enable() can be replaced by helper
> function devm_clk_get_optional_enabled(). Let's simplify code with use of
> devm_clk_get_optional_enabled() and avoid calling clk_disable_unprepare().
>
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>

Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Thanks

> ---
> v2: Fix mistakes in commit message.
>
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

