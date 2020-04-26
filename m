Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCFD1B8F74
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 13:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbgDZLj5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 07:39:57 -0400
Received: from mfdf018.ocn.ad.jp ([153.128.50.74]:50815 "EHLO
        mfdf018.ocn.ad.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgDZLj5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Apr 2020 07:39:57 -0400
X-Greylist: delayed 3634 seconds by postgrey-1.27 at vger.kernel.org; Sun, 26 Apr 2020 07:39:56 EDT
Received: from mogw1037.ocn.ad.jp (mogw1037.ocn.ad.jp [153.149.231.43])
        by mfdf018.ocn.ad.jp (Postfix) with ESMTP id C8525B80AB8
        for <linux-i2c@vger.kernel.org>; Sun, 26 Apr 2020 19:39:21 +0900 (JST)
Received: from mf-smf-ucb025c1 (mf-smf-ucb025c1.ocn.ad.jp [153.153.66.163])
        by mogw1037.ocn.ad.jp (Postfix) with ESMTP id 52093D0027B;
        Sun, 26 Apr 2020 19:39:19 +0900 (JST)
Received: from ocn-vc-mts-103c1.ocn.ad.jp ([153.138.237.78])
        by mf-smf-ucb025c1 with ESMTP
        id SeaTjtJde4tSHSegxj86aH; Sun, 26 Apr 2020 19:39:19 +0900
Received: from smtp.ocn.ne.jp ([153.149.227.166])
        by ocn-vc-mts-103c1.ocn.ad.jp with ESMTP
        id SegxjJw1NugkLSegxj2ods; Sun, 26 Apr 2020 19:39:19 +0900
Received: from localhost (p2275225-ipngn10201funabasi.chiba.ocn.ne.jp [180.11.119.225])
        by smtp.ocn.ne.jp (Postfix) with ESMTPA;
        Sun, 26 Apr 2020 19:39:19 +0900 (JST)
Date:   Sun, 26 Apr 2020 19:39:16 +0900 (JST)
Message-Id: <20200426.193916.2256641485530997030.anemo@mba.ocn.ne.jp>
To:     wsa@the-dreams.de
Cc:     atsushi.nemoto@sord.co.jp, thor.thayer@linux.intel.com,
        linux-i2c@vger.kernel.org, tomonori.sakita@sord.co.jp
Subject: Re: [PATCH] i2c: altera: Fix race between xfer_msg and isr thread
From:   Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20200426083030.GI1262@kunai>
References: <20200410.100640.1949609603287475131.atsushi.nemoto@sord.co.jp>
        <20200426083030.GI1262@kunai>
X-Mailer: Mew version 6.7 on Emacs 24.5 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 26 Apr 2020 10:30:31 +0200, Wolfram Sang <wsa@the-dreams.de> wrote:
>> --- a/drivers/i2c/busses/i2c-altera.c
>> +++ b/drivers/i2c/busses/i2c-altera.c
>> @@ -70,6 +70,7 @@
>>   * @isr_mask: cached copy of local ISR enables.
>>   * @isr_status: cached copy of local ISR status.
>>   * @lock: spinlock for IRQ synchronization.
>> + * @mutex: mutex for IRQ thread.
> 
> I think the name 'mutex' is too unspecific. (Same goes for 'lock' above
> which is not part of your patch, obviously.)

Then, how about 'isr_mutex' ?  Should I resend a patch with new name?

>>   */
>>  struct altr_i2c_dev {
>>  	void __iomem *base;
>> @@ -86,6 +87,7 @@ struct altr_i2c_dev {
>>  	u32 isr_mask;
>>  	u32 isr_status;
>>  	spinlock_t lock;	/* IRQ synchronization */
>> +	struct mutex mutex;
>>  };
> 
> Has it been checked if we really need both, the spinlock and the mutex?
> From a glimpse, it looks like the spinlock became obsolete now.

Yes, but just dropping the spinlock will leak two code pathes unlocked:

1. altr_i2c_int_enable() at end of altr_i2c_init()
2. altr_i2c_int_enable() just after wait_for_completion_timeout()

We can kill the spinlock by adding some more mutex_lock, but I think
that is not a _fix_ but _cleanup_, so I would like to do in another
patch.

---
Atsushi Nemoto
