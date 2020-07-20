Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1947226D46
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jul 2020 19:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729326AbgGTRkZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jul 2020 13:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbgGTRkY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jul 2020 13:40:24 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77553C061794
        for <linux-i2c@vger.kernel.org>; Mon, 20 Jul 2020 10:40:24 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 184so346990wmb.0
        for <linux-i2c@vger.kernel.org>; Mon, 20 Jul 2020 10:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hNTtSnwQCPYkI9vVfOrEJLQRwWlzgGEc02Rqyshk+Hw=;
        b=Te0Y+PvEO5oNpWcaCTFDOBSRHyVqXRNcCBjyZqDeeObYUqqdGcGttbA6SiV13LiTRM
         jDRSdrsv1zfBWv+aHt0XqJT9ANTr9V5H0d7arLpfEDQkpIjNGKqJ7XLCUQpjiQbwIJVE
         mATPyPyTeGi6yzCK76m2kDlZZ6FCjXI1ZRuYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hNTtSnwQCPYkI9vVfOrEJLQRwWlzgGEc02Rqyshk+Hw=;
        b=kq0bjSXpGi+Jfk7guqxBcdom+h6BpE4WA/2SIN4sfEE2p8b17AU8LcqU6C9GwXg1ik
         xw8o0ozBywaWpCtClgCZ/zQdFl+M5Gprd6/XtgxiUz1rnt43PWVSDvKckGDwXs9UzbHi
         SbuIIDTqyWAel14Rqr4RLce0p/mbpICg2unbSbNOTXs8vILEZZOleDcZ7JdCSqLBYMww
         PokpeNCymjCaZP/xSkN/onkHmg/GGqpwDtQ/vNUZoKaxORQe47jFyShvTmSz8lGAjRqW
         liqcIapK9qRrXMfP/eXDqPOixpxIicwPKqCKSXa/tcjq+34Sc1mOjdbLbG5vIA8odRr0
         eAJQ==
X-Gm-Message-State: AOAM533CLbyFbKiIF+v9I6gr8+VqbDRrvoquaVoj4EvDlMMwS57yzDDA
        O0IxkBwMz7MZUbuxwZg3RohkGw==
X-Google-Smtp-Source: ABdhPJxPFmPtcldJ9Rmp5A0gxl2dDeFwR6B9YKH2VhvyUueGRULhzNHEhWlNfh0zDPXM4rzLzJzCOQ==
X-Received: by 2002:a1c:1b90:: with SMTP id b138mr392710wmb.21.1595266822926;
        Mon, 20 Jul 2020 10:40:22 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id d13sm34202869wrq.89.2020.07.20.10.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2020 10:40:22 -0700 (PDT)
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and isr
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Ray Jui <rjui@broadcom.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
References: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
 <CAHO=5PFGqyacnneCp76brDymyZK0axG+4n3RPThFp6w=-xP7hA@mail.gmail.com>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <f7397069-e22b-a921-132c-144ee3a07580@broadcom.com>
Date:   Mon, 20 Jul 2020 10:40:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHO=5PFGqyacnneCp76brDymyZK0axG+4n3RPThFp6w=-xP7hA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

looks good.

On 2020-07-19 12:59 a.m., Rayagonda Kokatanur wrote:
> On Sun, Jul 19, 2020 at 5:10 AM Dhananjay Phadke
> <dphadke@linux.microsoft.com> wrote:
>> When i2c client unregisters, synchronize irq before setting
>> iproc_i2c->slave to NULL.
>>
>> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000318
>>
>> [  371.020421] pc : bcm_iproc_i2c_isr+0x530/0x11f0
>> [  371.025098] lr : __handle_irq_event_percpu+0x6c/0x170
>> [  371.030309] sp : ffff800010003e40
>> [  371.033727] x29: ffff800010003e40 x28: 0000000000000060
>> [  371.039206] x27: ffff800010ca9de0 x26: ffff800010f895df
>> [  371.044686] x25: ffff800010f18888 x24: ffff0008f7ff3600
>> [  371.050165] x23: 0000000000000003 x22: 0000000001600000
>> [  371.055645] x21: ffff800010f18888 x20: 0000000001600000
>> [  371.061124] x19: ffff0008f726f080 x18: 0000000000000000
>> [  371.066603] x17: 0000000000000000 x16: 0000000000000000
>> [  371.072082] x15: 0000000000000000 x14: 0000000000000000
>> [  371.077561] x13: 0000000000000000 x12: 0000000000000001
>> [  371.083040] x11: 0000000000000000 x10: 0000000000000040
>> [  371.088519] x9 : ffff800010f317c8 x8 : ffff800010f317c0
>> [  371.093999] x7 : ffff0008f805b3b0 x6 : 0000000000000000
>> [  371.099478] x5 : ffff0008f7ff36a4 x4 : ffff8008ee43d000
>> [  371.104957] x3 : 0000000000000000 x2 : ffff8000107d64c0
>> [  371.110436] x1 : 00000000c00000af x0 : 0000000000000000
>>
>> [  371.115916] Call trace:
>> [  371.118439]  bcm_iproc_i2c_isr+0x530/0x11f0
>> [  371.122754]  __handle_irq_event_percpu+0x6c/0x170
>> [  371.127606]  handle_irq_event_percpu+0x34/0x88
>> [  371.132189]  handle_irq_event+0x40/0x120
>> [  371.136234]  handle_fasteoi_irq+0xcc/0x1a0
>> [  371.140459]  generic_handle_irq+0x24/0x38
>> [  371.144594]  __handle_domain_irq+0x60/0xb8
>> [  371.148820]  gic_handle_irq+0xc0/0x158
>> [  371.152687]  el1_irq+0xb8/0x140
>> [  371.155927]  arch_cpu_idle+0x10/0x18
>> [  371.159615]  do_idle+0x204/0x290
>> [  371.162943]  cpu_startup_entry+0x24/0x60
>> [  371.166990]  rest_init+0xb0/0xbc
>> [  371.170322]  arch_call_rest_init+0xc/0x14
>> [  371.174458]  start_kernel+0x404/0x430
>>
>> Fixes: c245d94ed106 ("i2c: iproc: Add multi byte read-write support for slave mode")
>> Signed-off-by: Dhananjay Phadke <dphadke@linux.microsoft.com>
Acked-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>>   drivers/i2c/busses/i2c-bcm-iproc.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
>> index b58224b7b..37d2a79e7 100644
>> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
>> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
>> @@ -1074,14 +1074,15 @@ static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
>>          if (!iproc_i2c->slave)
>>                  return -EINVAL;
>>
>> -       iproc_i2c->slave = NULL;
>> -
>>          /* disable all slave interrupts */
>>          tmp = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
>>          tmp &= ~(IE_S_ALL_INTERRUPT_MASK <<
>>                          IE_S_ALL_INTERRUPT_SHIFT);
>>          iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, tmp);
>>
>> +       synchronize_irq(iproc_i2c->irq);
>> +       iproc_i2c->slave = NULL;
>> +
>>          /* Erase the slave address programmed */
>>          tmp = iproc_i2c_rd_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET);
>>          tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
> Looks good to me. Thank you for the patch.
> Reviewed-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
>
> Regards,
> Rayagonda

