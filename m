Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9841F327DFB
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Mar 2021 13:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbhCAMNh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Mar 2021 07:13:37 -0500
Received: from mga02.intel.com ([134.134.136.20]:6607 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233549AbhCAMNe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Mar 2021 07:13:34 -0500
IronPort-SDR: BS4RFWLEvZ7zv7SId9PfN/by8ttb3Zs1Z2DgQJ2mg3PiWP+IyCJM7nMFgXODo2AX5eMiUr1E/r
 XrugVuKbTQsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="173573680"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="173573680"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 04:11:47 -0800
IronPort-SDR: gUA0LbTEcUEdSQsKIp5iXeKjN/nBXDZy5Pog61nPnurKuGwW8gYLa17540bXo984ytkjKEQim2
 /ez9RTGvHPaw==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="435380350"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 04:09:35 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lGhMb-0098Ty-Ql; Mon, 01 Mar 2021 14:09:25 +0200
Date:   Mon, 1 Mar 2021 14:09:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        conghui.chen@intel.com, arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YDzZdc9+6hEvIDS1@smile.fi.intel.com>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <20210301115441.a4s5xzwm6d6ohz7f@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210301115441.a4s5xzwm6d6ohz7f@vireshk-i7>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 01, 2021 at 05:24:41PM +0530, Viresh Kumar wrote:
> On 01-03-21, 14:41, Jie Deng wrote:
> > +/**
> > + * struct virtio_i2c_req - the virtio I2C request structure
> > + * @out_hdr: the OUT header of the virtio I2C message
> > + * @write_buf: contains one I2C segment being written to the device
> > + * @read_buf: contains one I2C segment being read from the device
> > + * @in_hdr: the IN header of the virtio I2C message
> > + */
> > +struct virtio_i2c_req {
> > +	struct virtio_i2c_out_hdr out_hdr;
> > +	u8 *write_buf;
> > +	u8 *read_buf;
> > +	struct virtio_i2c_in_hdr in_hdr;
> > +};
> 
> I am not able to appreciate the use of write/read bufs here as we
> aren't trying to read/write data in the same transaction. Why do we
> have two bufs here as well as in specs ?

I²C and SMBus support bidirectional transfers as well. I think two buffers is
the right thing to do.

-- 
With Best Regards,
Andy Shevchenko


