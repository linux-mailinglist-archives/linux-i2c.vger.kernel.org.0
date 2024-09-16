Return-Path: <linux-i2c+bounces-6798-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 300FD97A28E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE12328784D
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6971509B3;
	Mon, 16 Sep 2024 12:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8uagj0I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3A37BB15;
	Mon, 16 Sep 2024 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726491214; cv=none; b=JvSd7wNCHt410BHW1a4Vrzn4AG+eu7eOMdZed3N3a6H7wVL6k5hgtReL8mTG2LjY4bG4xFuV3EDV+VyQt/vCPJXnHyXXWbi3046KkyQMnU9k2z1ktBuQ3JMYqVxEU2YtNM1D8bJDP2FHpFMyDpCxm4Ett8NuxZ6aE4phoBQCV5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726491214; c=relaxed/simple;
	bh=FhRNnOze2UFnXZAjYPHSrk0MyxDWTSo8GRum1FUygH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AP8Yd0E2eUwQ0yoTRptgtybB25ETvyhBt90aomA+/1qm+EXkOKirCn7yfYO74wWFQG1QiFq996jsCaN6l3HwZkEekq0J/paif+UMyApGxbw4ICdmV6TYsQ6vUsobDjwZOR1tPJDge0Qna0eOzrgufxLgxX464ayxY33rNw44R2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8uagj0I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AFABC4CECE;
	Mon, 16 Sep 2024 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726491213;
	bh=FhRNnOze2UFnXZAjYPHSrk0MyxDWTSo8GRum1FUygH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z8uagj0IL/hj/TYI3poKF9XljOZRw9U3MhJVxvI0l5jLEsTixkvHMiYyM8cgj9GA0
	 GmyhRvBt7AW0q/N31LD4l2BO4dMT64y/aQI4usR4uT4tHDkMifB/MJ8DpkV6dRmYGL
	 Cf3fxIl4nw8TXgu0Gu6Qm+5ezB+mZePZTSKhEh9aOt68BhjnZamCZjHgaKAPvndNIP
	 0pS9H50Okz88XajWxCoribp3rIeA1Y1+n5n6sRxOXKg/lNEk+gR23yd2DjKSgptZyP
	 ZPFZwrt69bSswAR53lJblzMhak8ca2hMtHsz810trra9jRDGs4r6ofcRIx5KRMXNqt
	 p7Kb5XbbRYcCA==
Date: Mon, 16 Sep 2024 14:53:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: Keep comment why interrupts start
 disabled
Message-ID: <rezzwxrahok257tz35sxawqodn5sktkgxfokhmhdlrm2o4624p@agqoixuxg3md>
References: <20240916121516.3102-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240916121516.3102-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Mon, Sep 16, 2024 at 02:15:17PM GMT, Wolfram Sang wrote:
> The to-be-fixed commit rightfully reduced a race window, but also
> removed a comment which is still helpful after the fix. Bring the
> comment back.
> 
> Fixes: e2c85d85a05f ("i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 4c9050a4d58e..03c05dcc2202 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -818,6 +818,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	init_completion(&gi2c->done);
>  	spin_lock_init(&gi2c->lock);
>  	platform_set_drvdata(pdev, gi2c);
> +
> +	/* Disable the interrupt so that the system can enter low-power mode */

Thanks for the patch! However, I wouldn’t typically consider this
a fix, and I don’t think it would qualify for stable release
inclusion.

That said, I agree that a comment should be added back. The original
comment no longer fits as well as it did before. A more
appropriate comment would be:

/*
 * Do not enable interrupts by default to allow the system to enter
 * low-power mode. The driver will explicitly enable interrupts when
 * needed using enable_irq().
 */

Does it make sense?

Thanks,
Andi

PS If you want I can add it to the current i2c-host-fixes and
retrigger the pull request.

>  	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
>  			       dev_name(dev), gi2c);
>  	if (ret) {
> -- 
> 2.45.2
> 

