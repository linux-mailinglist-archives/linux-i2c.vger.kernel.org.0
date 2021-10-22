Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B808437242
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 08:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbhJVGxb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Oct 2021 02:53:31 -0400
Received: from mga18.intel.com ([134.134.136.126]:2155 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231778AbhJVGxb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 Oct 2021 02:53:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="216155938"
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; 
   d="scan'208";a="216155938"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2021 23:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; 
   d="scan'208";a="495543192"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.68]) ([10.239.154.68])
  by orsmga008.jf.intel.com with ESMTP; 21 Oct 2021 23:51:10 -0700
Subject: Re: [PATCH] i2c: virtio: Add support for zero-length requests
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>,
        stratos-dev@op-lists.linaro.org,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        cohuck@redhat.com,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, conghui.chen@intel.com
References: <7c58868cd26d2fc4bd82d0d8b0dfb55636380110.1634808714.git.viresh.kumar@linaro.org>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <0adf1c36-a00b-f16f-e631-439148c4f956@intel.com>
Date:   Fri, 22 Oct 2021 14:51:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7c58868cd26d2fc4bd82d0d8b0dfb55636380110.1634808714.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/10/21 17:47, Viresh Kumar wrote:
> The virtio specification received a new mandatory feature
> (VIRTIO_I2C_F_ZERO_LENGTH_REQUEST) for zero length requests. Fail if the
> feature isn't offered by the device.
>
> For each read-request, set the VIRTIO_I2C_FLAGS_M_RD flag, as required
> by the VIRTIO_I2C_F_ZERO_LENGTH_REQUEST feature.
>
> This allows us to support zero length requests, like SMBUS Quick, where
> the buffer need not be sent anymore.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> Hi Wolfram,
>
> Please do not apply this until the spec changes [1] are merged, sending it early
> to get review done. I will ping you later once the spec is merged.
>
> [1] https://lists.oasis-open.org/archives/virtio-dev/202110/msg00109.html
>
>   drivers/i2c/busses/i2c-virtio.c | 56 ++++++++++++++++++---------------
>   include/uapi/linux/virtio_i2c.h |  6 ++++
>   2 files changed, 36 insertions(+), 26 deletions(-)
>

Acked-by: Jie Deng<jie.deng@intel.com>  once the spec is merged.


>   
> +	if (!virtio_has_feature(vdev, VIRTIO_I2C_F_ZERO_LENGTH_REQUEST)) {
> +		dev_err(&vdev->dev, "Zero-length request feature is mandatory\n");
> +		return -EINVAL;


It might be better to return -EOPNOTSUPP ?


