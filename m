Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0834635EB0
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 16:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbfFEOH6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 10:07:58 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:51154 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbfFEOH6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 10:07:58 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 71635609CD; Wed,  5 Jun 2019 14:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559743677;
        bh=NSod75b8DJcTQooBObsabB98SlwnE/yB22rLx7b7vo4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=VzxwyZGNZQA4zeBv/BThAhOh4uQbB2NV8zcoA2TC+zvKtIofIn3LXJaG+ewtqJxvh
         NaTwokrhZVSDgQ7r2AAWTJteIzwF4ri0ToLKOXwp4hhtdIvNwZSizFetVFjbgNUTiG
         XPYs4T09OT0NHzPW3k2rr0/7uAAzuM3KmD0bJFKA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37D4560213;
        Wed,  5 Jun 2019 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559743676;
        bh=NSod75b8DJcTQooBObsabB98SlwnE/yB22rLx7b7vo4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=AhttVGMIKT/YAg18mc+nO6i4RoK8LFyfN6scj22jM6vBiFF/l/SCvUpWt04O0KpV6
         +mUF+hnGMTEYjCt+Tb22tm+q3krR2EIA03Z09X19U2zXgJXI2dAaykEhNOFKJRgSXJ
         U++evfu2CgTkylaAVJE29JBFO0j69VAJJsdQLidw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37D4560213
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH 7/8] usb: dwc3: qcom: Start USB in 'host mode' on the
 SDM845
To:     Lee Jones <lee.jones@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     balbi@kernel.org, wsa+renesas@sang-engineering.com,
        gregkh@linuxfoundation.org, linus.walleij@linaro.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        david.brown@linaro.org, alokc@codeaurora.org,
        kramasub@codeaurora.org, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, jlhugo@gmail.com,
        linux-arm-kernel@lists.infradead.org
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-7-lee.jones@linaro.org>
 <20190605070029.GN22737@tuxbook-pro> <20190605083454.GO4797@dell>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <d9ba98e6-3caf-62fc-45ca-944cb718b7e4@codeaurora.org>
Date:   Wed, 5 Jun 2019 08:07:54 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605083454.GO4797@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/5/2019 2:34 AM, Lee Jones wrote:
> On Wed, 05 Jun 2019, Bjorn Andersson wrote:
> 
>> On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:
>>
>>> When booting with Device Tree, the current default boot configuration
>>> table option, the request to boot via 'host mode' comes from the
>>> "dr_mode" property.
>>
>> This has been the default on the MTP, but this is changing as this is
>> causing issues when connected downstream from a hub (the typical
>> development case for the primary USB port of a phone like device) and
>> more importantly we don't have support for the PMIC blocks that control
>> VBUS.
> 
> My point is not about which mode is currently chosen.  It's more about
> the capability of choosing which mode is appropriate for a given
> system via DT.
> 
>> Once these issues are resolved the dr_mode would be "otg".
> 
> OTG doesn't work on this H/W, so we need to specify "host" mode.

How have you made that determination?

> 
>>> A property of the same name can be used inside
>>> ACPI tables too.  However it is missing from the SDM845's ACPI tables
>>> so we have to supply this information using Platform Device Properites
>>> instead.
>>>
>>
>> Afaict this would install a fall-back property, so in the case that we
>> have specified dr_mode in DT (or ACPI) that would take precedence. So
> 
> That's correct.
> 
>> the commit message should reflect that this redefines the default choice
>> to be "host", rather than "otg".
> 
> No problem. >
>> Which is in conflict with what's described for dr_mode in
>> Documentation/devicetree/bindings/usb/generic.txt
> 
> This implementation only affects ACPI based platforms.  When booting
> with DT, the description in that DT related document is still
> accurate.
> 
>> And this driver is used on a range of different Qualcomm platforms, so I
>> don't think this is SDM845 specific.
> 
> ACPI based platforms?
> 
> All the ones I've seen use the XHCI USB driver directly ("PNP0D10").
>   
>>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
>>> ---
>>>   drivers/usb/dwc3/dwc3-qcom.c | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>>> index 349bf549ee44..f21fdd6cdd1a 100644
>>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>>> @@ -468,6 +468,11 @@ static const struct acpi_device_id dwc3_qcom_acpi_match[] = {
>>>   };
>>>   MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
>>>   
>>> +static const struct property_entry dwc3_qcom_acpi_properties[] = {
>>> +	PROPERTY_ENTRY_STRING("dr_mode", "host"),
>>> +	{}
>>> +};
>>> +
>>>   static int dwc3_qcom_probe(struct platform_device *pdev)
>>>   {
>>>   	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
>>> @@ -603,6 +608,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>>   			goto platform_unalloc;
>>>   		}
>>>   
>>> +		ret = platform_device_add_properties(qcom->dwc3,
>>> +						     dwc3_qcom_acpi_properties);
>>> +		if (ret < 0) {
>>> +			dev_err(&pdev->dev, "failed to add properties\n");
>>> +			goto platform_unalloc;
>>> +		}
>>> +
>>>   		ret = platform_device_add(qcom->dwc3);
>>>   		if (ret) {
>>>   			dev_err(&pdev->dev, "failed to add device\n");
> 


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
