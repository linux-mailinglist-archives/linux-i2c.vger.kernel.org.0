Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBE82EA47
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2019 03:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbfE3BjI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 May 2019 21:39:08 -0400
Received: from mga14.intel.com ([192.55.52.115]:7802 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726527AbfE3BjI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 May 2019 21:39:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 18:39:07 -0700
X-ExtLoop1: 1
Received: from haiyuewa-mobl.ccr.corp.intel.com (HELO [10.67.64.79]) ([10.67.64.79])
  by fmsmga008.fm.intel.com with ESMTP; 29 May 2019 18:39:05 -0700
Subject: Re: [PATCH i2c/slave-mqueue v5] i2c: slave-mqueue: add a slave
 backend to receive and queue messages
To:     Eduardo Valentin <eduval@amazon.com>
Cc:     wsa@the-dreams.de, brendanhiggins@google.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@intel.com, jae.hyun.yoo@linux.intel.com
References: <1524503192-4176-1-git-send-email-haiyue.wang@linux.intel.com>
 <20190523220345.GA3417@u40b0340c692b58f6553c.ant.amazon.com>
 <35a9d066-c732-cb00-04a5-438c948915ae@linux.intel.com>
 <20190524173353.GA6428@u40b0340c692b58f6553c.ant.amazon.com>
 <bf1e8f0b-5bd0-fb43-c19b-9487603b9ee3@linux.intel.com>
 <20190529231100.GA18339@u40b0340c692b58f6553c.ant.amazon.com>
From:   "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <ef5c197a-2dfc-a46c-88c2-bfec62aebeb7@linux.intel.com>
Date:   Thu, 30 May 2019 09:39:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190529231100.GA18339@u40b0340c692b58f6553c.ant.amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2019-05-30 07:11, Eduardo Valentin 写道:
>>> this code goes access and modify data here, e.g. msg->len and msg->buf.
>>>
>>> On this case (I2C_SLAVE_WRITE_RECEIVED), this code wont protect access.
>>>
>>> This can cause concurrence issues if you receive an IRQ when the user
>>> is on your bin_read().
>> User will not touch 'msg = mq->curr;', just touch 'msg =
>> &mq->queue[mq->out];'
> What happens if mq->curr == mq->queue[mq->out]?
>
1. The Read will check.

+	spin_lock_irqsave(&mq->lock, flags);
+	if (mq->out != mq->in) {
+		msg = &mq->queue[mq->out];

2. Flush the oldeast message. ^_^

+	case I2C_SLAVE_STOP:
+		if (unlikely(mq->truncated || msg->len < 2))
+			break;
+
+		spin_lock(&mq->lock);
+		mq->in = MQ_QUEUE_NEXT(mq->in);
+		mq->curr = &mq->queue[mq->in];
+		mq->curr->len = 0;
+
+		/* Flush the oldest message */
+		if (mq->out == mq->in)
+			mq->out = MQ_QUEUE_NEXT(mq->out);
+		spin_unlock(&mq->lock);


