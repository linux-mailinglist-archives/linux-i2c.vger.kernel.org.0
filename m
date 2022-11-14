Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B480627990
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 10:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235827AbiKNJxT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 04:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235804AbiKNJxS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 04:53:18 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F221E720
        for <linux-i2c@vger.kernel.org>; Mon, 14 Nov 2022 01:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668419597; x=1699955597;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=aHw0Wu1vtC/c9/flw9xDwjklo4CGELzYA2CYzmY3RYQ=;
  b=LDsWCFy3G8U0IwaNAchpv3iPCIWejbOgcAcIIBerRSGKCLDqEw2eMzNT
   miNivrWlyrmpqSVkJ4Ar1vXRFjE47vlOZKqu31x/9LNEMRE9unX3IQkEC
   SIZYfOFLu6MaB6ww2MbdemcY+6GSwBgxqSm4d6xJM8BxTt0VaEzZBkfr5
   NmlVWv9jx6GkzzrZRzupmNRqmsSP8Q0NLaU4lFXmDzG7XcrsohoK39i6P
   sfOGhxDl9+B51vo8J77Sv/XtVP8UH/LtXSlHklSl6ieQESXnP431zMuIF
   Jb+8XyjKMrxnNeVWV4G408pOUpHDPCY2TxN0VH4QMchHFdiJdLuDgc1DX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="374057836"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="374057836"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 01:53:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="638413286"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="638413286"
Received: from mylly.fi.intel.com (HELO [10.237.72.171]) ([10.237.72.171])
  by orsmga002.jf.intel.com with ESMTP; 14 Nov 2022 01:53:15 -0800
Message-ID: <a7fd168d-9333-52d2-90da-5bb58d1953a7@linux.intel.com>
Date:   Mon, 14 Nov 2022 11:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [PATCH v3 02/12] i2c: designware: Empty receive FIFO in slave
 interrupt handler
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>
References: <20221107134248.864890-1-jarkko.nikula@linux.intel.com>
 <20221107134248.864890-3-jarkko.nikula@linux.intel.com>
 <Y29DwdOd5UIzgwsl@shikoro>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Y29DwdOd5UIzgwsl@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/12/22 08:57, Wolfram Sang wrote:
> 
>> 2. i2ctransfer -y 6 w9@0x65 0x00 0xff-
> 
> Always nice to see 'i2ctransfer' in action!
> 
>> While at it do not test the return code from i2c_slave_event() for the
>> I2C_SLAVE_WRITE_RECEIVED since to my understanding this hardware cannot
>> generate NACK to incoming bytes
> 
> Not even on the last byte? That would be bad. If a backend encounters a
> problem, there is no way then to communicate that back to the
> controller.
> 
Yeah, that's how I understood it. HW has an optional register (I didn't 
check is it enabled on our HW) that enable generation of NACK for the 
incoming data byte but it can be enabled only when the controller is 
disabled and slave is inactive so it doesn't look very useful.

Jarkko
