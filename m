Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8BE43476A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Oct 2021 10:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhJTI5O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Oct 2021 04:57:14 -0400
Received: from mga02.intel.com ([134.134.136.20]:30150 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229544AbhJTI5O (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Oct 2021 04:57:14 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="215895432"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="215895432"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 01:54:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="483636775"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.68]) ([10.239.154.68])
  by orsmga007.jf.intel.com with ESMTP; 20 Oct 2021 01:54:57 -0700
Subject: Re: [PATCH 2/2] i2c: virtio: fix completion handling
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     wsa@kernel.org, virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-3-vincent.whitchurch@axis.com>
 <20211019082211.ngkkkxlfcrsvfaxg@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <81ea2661-20f8-8836-5311-7f2ed4a1781f@intel.com>
Date:   Wed, 20 Oct 2021 16:54:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211019082211.ngkkkxlfcrsvfaxg@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/10/19 16:22, Viresh Kumar wrote:
> On 19-10-21, 09:46, Vincent Whitchurch wrote:
>>   static void virtio_i2c_msg_done(struct virtqueue *vq)
>>   {
>> -	struct virtio_i2c *vi = vq->vdev->priv;
>> +	struct virtio_i2c_req *req;
>> +	unsigned int len;
>>   
>> -	complete(&vi->completion);
>> +	while ((req = virtqueue_get_buf(vq, &len)))
>> +		complete(&req->completion);
> Instead of adding a completion for each request and using only the
> last one, maybe we can do this instead here:
>
> 	while ((req = virtqueue_get_buf(vq, &len))) {
>                  if (req->out_hdr.flags == cpu_to_le32(VIRTIO_I2C_FLAGS_FAIL_NEXT))


Is this for the last one check ? For the last one, this bit should be 
cleared, right ?


>                          complete(&vi->completion);
>          }
>
> Since we already know which is the last one, we can also check at this
> point if buffers for all other requests are received or not.
>
