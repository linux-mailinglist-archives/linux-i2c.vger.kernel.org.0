Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A476819946A
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 12:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730680AbgCaKzf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 06:55:35 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:21395 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730560AbgCaKzf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Mar 2020 06:55:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585652134; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Z1zxpnAq/Fwpkm4EM1Ngtn/CesAxPUZeODG4rTDUTVI=; b=Z2BfFoxa59asqejGcKFmg3kyJG0nadQs040niP1mAQdbuv04jFy3HYLdMbKmWrmEIStOSV40
 //pDJDHL+Df1zzkI8jOcEgNzIJ7fCSo+9PkTLIly9KJFMvufcXqoWJDvC1iyRNLZAw5RHHoU
 GIW8WjH0xXwM/qz8LuufPJZQVII=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8321a0.7fae400bd500-smtp-out-n03;
 Tue, 31 Mar 2020 10:55:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E82D7C44788; Tue, 31 Mar 2020 10:55:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E7C22C433BA;
        Tue, 31 Mar 2020 10:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E7C22C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V2 3/8] soc: qcom-geni-se: Add interconnect support to fix
 earlycon crash
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>, wsa@the-dreams.de,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, Doug Anderson <dianders@chromium.org>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-4-git-send-email-akashast@codeaurora.org>
 <20200313204441.GJ144492@google.com>
 <1f86fdf0-df7c-4e4a-d4d8-8b0162e52cb4@codeaurora.org>
 <20200317182910.GR144492@google.com>
 <3831b33c-93ee-e5e0-fcfb-530b4738f930@codeaurora.org>
 <20200319194332.GA60149@google.com>
 <a7227a1f-00a1-0818-80f3-904fe264f864@codeaurora.org>
 <CAE=gft6AGkcdUAkoyevZgmtBgaiEkoQzzJcg7sYjbpy5Kh2fyA@mail.gmail.com>
 <20200327232338.GL5063@builder>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <2d75c2e9-96a7-a503-18a9-f0665bc67973@codeaurora.org>
Date:   Tue, 31 Mar 2020 16:25:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200327232338.GL5063@builder>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bjorn,

On 3/28/2020 4:53 AM, Bjorn Andersson wrote:
> Note though that the boot console will outlive the real console when the
> kernel is booted with "keep_bootcon" on the command line (something I do
> from time to time).
>
> So rather than relying on "real probe" to signal when we can release the
> earlycon's icc vote I think we should specify dev->con->exit in
> qcom_geni_serial_early

Okay,

Thanks,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
