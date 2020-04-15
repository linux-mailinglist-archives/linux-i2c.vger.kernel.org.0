Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E0B1A9B78
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 12:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441192AbgDOKy1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 06:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441190AbgDOKyV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 06:54:21 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B72CC061A10
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 03:54:20 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id d27so9359884wra.1
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 03:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N5achumHbyhd7pAEpLAvWmDnK4L9orFHPx3MDqdGic0=;
        b=vbJ7rOV0wR/LUZcYwSBUqIAoh50IC66nIOBJIOymEnqWGZFxPAoxoL58zbrXjNZJP5
         3jOa7Bk6zMW9j5w9AmwGnZ6Jpr9HXhF46KbxE58T5a2xTGCx+zxtqLPFE3QtUIaqCznm
         /Ql9qYg/J5OnmNwi/Jub65h5MpHxHGYNAvOY3RSIXTLHQAVwvM7RoyHYNo+uSHmujtoc
         ZYfzBeopVfidJT2oWkmAe7y2jiszM7R+nFAkwpEFTIYWmGfKTSUJIss4RjTgXxPU57qQ
         r1/8yBMDRG7NZsSpPC89kvwVHXiG+TjDKxi9mbP2Gc6ENhHMF2ihWpSTHJwgRMrlG7hc
         a/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N5achumHbyhd7pAEpLAvWmDnK4L9orFHPx3MDqdGic0=;
        b=Q6QGhRVIc7ky4DnN8GfxpFVCTKoTQF5V6VqmfEO9n+LdKB7T8UNw7keh9ct9zhkUKs
         I7EvrrSxDZu4vrtcZA6d05pUKf70lY4LIsH6rcn6xW392eDXEI9DnUupeojn3UaQHrcg
         REdk5f8YH/f9kuQTQUlVngu1m6XKVTfVXjiQVDtDE9vhw2CBF0Qp+XezDQb8EKhMjJC5
         wuUvppckz+AV255h9ph9iCYe2fkXTGBsqMPCU/WcmYWPDDSiveikhLhOlczOkQMlukuh
         bMoQWZNTkoosAiy5WYGeHB7mbKzgz6XVn1CDPwalkEJYUl4loE3JLxF6ZaTdaL9XsfAT
         9gzg==
X-Gm-Message-State: AGi0PuZMHx/vWyoVIyEZHnBucjrok8E3uBcdKd/adwKcbhfsUuX/QV3k
        Q6hkY1fxzofA2jYydM4eApnYxQ==
X-Google-Smtp-Source: APiQypJzWzAuH9J0oAP/CwcaigLX+6VY3cfSnNSog0Vu5MnQCvINZqLpelMLG0YDScc+sYv7sdMCcA==
X-Received: by 2002:a5d:5189:: with SMTP id k9mr1072209wrv.3.1586948058564;
        Wed, 15 Apr 2020 03:54:18 -0700 (PDT)
Received: from [192.168.0.136] ([87.120.218.65])
        by smtp.googlemail.com with ESMTPSA id k3sm13384202wru.90.2020.04.15.03.54.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Apr 2020 03:54:17 -0700 (PDT)
Subject: Re: [PATCH V3 7/8] spi: spi-qcom-qspi: Add interconnect support
To:     Akash Asthana <akashast@codeaurora.org>,
        Mark Brown <broonie@kernel.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de,
        mark.rutland@arm.com, robh+dt@kernel.org,
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
 <48c60fdf-03c6-650a-2671-b8f7cc1e5c82@codeaurora.org>
 <5644ef02-f984-0f5b-d745-eca3c9573726@linaro.org>
 <eca0e6a7-effe-022c-e90e-c0672991251d@codeaurora.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <1354a27f-217b-c530-c093-d2a5d3df99b2@linaro.org>
Date:   Wed, 15 Apr 2020 13:54:16 +0300
MIME-Version: 1.0
In-Reply-To: <eca0e6a7-effe-022c-e90e-c0672991251d@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

On 4/10/20 10:31, Akash Asthana wrote:
> Hi Georgi,
> 
> On 4/9/2020 6:47 PM, Georgi Djakov wrote:
>> Hi Akash,
>>
>> On 4/8/20 15:17, Akash Asthana wrote:
>>> Hi Mark, Evan, Georgi,
>>>
>>> On 4/7/2020 4:25 PM, Mark Brown wrote:
>>>> On Tue, Apr 07, 2020 at 03:24:42PM +0530, Akash Asthana wrote:
>>>>> On 3/31/2020 4:53 PM, Mark Brown wrote:
>>>>>>> +    ctrl->avg_bw_cpu = Bps_to_icc(speed_hz);
>>>>>>> +    ctrl->peak_bw_cpu = Bps_to_icc(2 * speed_hz);
>>>>>> I thought you were going to factor this best guess handling of peak
>>>>>> bandwidth out into the core?
>>>>> I can centralize this for SPI, I2C and UART  in Common driver(QUP wrapper)
>>>>> but still for QSPI I have to keep this piece of code as is because It is not
>>>>> child of QUP wrapper(it doesn't use common code).
>>>> Why not?
>>>>
>>>>> I am not sure whether I can move this " Assume peak_bw as twice of avg_bw if
>>>>> nothing is mentioned explicitly" to ICC core because the factor of 2 is
>>>>> chosen randomly by me.
>>>> That's the whole point - if this is just a random number then we may as
>>>> well at least be consistently random.
>>> Can we centralize below logic of peak_bw selection for all the clients to ICC core?
>> I don't think this is a good idea for now, because this is very hardware
>> specific. A scaling factor that works for one client might not work for another.
>>
>> My questions here is how did you decide on this "multiply by two"? I can imagine
>> that the traffic can be bursty on some interfaces, but is the factor here really
>> a "random number" or is this based on some data patterns or performance
>> analysis?
> 
> Factor of 2 is random number.
> 
> We are taking care of actual throughput requirement in avg_bw vote and
> the intention of putting peak as twice of avg is to ensure that if high
> speed peripherals(ex:USB) removes their votes, we shouldn't see any
> latency issue because of other ICC client who don't vote for their BW
> requirement or *actual* BW requirement.

Thanks for clarifying, but is this latency a confirmed issue on real hardware?
I guess voting for twice as average will work, but still wondering wouldn't
it be more appropriate to handle it in the interconnect platform driver instead?
Also why is the other client not voting, can we fix it?

Thanks,
Georgi
