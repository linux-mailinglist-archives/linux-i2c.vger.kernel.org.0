Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9618E1645F2
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2020 14:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgBSNte (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Feb 2020 08:49:34 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:34446 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726551AbgBSNte (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Feb 2020 08:49:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582120174; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=nlOJ2QjC76fp//IJNgKlJ1in/DYwlbd9Ta/pZD7AXdY=; b=xHqG61oYnbQIEuNKZDbtGLUE9Kykcpx8JrP43P1gAi7Kq2wjup1+0fUqVtivIdgVbROmos11
 IDyQ3T4/+lfObnELqWOPAFykOZ1bE0TguJxmn+QqvJ6n/hm91QwPu7qQkR8RCybDFIcQhTcH
 ZzLpc4cik6T3N2vh+KkeGBynOF0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4d3ce1.7fe2ec9228f0-smtp-out-n01;
 Wed, 19 Feb 2020 13:49:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4EA97C447A0; Wed, 19 Feb 2020 13:49:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.252.222.65] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 555F8C43383;
        Wed, 19 Feb 2020 13:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 555F8C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH 6/6] arm64: dts: sc7180: Add interconnect for QUP and QSPI
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org, wsa@the-dreams.de,
        broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
 <1581946205-27189-7-git-send-email-akashast@codeaurora.org>
 <20200218031830.GX955802@ripper>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <f82a28c7-63a4-b0e8-3902-5614dfed0f78@codeaurora.org>
Date:   Wed, 19 Feb 2020 19:19:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218031830.GX955802@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bjorn,

>> +				interconnects = <&qup_virt MASTER_QUP_CORE_0
>> +						&qup_virt SLAVE_QUP_CORE_0>,
>> +						<&gem_noc MASTER_APPSS_PROC
>> +						&config_noc SLAVE_QUP_0>,
>> +						<&aggre1_noc MASTER_QUP_0
>> +						&mc_virt SLAVE_EBI1>;
> Please ignore the 80-char "limit" and write this as:
> 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
> 						<&gem_noc ...>,
> 						<&aggre1_noc ...>;
>
> Regards,
> Bjorn

ok

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
