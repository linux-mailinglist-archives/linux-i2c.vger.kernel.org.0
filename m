Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8972125BEF8
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 12:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgICKUS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 06:20:18 -0400
Received: from mga03.intel.com ([134.134.136.65]:23262 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726109AbgICKUQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Sep 2020 06:20:16 -0400
IronPort-SDR: HW/hTd2GOWEwDB6eyiJKKDdqRsoFd9Wv414YoKUBY0Eo4srHGf07UWDo5F8QBH7Fv6Nz5X1bmU
 UgS0/ZAEes9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="157554412"
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; 
   d="scan'208";a="157554412"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2020 03:20:15 -0700
IronPort-SDR: acaoowsTjA5RVrtKbFxzUHplXC2xaCrUjWDZb9t4vxLl+4qUNV3OvubBTwvJDW1WGOx//mGF8h
 zFOFE+YeSYkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; 
   d="scan'208";a="331747749"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 03 Sep 2020 03:20:11 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kDmLg-00Dzgr-1N; Thu, 03 Sep 2020 13:20:08 +0300
Date:   Thu, 3 Sep 2020 13:20:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        wsa+renesas@sang-engineering.com, wsa@kernel.org,
        jarkko.nikula@linux.intel.com, jdelvare@suse.de,
        Sergey.Semin@baikalelectronics.ru, krzk@kernel.org,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        bjorn.andersson@linaro.org, shuo.a.liu@intel.com,
        conghui.chen@intel.com, yu1.wang@intel.com
Subject: Re: [PATCH] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20200903102008.GY1891694@smile.fi.intel.com>
References: <0efc2605c8c06b4b1bf68cbad5536c4a900dc019.1599110284.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0efc2605c8c06b4b1bf68cbad5536c4a900dc019.1599110284.git.jie.deng@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 03, 2020 at 01:34:45PM +0800, Jie Deng wrote:
> Add an I2C bus driver for virtio para-virtualization.
> 
> The controller can be emulated by the backend driver in
> any device model software by following the virtio protocol.
> 
> This driver communicates with the backend driver through a
> virtio I2C message structure which includes following parts:
> 
> - Header: i2c_msg addr, flags, len.
> - Data buffer: the pointer to the i2c msg data.
> - Status: the processing result from the backend.
> 
> People may implement different backend drivers to emulate
> different controllers according to their needs. A backend
> example can be found in the device model of the open source
> project ACRN. For more information, please refer to
> https://projectacrn.org.
> 
> The virtio device ID 34 is used for this I2C adpter since IDs
> before 34 have been reserved by other virtio devices.

Seems it's slightly different version to what I have reviewed internally.
My comments below. (I admit that some of them maybe new)

...

> +/**
> + * struct virtio_i2c_hdr - the virtio I2C message header structure
> + * @addr: i2c_msg addr, the slave address
> + * @flags: i2c_msg flags
> + * @len: i2c_msg len
> + */
> +struct virtio_i2c_hdr {
> +	__virtio16 addr;
> +	__virtio16 flags;
> +	__virtio16 len;
> +} __packed;

As Misha noticed and somewhere I saw 0-day reports these should be carefully
taken care of.

...

> +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +{
> +	struct virtio_i2c *vi = i2c_get_adapdata(adap);
> +	struct virtio_i2c_msg *vmsg_o, *vmsg_i;
> +	struct virtqueue *vq = vi->vq;
> +	unsigned long time_left;
> +	int len, i, ret = 0;
> +
> +	vmsg_o = kzalloc(sizeof(*vmsg_o), GFP_KERNEL);
> +	if (!vmsg_o)
> +		return -ENOMEM;
> +
> +	mutex_lock(&vi->i2c_lock);
> +	vmsg_o->buf = NULL;
> +	for (i = 0; i < num; i++) {
> +		ret = virtio_i2c_add_msg(vq, vmsg_o, &msgs[i]);
> +		if (ret) {
> +			dev_err(&adap->dev, "failed to add msg[%d] to virtqueue.\n", i);

> +			goto err_unlock_free;

break;

> +		}
> +
> +		virtqueue_kick(vq);
> +
> +		time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
> +		if (!time_left) {
> +			dev_err(&adap->dev, "msg[%d]: addr=0x%x timeout.\n", i, msgs[i].addr);
> +			ret = i;

> +			goto err_unlock_free;

break;

And so on.

> +		}
> +
> +		vmsg_i = (struct virtio_i2c_msg *)virtqueue_get_buf(vq, &len);
> +		if (vmsg_i) {
> +			/* vmsg_i should point to the same address with vmsg_o */
> +			if (vmsg_i != vmsg_o) {
> +				dev_err(&adap->dev, "msg[%d]: addr=0x%x virtqueue error.\n",
> +					i, vmsg_i->hdr.addr);
> +				ret = i;
> +				goto err_unlock_free;
> +			}
> +			if (vmsg_i->status != VIRTIO_I2C_MSG_OK) {
> +				dev_err(&adap->dev, "msg[%d]: addr=0x%x error=%d.\n",
> +					i, vmsg_i->hdr.addr, vmsg_i->status);
> +				ret = i;
> +				goto err_unlock_free;
> +			}
> +			if ((vmsg_i->hdr.flags & I2C_M_RD) && vmsg_i->hdr.len)
> +				memcpy(msgs[i].buf, vmsg_i->buf, vmsg_i->hdr.len);
> +
> +			kfree(vmsg_i->buf);
> +			vmsg_i->buf = NULL;
> +		}
> +		reinit_completion(&vi->completion);
> +	}

> +	if (i == num)
> +		ret = num;

And this conditional seems a dup of the for-loop successfully iterating over
entire queue.

> +err_unlock_free:

Redundant.

> +	mutex_unlock(&vi->i2c_lock);
> +	kfree(vmsg_o->buf);
> +	kfree(vmsg_o);
> +	return ret;
> +}

...

> +	vi->adap.timeout = HZ / 10;

+ Blank line.

> +	ret = i2c_add_adapter(&vi->adap);
> +	if (ret) {

> +		dev_err(&vdev->dev, "failed to add virtio-i2c adapter.\n");
> +		virtio_i2c_del_vqs(vdev);

Usually we do clean up followed by message.

> +	}
> +
> +	return ret;


-- 
With Best Regards,
Andy Shevchenko


