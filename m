Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E86E511F1D4
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Dec 2019 13:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbfLNMdE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 Dec 2019 07:33:04 -0500
Received: from out28-173.mail.aliyun.com ([115.124.28.173]:49661 "EHLO
        out28-173.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbfLNMdE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 Dec 2019 07:33:04 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.351933-0.00694798-0.641119;DS=CONTINUE|ham_regular_dialog|0.107182-0.000433894-0.892384;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16384;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.GH.d-qj_1576326771;
Received: from 192.168.88.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GH.d-qj_1576326771)
          by smtp.aliyun-inc.com(10.147.41.143);
          Sat, 14 Dec 2019 20:32:52 +0800
Subject: Re: [PATCH 2/2] I2C: JZ4780: Add support for the X1000.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1576165850-20727-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1576165850-20727-4-git-send-email-zhouyanjie@wanyeetech.com>
 <1576272065.3.2@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, paul.burton@mips.com,
        paulburton@kernel.org, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
From:   zhouyanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5DF4D673.8050104@wanyeetech.com>
Date:   Sat, 14 Dec 2019 20:32:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1576272065.3.2@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Paul,

On 2019年12月14日 05:21, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le jeu., déc. 12, 2019 at 23:50, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add support for probing i2c driver on the X1000 Soc from Ingenic.
>> call the corresponding fifo parameter according to the device
>> model obtained from the devicetree.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>  drivers/i2c/busses/i2c-jz4780.c | 159 
>> +++++++++++++++++++++++++++++-----------
>>  1 file changed, 117 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-jz4780.c 
>> b/drivers/i2c/busses/i2c-jz4780.c
>> index 25dcd73..3b21896 100644
>> --- a/drivers/i2c/busses/i2c-jz4780.c
>> +++ b/drivers/i2c/busses/i2c-jz4780.c
>> @@ -4,6 +4,7 @@
>>   *
>>   * Copyright (C) 2006 - 2009 Ingenic Semiconductor Inc.
>>   * Copyright (C) 2015 Imagination Technologies
>> + * Copyright (C) 2019 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>   */
>>
>>  #include <linux/bitops.h>
>> @@ -17,6 +18,7 @@
>>  #include <linux/io.h>
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>> +#include <linux/of_device.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/sched.h>
>>  #include <linux/slab.h>
>> @@ -55,6 +57,7 @@
>>  #define JZ4780_I2C_ACKGC    0x98
>>  #define JZ4780_I2C_ENSTA    0x9C
>>  #define JZ4780_I2C_SDAHD    0xD0
>> +#define X1000_I2C_SDAHD        0x7C
>>
>>  #define JZ4780_I2C_CTRL_STPHLD        BIT(7)
>>  #define JZ4780_I2C_CTRL_SLVDIS        BIT(6)
>> @@ -73,6 +76,8 @@
>>  #define JZ4780_I2C_STA_TFNF        BIT(1)
>>  #define JZ4780_I2C_STA_ACT        BIT(0)
>>
>> +#define X1000_I2C_DC_STOP        BIT(9)
>> +
>>  static const char * const jz4780_i2c_abrt_src[] = {
>>      "ABRT_7B_ADDR_NOACK",
>>      "ABRT_10ADDR1_NOACK",
>> @@ -130,18 +135,32 @@ static const char * const jz4780_i2c_abrt_src[] 
>> = {
>>  #define JZ4780_I2CFLCNT_ADJUST(n)    (((n) - 1) < 8 ? 8 : ((n) - 1))
>>
>>  #define JZ4780_I2C_FIFO_LEN    16
>> -#define TX_LEVEL        3
>> -#define RX_LEVEL        (JZ4780_I2C_FIFO_LEN - TX_LEVEL - 1)
>> +
>> +#define X1000_I2C_FIFO_LEN    64
>>
>>  #define JZ4780_I2C_TIMEOUT    300
>>
>>  #define BUFSIZE 200
>>
>> +enum ingenic_i2c_version {
>> +    ID_JZ4780,
>> +    ID_X1000,
>> +};
>> +
>> +/** ingenic_i2c_config: SOC specific config data. */
>> +struct ingenic_i2c_config {
>> +    int fifosize;
>> +    int tx_level;
>> +    int rx_level;
>> +};
>> +
>>  struct jz4780_i2c {
>>      void __iomem        *iomem;
>>      int             irq;
>>      struct clk        *clk;
>>      struct i2c_adapter     adap;
>> +    enum ingenic_i2c_version version;
>> +    const struct ingenic_i2c_config *cdata;
>>
>>      /* lock to protect rbuf and wbuf between xfer_rd/wr and irq 
>> handler */
>>      spinlock_t        lock;
>> @@ -340,11 +359,18 @@ static int jz4780_i2c_set_speed(struct 
>> jz4780_i2c *i2c)
>>
>>      if (hold_time >= 0) {
>>          /*i2c hold time enable */
>> -        hold_time |= JZ4780_I2C_SDAHD_HDENB;
>> -        jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, hold_time);
>> +        if (i2c->version >= ID_X1000)
>> +            jz4780_i2c_writew(i2c, X1000_I2C_SDAHD, hold_time);
>> +        else {
>> +            hold_time |= JZ4780_I2C_SDAHD_HDENB;
>> +            jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, hold_time);
>> +        }
>>      } else {
>>          /* disable hold time */
>> -        jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, 0);
>> +        if (i2c->version >= ID_X1000)
>> +            jz4780_i2c_writew(i2c, X1000_I2C_SDAHD, 0);
>> +        else
>> +            jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, 0);
>>      }
>>
>>      return 0;
>> @@ -359,9 +385,11 @@ static int jz4780_i2c_cleanup(struct jz4780_i2c 
>> *i2c)
>>      spin_lock_irqsave(&i2c->lock, flags);
>>
>>      /* can send stop now if need */
>> -    tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> -    tmp &= ~JZ4780_I2C_CTRL_STPHLD;
>> -    jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +    if (i2c->version < ID_X1000) {
>> +        tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> +        tmp &= ~JZ4780_I2C_CTRL_STPHLD;
>> +        jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +    }
>>
>>      /* disable all interrupts first */
>>      jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, 0);
>> @@ -399,11 +427,18 @@ static int jz4780_i2c_prepare(struct jz4780_i2c 
>> *i2c)
>>      return jz4780_i2c_enable(i2c);
>>  }
>>
>> -static void jz4780_i2c_send_rcmd(struct jz4780_i2c *i2c, int cmd_count)
>> +static void jz4780_i2c_send_rcmd(struct jz4780_i2c *i2c,
>> +                       int cmd_count, int cmd_left)
>>  {
>>      int i;
>>
>> -    for (i = 0; i < cmd_count; i++)
>> +    for (i = 0; i < cmd_count - 1; i++)
>> +        jz4780_i2c_writew(i2c, JZ4780_I2C_DC, JZ4780_I2C_DC_READ);
>> +
>> +    if ((cmd_left == 0) && (i2c->version >= ID_X1000))
>> +        jz4780_i2c_writew(i2c, JZ4780_I2C_DC,
>> +                JZ4780_I2C_DC_READ | X1000_I2C_DC_STOP);
>> +    else
>>          jz4780_i2c_writew(i2c, JZ4780_I2C_DC, JZ4780_I2C_DC_READ);
>>  }
>>
>> @@ -458,37 +493,40 @@ static irqreturn_t jz4780_i2c_irq(int irqno, 
>> void *dev_id)
>>
>>          rd_left = i2c->rd_total_len - i2c->rd_data_xfered;
>>
>> -        if (rd_left <= JZ4780_I2C_FIFO_LEN)
>> +        if (rd_left <= i2c->cdata->fifosize)
>>              jz4780_i2c_writew(i2c, JZ4780_I2C_RXTL, rd_left - 1);
>>      }
>>
>>      if (intst & JZ4780_I2C_INTST_TXEMP) {
>>          if (i2c->is_write == 0) {
>>              int cmd_left = i2c->rd_total_len - i2c->rd_cmd_xfered;
>> -            int max_send = (JZ4780_I2C_FIFO_LEN - 1)
>> +            int max_send = (i2c->cdata->fifosize - 1)
>>                       - (i2c->rd_cmd_xfered
>>                       - i2c->rd_data_xfered);
>>              int cmd_to_send = min(cmd_left, max_send);
>>
>>              if (i2c->rd_cmd_xfered != 0)
>>                  cmd_to_send = min(cmd_to_send,
>> -                          JZ4780_I2C_FIFO_LEN
>> -                          - TX_LEVEL - 1);
>> +                          i2c->cdata->fifosize
>> +                          - i2c->cdata->tx_level - 1);
>>
>>              if (cmd_to_send) {
>> -                jz4780_i2c_send_rcmd(i2c, cmd_to_send);
>>                  i2c->rd_cmd_xfered += cmd_to_send;
>> +                cmd_left = i2c->rd_total_len - i2c->rd_cmd_xfered;
>> +                jz4780_i2c_send_rcmd(i2c, cmd_to_send, cmd_left);
>> +
>>              }
>>
>> -            cmd_left = i2c->rd_total_len - i2c->rd_cmd_xfered;
>>              if (cmd_left == 0) {
>>                  intmsk = jz4780_i2c_readw(i2c, JZ4780_I2C_INTM);
>>                  intmsk &= ~JZ4780_I2C_INTM_MTXEMP;
>>                  jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, intmsk);
>>
>> -                tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> -                tmp &= ~JZ4780_I2C_CTRL_STPHLD;
>> -                jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +                if (i2c->version < ID_X1000) {
>> +                    tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> +                    tmp &= ~JZ4780_I2C_CTRL_STPHLD;
>> +                    jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +                }
>>              }
>>          } else {
>>              unsigned short data;
>> @@ -496,24 +534,22 @@ static irqreturn_t jz4780_i2c_irq(int irqno, 
>> void *dev_id)
>>
>>              i2c_sta = jz4780_i2c_readw(i2c, JZ4780_I2C_STA);
>>
>> -            while ((i2c_sta & JZ4780_I2C_STA_TFNF) &&
>> -                   (i2c->wt_len > 0)) {
>> +            while ((i2c_sta & JZ4780_I2C_STA_TFNF) && (i2c->wt_len > 
>> 0)) {
>>                  i2c_sta = jz4780_i2c_readw(i2c, JZ4780_I2C_STA);
>>                  data = *i2c->wbuf;
>>                  data &= ~JZ4780_I2C_DC_READ;
>> -                jz4780_i2c_writew(i2c, JZ4780_I2C_DC,
>> -                          data);
>> +                if ((!i2c->stop_hold) && (i2c->version >= ID_X1000))
>> +                    data |= X1000_I2C_DC_STOP;
>> +                jz4780_i2c_writew(i2c, JZ4780_I2C_DC, data);
>>                  i2c->wbuf++;
>>                  i2c->wt_len--;
>>              }
>>
>>              if (i2c->wt_len == 0) {
>> -                if (!i2c->stop_hold) {
>> -                    tmp = jz4780_i2c_readw(i2c,
>> -                                   JZ4780_I2C_CTRL);
>> +                if ((!i2c->stop_hold) && (i2c->version < ID_X1000)) {
>> +                    tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>>                      tmp &= ~JZ4780_I2C_CTRL_STPHLD;
>> -                    jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL,
>> -                              tmp);
>> +                    jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>>                  }
>>
>>                  jz4780_i2c_trans_done(i2c);
>> @@ -567,20 +603,22 @@ static inline int jz4780_i2c_xfer_read(struct 
>> jz4780_i2c *i2c,
>>      i2c->rd_data_xfered = 0;
>>      i2c->rd_cmd_xfered = 0;
>>
>> -    if (len <= JZ4780_I2C_FIFO_LEN)
>> +    if (len <= i2c->cdata->fifosize)
>>          jz4780_i2c_writew(i2c, JZ4780_I2C_RXTL, len - 1);
>>      else
>> -        jz4780_i2c_writew(i2c, JZ4780_I2C_RXTL, RX_LEVEL);
>> +        jz4780_i2c_writew(i2c, JZ4780_I2C_RXTL, i2c->cdata->rx_level);
>>
>> -    jz4780_i2c_writew(i2c, JZ4780_I2C_TXTL, TX_LEVEL);
>> +    jz4780_i2c_writew(i2c, JZ4780_I2C_TXTL, i2c->cdata->tx_level);
>>
>>      jz4780_i2c_writew(i2c, JZ4780_I2C_INTM,
>>                JZ4780_I2C_INTM_MRXFL | JZ4780_I2C_INTM_MTXEMP
>>                | JZ4780_I2C_INTM_MTXABT | JZ4780_I2C_INTM_MRXOF);
>>
>> -    tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> -    tmp |= JZ4780_I2C_CTRL_STPHLD;
>> -    jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +    if (i2c->version < ID_X1000) {
>> +        tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> +        tmp |= JZ4780_I2C_CTRL_STPHLD;
>> +        jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +    }
>>
>>      spin_unlock_irqrestore(&i2c->lock, flags);
>>
>> @@ -626,14 +664,16 @@ static inline int jz4780_i2c_xfer_write(struct 
>> jz4780_i2c *i2c,
>>      i2c->wbuf = buf;
>>      i2c->wt_len = len;
>>
>> -    jz4780_i2c_writew(i2c, JZ4780_I2C_TXTL, TX_LEVEL);
>> +    jz4780_i2c_writew(i2c, JZ4780_I2C_TXTL, i2c->cdata->tx_level);
>>
>>      jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, JZ4780_I2C_INTM_MTXEMP
>>                      | JZ4780_I2C_INTM_MTXABT);
>>
>> -    tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> -    tmp |= JZ4780_I2C_CTRL_STPHLD;
>> -    jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +    if (i2c->version < ID_X1000) {
>> +        tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> +        tmp |= JZ4780_I2C_CTRL_STPHLD;
>> +        jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +    }
>>
>>      spin_unlock_irqrestore(&i2c->lock, flags);
>>
>> @@ -716,8 +756,21 @@ static const struct i2c_algorithm 
>> jz4780_i2c_algorithm = {
>>      .functionality    = jz4780_i2c_functionality,
>>  };
>>
>> +static const struct ingenic_i2c_config jz4780_i2c_config = {
>> +    .fifosize = JZ4780_I2C_FIFO_LEN,
>> +    .tx_level = JZ4780_I2C_FIFO_LEN / 2,
>> +    .rx_level = JZ4780_I2C_FIFO_LEN / 2 - 1,
>> +};
>> +
>> +static const struct ingenic_i2c_config x1000_i2c_config = {
>> +    .fifosize = X1000_I2C_FIFO_LEN,
>> +    .tx_level = X1000_I2C_FIFO_LEN / 2,
>> +    .rx_level = X1000_I2C_FIFO_LEN / 2 - 1,
>> +};
>> +
>>  static const struct of_device_id jz4780_i2c_of_matches[] = {
>> -    { .compatible = "ingenic,jz4780-i2c", },
>> +    { .compatible = "ingenic,jz4780-i2c", .data = (void *) ID_JZ4780 },
>> +    { .compatible = "ingenic,x1000-i2c", .data = (void *) ID_X1000 },
>
> I think in general you should pass pointers to your ingenic_i2c_config 
> structures directly in .data here, and have a "version" field in your 
> ingenic_i2c_config struct.
>

Sure, I will change it in v2.

>
>>      { /* sentinel */ }
>>  };
>>  MODULE_DEVICE_TABLE(of, jz4780_i2c_of_matches);
>> @@ -729,11 +782,24 @@ static int jz4780_i2c_probe(struct 
>> platform_device *pdev)
>>      unsigned short tmp;
>>      struct resource *r;
>>      struct jz4780_i2c *i2c;
>> +    const struct platform_device_id *id = platform_get_device_id(pdev);
>> +    const struct of_device_id  *of_id = of_match_device(
>> +            jz4780_i2c_of_matches, &pdev->dev);
>>
>>      i2c = devm_kzalloc(&pdev->dev, sizeof(struct jz4780_i2c), 
>> GFP_KERNEL);
>>      if (!i2c)
>>          return -ENOMEM;
>>
>> +    if (of_id)
>> +        i2c->version = (enum ingenic_i2c_version)of_id->data;
>> +    else
>> +        i2c->version = (enum ingenic_i2c_version)id->driver_data;
>> +
>> +    if (i2c->version >= ID_X1000)
>> +        i2c->cdata = &x1000_i2c_config;
>> +    else
>> +        i2c->cdata = &jz4780_i2c_config;
>> +
>
> Then you can replace all these lines with:
> i2c->cdata = device_get_match_data(dev);
>
> And your checks on i2c->version become checks on i2c->cdata->version.
>

OK, will change in v2.

>
>>      i2c->adap.owner        = THIS_MODULE;
>>      i2c->adap.algo        = &jz4780_i2c_algorithm;
>>      i2c->adap.algo_data    = i2c;
>> @@ -777,9 +843,11 @@ static int jz4780_i2c_probe(struct 
>> platform_device *pdev)
>>
>>      dev_info(&pdev->dev, "Bus frequency is %d KHz\n", i2c->speed);
>>
>> -    tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> -    tmp &= ~JZ4780_I2C_CTRL_STPHLD;
>> -    jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +    if (i2c->version < ID_X1000) {
>> +        tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> +        tmp &= ~JZ4780_I2C_CTRL_STPHLD;
>> +        jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +    }
>>
>>      jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, 0x0);
>>
>> @@ -809,6 +877,12 @@ static int jz4780_i2c_remove(struct 
>> platform_device *pdev)
>>      return 0;
>>  }
>>
>> +static const struct platform_device_id ingenic_i2c_ids[] = {
>> +    { "jz4780-i2c", ID_JZ4780 },
>> +    { "x1000-i2c", ID_X1000 },
>> +    {},
>
> I honestly think you can drop the platform ID table. It will never be 
> used.
>

OK, just need to drop the platform ID table? Or any other changes need 
to be made?

Thanks and best regards!

> Cheers,
> -Paul
>
>> +};
>> +
>>  static struct platform_driver jz4780_i2c_driver = {
>>      .probe        = jz4780_i2c_probe,
>>      .remove        = jz4780_i2c_remove,
>> @@ -816,6 +890,7 @@ static struct platform_driver jz4780_i2c_driver = {
>>          .name    = "jz4780-i2c",
>>          .of_match_table = of_match_ptr(jz4780_i2c_of_matches),
>>      },
>> +    .id_table = ingenic_i2c_ids,
>>  };
>>
>>  module_platform_driver(jz4780_i2c_driver);
>> -- 
>> 2.7.4
>>
>

