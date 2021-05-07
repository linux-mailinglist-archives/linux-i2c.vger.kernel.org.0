Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E95D37634E
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 12:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235809AbhEGKIq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 06:08:46 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:46820 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235718AbhEGKIp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 06:08:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620382065; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=/kucTrvIJ+SjM2UVPI+sjkYNmztr0wIgE/b/ph6ax44=; b=spyCSxoQcuNuc0u5vVJk/TtuQnY1qQf5fslc3/j38ZSwpu5nCv6ZiJZgnZemftN5U9JoExCe
 hWy7+13BGT3E++KqLOZzfLv2DuvkcH5yzKBxTnqTY2Qnjgx/i/hOR/4xCL9tOiOGbrYqygyE
 B93CU3L2Rn81XGlOxN4Bbz9Gsx0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6095117055b14811b4fce873 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 07 May 2021 10:07:44
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2486BC43149; Fri,  7 May 2021 10:07:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7220DC4338A;
        Fri,  7 May 2021 10:07:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 07 May 2021 15:37:42 +0530
From:   rojay@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     wsa@kernel.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, skananth@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V9] i2c: i2c-qcom-geni: Add shutdown callback for i2c
Message-ID: <d23263dcb0f1535275ff37524b0203b2@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stephen,

On 2021-05-05 07:08, Stephen Boyd wrote:
> Quoting Roja Rani Yarubandi (2021-04-20 04:13:55)
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 214b4c913a13..8ae17ccad99e 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -71,6 +71,8 @@ enum geni_i2c_err_code {
>>  #define ABORT_TIMEOUT          HZ
>>  #define XFER_TIMEOUT           HZ
>>  #define RST_TIMEOUT            HZ
>> +#define ABORT_XFER             0
>> +#define STOP_AND_ABORT_XFER    1
> 
> These should be an enum.
> 

Okay.

>> 
>>  struct geni_i2c_dev {
>>         struct geni_se se;
>> @@ -89,6 +91,7 @@ struct geni_i2c_dev {
>>         void *dma_buf;
>>         size_t xfer_len;
>>         dma_addr_t dma_addr;
>> +       bool stop_xfer;
>>  };
>> 
>>  struct geni_i2c_err_log {
>> @@ -215,6 +218,11 @@ static irqreturn_t geni_i2c_irq(int irq, void 
>> *dev)
>>         struct i2c_msg *cur;
>> 
>>         spin_lock(&gi2c->lock);
>> +       if (!gi2c->cur) {
>> +               dev_err(gi2c->se.dev, "Can't process irq, gi2c->cur is 
>> NULL\n");
> 
> This error message is worthless. The user won't know what to do and 
> then
> we return IRQ_HANDLED? If the device is misbehaving we should return
> IRQ_NONE and shut down the irq storm that will soon be upon us, not
> print an error message and hope for the best.
> 

Okay, will return IRQ_NONE. The reason I have kept this error message is 
to know
that this case has occurred.

>> +               spin_unlock(&gi2c->lock);
>> +               return IRQ_HANDLED;
>> +       }
>>         m_stat = readl_relaxed(base + SE_GENI_M_IRQ_STATUS);
>>         rx_st = readl_relaxed(base + SE_GENI_RX_FIFO_STATUS);
>>         dm_tx_st = readl_relaxed(base + SE_DMA_TX_IRQ_STAT);
>> @@ -222,8 +230,7 @@ static irqreturn_t geni_i2c_irq(int irq, void 
>> *dev)
>>         dma = readl_relaxed(base + SE_GENI_DMA_MODE_EN);
>>         cur = gi2c->cur;
>> 
>> -       if (!cur ||
>> -           m_stat & (M_CMD_FAILURE_EN | M_CMD_ABORT_EN) ||
>> +       if (m_stat & (M_CMD_FAILURE_EN | M_CMD_ABORT_EN) ||
>>             dm_rx_st & (DM_I2C_CB_ERR)) {
>>                 if (m_stat & M_GP_IRQ_1_EN)
>>                         geni_i2c_err(gi2c, NACK);
>> @@ -301,17 +308,19 @@ static irqreturn_t geni_i2c_irq(int irq, void 
>> *dev)
>>         return IRQ_HANDLED;
>>  }
>> 
>> -static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c)
>> +static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c, bool 
>> is_stop_xfer)
> 
> The bool should be an enum, but a better approach would be to have a
> locked and unlocked version of this function.
> 

Okay, will try to come up with the better approach.

>>  {
>>         u32 val;
>>         unsigned long time_left = ABORT_TIMEOUT;
>>         unsigned long flags;
>> 
>> -       spin_lock_irqsave(&gi2c->lock, flags);
>> +       if (!is_stop_xfer)
>> +               spin_lock_irqsave(&gi2c->lock, flags);
>>         geni_i2c_err(gi2c, GENI_TIMEOUT);
>>         gi2c->cur = NULL;
>>         geni_se_abort_m_cmd(&gi2c->se);
>> -       spin_unlock_irqrestore(&gi2c->lock, flags);
>> +       if (!is_stop_xfer)
>> +               spin_unlock_irqrestore(&gi2c->lock, flags);
> 
> Please no conditional locking. It's too hard to reason about.
> 

This will be fixed with the above mentioned optimal approach.

>>         do {
>>                 time_left = wait_for_completion_timeout(&gi2c->done, 
>> time_left);
>>                 val = readl_relaxed(gi2c->se.base + 
>> SE_GENI_M_IRQ_STATUS);
>> @@ -375,6 +384,38 @@ static void geni_i2c_tx_msg_cleanup(struct 
>> geni_i2c_dev *gi2c,
>>         }
>>  }
>> 
>> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
>> +{
>> +       int ret;
>> +       u32 geni_status;
>> +       struct i2c_msg *cur;
>> +       unsigned long flags;
>> +
>> +       /* Resume device, as runtime suspend can happen anytime during 
>> transfer */
> 
> This comment doesn't make any sense. Hopefully a suspend can't happen
> during a transfer, but only before or after a transfer. Otherwise, the
> transfer code is broken and isn't properly keeping the device runtime
> resumed during the transfer.
> 

Okay, instead of resuming the device, I will check for the device 
status,
and if it is in resume state will proceed accordingly.

>> +       ret = pm_runtime_get_sync(gi2c->se.dev);
>> +       if (ret < 0) {
>> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n", 
>> ret);
>> +               return;
>> +       }
>> +
>> +       spin_lock_irqsave(&gi2c->lock, flags);
>> +       gi2c->stop_xfer = 1;
>> +       geni_status = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
>> +       if (geni_status & M_GENI_CMD_ACTIVE) {
>> +               cur = gi2c->cur;
>> +               geni_i2c_abort_xfer(gi2c, STOP_AND_ABORT_XFER);
>> +               spin_unlock_irqrestore(&gi2c->lock, flags);
>> +               if (cur->flags & I2C_M_RD)
>> +                       geni_i2c_rx_msg_cleanup(gi2c, cur);
>> +               else
>> +                       geni_i2c_tx_msg_cleanup(gi2c, cur);
>> +       } else {
>> +               spin_unlock_irqrestore(&gi2c->lock, flags);
>> +       }
> 
> Please unlock outside of an if condition. A local variable can be used
> outside of the unlock, but then the code is easier to follow
> 

Okay.

> 	spin_lock_irqsave(&gi2c->lock, flags);
> 	if (geni_status & M_GENI_CMD_ACTIVE) {
> 		cur = gic2->cur;
> 		geni_i2c_abort_xfer(....);
> 	}
> 	spin_unlock_irqrestore(gi2c->lock, flags);
> 
> 	if (cur) {
> 		if (cur->flags & I2C_M_RD)
> 			...
> 		else
> 			...
> 	}
> 
> And then I don't really know if grabbing 'cur' out of the struct and
> then messing with it outside the lock is correct.
> 

I think it shouldn't be a problem, gi2c->cur will be NULL, and 'cur' 
should be
fine to use, and we have fixed the race between this and geni_i2c_xfer()
with proper protection.

>> +
>> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
>> +}
>> +
>>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct 
>> i2c_msg *msg,
>>                                 u32 m_param)
>>  {
>> @@ -407,7 +448,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>         cur = gi2c->cur;
>>         time_left = wait_for_completion_timeout(&gi2c->done, 
>> XFER_TIMEOUT);
>>         if (!time_left)
>> -               geni_i2c_abort_xfer(gi2c);
>> +               geni_i2c_abort_xfer(gi2c, ABORT_XFER);
> 
> So this would say geni_i2c_abort_xfer() but the one above would say
> geni_i2c_abort_xfer_locked() because the lock is already held.
> 

Correct.

>> 
>>         geni_i2c_rx_msg_cleanup(gi2c, cur);
>> 
>> @@ -449,7 +490,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>         cur = gi2c->cur;
>>         time_left = wait_for_completion_timeout(&gi2c->done, 
>> XFER_TIMEOUT);
>>         if (!time_left)
>> -               geni_i2c_abort_xfer(gi2c);
>> +               geni_i2c_abort_xfer(gi2c, ABORT_XFER);
>> 
>>         geni_i2c_tx_msg_cleanup(gi2c, cur);
>> 
>> @@ -462,6 +503,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>  {
>>         struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
>>         int i, ret;
>> +       unsigned long flags;
>> 
>>         gi2c->err = 0;
>>         reinit_completion(&gi2c->done);
>> @@ -480,7 +522,13 @@ static int geni_i2c_xfer(struct i2c_adapter 
>> *adap,
>> 
>>                 m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & 
>> SLV_ADDR_MSK);
>> 
>> +               spin_lock_irqsave(&gi2c->lock, flags);
>> +               if (gi2c->stop_xfer) {
>> +                       spin_unlock_irqrestore(&gi2c->lock, flags);
>> +                       break;
>> +               }
>>                 gi2c->cur = &msgs[i];
>> +               spin_unlock_irqrestore(&gi2c->lock, flags);
> 
> Is this to jump into the transfer real fast and break out if we're in
> the middle of a transfer?
> 

Yes, to break the loop.

>>                 if (msgs[i].flags & I2C_M_RD)
>>                         ret = geni_i2c_rx_one_msg(gi2c, &msgs[i], 
>> m_param);
>>                 else
>> @@ -624,6 +672,7 @@ static int geni_i2c_probe(struct platform_device 
>> *pdev)
>>         dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", 
>> tx_depth);
>> 
>>         gi2c->suspended = 1;
>> +       gi2c->stop_xfer = 0;
>>         pm_runtime_set_suspended(gi2c->se.dev);
>>         pm_runtime_set_autosuspend_delay(gi2c->se.dev, 
>> I2C_AUTO_SUSPEND_DELAY);
>>         pm_runtime_use_autosuspend(gi2c->se.dev);
>> @@ -650,6 +699,13 @@ static int geni_i2c_remove(struct platform_device 
>> *pdev)
>>         return 0;
>>  }
>> 
>> +static void  geni_i2c_shutdown(struct platform_device *pdev)
>> +{
>> +       struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
>> +
>> +       geni_i2c_stop_xfer(gi2c);
> 
> It would read better as
> 
> 	geni_i2c_plug_xfer(gi2c);
> 
> or
> 
> 	geni_i2c_flush_and_teardown(gi2c);
> 
> or
> 
> 	geni_i2c_teardown_tx_rx(gi2c);
> 
> Something that says we're waiting for any transfer to complete, and 
> then
> plugging the queue and removing the i2c bus entirely.
> 

Sure, will change.

> In fact, where is that code? I'd expect to see i2c_del_adapter() in 
> here
> so we know the adapter can't accept transfers anymore. Maybe
> i2c_del_adapter() could be called, and then there's nothing to do after
> that? This whole patch is trying to rip the adapter out from under the
> i2c core framework, when we should take the opposite approach and 
> remove
> it from the core framework so that it can't transfer anything anymore
> and thus the IOMMU can remove the mapping.
> 

IIUC about probe/remove/shutdown calls, during "remove" we will unplug 
the
device with opposite calls to "probe's" plug operations.
For example i2c_add_adapter() from 'probe' and i2c_del_adapter() from 
'remove'.
For "shutdown", as system is going to shutdown, there is no need of 
unplug
operations to be done.

And also, I had a glance on other upstream i2c drivers, and noticed 
"i2c-i801.c"
driver has i2c_del_adapter() called from remove callback but not from 
shutdown
callback.

And actually I tried calling i2c_del_adapter() from geni_i2c_shutdown(),
and it resulted in below WARNING trace
[   90.320282] Call trace:
[   90.322807]  _regulator_put+0xc4/0xcc
[   90.326583]  regulator_bulk_free+0x48/0x6c
[   90.330808]  devm_regulator_bulk_release+0x20/0x2c
[   90.335744]  release_nodes+0x1d0/0x244
[   90.339609]  devres_release_all+0x3c/0x54
[   90.343735]  device_release_driver_internal+0x108/0x194
[   90.349109]  device_release_driver+0x24/0x30
[   90.353510]  bus_remove_device+0xd0/0xf4
[   90.357548]  device_del+0x1a8/0x2f8
[   90.361143]  device_unregister+0x1c/0x34
[   90.365181]  __unregister_client+0x78/0x88
[   90.369397]  device_for_each_child+0x64/0xb4
[   90.373797]  i2c_del_adapter+0xf0/0x1d4
[   90.377745]  geni_i2c_shutdown+0x9c/0xc0
[   90.381783]  platform_drv_shutdown+0x28/0x34
[   90.386182]  device_shutdown+0x148/0x1f0

Can you please suggest me what might be missing here?

>> +}
>> +
>>  static int __maybe_unused geni_i2c_runtime_suspend(struct device 
>> *dev)
>>  {
>>         int ret;

Thanks,
Roja
