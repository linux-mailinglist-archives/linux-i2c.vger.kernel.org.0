Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6EAC3BB5EB
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 05:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbhGEDtW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jul 2021 23:49:22 -0400
Received: from mga17.intel.com ([192.55.52.151]:60703 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229652AbhGEDtW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 4 Jul 2021 23:49:22 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="189297079"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="189297079"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2021 20:46:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="562384083"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2021 20:46:41 -0700
Subject: Re: [PATCH v12] i2c: virtio: add a virtio i2c frontend driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, yu1.wang@intel.com, shuo.a.liu@intel.com,
        conghui.chen@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com
References: <f229cd761048bc143f88f33a3437bdbf891c39fd.1625214435.git.jie.deng@intel.com>
 <YN7jOm68fUL4UA2Q@smile.fi.intel.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <2cb3e0db-f24b-bd12-c1a0-3fc7516b38c5@intel.com>
Date:   Mon, 5 Jul 2021 11:46:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YN7jOm68fUL4UA2Q@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/7/2 17:58, Andy Shevchenko wrote:
> On Fri, Jul 02, 2021 at 04:46:47PM +0800, Jie Deng wrote:
>> Add an I2C bus driver for virtio para-virtualization.
>>
>> The controller can be emulated by the backend driver in
>> any device model software by following the virtio protocol.
>>
>> The device specification can be found on
>> https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.
>>
>> By following the specification, people may implement different
>> backend drivers to emulate different controllers according to
>> their needs.
> ...
>
>> +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
>> +				    struct virtio_i2c_req *reqs,
>> +				    struct i2c_msg *msgs, int nr,
>> +				    bool fail)
>> +{
>> +	struct virtio_i2c_req *req;
>> +	bool failed = fail;
>> +	unsigned int len;
>> +	int i, j = 0;
>> +
>> +	for (i = 0; i < nr; i++) {
>> +		/* Detach the ith request from the vq */
>> +		req = virtqueue_get_buf(vq, &len);
>> +
>> +		/*
>> +		 * Condition (req && req == &reqs[i]) should always meet since
>> +		 * we have total nr requests in the vq.
>> +		 */
>> +		if (!failed && (WARN_ON(!(req && req == &reqs[i])) ||
>> +		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
>> +			failed = true;
> ...and after failed is true, we are continuing the loop, why?


Still need to continue to do some cleanup.


>
>> +		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
>> +		if (!failed)
>> +			++j;
> Besides better to read j++ the j itself can be renamed to something more
> verbose.


Will change it to j++.


>> +	}
>> +	return (fail ? -ETIMEDOUT : j);
> Redundant parentheses.


Will remove the parentheses.


>
>> +}
> ...
>
>> +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
>> +	if (ret != num) {
>> +		virtio_i2c_complete_reqs(vq, reqs, msgs, ret, true);
> Below you check the returned code, here is not.


I will do some optimization here.


>
>> +		ret = 0;
>> +		goto err_free;
>> +	}
>> +
>> +	reinit_completion(&vi->completion);
>> +	virtqueue_kick(vq);
>> +
>> +	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
>> +	if (!time_left)
>> +		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
>> +
>> +	ret = virtio_i2c_complete_reqs(vq, reqs, msgs, num, !time_left);
>> +
>> +err_free:
>> +	kfree(reqs);
>> +	return ret;
>> +++ b/include/uapi/linux/virtio_i2c.h
>> +#include <linux/types.h>
>> +
>> +/* The bit 0 of the @virtio_i2c_out_hdr.@flags, used to group the requests */
>> +#define VIRTIO_I2C_FLAGS_FAIL_NEXT	BIT(0)
> It's _BITUL() or so from linux/const.h.
> https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/const.h#L28
> You may not use internal definitions in UAPI headers.


Let's use this _BITUL() from linux/const.h instead. Thank you !


