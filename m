Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 178FB18CB81
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 11:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgCTKWz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 06:22:55 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:41141 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727082AbgCTKWz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Mar 2020 06:22:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584699774; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=60JbKnWdQrMgDSn6i45yRk/lB+J1ZqLUwhRcp62dqQc=; b=ni0cjPzCGWPESzbo5+A4nHCxeeyRa6S1YKB0tVSMYrbSHeH1NVGXOQOcnKOzJ7elBYKG3dnJ
 pliqAfy6Ph1krEEMPZG19Rw0BPjH7RrS76sbQNKZyIJ0oB3ISKxw373cEZ/vwMzfUxMeWaBh
 eKVMluSCzGr+YiQTIKb+NExZJAU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e74996d.7f9ac9a792d0-smtp-out-n02;
 Fri, 20 Mar 2020 10:22:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8FEA0C43637; Fri, 20 Mar 2020 10:22:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9238C433CB;
        Fri, 20 Mar 2020 10:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9238C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 3/8] soc: qcom-geni-se: Add interconnect support to fix
 earlycon crash
To:     "Matthias Kaehlcke <mka@chromium.org> Evan Green" 
        <evgreen@chromium.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-4-git-send-email-akashast@codeaurora.org>
 <20200313204441.GJ144492@google.com>
 <1f86fdf0-df7c-4e4a-d4d8-8b0162e52cb4@codeaurora.org>
 <20200317182910.GR144492@google.com>
 <3831b33c-93ee-e5e0-fcfb-530b4738f930@codeaurora.org>
 <20200319194332.GA60149@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <a7227a1f-00a1-0818-80f3-904fe264f864@codeaurora.org>
Date:   Fri, 20 Mar 2020 15:52:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319194332.GA60149@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Evan, Matthias,

On 3/20/2020 1:13 AM, Matthias Kaehlcke wrote:
> On Wed, Mar 18, 2020 at 02:24:35PM +0530, Akash Asthana wrote:
>> Hi Matthias,
>>
>> On 3/17/2020 11:59 PM, Matthias Kaehlcke wrote:
>>> Hi Akash,
>>>
>>> On Tue, Mar 17, 2020 at 04:27:47PM +0530, Akash Asthana wrote:
>>>> Hi Matthias,
>>>>
>>>> On 3/14/2020 2:14 AM, Matthias Kaehlcke wrote:
>>>>> Hi Akash,
>>>>>
>>>>> On Fri, Mar 13, 2020 at 06:42:09PM +0530, Akash Asthana wrote:
>>>>>> V1 patch@https://patchwork.kernel.org/patch/11386469/ caused SC7180 system
>>>>>> to reset at boot time.
>>>>> The v1 patch isn't relevant in the commit message, please just describe the
>>>>> problem. Also the crash only occurs when earlycon is used.
>>>> ok
>>>>>> As QUP core clock is shared among all the SE drivers present on particular
>>>>>> QUP wrapper, the reset seen is due to earlycon usage after QUP core clock
>>>>>> is put to 0 from other SE drivers before real console comes up.
>>>>>>
>>>>>> As earlycon can't vote for it's QUP core need, to fix this add ICC
>>>>>> support to common/QUP wrapper driver and put vote for QUP core from
>>>>>> probe on behalf of earlycon and remove vote during sys suspend.
>>>>> Only removing the vote on suspend isn't ideal, the system might never get
>>>>> suspended. That said I don't have a really good alternative suggestion.
>>>>>
>>>>> One thing you could possibly do is to launch a delayed work, check
>>>>> console_device() every second or so and remove the vote when it returns
>>>>> non-NULL. Not claiming this would be a great solution ...
>>>>>
>>>>> The cleanest solution might be a notifier when the early console is
>>>>> unregistered, it seems somewhat over-engineered though ... Then again
>>>>> other (future) uart drivers with interconnect support might run into
>>>>> the same problem.
>>>> We are hitting this problem because QUP core clocks are shared among all the
>>>> SE driver present in particular QUP wrapper, if other HW controllers has
>>>> similar architecture we will hit this issue.
>>>>
>>>> How about if we expose an API from common driver(geni-se) for putting QUP
>>>> core BW vote to 0.
>>>>
>>>> We call this from console probe just after uart_add_one_port call (console
>>>> resources are enabled as part of this call) to put core quota to 0 on behalf
>>>> of earlyconsole?
>>>   From my notes from earlier debugging I have doubts this would work:
>>>
>>>     There is a short window where the early console and the 'real' console coexist:
>>>
>>>     [    3.858122] printk: console [ttyMSM0] enabled
>>>     [    3.875692] printk: bootconsole [qcom_geni0] disabled
>>>
>>>     The reset probably occurs when the early console tries to write, but the ICC
>>>     is effectively disabled because ttyMSM0 and the other geni ports are runtime
>>>     suspended.
>> Code flow from console driver probe(qcom_geni_serial.c)
>>
>> uart_add_one_port--->uart_configure_port--->{ 1) uart_change_pm(enable
>> console resources)  2)register_console(boot to real console switch happens
>> here)}
>>
>> Console resources are not disabled from anywhere before the switch happens
>> completely. I meant to say until we saw below logs.
>>
>> [    3.875692] printk: bootconsole [qcom_geni0] disabled
>>
>> I think the board reset issue cannot occur during the window where early
>> console and 'real' console coexist.
> Thanks for the clarification! Indeed my notes were only a hypothesis, I
> don't see evidence that there is an actual downvote shortly after console
> registration.
>
>> I have validated proposed solution by me, it is working fine.
>>
>> Currently voting is done for every QUP and not only to which earlycon is
>> connect, with the above approach we can't remove vote from other QUPs.
>>
>> However we can limit voting only to earlycon QUP by removing interconnect
>> from DT node of other QUPs.
>>
>> I am not sure how clean is this solution.
> I'm more inclined towards a solution along the lines of what Evan
> proposed, i.e. delaying the votes (either in geni or ICC) until we
> are ready.

Based on discussion I think the delayed solution is most suited if 
implemented in ICC core because other ICC client might face the similar 
problem.

However for geni case I am more inclined towards below proposed solution.

-----------------------------------------------------------------------------------------------------

How about if we expose an API from common driver(geni-se) for putting QUP
core BW vote to 0.

We call this from console probe just after uart_add_one_port call (console
resources are enabled as part of this call) to put core quota to 0 on behalf
of earlyconsole?
---------------------------------------------------------------------------

I think below are the pros and cons for above solution.

Pros:

1) Not only it'll solve the current issue also it'll lay foundation to 
support earlyconsole without having a real console. In future if needed 
we can enable rest of the earlyconsole resources(SE clocks) from common 
driver to make it independent of real console.

2) Inorder to solve bug:120934049(Add runtime PM support to common 
driver and move enablement/disablement of AHB clocks there) reported by 
Stephen Boyd, we'll end up adding ICC support to this driver because as 
per HPG the order of enabling the QUP clocks should be 
(Core-->AHB-->SE(per engine)). So we need to have the minimal possible 
vote on QUP core before enabling AHB clocks.

I agree still we have keep earlycon fix as it is(vote from common driver 
probe and remove once real console is up) .

I mentioned above bug in case it seems silly to add ICC support to 
common driver just for earlyconsole fix.

Cons:

1) As Evan mentioned and I agree that the whole house of cards comes 
down if we replace these votes in the wrong order. But I think this is 
very unlikely to happen once fixed.

2) As Matthias mentioned we are voting for all the QUPs regardless 
earlycon is present or not, I think this is HW limitation and we have to 
live with it.

Even if I try something like below the QUP1 can come up before 
QUP2(console) and child of QUP1 can remove vote from share QUP clocks.

if (of_get_compatible_child(pdev->dev.of_node, "qcom,geni-debug-uart")) {

     ret = icc_set_bw(wrapper->icc_path_geni_to_core, Bps_to_icc(1000),

         Bps_to_icc(1000));

}


Thanks,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
