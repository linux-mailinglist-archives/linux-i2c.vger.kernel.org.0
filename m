Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95E5269119
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 18:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgINQJ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 12:09:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:58202 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgINQJI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Sep 2020 12:09:08 -0400
IronPort-SDR: wKV5nzp4vd2VYW/Gr67OJhnhiRIulxoZT4yPUDHUKVgc5iAiGNTKej1+11rRGMk0UJAt7M6CYc
 RsU4KsfGhJrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="146792575"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
   d="scan'208";a="146792575"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 09:08:50 -0700
IronPort-SDR: UiGrMlA3ZvzCKetd+zbQl9xfL2hz20+ZIEgqGOqpEgt+1xUQn95d6KsEA4pHndFmAv+wFTEFaD
 yMyLQNempZNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
   d="scan'208";a="335328062"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 14 Sep 2020 09:08:46 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kHr23-00GdbG-9I; Mon, 14 Sep 2020 19:08:43 +0300
Date:   Mon, 14 Sep 2020 19:08:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kbuild@lists.01.org, Jie Deng <jie.deng@intel.com>,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, lkp@intel.com,
        kbuild-all@lists.01.org, mst@redhat.com, jasowang@redhat.com,
        wsa+renesas@sang-engineering.com, wsa@kernel.org,
        jarkko.nikula@linux.intel.com, jdelvare@suse.de
Subject: Re: [PATCH v2] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20200914160843.GM3956970@smile.fi.intel.com>
References: <c4bd4fd56df36864ed34d3572f00b2b838fd833a.1599795029.git.jie.deng@intel.com>
 <20200914144807.GC4282@kadam>
 <20200914152455.GI3956970@smile.fi.intel.com>
 <20200914154726.GE18329@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914154726.GE18329@kadam>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 14, 2020 at 06:47:27PM +0300, Dan Carpenter wrote:
> On Mon, Sep 14, 2020 at 06:24:55PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 14, 2020 at 05:48:07PM +0300, Dan Carpenter wrote:
> > > Hi Jie,
> > > 
> > > url:    https://github.com/0day-ci/linux/commits/Jie-Deng/i2c-virtio-add-a-virtio-i2c-frontend-driver/20200911-115013 
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git  i2c/for-next
> > > config: parisc-randconfig-m031-20200913 (attached as .config)
> > > compiler: hppa-linux-gcc (GCC) 9.3.0
> > > 
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > 
> > > smatch warnings:
> > > drivers/i2c/busses/i2c-virtio.c:160 virtio_i2c_xfer() error: we previously assumed 'vmsg' could be null (see line 137)
> > > 
> > 
> > It's quite possible a false positive. Look at 122. But I agree that for-loop is
> > not the best for such things to understand. Perhaps switching to do {} while ()
> > will make it better.
> > 
> 
> Smatch is assuming that virtqueue_get_buf() can return NULL on the last
> iteration through the loop.

I see now. Thanks.

> > > # https://github.com/0day-ci/linux/commit/0a54ec771966748fcbc86256b830b5f786168b7d 
> > > git remote add linux-review https://github.com/0day-ci/linux 
> > > git fetch --no-tags linux-review Jie-Deng/i2c-virtio-add-a-virtio-i2c-frontend-driver/20200911-115013
> > > git checkout 0a54ec771966748fcbc86256b830b5f786168b7d
> > > vim +/vmsg +160 drivers/i2c/busses/i2c-virtio.c
> > > 
> > > 0a54ec77196674 Jie Deng 2020-09-11  109  static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> > > 0a54ec77196674 Jie Deng 2020-09-11  110  {
> > > 0a54ec77196674 Jie Deng 2020-09-11  111  	struct virtio_i2c *vi = i2c_get_adapdata(adap);
> > > 0a54ec77196674 Jie Deng 2020-09-11  112  	struct virtqueue *vq = vi->vq;
> > > 0a54ec77196674 Jie Deng 2020-09-11  113  	struct virtio_i2c_msg *vmsg;
> > > 0a54ec77196674 Jie Deng 2020-09-11  114  	unsigned long time_left;
> > > 0a54ec77196674 Jie Deng 2020-09-11  115  	int len, i, ret = 0;
> > > 0a54ec77196674 Jie Deng 2020-09-11  116  
> > > 0a54ec77196674 Jie Deng 2020-09-11  117  	mutex_lock(&vi->i2c_lock);
> > > 0a54ec77196674 Jie Deng 2020-09-11  118  	vmsg = &vi->vmsg;
> > > 0a54ec77196674 Jie Deng 2020-09-11  119  	vmsg->buf = NULL;
> > > 0a54ec77196674 Jie Deng 2020-09-11  120  
> > > 0a54ec77196674 Jie Deng 2020-09-11  121  	for (i = 0; i < num; i++) {
> > > 0a54ec77196674 Jie Deng 2020-09-11  122  		ret = virtio_i2c_add_msg(vq, vmsg, &msgs[i]);
> > > 0a54ec77196674 Jie Deng 2020-09-11  123  		if (ret) {
> > > 0a54ec77196674 Jie Deng 2020-09-11  124  			dev_err(&adap->dev, "failed to add msg[%d] to virtqueue.\n", i);
> > > 0a54ec77196674 Jie Deng 2020-09-11  125  			break;
> > > 0a54ec77196674 Jie Deng 2020-09-11  126  		}
> > > 0a54ec77196674 Jie Deng 2020-09-11  127  
> > > 0a54ec77196674 Jie Deng 2020-09-11  128  		virtqueue_kick(vq);
> > > 0a54ec77196674 Jie Deng 2020-09-11  129  
> > > 0a54ec77196674 Jie Deng 2020-09-11  130  		time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
> > > 0a54ec77196674 Jie Deng 2020-09-11  131  		if (!time_left) {
> > > 0a54ec77196674 Jie Deng 2020-09-11  132  			dev_err(&adap->dev, "msg[%d]: addr=0x%x timeout.\n", i, msgs[i].addr);
> > > 0a54ec77196674 Jie Deng 2020-09-11  133  			break;
> > > 0a54ec77196674 Jie Deng 2020-09-11  134  		}
> > > 0a54ec77196674 Jie Deng 2020-09-11  135  
> > > 0a54ec77196674 Jie Deng 2020-09-11  136  		vmsg = (struct virtio_i2c_msg *)virtqueue_get_buf(vq, &len);
> > > 0a54ec77196674 Jie Deng 2020-09-11 @137  		if (vmsg) {
> > >                                                             ^^^^
> > > Check for NULL.
> > > 
> > > 0a54ec77196674 Jie Deng 2020-09-11  138  			/* vmsg should point to the same address with &vi->vmsg */
> > > 0a54ec77196674 Jie Deng 2020-09-11  139  			if (vmsg != &vi->vmsg) {
> > > 0a54ec77196674 Jie Deng 2020-09-11  140  				dev_err(&adap->dev, "msg[%d]: addr=0x%x virtqueue error.\n",
> > > 0a54ec77196674 Jie Deng 2020-09-11  141  					i, le16_to_cpu(vmsg->hdr.addr));
> > > 0a54ec77196674 Jie Deng 2020-09-11  142  				break;
> > > 0a54ec77196674 Jie Deng 2020-09-11  143  			}
> > > 0a54ec77196674 Jie Deng 2020-09-11  144  			if (vmsg->status != VIRTIO_I2C_MSG_OK) {
> > > 0a54ec77196674 Jie Deng 2020-09-11  145  				dev_err(&adap->dev, "msg[%d]: addr=0x%x error=%d.\n",
> > > 0a54ec77196674 Jie Deng 2020-09-11  146  					i, le16_to_cpu(vmsg->hdr.addr), vmsg->status);
> > > 0a54ec77196674 Jie Deng 2020-09-11  147  				break;
> > > 0a54ec77196674 Jie Deng 2020-09-11  148  			}
> > > 0a54ec77196674 Jie Deng 2020-09-11  149  			if ((msgs[i].flags & I2C_M_RD) && msgs[i].len)
> > > 0a54ec77196674 Jie Deng 2020-09-11  150  				memcpy(msgs[i].buf, vmsg->buf, msgs[i].len);
> > > 0a54ec77196674 Jie Deng 2020-09-11  151  
> > > 0a54ec77196674 Jie Deng 2020-09-11  152  			kfree(vmsg->buf);
> > > 0a54ec77196674 Jie Deng 2020-09-11  153  			vmsg->buf = NULL;
> > > 0a54ec77196674 Jie Deng 2020-09-11  154  		}
> > > 0a54ec77196674 Jie Deng 2020-09-11  155  
> > > 0a54ec77196674 Jie Deng 2020-09-11  156  		reinit_completion(&vi->completion);
> > > 0a54ec77196674 Jie Deng 2020-09-11  157  	}
> > > 0a54ec77196674 Jie Deng 2020-09-11  158  
> > > 0a54ec77196674 Jie Deng 2020-09-11  159  	mutex_unlock(&vi->i2c_lock);
> > > 0a54ec77196674 Jie Deng 2020-09-11 @160  	kfree(vmsg->buf);
> > >                                                       ^^^^^^^^^
> > > Unchecked dereference.
> > > 
> > > 0a54ec77196674 Jie Deng 2020-09-11  161  	return ((ret < 0) ? ret : i);
> > > 0a54ec77196674 Jie Deng 2020-09-11  162  }
> > > 
> > > ---
> > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org 
> > 
> > 
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 

-- 
With Best Regards,
Andy Shevchenko


