Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4913B9E98
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 11:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhGBKA7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jul 2021 06:00:59 -0400
Received: from mga06.intel.com ([134.134.136.31]:44767 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230363AbhGBKA6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Jul 2021 06:00:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="269835890"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="269835890"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 02:58:26 -0700
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="558990539"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 02:58:23 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lzFwA-007eal-2Q; Fri, 02 Jul 2021 12:58:18 +0300
Date:   Fri, 2 Jul 2021 12:58:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, yu1.wang@intel.com, shuo.a.liu@intel.com,
        conghui.chen@intel.com, viresh.kumar@linaro.org,
        stefanha@redhat.com
Subject: Re: [PATCH v12] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YN7jOm68fUL4UA2Q@smile.fi.intel.com>
References: <f229cd761048bc143f88f33a3437bdbf891c39fd.1625214435.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f229cd761048bc143f88f33a3437bdbf891c39fd.1625214435.git.jie.deng@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 02, 2021 at 04:46:47PM +0800, Jie Deng wrote:
> Add an I2C bus driver for virtio para-virtualization.
> 
> The controller can be emulated by the backend driver in
> any device model software by following the virtio protocol.
> 
> The device specification can be found on
> https://lists.oasis-open.org/archives/virtio-comment/202101/msg00008.html.
> 
> By following the specification, people may implement different
> backend drivers to emulate different controllers according to
> their needs.

...

> +static int virtio_i2c_complete_reqs(struct virtqueue *vq,
> +				    struct virtio_i2c_req *reqs,
> +				    struct i2c_msg *msgs, int nr,
> +				    bool fail)
> +{
> +	struct virtio_i2c_req *req;
> +	bool failed = fail;
> +	unsigned int len;
> +	int i, j = 0;
> +
> +	for (i = 0; i < nr; i++) {
> +		/* Detach the ith request from the vq */
> +		req = virtqueue_get_buf(vq, &len);
> +
> +		/*
> +		 * Condition (req && req == &reqs[i]) should always meet since
> +		 * we have total nr requests in the vq.
> +		 */
> +		if (!failed && (WARN_ON(!(req && req == &reqs[i])) ||
> +		    (req->in_hdr.status != VIRTIO_I2C_MSG_OK)))
> +			failed = true;

...and after failed is true, we are continuing the loop, why?

> +		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
> +		if (!failed)

> +			++j;

Besides better to read j++ the j itself can be renamed to something more
verbose.

> +	}

> +	return (fail ? -ETIMEDOUT : j);

Redundant parentheses.

> +}

...

> +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
> +	if (ret != num) {
> +		virtio_i2c_complete_reqs(vq, reqs, msgs, ret, true);

Below you check the returned code, here is not.

> +		ret = 0;
> +		goto err_free;
> +	}
> +
> +	reinit_completion(&vi->completion);
> +	virtqueue_kick(vq);
> +
> +	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
> +	if (!time_left)
> +		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
> +
> +	ret = virtio_i2c_complete_reqs(vq, reqs, msgs, num, !time_left);
> +
> +err_free:
> +	kfree(reqs);
> +	return ret;

> +++ b/include/uapi/linux/virtio_i2c.h

> +#include <linux/types.h>
> +
> +/* The bit 0 of the @virtio_i2c_out_hdr.@flags, used to group the requests */
> +#define VIRTIO_I2C_FLAGS_FAIL_NEXT	BIT(0)

It's _BITUL() or so from linux/const.h.
https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/const.h#L28
You may not use internal definitions in UAPI headers.

-- 
With Best Regards,
Andy Shevchenko


