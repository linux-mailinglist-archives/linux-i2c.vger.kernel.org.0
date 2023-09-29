Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6757F7B2E56
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 10:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbjI2IsT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 04:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbjI2IsS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 04:48:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DD3AC;
        Fri, 29 Sep 2023 01:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695977296; x=1727513296;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=3M7aFFgj+OG/B4ua2iQPHy8g+N3GH2j+D8XnoTVg0ek=;
  b=Zv2TUz9IjnJ0nLmVdkHDEt2VUyzYgHliYu+IjSjGSW0OtZPG6RLznTHh
   gsBKdiaHJPFNIBf9ZBv12BjuFZjhWI4VbGQi2yRUO/ZvyVcHd8qiA0UJ6
   E4+vTKDDtMDlOxa6CuGhfMLJXwebNVQUM5/N6QNuJQF0Y4/H8YSWbUVT5
   Zn69Jj/NzQPb9auLG8SR26d0PbAkph62ImK4Po/2N42OuwrgqRuFVwL6+
   xct5AtO/+C/jHxvvEziTGhJjA6FSkZnn3AmhgMw9XaK7SwVWkkQpusqjX
   5VX54tiYZhyzzusp1vy/ESjJJ4md+VY+gaJm8LVT6+305LjU7oA2BL5Ml
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="448753071"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="448753071"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 01:48:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="1080861194"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="1080861194"
Received: from mylly.fi.intel.com (HELO [10.237.72.66]) ([10.237.72.66])
  by fmsmga005.fm.intel.com with ESMTP; 29 Sep 2023 01:48:11 -0700
Message-ID: <1d56ceef-6573-43b9-a050-124c341a0698@linux.intel.com>
Date:   Fri, 29 Sep 2023 11:48:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
To:     Wolfram Sang <wsa@kernel.org>,
        Jan Bottorff <janb@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ZQl1zwVkx9n2MPvr@shikoro>
 <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
 <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
 <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
 <ZQq2cT+/QCenR5gx@shikoro>
 <ba6d4378-b646-4514-3a45-4b6c951fbb9c@kalrayinc.com>
 <9219ad29-b9a3-4f07-81b5-43b4b6d9d178@os.amperecomputing.com>
 <d65lwrkji3rvw6r4jdcumo4zu3hbu6zpv6xq73hw6hcshvhtkw@jvuohb3f3loo>
 <3a305e74-2235-47ab-8564-0c594f24dc0a@os.amperecomputing.com>
 <ZRSEntqne/1y1ozq@shikoro>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZRSEntqne/1y1ozq@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/27/23 22:38, Wolfram Sang wrote:
> 
>> So my next question, is the change to dw_reg_write something that I should
>> write and submit, or should someone else submit something more generalized,
>> like option 2 above? I don't own the i2c driver, I'm just trying to fix one
>> issue on one processor with minimal risk of breaking something. I don't have
>> the broader view of what's optimal for the whole DesignWare i2c driver. I
>> also don't have any way to test changes on other models of processors.
> 
> Well, I guess this is a question for the designware maintainers: do we
> want this one conversion from *_relaxed to non-relaxed. Or are we
> playing safe by using non-relaxed all the time. I would suggest the
> latter because the drivers I look after hardly write registers in a hot
> path (and not many of them at a time). But you guys know your driver
> better...
> 
Well I don't have any preference (read enough knowledge) either here and 
I hardly think performance becomes issue in any configuration.

Not a showstopper to this fix nor necessarily need to cover either but 
one another memory barrier case might be in i2c-slave flows:

1. I2C bus read/write from another host
2. Interrupt to i2c-designware IP
    i2c-designware-slave.c: i2c_dw_isr_slave()
    i2c-core-slave.c: i2c_slave_event()
    -> irq handler goes to slave backend like i2c-slave-eeprom
    i2c-slave-eeprom.c: i2c_slave_eeprom_slave_cb()
3. Shared data between irq handler and process context
    struct eeprom_data is accessed both from irq handler via 
i2c_slave_eeprom_slave_cb() and process context via sysfs node handlers 
i2c_slave_eeprom_bin_read() and i2c_slave_eeprom_bin_write()
