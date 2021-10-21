Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AECAD435A80
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Oct 2021 07:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhJUF5t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Oct 2021 01:57:49 -0400
Received: from mga18.intel.com ([134.134.136.126]:50047 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229499AbhJUF5t (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 21 Oct 2021 01:57:49 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="215871485"
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; 
   d="scan'208";a="215871485"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 22:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; 
   d="scan'208";a="444654055"
Received: from unknown (HELO [10.239.154.68]) ([10.239.154.68])
  by orsmga006.jf.intel.com with ESMTP; 20 Oct 2021 22:55:31 -0700
Subject: Re: [PATCH 2/2] i2c: virtio: fix completion handling
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>, wsa@kernel.org,
        viresh.kumar@linaro.org
Cc:     virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-3-vincent.whitchurch@axis.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <a6cb9ae7-eee3-74aa-87de-a2be3fdc7a76@intel.com>
Date:   Thu, 21 Oct 2021 13:55:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211019074647.19061-3-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/10/19 15:46, Vincent Whitchurch wrote:
> The driver currently assumes that the notify callback is only received
> when the device is done with all the queued buffers.
>
> However, this is not true, since the notify callback could be called
> without any of the queued buffers being completed (for example, with
> virtio-pci and shared interrupts) or with only some of the buffers being
> completed (since the driver makes them available to the device in
> multiple separate virtqueue_add_sgs() calls).


Can the backend driver control the time point of interrupt injection ? I 
can't think of

why the backend has to send an early interrupt. This operation should be 
avoided

in the backend driver if possible. However, this change make sense if 
early interrupt

can't be avoid.


>
> This can lead to incorrect data on the I2C bus or memory corruption in
> the guest if the device operates on buffers which are have been freed by
> the driver.  (The WARN_ON in the driver is also triggered.)
>
