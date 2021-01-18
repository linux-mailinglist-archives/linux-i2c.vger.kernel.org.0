Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A22652F996A
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 06:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732088AbhARFlF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 00:41:05 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:21736 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732019AbhARFkm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 00:40:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610948423; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=uHzxGrf8G3zeYX2HaPoNqsgtQtnnIbLvf2LA8dS+iTk=; b=M1hRgroszKgJU+IjSGW03tQ95OrQbGF8fUL6xFEnYRh+5G0EVzLfI1tFXtZU2fHl+S15BWLl
 G0tFJ6JpBnB2lxRKvc50Z0yAphHccAjv9r56LXRBpK5rMcSlaiWZjXgy9vrPOSfeh0xF9zJb
 zZYmmSMO8qMHBhlHhSHtEc9YLHA=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 60051f28fd7e724dd3dca9f4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Jan 2021 05:39:52
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 059CAC43461; Mon, 18 Jan 2021 05:39:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.120] (unknown [49.207.201.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68450C433C6;
        Mon, 18 Jan 2021 05:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 68450C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 1/3] dt-bindings: power: Introduce
 'assigned-performance-states' property
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     ulf.hansson@linaro.org, robh+dt@kernel.org, wsa@kernel.org,
        swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, mka@chromium.org,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        parashar@codeaurora.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        linux-i2c@vger.kernel.org
References: <20201224111210.1214-1-rojay@codeaurora.org>
 <20201224111210.1214-2-rojay@codeaurora.org> <YAG/pNXQOS+C2zLr@builder.lan>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <c7824b62-98bb-8327-1769-3fdb99b361a3@codeaurora.org>
Date:   Mon, 18 Jan 2021 11:09:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YAG/pNXQOS+C2zLr@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 1/15/2021 9:45 PM, Bjorn Andersson wrote:
> On Thu 24 Dec 05:12 CST 2020, Roja Rani Yarubandi wrote:
> 
>> While most devices within power-domains which support performance states,
>> scale the performance state dynamically, some devices might want to
>> set a static/default performance state while the device is active.
>> These devices typically would also run off a fixed clock and not support
>> dynamically scaling the device's performance, also known as DVFS
>> techniques.
>>
>> Add a property 'assigned-performance-states' which client devices can
>> use to set this default performance state on their power-domains.
>>
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> ---
>>   .../bindings/power/power-domain.yaml          | 49 +++++++++++++++++++
>>   1 file changed, 49 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
>> index aed51e9dcb11..a42977a82d06 100644
>> --- a/Documentation/devicetree/bindings/power/power-domain.yaml
>> +++ b/Documentation/devicetree/bindings/power/power-domain.yaml
>> @@ -66,6 +66,18 @@ properties:
>>         by the given provider should be subdomains of the domain specified
>>         by this binding.
>>   
>> +  assigned-performance-states:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description:
>> +       Some devices might need to configure their power domains in a default
>> +       performance state while the device is active. These devices typcially
>> +       would also run off a fixed clock and not support dynamically scaling
>> +       the device's performance, also known as DVFS techniques. Each cell in
>> +       performance state value corresponds to one power domain specified as
>> +       part of the power-domains property. Performance state value can be an
>> +       opp-level inside an OPP table of the power-domain and need not match
>> +       with any OPP table performance state.
>> +
>>   required:
>>     - "#power-domain-cells"
>>   
>> @@ -131,3 +143,40 @@ examples:
>>               min-residency-us = <7000>;
>>           };
>>       };
>> +
>> +  - |
>> +    parent4: power-controller@12340000 {
>> +        compatible = "foo,power-controller";
>> +        reg = <0x12340000 0x1000>;
>> +        #power-domain-cells = <0>;
>> +    };
>> +
>> +    parent5: power-controller@43210000 {
>> +        compatible = "foo,power-controller";
>> +        reg = <0x43210000 0x1000>;
>> +        #power-domain-cells = <0>;
>> +        operating-points-v2 = <&power_opp_table>;
>> +
>> +        power_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            power_opp_low: opp1 {
>> +                opp-level = <16>;
>> +            };
>> +
>> +            rpmpd_opp_ret: opp2 {
>> +                opp-level = <64>;
>> +            };
>> +
>> +            rpmpd_opp_svs: opp3 {
>> +                opp-level = <256>;
>> +            };
>> +        };
>> +    };
>> +
>> +    child4: consumer@12341000 {
>> +        compatible = "foo,consumer";
>> +        reg = <0x12341000 0x1000>;
>> +        power-domains = <&parent4>, <&parent5>;
>> +        assigned-performance-states = <0>, <256>;
> 
> May I ask how this is different from saying something like:
> 
> 	required-opps = <&??>, <&rpmpd_opp_svs>:

I think its potentially the same. We just don't have any code to handle this
binding in kernel yet (when this property is part of the device/consumer node)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
