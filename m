Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26DE51A218A
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 14:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgDHMRf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 08:17:35 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:35244 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727798AbgDHMRf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 08:17:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586348254; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=k3YztnopJljpDNhUQCDDNG8AGHekob6hja/cRl7AZTw=; b=UFNn/xH+D+wUgqGnBt1SftP8ZbOq6NO64OZ2QaJeWKKdbqRO8lCR3P68ouFuTRWGouAjjP0L
 vyJjog9Ma8aJPJ/QPAbe/k8BwOttkM4bzwNWLIir9IXpSqxNdduWK6/W90oGfPmF1IQdEkqN
 Q0emlana+hBQgIKoWD4N+jfiip4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dc0de.7fb8db3359d0-smtp-out-n04;
 Wed, 08 Apr 2020 12:17:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11216C43636; Wed,  8 Apr 2020 12:17:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.6] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7BE5AC433F2;
        Wed,  8 Apr 2020 12:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7BE5AC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V3 7/8] spi: spi-qcom-qspi: Add interconnect support
To:     Mark Brown <broonie@kernel.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de,
        mark.rutland@arm.com, robh+dt@kernel.org, georgi.djakov@linaro.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-8-git-send-email-akashast@codeaurora.org>
 <20200331112352.GB4802@sirena.org.uk>
 <f896d6e4-cc86-db46-a9b9-d7c98071b524@codeaurora.org>
 <20200407105542.GA5247@sirena.org.uk>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <48c60fdf-03c6-650a-2671-b8f7cc1e5c82@codeaurora.org>
Date:   Wed, 8 Apr 2020 17:47:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407105542.GA5247@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mark, Evan, Georgi,

On 4/7/2020 4:25 PM, Mark Brown wrote:
> On Tue, Apr 07, 2020 at 03:24:42PM +0530, Akash Asthana wrote:
>> On 3/31/2020 4:53 PM, Mark Brown wrote:
>>>> +	ctrl->avg_bw_cpu = Bps_to_icc(speed_hz);
>>>> +	ctrl->peak_bw_cpu = Bps_to_icc(2 * speed_hz);
>>> I thought you were going to factor this best guess handling of peak
>>> bandwidth out into the core?
>> I can centralize this for SPI, I2C and UART  in Common driver(QUP wrapper)
>> but still for QSPI I have to keep this piece of code as is because It is not
>> child of QUP wrapper(it doesn't use common code).
> Why not?
>
>> I am not sure whether I can move this " Assume peak_bw as twice of avg_bw if
>> nothing is mentioned explicitly" to ICC core because the factor of 2 is
>> chosen randomly by me.
> That's the whole point - if this is just a random number then we may as
> well at least be consistently random.

Can we centralize below logic of peak_bw selection for all the clients 
to ICC core?

"Assume peak_bw requirement as twice of avg_bw, if it is not mentioned 
explicitly"

===========================================================================
int icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw)
{
         struct icc_node *node;
         u32 old_avg, old_peak;
         size_t i;
         int ret;

         if (!path)
                 return 0;

         if (WARN_ON(IS_ERR(path) || !path->num_nodes))
                 return -EINVAL;

+       /*
+        * Assume peak_bw requirement as twice of avg_bw, if it is not
+        * mentioned explicitly
+        */
+       peak_bw = peak_bw ? peak_bw : 2 * avg_bw;
===========================================================================

In case if some client really don't want to put peak requirement they 
can pass avg_bw = peak_bw. As peak_bw <= avg_bw is kind of no-ops.

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
