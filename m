Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0592C719358
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jun 2023 08:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbjFAGiI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 1 Jun 2023 02:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbjFAGiH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jun 2023 02:38:07 -0400
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A09C0
        for <linux-i2c@vger.kernel.org>; Wed, 31 May 2023 23:38:04 -0700 (PDT)
X-ASG-Debug-ID: 1685601477-086e233135056f0001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id WWEpSeFjDWH9jzbC (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 01 Jun 2023 14:37:58 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 1 Jun
 2023 14:37:57 +0800
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 1 Jun
 2023 14:37:56 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com ([fe80::9855:4cb:7f79:a31d]) by
 ZXBJMBX03.zhaoxin.com ([fe80::9855:4cb:7f79:a31d%4]) with mapi id
 15.01.2507.016; Thu, 1 Jun 2023 14:37:56 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.163
From:   HansHu-oc <HansHu-oc@zhaoxin.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Cobe Chen(BJ-RD)" <CobeChen@zhaoxin.com>,
        "Tony W. Wang(XA-RD)" <TonyWWang@zhaoxin.com>
Subject: Re: [PATCH v2] i2c: add support for Zhaoxin I2C controller
Thread-Topic: [PATCH v2] i2c: add support for Zhaoxin I2C controller
X-ASG-Orig-Subj: Re: [PATCH v2] i2c: add support for Zhaoxin I2C controller
Thread-Index: AdmUUwR14QhYu2MgO0iFXo1cHs3mZw==
Date:   Thu, 1 Jun 2023 06:37:56 +0000
Message-ID: <3509ba04d98b4537ba3459407da43f62@zhaoxin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.28.64.62]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1685601477
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 2607
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.00
X-Barracuda-Spam-Status: No, SCORE=-2.00 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=THREAD_INDEX, THREAD_TOPIC
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.109452
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
        0.01 THREAD_TOPIC           Thread-Topic: ...(Japanese Subject)...
        0.01 THREAD_INDEX           thread-index: AcO7Y8iR61tzADqsRmmc5wNiFHEOig==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

Thank you very much for reviewing this. I'll take most of your
proposed changes and double check patch with checkpatch.pl.

For the following two proposed changes, please see if my
consideration is reasonable.

On 2023/5/31 19:00, Andi Shyti wrote:
> [...]
>
>> +static irqreturn_t zxi2c_irq_handle(int irq, void *dev_id)
>> +{
>> +	struct zxi2c *i2c = (struct zxi2c *)dev_id;
>> +	void __iomem *regs = i2c->regs;
>> +	u8 status = get_irq_status(regs);
>> +
>> +	if ((status & IRQ_STS_MASK) == 0)
>> +		return IRQ_NONE;
>
> unlikely?

This irq is shared, so it is possible.

>> +	if (status & IRQ_SCL_TIMEOUT)
>> +		dev_warn(i2c->dev, "timeout(HW), ID: 0x%X\n", i2c->addr);
>> +
>> +	if (status & IRQ_STS_ADDRNACK) {
>> +		dev_dbg(i2c->dev, "addr NACK, ID: 0x%X\n", i2c->addr);
>> +	} else if (status & IRQ_STS_BYTEEND) {
>> +		i2c->byte_left--;
>> +		if (!i2c->is_read) {
>> +			if (is_nack(regs)) {
>> +				status = IRQ_STS_BYTENACK;
>> +				i2c->byte_left++;
>> +				dev_err(i2c->dev, "data NACK, ID: 0x%X\n",
>> +					i2c->addr);
>> +			} else if (i2c->byte_left == 0 && i2c->is_last_msg) {
>> +				stop_write_byte(regs);
>> +			}
>> +		}
>> +	}
>> +
>> +	i2c->event = status;
>> +	clear_irq_status(regs);
>> +	wake_up(&i2c->waitq);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int zxi2c_wait_event(struct zxi2c *i2c, u8 event)
>> +{
>> +	int timeout;
>> +
>> +	timeout = wait_event_interruptible_timeout(i2c->waitq,
>> +			i2c->event != 0,
>> +			msecs_to_jiffies(ZXI2C_TIMEOUT));
>> +
>> +	if (i2c->event & event)
>> +		return 0;
>
> is this valid even when "timeout == 0"?

Let's see the description of the value returned by wait_event_interruptible_timeout():
https://elixir.bootlin.com/linux/v6.3.5/source/include/linux/wait.h#L525
 * Returns:
 * 0 if the @condition evaluated to %false after the @timeout elapsed,
 * 1 if the @condition evaluated to %true after the @timeout elapsed,
 * the remaining jiffies (at least 1) if the @condition evaluated
 * to %true before the @timeout elapsed, or -%ERESTARTSYS if it was
 * interrupted by a signal.
So, "timeout == 0" and @condition evaluated to %true unlikely to happen at the same time.

Or is it OK to change it to like below?
+    timeout = wait_event_interruptible_timeout(i2c->waitq,
+            i2c->event != 0,
+            msecs_to_jiffies(ZXI2C_TIMEOUT));
+
+    if (i2c->event & event) {
+        if (timeout == 1)
+            dev_warn(i2c->dev, "thread may be blocked\n");
+        return 0;
+    }
+
+    if (timeout == 0) {

Hans
