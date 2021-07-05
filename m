Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87003BB722
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 08:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhGEGYd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 02:24:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:55416 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229797AbhGEGYd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Jul 2021 02:24:33 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="189308641"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="189308641"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2021 23:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="562409078"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2021 23:21:53 -0700
Subject: Re: [PATCH v12] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, yu1.wang@intel.com, shuo.a.liu@intel.com,
        conghui.chen@intel.com, stefanha@redhat.com
References: <f229cd761048bc143f88f33a3437bdbf891c39fd.1625214435.git.jie.deng@intel.com>
 <YN7jOm68fUL4UA2Q@smile.fi.intel.com>
 <20210705024340.mb5sv5epxbdatgsg@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <adb5a18f-cf48-3059-5541-fb6d7bafb8d2@intel.com>
Date:   Mon, 5 Jul 2021 14:21:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210705024340.mb5sv5epxbdatgsg@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/7/5 10:43, Viresh Kumar wrote:
> On 02-07-21, 12:58, Andy Shevchenko wrote:
>> On Fri, Jul 02, 2021 at 04:46:47PM +0800, Jie Deng wrote:
>>> +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
>>> +				    struct virtio_i2c_req *reqs,
>>> +				    struct i2c_msg *msgs, int nr,
>>> +				    bool fail)
>>> +{
>>> +	struct virtio_i2c_req *req;
>>> +	bool failed = fail;
> Jie, you can actually get rid of this variable too. Jut rename fail to failed
> and everything shall work as you want.


Oh, You are not right. I just found we can't remove this variable. The 
"fail" and "failed" have different

meanings for this function. We need fail to return the result.


>>> +	unsigned int len;
>>> +	int i, j = 0;
>>> +
>>> +	for (i = 0; i < nr; i++) {
>>> +		/* Detach the ith request from the vq */
>>> +		req = virtqueue_get_buf(vq, &len);
>>> +
>>> +		/*
>>> +		 * Condition (req && req == &reqs[i]) should always meet since
>>> +		 * we have total nr requests in the vq.
>>> +		 */
>>> +		if (!failed && (WARN_ON(!(req && req == &reqs[i])) ||
>>> +		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
>>> +			failed = true;
>> ...and after failed is true, we are continuing the loop, why?
> Actually this function can be called with fail set to true. We proceed as we
> need to call i2c_put_dma_safe_msg_buf() for all buffers we allocated earlier.
>
>>> +		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
>>> +		if (!failed)
>>> +			++j;
>> Besides better to read j++ the j itself can be renamed to something more
>> verbose.
>>
>>> +	}
>>> +	return (fail ? -ETIMEDOUT : j);
>> Redundant parentheses.
>>
>>> +}
