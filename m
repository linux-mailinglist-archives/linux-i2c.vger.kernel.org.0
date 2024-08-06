Return-Path: <linux-i2c+bounces-5164-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD07948FA2
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 14:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDB1F1C20AE0
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 12:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0741C461A;
	Tue,  6 Aug 2024 12:55:12 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEBF1C3F25;
	Tue,  6 Aug 2024 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722948912; cv=none; b=CJXifd+nbt9j7CPF2EubxmnsM2RHWHya9FeNBLGtLYyrBrD2ynR/QHojue8z3s6IcviZb3NbfY9IL91iD8NJFzqL14liRVh434hKlBb2pX7rlJV6P9ma/xjWd9QgfvtbsrzOrVLW+1fHBLyhsKa56yDWJclOJ51egyGwqONkV+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722948912; c=relaxed/simple;
	bh=CXm6TG2nPEce1l+pwq2K5WHRyrTkIDixKKmT/xQhp4M=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=vFFiMhLQeeGwzbCi4ndA7QgFEG9uvtcR9Ml25Oa6Mgh3TtW/Js9XjOxp6EUMG6py7JrpwiRdtbrbdEkxAQGuaQLypbAXwv0iNAI9pNVd8ePFV8HzTVHPLIE9tL40ilwLEqUvxptLX2AILIS5sVBXZEnEmy0D+a6fTun2yqHdcjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WdYBl4kCPz1xtys;
	Tue,  6 Aug 2024 20:53:19 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 847D5140157;
	Tue,  6 Aug 2024 20:55:07 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 6 Aug 2024 20:55:07 +0800
Subject: Re: [PATCH -next] i2c: qcom-geni: Add missing clk_disable_unprepare
 in geni_i2c_runti
To: Andi Shyti <andi.shyti@kernel.org>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <20240803061041.283940-1-cuigaosheng1@huawei.com>
 <a12d2ec6-07b1-4577-8bed-981024c5cc9c@linaro.org>
 <2w4bpzbrem77q2xr4pdo7ual4vh3pgvsbdxhphhtp53qwtch65@36h2nzb2sk5j>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <5f1384aa-43c9-9d25-c857-ce5fd3fbd7e2@huawei.com>
Date: Tue, 6 Aug 2024 20:55:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2w4bpzbrem77q2xr4pdo7ual4vh3pgvsbdxhphhtp53qwtch65@36h2nzb2sk5j>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200011.china.huawei.com (7.221.188.251)

Thanks for your time!

> Are you going to take care of this, as well?
>
> Thanks,
> Andi
I've made and submitted a patch, thanks again.

On 2024/8/6 1:11, Andi Shyti wrote:
> Hi Gaosheng,
>
> On Mon, Aug 05, 2024 at 12:21:53AM GMT, Vladimir Zapolskiy wrote:
>> On 8/3/24 09:10, Gaosheng Cui wrote:
>>> Add the missing clk_disable_unprepare() before return in
>>> geni_i2c_runti().
>> The function name above is scrambled, it should be geni_i2c_runtime_resume().
> with the function names fixed, merged into i2c/i2c-host-fixes.
>
>>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>>> ---
>>>    drivers/i2c/busses/i2c-qcom-geni.c | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>>> index 0a8b95ce35f7..78f43648e9f3 100644
>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>> @@ -990,8 +990,10 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>>>    		return ret;
>>>    	ret = geni_se_resources_on(&gi2c->se);
>>> -	if (ret)
>>> +	if (ret) {
>>> +		clk_disable_unprepare(gi2c->core_clk);
>>>    		return ret;
>>> +	}
>>>    	enable_irq(gi2c->irq);
>>>    	gi2c->suspended = 0;
>> The fix is correct, thank you.
>>
>> FWIW there is another missed call of geni_icc_disable(&gi2c->se) on the error paths.
> Are you going to take care of this, as well?
>
> Thanks,
> Andi
>
>> Fixes: 14d02fbadb5d ("i2c: qcom-geni: add desc struct to prepare support for I2C Master Hub variant")
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>
>> --
>> Best wishes,
>> Vladimir
> .

