Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C542037812
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 17:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbfFFPe3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 11:34:29 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43826 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728916AbfFFPe3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 11:34:29 -0400
Received: by mail-lf1-f67.google.com with SMTP id j29so463770lfk.10;
        Thu, 06 Jun 2019 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SzDhvhshjsFSSHSi+Eod6Z0jHeQx4OkmeJrier2GblM=;
        b=UQcJLrJneu34YJjKqmC79bH5LQi6mMN6cqPC2WPG+Gu+bVu+mqbAo2J3y8wuXAJAcH
         ona4ZtLabPkhCfxJUF19PQo+CPfgNFpxaJXCa/D4rlFDGwP7277FiD8wFnLxy0qXCEZI
         QX9HevHapm4k500UCrO5ToCN6tywvoRmgEy1aDGLofl9MLTdH/6425gUtpfEPEH2o49K
         C45NCe9k75gbOT1EjmemxtRsu2b7LvlBZw2ZwbZdvzXPS9hWMdoI299+TGCA7RfbPBUU
         AMswfF592SN1fNfW+/LUW88haA7wfDg+cnCrOsrcHHKccA3v1wXKAteYZXQ+o60fo498
         qsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SzDhvhshjsFSSHSi+Eod6Z0jHeQx4OkmeJrier2GblM=;
        b=hnSN4JpghVOVbZfleCYVe3wo6Y68sLn4So83YlFAfB27MMVx7CUI/+huHUFe7pbVld
         YjAw1zDPyJcMfMjprBJKG6/stGEDV3bLN4J9gQlRnnLCSVG9+9ZyDtApsUr1zhjlo1Vo
         0eIFDdfKansd9UtLaXFb7yTLjkNwE0APuHhuw2qqMp8bdboSRjdpGZ0/tU25sUx7HtKx
         PMLbvwyjr6OZH8gJlNWFbueqdpUPiu9hoWEz9ZIhWpRttMEdKTB0Gw+jeve7XhwCiGck
         5zdNude5py4HU/RY6HIzWCUo/Qb4jwSRS100ErkmWkMzNkZmDQsrfmMBdwzTy6pJxUfp
         /66Q==
X-Gm-Message-State: APjAAAVXn7OUDbtD8hsFjLQULURwcbGRoEaMN81xfiNu2bs4S3QIKahz
        G/X9BqOiACrJrVIQLiC4Hww=
X-Google-Smtp-Source: APXvYqzPbG22Fe+Mqvj1W8fD3FRpLt79MCku8i2OvdwsFB8vU/pcIU/ymrSdykUw1AgxXKGxNY95tA==
X-Received: by 2002:a19:750b:: with SMTP id y11mr11104398lfe.16.1559835265610;
        Thu, 06 Jun 2019 08:34:25 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id e14sm342122lfd.84.2019.06.06.08.34.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 08:34:24 -0700 (PDT)
Subject: Re: [PATCH V4] drivers: i2c: tegra: fix checkpatch defects
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559806523-1352-1-git-send-email-bbiswas@nvidia.com>
 <bbe8ef0e-fdef-613c-9758-6525b60e5992@gmail.com>
 <e8c2f722-eeaa-7449-d4fb-6caf0466bcc8@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eafab1bf-82bb-ecbb-e3b3-332c3db620c2@gmail.com>
Date:   Thu, 6 Jun 2019 18:34:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e8c2f722-eeaa-7449-d4fb-6caf0466bcc8@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

06.06.2019 17:02, Bitan Biswas пишет:
> 
> 
> On 6/6/19 4:39 AM, Dmitry Osipenko wrote:
>> 06.06.2019 10:35, Bitan Biswas пишет:
>>> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>>>
>>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>> as needed. Replace BUG() with error handling code.
>>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>>>
>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>> ---
>>>   drivers/i2c/busses/i2c-tegra.c | 67
>>> +++++++++++++++++++++++-------------------
>>>   1 file changed, 37 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>> b/drivers/i2c/busses/i2c-tegra.c
>>> index 76b7926..55a5d87 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -78,6 +78,7 @@
>>>   #define I2C_ERR_NO_ACK                0x01
>>>   #define I2C_ERR_ARBITRATION_LOST        0x02
>>>   #define I2C_ERR_UNKNOWN_INTERRUPT        0x04
>>> +#define I2C_ERR_UNEXPECTED_STATUS               0x08
>>>     #define PACKET_HEADER0_HEADER_SIZE_SHIFT    28
>>>   #define PACKET_HEADER0_PACKET_ID_SHIFT        16
>>> @@ -112,7 +113,7 @@
>>>   #define I2C_CLKEN_OVERRIDE            0x090
>>>   #define I2C_MST_CORE_CLKEN_OVR            BIT(0)
>>>   -#define I2C_CONFIG_LOAD_TIMEOUT            1000000
>>> +#define I2C_CONFIG_LOAD_TMOUT            1000000
>>>     #define I2C_MST_FIFO_CONTROL            0x0b4
>>>   #define I2C_MST_FIFO_CONTROL_RX_FLUSH        BIT(0)
>>> @@ -280,6 +281,7 @@ struct tegra_i2c_dev {
>>>       u32 bus_clk_rate;
>>>       u16 clk_divisor_non_hs_mode;
>>>       bool is_multimaster_mode;
>>> +    /* xfer_lock: lock to serialize transfer submission and
>>> processing */
>>>       spinlock_t xfer_lock;
>>>       struct dma_chan *tx_dma_chan;
>>>       struct dma_chan *rx_dma_chan;
>>> @@ -306,7 +308,7 @@ static u32 dvc_readl(struct tegra_i2c_dev
>>> *i2c_dev, unsigned long reg)
>>>    * to the I2C block inside the DVC block
>>>    */
>>>   static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
>>> -    unsigned long reg)
>>> +                    unsigned long reg)
>>>   {
>>>       if (i2c_dev->is_dvc)
>>>           reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
>>> @@ -314,7 +316,7 @@ static unsigned long tegra_i2c_reg_addr(struct
>>> tegra_i2c_dev *i2c_dev,
>>>   }
>>>     static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>>> -    unsigned long reg)
>>> +               unsigned long reg)
>>>   {
>>>       writel(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
>>>   @@ -329,13 +331,13 @@ static u32 i2c_readl(struct tegra_i2c_dev
>>> *i2c_dev, unsigned long reg)
>>>   }
>>>     static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
>>> -    unsigned long reg, int len)
>>> +            unsigned long reg, int len)
>>>   {
>>>       writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data,
>>> len);
>>>   }
>>>     static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
>>> -    unsigned long reg, int len)
>>> +               unsigned long reg, int len)
>>>   {
>>>       readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data,
>>> len);
>>>   }
>>> @@ -486,7 +488,7 @@ static int tegra_i2c_flush_fifos(struct
>>> tegra_i2c_dev *i2c_dev)
>>>               dev_warn(i2c_dev->dev, "timeout waiting for fifo
>>> flush\n");
>>>               return -ETIMEDOUT;
>>>           }
>>> -        msleep(1);
>>> +        usleep_range(1000, 2000);
>>>       }
>>>       return 0;
>>>   }
>>> @@ -525,7 +527,6 @@ static int tegra_i2c_empty_rx_fifo(struct
>>> tegra_i2c_dev *i2c_dev)
>>>        * prevent overwriting past the end of buf
>>>        */
>>>       if (rx_fifo_avail > 0 && buf_remaining > 0) {
>>> -        BUG_ON(buf_remaining > 3);
>>>           val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>>>           val = cpu_to_le32(val);
>>>           memcpy(buf, &val, buf_remaining);
>>> @@ -533,7 +534,6 @@ static int tegra_i2c_empty_rx_fifo(struct
>>> tegra_i2c_dev *i2c_dev)
>>>           rx_fifo_avail--;
>>>       }
>>>   -    BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>>>       i2c_dev->msg_buf_remaining = buf_remaining;
>>>       i2c_dev->msg_buf = buf;
>>>   @@ -591,7 +591,6 @@ static int tegra_i2c_fill_tx_fifo(struct
>>> tegra_i2c_dev *i2c_dev)
>>>        * boundary and fault.
>>>        */
>>>       if (tx_fifo_avail > 0 && buf_remaining > 0) {
>>> -        BUG_ON(buf_remaining > 3);
>>>           memcpy(&val, buf, buf_remaining);
>>>           val = le32_to_cpu(val);
>>>   @@ -680,10 +679,11 @@ static int
>>> tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
>>>           i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
>>>           if (in_interrupt())
>>>               err = readl_poll_timeout_atomic(addr, val, val == 0,
>>> -                    1000, I2C_CONFIG_LOAD_TIMEOUT);
>>> +                            1000,
>>> +                            I2C_CONFIG_LOAD_TMOUT);
>>>           else
>>> -            err = readl_poll_timeout(addr, val, val == 0,
>>> -                    1000, I2C_CONFIG_LOAD_TIMEOUT);
>>> +            err = readl_poll_timeout(addr, val, val == 0, 1000,
>>> +                         I2C_CONFIG_LOAD_TMOUT);
>>>             if (err) {
>>>               dev_warn(i2c_dev->dev,
>>> @@ -858,16 +858,21 @@ static irqreturn_t tegra_i2c_isr(int irq, void
>>> *dev_id)
>>>           if (i2c_dev->msg_read && (status &
>>> I2C_INT_RX_FIFO_DATA_REQ)) {
>>>               if (i2c_dev->msg_buf_remaining)
>>>                   tegra_i2c_empty_rx_fifo(i2c_dev);
>>> -            else
>>> -                BUG();
>>> +            else {
>>> +                dev_err(i2c_dev->dev, "unexpected rx data request\n");
>>> +                i2c_dev->msg_err |= I2C_ERR_UNEXPECTED_STATUS;
>>> +                goto err;
>>> +            }
>>>           }
>>>             if (!i2c_dev->msg_read && (status &
>>> I2C_INT_TX_FIFO_DATA_REQ)) {
>>> -            if (i2c_dev->msg_buf_remaining)
>>> -                tegra_i2c_fill_tx_fifo(i2c_dev);
>>> -            else
>>> +            if (i2c_dev->msg_buf_remaining) {
>>> +                if (tegra_i2c_fill_tx_fifo(i2c_dev))
>>> +                    goto err;
>>> +            } else {
>>>                   tegra_i2c_mask_irq(i2c_dev,
>>>                              I2C_INT_TX_FIFO_DATA_REQ);
>>> +            }
>>>           }
>>>       }
>>>   @@ -885,7 +890,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void
>>> *dev_id)
>>>       if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>>>           if (i2c_dev->is_curr_dma_xfer)
>>>               i2c_dev->msg_buf_remaining = 0;
>>> -        BUG_ON(i2c_dev->msg_buf_remaining);
>>> +        WARN_ON_ONCE(i2c_dev->msg_buf_remaining);
>>>           complete(&i2c_dev->msg_complete);
>>>       }
>>>       goto done;
>>> @@ -1024,7 +1029,7 @@ static int tegra_i2c_issue_bus_clear(struct
>>> i2c_adapter *adap)
>>>   }
>>>     static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>>> -    struct i2c_msg *msg, enum msg_end_type end_state)
>>> +                  struct i2c_msg *msg, enum msg_end_type end_state)
>>>   {
>>>       u32 packet_header;
>>>       u32 int_mask;
>>> @@ -1034,7 +1039,7 @@ static int tegra_i2c_xfer_msg(struct
>>> tegra_i2c_dev *i2c_dev,
>>>       u32 *buffer = NULL;
>>>       int err = 0;
>>>       bool dma;
>>> -    u16 xfer_time = 100;
>>> +    u16 xfer_tm = 100;
>>
>> Why xfer_time is renamed? It is much more important to keep code
>> readable rather than to satisfy checkpatch. You should *not* follow
>> checkpatch recommendations where they do not make much sense. The
>> xfer_tm is a less intuitive naming and hence it harms readability of the
>> code. Hence it is better to have "lines over 80 chars" in this
>> particular case.
> Agreed. I shall share updated patch.

Yes, please.

>>
>> Also, please don't skip review comments. I already pointed out the above
>> in the answer to previous version of the patch.
>>
> I apologize for the oversight. I shall be more careful in future.

No problems ;)
