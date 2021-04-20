Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829A536573F
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Apr 2021 13:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbhDTLNB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Apr 2021 07:13:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59106 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231956AbhDTLMu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 20 Apr 2021 07:12:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618917138; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hl8EUPn2bmfex04b3yPPF4NbgsG6QE0JOYL2gmZJ1/o=;
 b=rnbhEwUTg+wkTz+Ggxx3qu99ypZFbey/qNnC0vcvTLsqbyJxOo3XSNWOnqcw20RYwBev39GY
 k2zKCmndSDVPdrtQelbjfxWMVWPPhq4XvsY1PuJ95tGIZ7KGx84K4kvJpmImCgPbvGGSWY/U
 ps1kjKTWo4KcffEh/rGrc5xJMbk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 607eb710a817abd39ac8cedc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Apr 2021 11:12:16
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 36DF1C43144; Tue, 20 Apr 2021 11:12:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 03007C433D3;
        Tue, 20 Apr 2021 11:12:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 20 Apr 2021 16:42:13 +0530
From:   rojay@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     wsa@kernel.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V8 1/1] i2c: i2c-qcom-geni: Add shutdown callback for i2c
In-Reply-To: <161415039142.1254594.3043511127113195221@swboyd.mtv.corp.google.com>
References: <20210108150545.2018-1-rojay@codeaurora.org>
 <20210108150545.2018-2-rojay@codeaurora.org>
 <161052087940.3661239.14609415796697267628@swboyd.mtv.corp.google.com>
 <9ec10130df230a0ff078d9eec47e94b2@codeaurora.org>
 <161415039142.1254594.3043511127113195221@swboyd.mtv.corp.google.com>
Message-ID: <30d8e3661c37c7d2580ac1f03e254680@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stephen,

On 2021-02-24 12:36, Stephen Boyd wrote:
> Quoting rojay@codeaurora.org (2021-02-18 06:15:17)
>> Hi Stephen,
>> 
>> On 2021-01-13 12:24, Stephen Boyd wrote:
>> > Quoting Roja Rani Yarubandi (2021-01-08 07:05:45)
>> >> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c
>> >> b/drivers/i2c/busses/i2c-qcom-geni.c
>> >> index 214b4c913a13..c3f584795911 100644
>> >> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> >> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> >> @@ -375,6 +375,32 @@ static void geni_i2c_tx_msg_cleanup(struct
>> >> geni_i2c_dev *gi2c,
>> >>         }
>> >>  }
>> >>
>> >> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
>> >> +{
>> >> +       int ret;
>> >> +       u32 geni_status;
>> >> +       struct i2c_msg *cur;
>> >> +
>> >> +       /* Resume device, as runtime suspend can happen anytime during
>> >> transfer */
>> >> +       ret = pm_runtime_get_sync(gi2c->se.dev);
>> >> +       if (ret < 0) {
>> >> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n",
>> >> ret);
>> >> +               return;
>> >> +       }
>> >> +
>> >> +       geni_status = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
>> >> +       if (geni_status & M_GENI_CMD_ACTIVE) {
>> >> +               cur = gi2c->cur;
>> >
>> > Why don't we need to hold the spinlock gi2c::lock here?
>> >
>> 
>> I am not seeing any race here. May I know which race are you 
>> suspecting
>> here?
> 
> Sorry there are long delays between posting and replies to my review
> comments. It takes me some time to remember what we're talking about
> because this patch has dragged on for many months.
> 

Sorry for the delayed responses.

> So my understanding is that gi2c::lock protects the 'cur' pointer. I
> imagine this scenario might go bad
> 
>   CPU0                      CPU1
>   ----                      ----
>   geni_i2c_stop_xfer()
>    ...                      geni_i2c_rx_one_msg()
> 			     gi2c->cur = cur1;
>    cur = gi2c->cur;
>    ...                       geni_i2c_tx_one_msg()
> 			     gi2c->cur = cur2;
>    geni_i2c_abort_xfer()
>     <uses cur2>
>    if (cur->flags & I2C_M_RD)
>     <uses cur1 for the condition and call; oops that's bad>
> 
> It's almost like we should combine the geni_i2c_abort_xfer() logic with
> the rx/tx message cleanup functions so that it's all done under one
> lock. Unfortunately it's complicated by the fact that there are various
> completion waiting timeouts involved. Fun!
> 

Thanks for the explanation. Fixed this possible race by protecting 
gi2c->cur
and calling geni_i2c_abort_xfer() with adding another parameter to 
differentiate
from which sequence is the geni_i2c_abort_xfer() called and handle the
spin_lock/spin_unlock accordingly inside geni_i2c_abort_xfer()

> But even after all that, I don't see how the geni_i2c_stop_xfer() puts 
> a
> stop to future calls to geni_i2c_rx_one_msg() or geni_i2c_tx_one_msg().

Now handled this by adding a bool variable "stop_xfer" in geni_i2c_dev 
struct,
used to put stop to upcoming geni_i2c_rx_one_msg() and 
geni_i2c_tx_one_msg() calls
once we receive the shutdown call.

> The hardware isn't disabled from what I can tell. The irq isn't
> disabled, the clks aren't turned off, etc. What is to stop an i2c 
> device
> from trying to use the bus after this shutdown function is called? If
> anything, this function looks like a "flush", where we flush out any
> pending transfer. Where's the "plug" operation that prevents any future
> operations from following this call?
> 

We are turning off clocks and disabling irq in 
geni_i2c_runtime_suspend().

IIUC about shutdown sequence, during "remove" we will unplug the device 
with opposite
calls to "probe's" plug operations example i2c_del_adapter(). For 
"shutdown", as system
is going to shutdown, there is no need of unplug operations to be done.

> BTW, I see this is merged upstream. That's great, but it seems broken.
> Please fix it or revert it out.
> 
>> 
>> >> +               geni_i2c_abort_xfer(gi2c);
>> >> +               if (cur->flags & I2C_M_RD)
>> >> +                       geni_i2c_rx_msg_cleanup(gi2c, cur);
>> >> +               else
>> >> +                       geni_i2c_tx_msg_cleanup(gi2c, cur);
>> >> +       }
>> >> +
>> >> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
>> >> +}
>> >> +
>> >>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct
>> >> i2c_msg *msg,
>> >>                                 u32 m_param)
>> >>  {

Thanks,
Roja
