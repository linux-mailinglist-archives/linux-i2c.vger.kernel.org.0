Return-Path: <linux-i2c+bounces-7101-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5079D98AC44
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 20:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED8071F238EA
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 18:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5CE198825;
	Mon, 30 Sep 2024 18:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AODi7JnQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CADE192D82
	for <linux-i2c@vger.kernel.org>; Mon, 30 Sep 2024 18:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727721772; cv=none; b=tAES+5806kqIKr/lZSWtzf7Xn4ijY9w/KGZkS4GuUNJwz0gesOCsI9bEPC+TPSp438kYhMQhH8byHoApOcHOcaP8D8VQe6oI+t2Oscz+JFEqiovcVmRzYvsaIGexu4t62jwehgbJg+G7RfIQevFJ7iRVTS1fV+UZTcPue44nTuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727721772; c=relaxed/simple;
	bh=Nsft0xExql4cKVuw/k9WKak+/9yU7ss0cObUik4dsEs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8JPKoGDQIC39lhuJN/8DP7wsORh2VWWIYQIrz7MLM0DAPQdQA7c0fvLggnVzDr//Q71iwtJ7uaEvkgYriZHh5oHOZlYIeieBVFxC+/BwDbWya5kv3ZDVdAmtyIfPnoHnsR+p9d7PwdCiKOAcVuLPn+daRyHokk4LmFxSyqzf9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AODi7JnQ; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UF4bAW018825;
	Mon, 30 Sep 2024 20:42:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=OF0EkRxjx2yfvIsfLJPafutY
	qdx+PpnWM4Um2ShLhb4=; b=AODi7JnQ8n26NfVKR5wyu6c5g3gJtswanQ93QqsB
	+CyLF+MjoEUuxqwcK84jmP09Ve+ZC0AC/nurpJH1hyo3wxAQUoKhTLJLnRzdyr5t
	aiJ72lGQ1jWVsdv1dWOOiZJcQHv6rKFvcEcsLIJaDNU70Hq0IYlD88OC+AOvILtT
	vhrTcm0UBzupR/RJd62F3Pyb3ZoyEnAdWf46lGpCLjKkEpCaLnzw2DQUSBF6/10h
	1m33ow8DxEHnNA0N1t/vvMrAJpb3XbJaV7r5SoHyeREQFDLj7+xbV+aCQIPnuIhj
	ySo9Amg0Lr30JCUvoLNdvBCqWlYzzKEX8ouym2lGeauhGw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41x77gjd4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 20:42:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6574B4005B;
	Mon, 30 Sep 2024 20:41:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59CBC2A65AC;
	Mon, 30 Sep 2024 20:38:56 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 30 Sep
 2024 20:38:55 +0200
Date: Mon, 30 Sep 2024 20:38:46 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Marek Vasut <marex@denx.de>
CC: <linux-i2c@vger.kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Christoph
 Niedermaier <cniedermaier@dh-electronics.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Pierre-Yves MORDRET
	<pierre-yves.mordret@foss.st.com>,
        <kernel@dh-electronics.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH] i2c: stm32f7: Do not prepare/unprepare clock during
 runtime suspend/resume
Message-ID: <20240930183846.GA1601582@gnbcxd0016.gnb.st.com>
References: <20240928014409.633542-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240928014409.633542-1-marex@denx.de>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Marek,

thanks a lot for the patch.

On Sat, Sep 28, 2024 at 03:43:46AM +0200, Marek Vasut wrote:
> In case there is any sort of clock controller attached to this I2C bus
> controller, for example Versaclock or even an AIC32x4 I2C codec, then
> an I2C transfer triggered from the clock controller clk_ops .prepare
> callback may trigger a deadlock on drivers/clk/clk.c prepare_lock mutex.
> 
> This is because the clock controller first grabs the prepare_lock mutex
> and then performs the prepare operation, including its I2C access. The
> I2C access resumes this I2C bus controller via .runtime_resume callback,
> which calls clk_prepare_enable(), which attempts to grab the prepare_lock
> mutex again and deadlocks.
> 
> Since the clock are already prepared since probe() and unprepared in
> remove(), use simple clk_enable()/clk_disable() calls to enable and
> disable the clock on runtime suspend and resume, to avoid hitting the
> prepare_lock mutex.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index cfee2d9c09de3..65c035728a4fa 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -2395,7 +2395,7 @@ static int __maybe_unused stm32f7_i2c_runtime_suspend(struct device *dev)
>  	struct stm32f7_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>  
>  	if (!stm32f7_i2c_is_slave_registered(i2c_dev))
> -		clk_disable_unprepare(i2c_dev->clk);
> +		clk_disable(i2c_dev->clk);
>  
>  	return 0;
>  }
> @@ -2406,7 +2406,7 @@ static int __maybe_unused stm32f7_i2c_runtime_resume(struct device *dev)
>  	int ret;
>  
>  	if (!stm32f7_i2c_is_slave_registered(i2c_dev)) {
> -		ret = clk_prepare_enable(i2c_dev->clk);
> +		ret = clk_enable(i2c_dev->clk);
>  		if (ret) {
>  			dev_err(dev, "failed to prepare_enable clock\n");

The call now being clk_enable, could you also change the error message
from prepare_enable to enable ?

With that done,
Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

>  			return ret;
> -- 
> 2.45.2
> 

