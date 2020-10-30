Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D812A08B7
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Oct 2020 16:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgJ3PAb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Oct 2020 11:00:31 -0400
Received: from z5.mailgun.us ([104.130.96.5]:31536 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbgJ3PAa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Oct 2020 11:00:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604069973; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=NRiAvEzduLH4Fyb+nC9qHYSc/q8IvoaoKJXFIDpgOag=;
 b=uEdmCX24MegZT0stROoDcWddCJOxx/P6O/HhKTg5pAM6aVqIRgb23qqUhosEk7/oAfuJ0x+0
 II0tpPi4L2uZq4OnU70In/um6T/5IwTA6loCXdqqJ33Jt1WY5WWmdr48C89a+8lxTJCtWkrI
 1E064YMT7gI/knG+CSDA/DC5FPc=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f9c2a54b01cad7dbfeeadbc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 14:59:32
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8E71FC433C6; Fri, 30 Oct 2020 14:59:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E8E1BC433C9;
        Fri, 30 Oct 2020 14:59:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 30 Oct 2020 20:29:31 +0530
From:   rojay@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     wsa@kernel.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        vkaur@codeaurora.org, pyarlaga@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V5 3/3] i2c: i2c-qcom-geni: Add shutdown callback for i2c
In-Reply-To: <160168919332.310579.15311671258384969025@swboyd.mtv.corp.google.com>
References: <20201001084425.23117-1-rojay@codeaurora.org>
 <20201001084425.23117-4-rojay@codeaurora.org>
 <160168919332.310579.15311671258384969025@swboyd.mtv.corp.google.com>
Message-ID: <17edaa6ceded98199a6f94a505cbd436@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stephen,

On 2020-10-03 07:09, Stephen Boyd wrote:
> Quoting Roja Rani Yarubandi (2020-10-01 01:44:25)
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index aee2a1dd2c62..56d3fbfe7eb6 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -380,6 +380,36 @@ static void geni_i2c_tx_msg_cleanup(struct 
>> geni_i2c_dev *gi2c,
>>         }
>>  }
>> 
>> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
>> +{
>> +       int ret;
>> +       u32 geni_status;
>> +       unsigned long flags;
>> +       struct i2c_msg *cur;
>> +
>> +       /* Resume device, runtime suspend can happen anytime during 
>> transfer */
>> +       ret = pm_runtime_get_sync(gi2c->se.dev);
>> +       if (ret < 0) {
>> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n", 
>> ret);
>> +               return;
>> +       }
>> +
>> +       spin_lock_irqsave(&gi2c->lock, flags);
> 
> We grab the lock here.
> 
>> +       geni_status = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
>> +       if (!(geni_status & M_GENI_CMD_ACTIVE))
>> +               goto out;
>> +
>> +       cur = gi2c->cur;
>> +       geni_i2c_abort_xfer(gi2c);
> 
> But it looks like this function takes the lock again? Did you test this
> with lockdep enabled? It should hang even without lockdep, so it seems
> like this path of code has not been tested.
> 

Tested with lockdep enabled, and fixed the unsafe lock order issue here.
And to be more proper moved spin_lock/unlock to cleanup functions.

>> +       if (cur->flags & I2C_M_RD)
>> +               geni_i2c_rx_msg_cleanup(gi2c, cur);
>> +       else
>> +               geni_i2c_tx_msg_cleanup(gi2c, cur);
>> +       spin_unlock_irqrestore(&gi2c->lock, flags);
>> +out:
>> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
>> +}
>> +
>>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct 
>> i2c_msg *msg,
>>                                 u32 m_param)
>>  {
