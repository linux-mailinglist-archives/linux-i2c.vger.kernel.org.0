Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6DF51A07E9
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 09:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbgDGHFL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 03:05:11 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:28495 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726725AbgDGHFL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 03:05:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586243110; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=K1eI3g+2rywz52WFACcRvLb0O+4g0wn80XeZz5PXkfk=; b=UlWvM2oU5WCrk94+JyIntBCAsleXuiDgChEAgHnWoCVf2s/ihXA1eBAmsMsoVbd05q5MqJ/U
 2SM9S12iRbxo3OhP1Y4SoN0HqknA27ZKQQSANJZ1ls7lzzlVQuh1TrcTkyDwyfek4COdyb2C
 b5WFifb3rZSS375/rKJ7s2ha5nM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8c2616.7f5ce1cad1f0-smtp-out-n02;
 Tue, 07 Apr 2020 07:04:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2ACDC4478C; Tue,  7 Apr 2020 07:04:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.6] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ABF36C433F2;
        Tue,  7 Apr 2020 07:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ABF36C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V3 4/8] i2c: i2c-qcom-geni: Add interconnect support
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, georgi.djakov@linaro.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-5-git-send-email-akashast@codeaurora.org>
 <20200331184939.GI199755@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <872c2c0a-6612-07db-abc2-2ee0c15fdbb2@codeaurora.org>
Date:   Tue, 7 Apr 2020 12:34:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331184939.GI199755@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi  Matthias,

On 4/1/2020 12:19 AM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> On Tue, Mar 31, 2020 at 04:39:32PM +0530, Akash Asthana wrote:
>> Get the interconnect paths for I2C based Serial Engine device
>> and vote according to the bus speed of the driver.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>> Changes in V2:
>>   - As per Bjorn's comment, removed se == NULL check from geni_i2c_icc_get
>>   - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
>>   - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>>     path handle
>>   - As per Matthias comment, added error handling for icc_set_bw call
>>
>> Changes in V3:
>>   - As per Matthias comment, use common library APIs defined in geni-se
>>     driver for ICC functionality.
>>
>>   drivers/i2c/busses/i2c-qcom-geni.c | 30 +++++++++++++++++++++++++++++-
>>   1 file changed, 29 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 18d1e4f..373c2ca 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -557,6 +557,26 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   	gi2c->adap.dev.of_node = dev->of_node;
>>   	strlcpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
>>   
>> +	ret = geni_icc_get(&gi2c->se, "qup-core", "qup-config", "qup-memory");
>> +	if (ret)
>> +		return ret;
>> +	/*
>> +	 * Set the bus quota for core and cpu to a reasonable value for
>> +	 * register access.
>> +	 * Set quota for DDR based on bus speed, assume peak requirement
>> +	 * as twice of avg bw.
>> +	 */
>> +	gi2c->se.to_core.avg_bw = GENI_DEFAULT_BW;
>> +	gi2c->se.to_core.peak_bw = Bps_to_icc(CORE_2X_100_MHZ);
>> +	gi2c->se.from_cpu.avg_bw = GENI_DEFAULT_BW;
>> +	gi2c->se.from_cpu.peak_bw = GENI_DEFAULT_BW;
>> +	gi2c->se.to_ddr.avg_bw = Bps_to_icc(gi2c->clk_freq_out);
>> +	gi2c->se.to_ddr.peak_bw = Bps_to_icc(2 * gi2c->clk_freq_out);
>> +
>> +	ret = geni_icc_vote_on(&gi2c->se);
>> +	if (ret)
>> +		return ret;
>> +
>>   	ret = geni_se_resources_on(&gi2c->se);
>>   	if (ret) {
>>   		dev_err(dev, "Error turning on resources %d\n", ret);
> I think you need to call geni_icc_vote_off() here and in other error paths.

No need to add geni_icc_vote_off() on error paths because we are using 
devm_of_icc_get to get ICC path handle.

If we are going to fail probe then "devm_icc_release---->icc_put" will 
set votes to 0 on each path. https://patchwork.kernel.org/patch/11467507/

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
