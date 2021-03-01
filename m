Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B8C327DF0
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Mar 2021 13:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233168AbhCAMMG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Mar 2021 07:12:06 -0500
Received: from mga01.intel.com ([192.55.52.88]:29289 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233146AbhCAMMF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Mar 2021 07:12:05 -0500
IronPort-SDR: kTRbvG632CVMz2BEBXE5F7D/cA6wShZbE7ju5ineyxUAmbPtRZ6Y+CyA3mnZ5f7GDG8IMtYY6e
 7ois48GPeamA==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="206048613"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="206048613"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 04:10:19 -0800
IronPort-SDR: SPCAxCdAecMLLqoTDlPItL7K2jphc+xnG0mvpY6E/DAH8K/05t3iT+nKl4vzN1yyUbHSvp9PML
 xkFhJTXkqcuA==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="435380055"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 04:08:06 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lGhLA-0098TC-Sb; Mon, 01 Mar 2021 14:07:56 +0200
Date:   Mon, 1 Mar 2021 14:07:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        conghui.chen@intel.com, arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, viresh.kumar@linaro.org
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YDzZHKdrpROgSdg3@smile.fi.intel.com>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 01, 2021 at 02:41:35PM +0800, Jie Deng wrote:
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

> +		buf = kzalloc(msgs[i].len, GFP_KERNEL);
> +		if (!buf)
> +			break;
> +
> +		if (msgs[i].flags & I2C_M_RD) {

kzalloc()

> +			reqs[i].read_buf = buf;
> +			sg_init_one(&msg_buf, reqs[i].read_buf, msgs[i].len);
> +			sgs[outcnt + incnt++] = &msg_buf;
> +		} else {
> +			reqs[i].write_buf = buf;

> +			memcpy(reqs[i].write_buf, msgs[i].buf, msgs[i].len);

kmemdup() ?

> +			sg_init_one(&msg_buf, reqs[i].write_buf, msgs[i].len);
> +			sgs[outcnt++] = &msg_buf;
> +		}

...

> +
> +

One blank line is enough.

...


> +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
> +	if (ret == 0)
> +		goto err_unlock_free;

> +	else

Redundant.

> +		nr = ret;

-- 
With Best Regards,
Andy Shevchenko


