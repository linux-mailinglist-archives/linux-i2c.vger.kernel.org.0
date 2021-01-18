Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C658E2F9954
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 06:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731752AbhARFhe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 00:37:34 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:49891 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731743AbhARFhd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 00:37:33 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610948227; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=TjYdGssVsPJFHu21J0UDvrX/gV9OIWsRXIPK5jhOiOg=; b=Ba+iJkvRTtFCQsGypOZ+OJPKmTmB0r+XBTIk9apoYnLYc3b0hmuI8Cg6uqw5uEeQLuimmrWc
 fENOLjHWejAaq//KCyMpPRiNaGKUYIyKEBIJksmE8Eo3byNNMlvFNqBr76qg2TcV+KxBrB4m
 vr+VPSjLHRnGxB9cdR64lDdIZ/0=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 60051e59e23dedcc3a9bf135 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Jan 2021 05:36:25
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11DDDC43465; Mon, 18 Jan 2021 05:36:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.120] (unknown [49.207.201.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E82BDC433C6;
        Mon, 18 Jan 2021 05:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E82BDC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 3/3] i2c: i2c-qcom-geni: Add support for
 'assigned-performance-states'
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc:     robh+dt@kernel.org, wsa@kernel.org, swboyd@chromium.org,
        dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, parashar@codeaurora.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linux-i2c@vger.kernel.org
References: <20201224111210.1214-1-rojay@codeaurora.org>
 <20201224111210.1214-4-rojay@codeaurora.org> <YAGqKfDfB7EEuZVn@builder.lan>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <6bfec3e6-3d26-7ade-d836-032273856ce2@codeaurora.org>
Date:   Mon, 18 Jan 2021 11:06:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YAGqKfDfB7EEuZVn@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 1/15/2021 8:13 PM, Bjorn Andersson wrote:
> On Thu 24 Dec 05:12 CST 2020, Roja Rani Yarubandi wrote:
> 
>> @@ -629,6 +658,16 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>>   	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>>   
>>   	disable_irq(gi2c->irq);
>> +
>> +	/* Drop the assigned performance state */
>> +	if (gi2c->assigned_pstate) {
>> +		ret = dev_pm_genpd_set_performance_state(dev, 0);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to set performance state\n");
>> +			return ret;
>> +		}
>> +	}
>> +
> 
> Ulf, Viresh, I think we discussed this at the time of introducing the
> performance states.
> 
> The client's state does not affect if its performance_state should
> be included in the calculation of the aggregated performance_state, so
> each driver that needs to keep some minimum performance state needs to
> have these two snippets.
> 
> Would it not make sense to on enable/disable re-evaluate the
> performance_state and potentially reconfigure the hardware
> automatically?

I agree, this will be repeated across multiple drivers which would
need some minimal vote while they are active, handling this during
genpd enable/disable in genpd core makes sense.

> 
> Regards,
> Bjorn
> 
>>   	ret = geni_se_resources_off(&gi2c->se);
>>   	if (ret) {
>>   		enable_irq(gi2c->irq);
>> @@ -654,6 +693,16 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	/* Set the assigned performance state */
>> +	if (gi2c->assigned_pstate) {
>> +		ret = dev_pm_genpd_set_performance_state(dev,
>> +							 gi2c->assigned_pstate);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to set performance state\n");
>> +			return ret;
>> +		}
>> +	}
>> +
>>   	enable_irq(gi2c->irq);
>>   	gi2c->suspended = 0;
>>   	return 0;
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
