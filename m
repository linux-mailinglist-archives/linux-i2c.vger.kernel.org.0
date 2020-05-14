Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2591D28E4
	for <lists+linux-i2c@lfdr.de>; Thu, 14 May 2020 09:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgENHhl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 May 2020 03:37:41 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:16266 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726073AbgENHhk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 May 2020 03:37:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589441860; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=y4vCCmSr1ZBPDi4lPBD+cRmxDnvjeGEo2YEOpKBr8SQ=; b=GTRSeEapZYp5SgbxxUy4RMvI3kKCWWlAxq5R5kmzQmqIfzQOu1ZWpH9qB3x02vsPIVFU6VjT
 4njU+Ipe3tXNtCOl6Hz/LvXNhHiCjjtvGiDlUdUodiFyCBYmTUr/kTTl7GALEP4+qSHP5CSK
 VkdIkleEFB19XQ/drmDhpxi6sNE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebcf543.7f9c849e23b0-smtp-out-n04;
 Thu, 14 May 2020 07:37:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DBB43C432C2; Thu, 14 May 2020 07:37:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.246] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A39FC43636;
        Thu, 14 May 2020 07:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3A39FC43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V5 4/7] spi: spi-geni-qcom: Add interconnect support
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org, georgi.djakov@linaro.org
References: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
 <1588919619-21355-5-git-send-email-akashast@codeaurora.org>
 <20200508182532.GD4525@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <6a7b8129-6542-042f-e418-c4b49303d944@codeaurora.org>
Date:   Thu, 14 May 2020 13:07:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508182532.GD4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

....

;
>>   
>> +	ret = geni_icc_get(&mas->se, NULL);
>> +	if (ret)
>> +		goto spi_geni_probe_runtime_disable;
>> +	/* Set the bus quota to a reasonable value for register access */
>> +	geni_icc_bw_init(&mas->se.icc_paths[GENI_TO_CORE],
>> +			Bps_to_icc(CORE_2X_50_MHZ), 0);
>> +	geni_icc_bw_init(&mas->se.icc_paths[CPU_TO_GENI], GENI_DEFAULT_BW, 0);
>> +
>> +	/* Set BW for register access */
> This comment doesn't add any value. Register access is mentioned a few lines
> above and from the function name it's evident that it sets the ICC bandwidth.
ok
>
>> +	ret = geni_icc_set_bw(&mas->se);
>>
>> +		return ret;
>>   
>>   	return geni_se_resources_on(&mas->se);
>>   }
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
