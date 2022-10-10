Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 459A65F98BC
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Oct 2022 08:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbiJJG6M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Oct 2022 02:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiJJG6L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Oct 2022 02:58:11 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896113C8C1;
        Sun,  9 Oct 2022 23:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665385090; x=1696921090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/TYgCQ+WcvV+CgNviSLogrXwWv9rqFXTDzpniEGJAn0=;
  b=AVjHvZY0v8PMOD5Gi9RHoe8szsw0cP+Te4i4QjCx4c4xya410y2kDVVO
   h/f3KvZZJNDD5w7MJy51yw398cfb/HUHemACfZNO3cj7WruKgP9WsFzT/
   THA3CSXccu+ENlCPjQSOJMRKVHdCn9WMYoKVQgNtJBYyOrrZ9SAdJG9Pr
   W8yBpG9iyEYBlsgPYQ1K0CTb2okOO+RAarj0X+O/iHEabZOpv0MEBGLkD
   g9t1XfkdACFgktFLeK8vo6Hh2yrxx8ylZ5UD3E7Ek6a9TIUkeQbPT/pJi
   1Jb5Ih3JO0PUOORwSJSoTo/3BLaXTd7SPlXVzS7dg5RQ1zn6OLGvOF6HF
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="304145167"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="304145167"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2022 23:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="688683383"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="688683383"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 09 Oct 2022 23:58:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ohmjn-004l6D-0Z;
        Mon, 10 Oct 2022 09:58:07 +0300
Date:   Mon, 10 Oct 2022 09:58:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     tianye@sugon.com
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: slave should do WRITE_RECEIVED before
 SLAVE_STOP
Message-ID: <Y0PCfkobAoWQ3vmG@smile.fi.intel.com>
References: <20221010034015.7526-1-tianye@sugon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010034015.7526-1-tianye@sugon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 10, 2022 at 11:40:15AM +0800, tianye@sugon.com wrote:
> From: Tian Ye <tianye@sugon.com>
> 
> Sometimes when designware slave receive 3byte in high speed mode:

DesignWare
3 bytes

> 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
> I2C_SLAVE_WRITE_REQUESTED
> I2C_SLAVE_WRITE_RECEIVED
> 0x1 STATUS SLAVE_ACTIVITY=0 : RAW_INTR_STAT=0x714 : INTR_STAT=0x204
> I2C_SLAVE_WRITE_RECEIVED
> I2C_SLAVE_STOP
> 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
> I2C_SLAVE_WRITE_REQUESTED
> I2C_SLAVE_WRITE_RECEIVED
> 
> When second slave interrupt occus:slave rx fifo receive two bytes and

occurs: slave Rx FIFO receives 2 bytes

> stop interrupt occus at the same time.

occurs

...

Please, do a spell check / proof reading of the commit messages.

...

> +	u32 rx_valid;

> +		regmap_read(dev, DW_IC_RXFLR, &rx_valid);

If regmap_read() fails, rx_valid will contain garbage...

> +		for (; rx_valid > 0; rx_valid--) {

...and this will go far beyond the expected boundaries.

> +			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
> +			val = tmp;
> +			if (!i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
> +					     &val))

> +				dev_vdbg(dev->dev, "Byte %X acked!", val);

Why do you need this? regmap has it's own trace event mechanism, isn't it
enough?

> +		}

-- 
With Best Regards,
Andy Shevchenko


