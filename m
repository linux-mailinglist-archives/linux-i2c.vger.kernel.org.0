Return-Path: <linux-i2c+bounces-6343-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3ED9700B5
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Sep 2024 09:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45C6CB23063
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Sep 2024 07:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1B814A0B3;
	Sat,  7 Sep 2024 07:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmAHzH2G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E052D627;
	Sat,  7 Sep 2024 07:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725695809; cv=none; b=MZqlNyRSgDeOG/A4PoZk59Wks91ZAqOt8feWwCpWp2QDW9o5jQT0Li78ecW37IauvjjN71q0Qc4FyBFC34Akbs0THSzA/NM0ftGDDAQ0pt3JhWKzNZgBw4/fIDbxpsG6ItfokknOFxqSOvK5KlxELu1M7Yza9cwqg8go+PHG5AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725695809; c=relaxed/simple;
	bh=+mMc6B5j7zB6GCWEfBYhnQ5y4Mas/2X7aChRewkQeEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdcpTiWk+GRCwF1VDhOg3y1PZ4PeAsJqm6w3gf3gy2a0dLgXMf4VppckpGNyiKTLet6psVezwwOVptdA9aSj8EjOylEG21oDtR9pWvKCyQY7n8W68IQhdYhQfLM0COwRSQl2jPev33MzZA8gqueeMzGxpODAi5LHwEYRQF4xDHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmAHzH2G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EB3C4CEC2;
	Sat,  7 Sep 2024 07:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725695809;
	bh=+mMc6B5j7zB6GCWEfBYhnQ5y4Mas/2X7aChRewkQeEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mmAHzH2GRdzTEu15Q+QtypMrFa3wi1mKgv+0UtcUiqHvLGRI2YW25SFoS6u0BIA6O
	 /LBTDnum/6xHqchhCvo05y6KVb/FWN+0E1iz/jeEnvpWEc9YqhEdRxS0cjAcPyrn1b
	 Pw0F8eqh6ajmjfS2Lls4d3O7G2lDuEkXxpaRj8rseW+Q5ErVA0dzwRvC6qPCEIuzWv
	 VfRJD5k5WlPNhwqXrYvUePi7J39ovlXJQKR3fqNqamW3vMj7qT1arPdUehlVZTIQuC
	 puXV597AkRIeEgFmw5UMWA8uqPD0mZUaYHgR51my9Eh+kbIHQH/7CMMJyc1Eg9v90p
	 07J2dmmzsKuiA==
Date: Sat, 7 Sep 2024 09:56:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, conor+dt@kernel.org, agross@kernel.org, 
	devicetree@vger.kernel.org, vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org, 
	Frank.Li@nxp.com, konradybcio@kernel.org, quic_vdadhani@quicinc.com
Subject: Re: [PATCH v2 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
Message-ID: <pnt6pyeaqu3v3qk6hsccqfm5agtvzqjujs35roicovgv5xbsh5@gskuy5wefq6r>
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
 <20240906191438.4104329-5-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906191438.4104329-5-quic_msavaliy@quicinc.com>

Hi Mukesh,

On Sat, Sep 07, 2024 at 12:44:38AM GMT, Mukesh Kumar Savaliya wrote:
> Add support to share I2C SE by two Subsystems in a mutually exclusive way.
> Use  "qcom,shared-se" flag in a particular i2c instance node if the
> usecase requires i2c controller to be shared.
> 
> I2C driver just need to mark first_msg and last_msg flag to help indicate
> GPI driver to  take lock and unlock TRE there by protecting from concurrent
> access from other EE or Subsystem.
> 
> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
> Unlock TRE for the respective transfer operations.
> 
> Since the GPIOs are also shared for the i2c bus between two SS, do not
> touch GPIO configuration during runtime suspend and only turn off the
> clocks. This will allow other SS to continue to transfer the data
> without any disturbance over the IO lines.

if I remember correctly, someone already commented on your
patches to explain and expand the achronyms you are using. Please
improve the commit log so that people who don't know this device
can understand.

...

> @@ -631,8 +636,11 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  		dma_async_issue_pending(gi2c->tx_c);
>  
>  		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> -		if (!time_left)
> +		if (!time_left) {
> +			dev_err(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
> +						gi2c->cur->flags, gi2c->cur->addr);

Please, don't print out here. The user doesn't really need to
know, let the upper levels decide what to do.

>  			gi2c->err = -ETIMEDOUT;
> +		}
>  
>  		if (gi2c->err) {
>  			ret = gi2c->err;
> @@ -800,6 +808,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  		gi2c->clk_freq_out = KHZ(100);
>  	}
>  
> +	if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
> +		gi2c->is_shared = true;
> +		dev_dbg(&pdev->dev, "Shared SE Usecase\n");

Please, improve this debug message.

The rest looks good to me.

Thanks,
Andi

