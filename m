Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5BB189D47
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Mar 2020 14:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgCRNsg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Mar 2020 09:48:36 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:45001 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726961AbgCRNsf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Mar 2020 09:48:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584539315; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=e7D++PiZS2wNSyjtok+pyoNm2YTmDPQke/rQXBiRN5U=; b=PuhlFslr+FQjl5eYC85++7IQ1vZhD2wT2WYaVWM1JCoOHB6sACtDdYS1wqL22Espu1fkC+jG
 Ew6E0pZsJcgF4WXC8eXLAvTE0ByBG36sn4L+DHczDmfXLXcQWQipWvsL9EXpOF67gxvUCWML
 nZ4A9IDfiKlRrr37IJA1coo2x2g=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7226a2.7f4612e53730-smtp-out-n03;
 Wed, 18 Mar 2020 13:48:18 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 29F15C43636; Wed, 18 Mar 2020 13:48:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.8] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AB192C433CB;
        Wed, 18 Mar 2020 13:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AB192C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 7/8] spi: spi-qcom-qspi: Add interconnect support
To:     Evan Green <evgreen@chromium.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wsa@the-dreams.de, Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-8-git-send-email-akashast@codeaurora.org>
 <20200314005817.GN144492@google.com>
 <3aeb3083-2a31-b269-510d-eb608ff14ce5@codeaurora.org>
 <CAE=gft58QsgTCUHMHKJhcM9ZxAeMiY16CrbNv2HaTCRqwtmt7A@mail.gmail.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <e2ee1a60-a379-5c78-355a-64aad451a944@codeaurora.org>
Date:   Wed, 18 Mar 2020 19:18:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAE=gft58QsgTCUHMHKJhcM9ZxAeMiY16CrbNv2HaTCRqwtmt7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Evan,

On 3/18/2020 12:38 AM, Evan Green wrote:
> On Tue, Mar 17, 2020 at 5:13 AM Akash Asthana <akashast@codeaurora.org> wrote:
>> Hi Matthias,
>>
>> On 3/14/2020 6:28 AM, Matthias Kaehlcke wrote:
>>> Hi,
>>>
>>> On Fri, Mar 13, 2020 at 06:42:13PM +0530, Akash Asthana wrote:
>>>> Get the interconnect paths for QSPI device and vote according to the
>>>> current bus speed of the driver.
>>>>
>>>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>>>> ---
>>>>    - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>>>>      path handle
>>>>    - As per Matthias comment, added error handling for icc_set_bw call
>>>>
>>>>    drivers/spi/spi-qcom-qspi.c | 46 ++++++++++++++++++++++++++++++++++++++++++++-
>>>>    1 file changed, 45 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
>>>> index 3c4f83b..ad48f43 100644
>>>> --- a/drivers/spi/spi-qcom-qspi.c
>>>> +++ b/drivers/spi/spi-qcom-qspi.c
>>>> @@ -2,6 +2,7 @@
>>>>    // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
>>>>
>>>>    #include <linux/clk.h>
>>>> +#include <linux/interconnect.h>
>>>>    #include <linux/interrupt.h>
>>>>    #include <linux/io.h>
>>>>    #include <linux/module.h>
>>>> @@ -139,7 +140,10 @@ struct qcom_qspi {
>>>>       struct device *dev;
>>>>       struct clk_bulk_data *clks;
>>>>       struct qspi_xfer xfer;
>>>> -    /* Lock to protect xfer and IRQ accessed registers */
>>>> +    struct icc_path *icc_path_cpu_to_qspi;
>>>> +    unsigned int avg_bw_cpu;
>>>> +    unsigned int peak_bw_cpu;
>>> This triplet is a recurring pattern, and is probably not limited to geni SE/QSPI.
>>> On https://patchwork.kernel.org/patch/11436889/#23221925 I suggested the creation
>>> of a geni SE specific struct, however adding a generic convenience struct to
>>> 'linux/interconnect.h' might be the better solution:
>>>
>>> struct icc_client {
>>>        struct icc_path *path;
>>>        unsigned int avg_bw;
>>>        unsigned int peak_bw;
>>> };
>>>
>>> I'm sure there are better names for it, but this would be the idea.
>> Yeah, I think introducing this to ICC header would be better solution.
> +Georgi
>
> I'm not as convinced this structure is generally useful and belongs in
> the interconnect core. The thing that strikes me as weird with putting
> it in the core is now we're saving these values both inside and
> outside the interconnect core.
IIUC, you meant to say struct icc_req(inside icc_path) will be saving 
avg_bw and peak_bw so no need to save it outside icc_path?
>   In the GENI case here, we only really
> need them to undo the 0 votes we cast during suspend. If "vote for 0
> in suspend and whatever it was before at resume" is a recurring theme,
> maybe the core should give us path_disable() and path_enable() calls
> instead. I'm thinking out loud, maybe Georgi has some thoughts.
>
> Akash, for now if you want to avoid wading into a larger discussion
> maybe just refactor to a common structure local to GENI.

Ok

Thanks,

Akash

>
>
> -Evan

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
