Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AAE0288303
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Oct 2020 08:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbgJIGxy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Oct 2020 02:53:54 -0400
Received: from z5.mailgun.us ([104.130.96.5]:35058 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726432AbgJIGxy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Oct 2020 02:53:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602226434; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YDkhWM48cAkdMOYBmNFvGoMUdH8DwI8lrMxm58+8ZjQ=; b=jVB485LRL2y90tS/Prun6yyeQ49Om0i2lodXiTLL1xBrw5jfYAJmL6rVRP+3hx+l98nfOabX
 OpwhGsuHrl+yoYkJDz6dwN825/5M3UdFPmUzcVfCmKDfCIKO66QN3KoSX7xbRrW8v8bIxiD7
 Z1GZlS6jEAs8vqKjjWBreT8Om7M=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f80090157b88ccb567e4b60 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Oct 2020 06:53:53
 GMT
Sender: msavaliy=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7F66EC433C9; Fri,  9 Oct 2020 06:53:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.8] (unknown [106.213.185.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: msavaliy)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B2D7BC433CB;
        Fri,  9 Oct 2020 06:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B2D7BC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=msavaliy@codeaurora.org
Subject: Re: [PATCH 5/5] i2c: geni: sdm845: dont perform DMA for the oneplus6
To:     Wolfram Sang <wsa@kernel.org>, Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>,
        ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201007174736.292968-1-caleb@connolly.tech>
 <20201007174736.292968-6-caleb@connolly.tech>
 <20201008100352.GF76290@ninjato>
From:   "Mukesh, Savaliya" <msavaliy@codeaurora.org>
Message-ID: <5243ff4c-f08a-d9ff-ab1d-cadfa84171b8@codeaurora.org>
Date:   Fri, 9 Oct 2020 12:23:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201008100352.GF76290@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 10/8/2020 3:33 PM, Wolfram Sang wrote:
> On Wed, Oct 07, 2020 at 05:49:35PM +0000, Caleb Connolly wrote:
>> The OnePlus 6/T has the same issues as the c630 causing a crash when DMA
>> is used for i2c, so disable it.
>>
>> https://patchwork.kernel.org/patch/11133827/
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Reviewed-by: Mukesh Kumar Savaliya <msavaliy@codeaurora.org>
> May I ask for a quick review here, so we can get this into 5.9 if
> qcom-geni maintainers agree this is good to go?
>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index dead5db3315a..50a0674a6553 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -358,7 +358,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   	struct geni_se *se = &gi2c->se;
>>   	size_t len = msg->len;
>>   
>> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
>> +	if (!of_machine_is_compatible("lenovo,yoga-c630") &&
>> +	    !of_machine_is_compatible("oneplus,oneplus6"))
>>   		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>>   
>>   	if (dma_buf)
>> @@ -400,7 +401,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   	struct geni_se *se = &gi2c->se;
>>   	size_t len = msg->len;
>>   
>> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
>> +	if (!of_machine_is_compatible("lenovo,yoga-c630") &&
>> +	    !of_machine_is_compatible("oneplus,oneplus6"))
>>   		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>>   
>>   	if (dma_buf)
>> -- 
>> 2.28.0
>>
>>
