Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621D91225D9
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 08:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfLQHvJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 02:51:09 -0500
Received: from out28-172.mail.aliyun.com ([115.124.28.172]:44274 "EHLO
        out28-172.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfLQHvJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Dec 2019 02:51:09 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.419147-0.00477673-0.576076;DS=CONTINUE|ham_system_inform|0.021329-0.00209961-0.976571;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16367;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.GItK24u_1576569021;
Received: from 192.168.88.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GItK24u_1576569021)
          by smtp.aliyun-inc.com(10.147.44.145);
          Tue, 17 Dec 2019 15:50:24 +0800
Subject: Re: [PATCH v2 2/2] I2C: JZ4780: Add support for the X1000.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1576490771-120353-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1576490771-120353-4-git-send-email-zhouyanjie@wanyeetech.com>
 <1576504625.3.4@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mark.rutland@arm.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 2374286503@qq.com
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5DF888BC.9040601@wanyeetech.com>
Date:   Tue, 17 Dec 2019 15:50:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1576504625.3.4@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Paul,

On 2019年12月16日 21:57, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le lun., déc. 16, 2019 at 18:06, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Add support for probing i2c driver on the X1000 Soc from Ingenic.
>> call the corresponding fifo parameter according to the device
>> model obtained from the devicetree.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v1->v2:
>>     Add code to check device_get_match_data(), if it return a NULL ptr,
>>     then print an error message and return -ENODEV.
>>
>>  drivers/i2c/busses/i2c-jz4780.c | 155 
>> +++++++++++++++++++++++++++++-----------
>>  1 file changed, 115 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-jz4780.c 
>> b/drivers/i2c/busses/i2c-jz4780.c
>> index 25dcd73..f07a07c 100644
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
>> @@ -130,18 +135,33 @@ static const char * const jz4780_i2c_abrt_src[] 
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
>> +/* ingenic_i2c_config: SoC specific config data. */
>> +struct ingenic_i2c_config {
>> +    enum ingenic_i2c_version version;
>> +
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
>> +    const struct ingenic_i2c_config *cdata;
>>
>>      /* lock to protect rbuf and wbuf between xfer_rd/wr and irq 
>> handler */
>>      spinlock_t        lock;
>> @@ -340,11 +360,18 @@ static int jz4780_i2c_set_speed(struct 
>> jz4780_i2c *i2c)
>>
>>      if (hold_time >= 0) {
>>          /*i2c hold time enable */
>> -        hold_time |= JZ4780_I2C_SDAHD_HDENB;
>> -        jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, hold_time);
>> +        if (i2c->cdata->version >= ID_X1000)
>> +            jz4780_i2c_writew(i2c, X1000_I2C_SDAHD, hold_time);
>> +        else {
>
> If only one branch of a conditional statement is a single statement, 
> then you should use braces in both branches.
>

Sure, I will fix this in v3.

> See: 
> https://www.kernel.org/doc/html/v4.10/process/coding-style.html#placing-braces-and-spaces 
>
>
>
>> +            hold_time |= JZ4780_I2C_SDAHD_HDENB;
>> +            jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, hold_time);
>> +        }
>>      } else {
>>          /* disable hold time */
>> -        jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, 0);
>> +        if (i2c->cdata->version >= ID_X1000)
>> +            jz4780_i2c_writew(i2c, X1000_I2C_SDAHD, 0);
>> +        else
>> +            jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, 0);
>>      }
>>
>>      return 0;
>> @@ -359,9 +386,11 @@ static int jz4780_i2c_cleanup(struct jz4780_i2c 
>> *i2c)
>>      spin_lock_irqsave(&i2c->lock, flags);
>>
>>      /* can send stop now if need */
>> -    tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> -    tmp &= ~JZ4780_I2C_CTRL_STPHLD;
>> -    jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +    if (i2c->cdata->version < ID_X1000) {
>> +        tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> +        tmp &= ~JZ4780_I2C_CTRL_STPHLD;
>> +        jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +    }
>>
>>      /* disable all interrupts first */
>>      jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, 0);
>> @@ -399,11 +428,18 @@ static int jz4780_i2c_prepare(struct jz4780_i2c 
>> *i2c)
>>      return jz4780_i2c_enable(i2c);
>>  }
>>
>> -static void jz4780_i2c_send_rcmd(struct jz4780_i2c *i2c, int cmd_count)
>> +static void jz4780_i2c_send_rcmd(struct jz4780_i2c *i2c,
>> +                       int cmd_count, int cmd_left)
>
> Sorry to be pedantic ;) but this line is not properly indented. You 
> should indent with tab charaters (configure your IDE for one tab == 4 
> spaces) as much as possible, then use spaces to align the first word.
>

Sure, I will fix this in v3.

Thanks and best regards!

> With these two things fixed:
> Acked-by: Paul Cercueil <paul@crapouillou.net>
>
> Cheers,
> -Paul
>
>
>>  {
>>      int i;
>>
>> -    for (i = 0; i < cmd_count; i++)
>> +    for (i = 0; i < cmd_count - 1; i++)
>> +        jz4780_i2c_writew(i2c, JZ4780_I2C_DC, JZ4780_I2C_DC_READ);
>> +
>> +    if ((cmd_left == 0) && (i2c->cdata->version >= ID_X1000))
>> +        jz4780_i2c_writew(i2c, JZ4780_I2C_DC,
>> +                JZ4780_I2C_DC_READ | X1000_I2C_DC_STOP);
>> +    else
>>          jz4780_i2c_writew(i2c, JZ4780_I2C_DC, JZ4780_I2C_DC_READ);
>>  }
>>
>> @@ -458,37 +494,44 @@ static irqreturn_t jz4780_i2c_irq(int irqno, 
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
>> +                cmd_left = i2c->rd_total_len -
>> +                        i2c->rd_cmd_xfered;
>> +                jz4780_i2c_send_rcmd(i2c,
>> +                        cmd_to_send, cmd_left);
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
>> +                if (i2c->cdata->version < ID_X1000) {
>> +                    tmp = jz4780_i2c_readw(i2c,
>> +                            JZ4780_I2C_CTRL);
>> +                    tmp &= ~JZ4780_I2C_CTRL_STPHLD;
>> +                    jz4780_i2c_writew(i2c,
>> +                            JZ4780_I2C_CTRL, tmp);
>> +                }
>>              }
>>          } else {
>>              unsigned short data;
>> @@ -497,23 +540,26 @@ static irqreturn_t jz4780_i2c_irq(int irqno, 
>> void *dev_id)
>>              i2c_sta = jz4780_i2c_readw(i2c, JZ4780_I2C_STA);
>>
>>              while ((i2c_sta & JZ4780_I2C_STA_TFNF) &&
>> -                   (i2c->wt_len > 0)) {
>> +                    (i2c->wt_len > 0)) {
>>                  i2c_sta = jz4780_i2c_readw(i2c, JZ4780_I2C_STA);
>>                  data = *i2c->wbuf;
>>                  data &= ~JZ4780_I2C_DC_READ;
>> -                jz4780_i2c_writew(i2c, JZ4780_I2C_DC,
>> -                          data);
>> +                if ((!i2c->stop_hold) && (i2c->cdata->version >=
>> +                        ID_X1000))
>> +                    data |= X1000_I2C_DC_STOP;
>> +                jz4780_i2c_writew(i2c, JZ4780_I2C_DC, data);
>>                  i2c->wbuf++;
>>                  i2c->wt_len--;
>>              }
>>
>>              if (i2c->wt_len == 0) {
>> -                if (!i2c->stop_hold) {
>> +                if ((!i2c->stop_hold) && (i2c->cdata->version <
>> +                        ID_X1000)) {
>>                      tmp = jz4780_i2c_readw(i2c,
>> -                                   JZ4780_I2C_CTRL);
>> +                            JZ4780_I2C_CTRL);
>>                      tmp &= ~JZ4780_I2C_CTRL_STPHLD;
>> -                    jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL,
>> -                              tmp);
>> +                    jz4780_i2c_writew(i2c,
>> +                            JZ4780_I2C_CTRL, tmp);
>>                  }
>>
>>                  jz4780_i2c_trans_done(i2c);
>> @@ -567,20 +613,22 @@ static inline int jz4780_i2c_xfer_read(struct 
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
>> +    if (i2c->cdata->version < ID_X1000) {
>> +        tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> +        tmp |= JZ4780_I2C_CTRL_STPHLD;
>> +        jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +    }
>>
>>      spin_unlock_irqrestore(&i2c->lock, flags);
>>
>> @@ -626,14 +674,16 @@ static inline int jz4780_i2c_xfer_write(struct 
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
>> +    if (i2c->cdata->version < ID_X1000) {
>> +        tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> +        tmp |= JZ4780_I2C_CTRL_STPHLD;
>> +        jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +    }
>>
>>      spin_unlock_irqrestore(&i2c->lock, flags);
>>
>> @@ -716,8 +766,25 @@ static const struct i2c_algorithm 
>> jz4780_i2c_algorithm = {
>>      .functionality    = jz4780_i2c_functionality,
>>  };
>>
>> +static const struct ingenic_i2c_config jz4780_i2c_config = {
>> +    .version = ID_JZ4780,
>> +
>> +    .fifosize = JZ4780_I2C_FIFO_LEN,
>> +    .tx_level = JZ4780_I2C_FIFO_LEN / 2,
>> +    .rx_level = JZ4780_I2C_FIFO_LEN / 2 - 1,
>> +};
>> +
>> +static const struct ingenic_i2c_config x1000_i2c_config = {
>> +    .version = ID_X1000,
>> +
>> +    .fifosize = X1000_I2C_FIFO_LEN,
>> +    .tx_level = X1000_I2C_FIFO_LEN / 2,
>> +    .rx_level = X1000_I2C_FIFO_LEN / 2 - 1,
>> +};
>> +
>>  static const struct of_device_id jz4780_i2c_of_matches[] = {
>> -    { .compatible = "ingenic,jz4780-i2c", },
>> +    { .compatible = "ingenic,jz4780-i2c", .data = &jz4780_i2c_config },
>> +    { .compatible = "ingenic,x1000-i2c", .data = &x1000_i2c_config },
>>      { /* sentinel */ }
>>  };
>>  MODULE_DEVICE_TABLE(of, jz4780_i2c_of_matches);
>> @@ -734,6 +801,12 @@ static int jz4780_i2c_probe(struct 
>> platform_device *pdev)
>>      if (!i2c)
>>          return -ENOMEM;
>>
>> +    i2c->cdata = device_get_match_data(&pdev->dev);
>> +    if (!i2c->cdata) {
>> +        dev_err(&pdev->dev, "Error: No device match found\n");
>> +        return -ENODEV;
>> +    }
>> +
>>      i2c->adap.owner        = THIS_MODULE;
>>      i2c->adap.algo        = &jz4780_i2c_algorithm;
>>      i2c->adap.algo_data    = i2c;
>> @@ -777,9 +850,11 @@ static int jz4780_i2c_probe(struct 
>> platform_device *pdev)
>>
>>      dev_info(&pdev->dev, "Bus frequency is %d KHz\n", i2c->speed);
>>
>> -    tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> -    tmp &= ~JZ4780_I2C_CTRL_STPHLD;
>> -    jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +    if (i2c->cdata->version < ID_X1000) {
>> +        tmp = jz4780_i2c_readw(i2c, JZ4780_I2C_CTRL);
>> +        tmp &= ~JZ4780_I2C_CTRL_STPHLD;
>> +        jz4780_i2c_writew(i2c, JZ4780_I2C_CTRL, tmp);
>> +    }
>>
>>      jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, 0x0);
>>
>> -- 
>> 2.7.4
>>
>

