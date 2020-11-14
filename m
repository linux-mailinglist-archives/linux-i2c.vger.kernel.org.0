Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A42F2B2A64
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Nov 2020 02:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgKNBRk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Nov 2020 20:17:40 -0500
Received: from linux.microsoft.com ([13.77.154.182]:59560 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgKNBRk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Nov 2020 20:17:40 -0500
Received: by linux.microsoft.com (Postfix, from userid 1046)
        id 6B85E20B71B7; Fri, 13 Nov 2020 17:17:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6B85E20B71B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1605316659;
        bh=yUF3L6bAkQSx57oUz6pPfzc487YJPjSYBv9gnynSNRc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nyIdzzSJoZHNLbkf+LBkN/YUO6dxnk6BDkVtbkFafsayjDjlVxKzhLONudEhqYDv6
         D9npTEhjg/JOevaU0Q36G00on/hick+/lKyn+OmBYn2kIr5iL7JudDm1y/04WskFz2
         eX/flqr4sjvmhvP3OTEHutoRn+qE7jFScyau/vkU=
From:   Dhananjay Phadke <dphadke@linux.microsoft.com>
To:     ray.jui@broadcom.com
Cc:     andriy.shevchenko@linux.intel.com,
        bcm-kernel-feedback-list@broadcom.com, brendanhiggins@google.com,
        dphadke@linux.microsoft.com, f.fainelli@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, lori.hikichi@broadcom.com,
        rayagonda.kokatanur@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, wsa@kernel.org
Subject: Re: [PATCH v3 5/6] i2c: iproc: handle master read request
Date:   Fri, 13 Nov 2020 17:17:39 -0800
Message-Id: <1605316659-3422-1-git-send-email-dphadke@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <38a23afc-57da-a01f-286c-15f8b3d61705@broadcom.com>
References: <38a23afc-57da-a01f-286c-15f8b3d61705@broadcom.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 10 Nov 2020 11:24:36 -0800, Ray Jui wrote:

>>>> Yes it's true that for master write-read events both
>>>> IS_S_RD_EVENT_SHIFT and IS_S_RX_EVENT_SHIFT  are coming together.
>>>> So before the slave starts transmitting data to the master, it should
>>>> first read all data from rx-fifo i.e. complete master write and then
>>>> process master read.
>>>>
>>>> To minimise interrupt overhead, we are batching 64bytes.
>>>> To keep isr running for less time, we are using a tasklet.
>>>> Again to keep the tasklet not running for more than 20u, we have set
>>>> max of 10 bytes data read from rx-fifo per tasklet run.
>>>>
>>>> If we start processing everything in isr and using rx threshold
>>>> interrupt, then isr will run for a longer time and this may hog the
>>>> system.
>>>> For example, to process 10 bytes it takes 20us, to process 30 bytes it
>>>> takes 60us and so on.
>>>> So is it okay to run isr for so long ?
>>>>
>>>> Keeping all this in mind we thought a tasklet would be a good option
>>>> and kept max of 10 bytes read per tasklet.
>>>>
>>>> Please let me know if you still feel we should not use a tasklet and
>>>> don't batch 64 bytes.
>>>
>>> Deferring to tasklet is OK, could use a kernel thread (i.e. threaded_irq)
>>> as i2c rate is quite low.
>>>
>
>kernel thread was proposed in the internal review. I don't see much
>benefit of using tasklet. If a thread is blocked from running for more
>than several tenth of ms, that's really a system-level issue than an
>issue with this driver.
>
>IMO, it's an overkill to use tasklet here but we can probably leave it
>as it is since it does not have a adverse effect and the code ran in
>tasklet is short.
>
>How much time is expected to read 64 bytes from an RX FIFO? Even with
>APB bus each register read is expected to be in the tenth or hundreds of
>nanosecond range. Reading the entire FIFO of 64 bytes should take less
>than 10 us. The interrupt context switch overhead is probably longer
>than that. It's much more effective to read all of them in a single
>batch than breaking them into multiple batches.

OK, there's a general discussions towards removing tasklets, if this
fix works with threaded isr, strongly recommend that route.

This comment in the code suggested that register reads take long time to
drain 64 bytes.

>+/*
>+ * It takes ~18us to reading 10bytes of data, hence to keep tasklet
>+ * running for less time, max slave read per tasklet is set to 10
>bytes.

@Rayagonda, please take care of hand-off mentioned below, once the tasklet
is scheduled, isr should just return and clear status at the end of tasklet.

>>
>> Few other comments -
>>
>>> +              /* schedule tasklet to read data later */
>>> +              tasklet_schedule(&iproc_i2c->slave_rx_tasklet);
>>> +
>>> +              /* clear only IS_S_RX_EVENT_SHIFT interrupt */
>>> +              iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET,
>>> +                               BIT(IS_S_RX_EVENT_SHIFT));
>>> +      }
>>
>> Why clearing one rx interrupt bit here after scheduling tasklet? Should all that
>> be done by tasklet? Also should just return after scheduling tasklet?

Regards,
Dhananjay
