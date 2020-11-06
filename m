Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C904A2A9B03
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Nov 2020 18:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgKFRl1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Nov 2020 12:41:27 -0500
Received: from linux.microsoft.com ([13.77.154.182]:46340 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgKFRl1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Nov 2020 12:41:27 -0500
Received: by linux.microsoft.com (Postfix, from userid 1046)
        id 226BF20BE4A6; Fri,  6 Nov 2020 09:41:26 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 226BF20BE4A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1604684486;
        bh=/E8p26BZs+ElXJp0kzG7i/GtDQpHpgqTRJRJOBKzc7c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bcYquINMUl7AEexnx6z825WlUruPKZPoDg6YR5G5OiuWryDDlOi3zdvH5XVoy/t7g
         7yDwQxPun5EDf9OFv7INJ+kgnKh7aByCLuPGd7D2b6BsroV0beZRzydMIVDSXSmHbh
         kyx8Fe7Yi1eI+e4e5LBmwYyoIEcEylyxVIzTgbPw=
From:   Dhananjay Phadke <dphadke@linux.microsoft.com>
To:     rayagonda.kokatanur@broadcom.com
Cc:     andriy.shevchenko@linux.intel.com,
        bcm-kernel-feedback-list@broadcom.com, brendanhiggins@google.com,
        dphadke@linux.microsoft.com, f.fainelli@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, lori.hikichi@broadcom.com,
        ray.jui@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com,
        wsa@kernel.org
Subject: Re: [PATCH v3 5/6] i2c: iproc: handle master read request
Date:   Fri,  6 Nov 2020 09:41:26 -0800
Message-Id: <1604684486-16272-1-git-send-email-dphadke@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <CAHO=5PGAMvRAyrBF3_ubbgciqHV3hAbmt4B7Rb3hdibMbgs6ZQ@mail.gmail.com>
References: <CAHO=5PGAMvRAyrBF3_ubbgciqHV3hAbmt4B7Rb3hdibMbgs6ZQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 5 Nov 2020 15:13:04 +0530, Rayagonda Kokatanur wrote:
>> So the suggestion was to set HW threshold for rx fifo interrupt, not
>> really a SW property. By setting it in DT, makes it easier to
>> customize for target system, module param needs or ioctl makes it
>> dependent on userpsace to configure it.
>>
>> The need for tasklet seems to arise from the fact that many bytes are
>> left in the fifo. If there's a common problem here, such tasklet would be
>> needed in i2c subsys rather than controller specific tweak, akin to
>> how networking uses NAPI or adding block transactions to the interface?
>>
>> For master write-read event, it seems both IS_S_RD_EVENT_SHIFT and
>> IS_S_RX_EVENT_SHIFT are detected, which implies that core is late to
>> drain rx fifo i.e. write is complete and the read has started on the bus?
>
>Yes it's true that for master write-read events both
>IS_S_RD_EVENT_SHIFT and IS_S_RX_EVENT_SHIFT  are coming together.
>So before the slave starts transmitting data to the master, it should
>first read all data from rx-fifo i.e. complete master write and then
>process master read.
>
>To minimise interrupt overhead, we are batching 64bytes.
>To keep isr running for less time, we are using a tasklet.
>Again to keep the tasklet not running for more than 20u, we have set
>max of 10 bytes data read from rx-fifo per tasklet run.
>
>If we start processing everything in isr and using rx threshold
>interrupt, then isr will run for a longer time and this may hog the
>system.
>For example, to process 10 bytes it takes 20us, to process 30 bytes it
>takes 60us and so on.
>So is it okay to run isr for so long ?
>
>Keeping all this in mind we thought a tasklet would be a good option
>and kept max of 10 bytes read per tasklet.
>
>Please let me know if you still feel we should not use a tasklet and
>don't batch 64 bytes.

Deferring to tasklet is OK, could use a kernel thread (i.e. threaded_irq)
as i2c rate is quite low.

But do enable rx_threshold and read out early. This will avoid fifo full
or master write-read situation where lot of bytes must be drained from rx
fifo before serving tx fifo (avoid tx underrun).

Best would have been setting up DMA into mem (some controllers seem capable).
In absence of that, it's a trade off: if rx intr threshold is low,
there will be more interrupts, but less time spent in each. Default could
still be 64B or no-thresh (allow override in dtb).

Few other comments -

>+		/* schedule tasklet to read data later */
>+		tasklet_schedule(&iproc_i2c->slave_rx_tasklet);
>+
>+		/* clear only IS_S_RX_EVENT_SHIFT interrupt */
>+		iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET,
>+				 BIT(IS_S_RX_EVENT_SHIFT));
>+	}

Why clearing one rx interrupt bit here after scheduling tasklet? Should all that
be done by tasklet? Also should just return after scheduling tasklet?

Thanks,
Dhananjay
