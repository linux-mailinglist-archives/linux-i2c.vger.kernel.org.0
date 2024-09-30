Return-Path: <linux-i2c+bounces-7103-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC998ACF0
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 21:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D35991F24AC7
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 19:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C8F199E9B;
	Mon, 30 Sep 2024 19:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Hb6dAy2p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735E4198824
	for <linux-i2c@vger.kernel.org>; Mon, 30 Sep 2024 19:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727724530; cv=none; b=FZGN0/QXwX4Ghf1K1H4rfdnlCEUeeXBp151BDtjUle+RYFIvcN+dUuCawUgjizDSnjcG3JzZI+4RH608gkItd5FrJ/YElH3r0Ovhf2rnqcGl6yTxIJelPw5TZrFEZ3UdsewXs2zEoSFYuOpuKxKpMJzWZJGAiFPpW/WVWGwyBgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727724530; c=relaxed/simple;
	bh=iFxekvfoH9HTJT4KyQw1boUjBPd27tSrrrPzQfp7Oqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LjcMul4daH23y6ZaXZBMfXxh3L0it+8pGmy+hI/QjtLW4tPW3gKChSleBofZJaPWkoryw74Zl5+MtaTZ/8dzpx+1Fah279Yq56ukprNpBe5bssOn2sqQEb2A5Lo6RRax2vYWA9MxPBBGWqkifcDrHVvJQ3icYdUDBLty6ee6vQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Hb6dAy2p; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 23ED788F6F;
	Mon, 30 Sep 2024 21:28:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727724526;
	bh=t/qY0IMBlqjrsWUrE0QFIahgaCYX9DxAmnXrk/Bg8wo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hb6dAy2pWsq/8MeI0tgU2VWJ2EMc6EF31OuTv0rBfAqGjKuOZksHhL/zabTbz3W0z
	 cqjqyVi/hbnT/Sg4qKmZKPbbphmHQNd2zRn5D4Xf1kOEl/6JbjToH3kY2z8I3tOJcb
	 fCPfYXsy1/ENFJtckqAa9ewj3HM8o4GW5XZ88qx2Gw+kadr+nHdOtAZzEu3SU+k/OY
	 utxcvW31NA6E6vZDZbISpdpwyl2h8bDk39Eag/tfvCTvYyFhqjbl93rORmBpMHr3Qd
	 mYCF8Xc+jKquDFGLHXZgTwXi9Wjayct1uwaMdFQmliHzgcS6KYKe6lUotJXIEJWbf0
	 cPfE8z7Zp5pFw==
Message-ID: <3af2014a-9c25-43f8-95d1-0594f273f4f5@denx.de>
Date: Mon, 30 Sep 2024 21:26:49 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: stm32f7: Do not prepare/unprepare clock during
 runtime suspend/resume
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: linux-i2c@vger.kernel.org, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240928014409.633542-1-marex@denx.de>
 <20240930183846.GA1601582@gnbcxd0016.gnb.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240930183846.GA1601582@gnbcxd0016.gnb.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 9/30/24 8:38 PM, Alain Volmat wrote:
> Hi Marek,

Hello Alain,

> thanks a lot for the patch.
> 
> On Sat, Sep 28, 2024 at 03:43:46AM +0200, Marek Vasut wrote:
>> In case there is any sort of clock controller attached to this I2C bus
>> controller, for example Versaclock or even an AIC32x4 I2C codec, then
>> an I2C transfer triggered from the clock controller clk_ops .prepare
>> callback may trigger a deadlock on drivers/clk/clk.c prepare_lock mutex.
>>
>> This is because the clock controller first grabs the prepare_lock mutex
>> and then performs the prepare operation, including its I2C access. The
>> I2C access resumes this I2C bus controller via .runtime_resume callback,
>> which calls clk_prepare_enable(), which attempts to grab the prepare_lock
>> mutex again and deadlocks.
>>
>> Since the clock are already prepared since probe() and unprepared in
>> remove(), use simple clk_enable()/clk_disable() calls to enable and
>> disable the clock on runtime suspend and resume, to avoid hitting the
>> prepare_lock mutex.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alain Volmat <alain.volmat@foss.st.com>
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Andi Shyti <andi.shyti@kernel.org>
>> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-i2c@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> ---
>>   drivers/i2c/busses/i2c-stm32f7.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
>> index cfee2d9c09de3..65c035728a4fa 100644
>> --- a/drivers/i2c/busses/i2c-stm32f7.c
>> +++ b/drivers/i2c/busses/i2c-stm32f7.c
>> @@ -2395,7 +2395,7 @@ static int __maybe_unused stm32f7_i2c_runtime_suspend(struct device *dev)
>>   	struct stm32f7_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>   
>>   	if (!stm32f7_i2c_is_slave_registered(i2c_dev))
>> -		clk_disable_unprepare(i2c_dev->clk);
>> +		clk_disable(i2c_dev->clk);
>>   
>>   	return 0;
>>   }
>> @@ -2406,7 +2406,7 @@ static int __maybe_unused stm32f7_i2c_runtime_resume(struct device *dev)
>>   	int ret;
>>   
>>   	if (!stm32f7_i2c_is_slave_registered(i2c_dev)) {
>> -		ret = clk_prepare_enable(i2c_dev->clk);
>> +		ret = clk_enable(i2c_dev->clk);
>>   		if (ret) {
>>   			dev_err(dev, "failed to prepare_enable clock\n");
> 
> The call now being clk_enable, could you also change the error message
> from prepare_enable to enable ?
> 
> With that done,
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
Fixed in V2, thanks !

