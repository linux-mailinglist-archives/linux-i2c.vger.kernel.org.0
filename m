Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A02687867E2
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 08:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233621AbjHXGxm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 02:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240231AbjHXGxd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 02:53:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEDC91724;
        Wed, 23 Aug 2023 23:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692859980; x=1724395980;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=glCjWylfZPa8/1r90fCH4I0bDmEqpvkYi6gf5hnG/+M=;
  b=MoyDpStzIkxxN4s+LK3g7I7+NsC8Ej+DaRPK5WvuPrT21pBQWG8SHU1a
   2RK1QzH4dl9KIZzcIsz0iFwArecBk7T6hBllpXWmstFpC02wl2YJU17hh
   ioFq9sYnba8oIRtTBykbZZ1+o/BcofIPA6h82YbfI/7CxtYPItw0y8USK
   6oA+BLvkUWzHGjc7bFZwaaVrjMfTNw23CpVQmbqC8e/9wNAzFXlI+xwum
   4RbiKcKsDVbz5uqdKgKE9B2zP14fzTP2FyWqqbdzOtkPwtQEQtZ81zdlF
   LsWf524OTjmkL6fk4KlYCyrSg7jDbozkk+mxlCqmCxwkyvHxcHw3RlP5B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="364533845"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="364533845"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 23:53:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="766426382"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="766426382"
Received: from mylly.fi.intel.com (HELO [10.237.72.62]) ([10.237.72.62])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 23:52:58 -0700
Message-ID: <686d5609-7e3d-4385-a23b-f7dec13c02bf@linux.intel.com>
Date:   Thu, 24 Aug 2023 09:52:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] i2c: designware: Add support for recovery when GPIO
 need pinctrl.
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yann Sionneau <ysionneau@kalray.eu>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>
References: <20230822143437.9395-1-ysionneau@kalray.eu>
 <ZOTJnWjG90tyGkJl@smile.fi.intel.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZOTJnWjG90tyGkJl@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/22/23 17:43, Andy Shevchenko wrote:
> On Tue, Aug 22, 2023 at 04:34:37PM +0200, Yann Sionneau wrote:
>> Currently if the SoC needs pinctrl to switch the SCL and SDA from the I2C
>> function to GPIO function, the recovery won't work.
>>
>> scl-gpio = <>;
>> sda-gpio = <>;
>>
>> Are not enough for some SoCs to have a working recovery.
>> Some need:
>>
>> scl-gpio = <>;
>> sda-gpio = <>;
>> pinctrl-names = "default", "recovery";
>> pinctrl-0 = <&i2c_pins_hw>;
>> pinctrl-1 = <&i2c_pins_gpio>;
>>
>> The driver was not filling rinfo->pinctrl with the device node
>> pinctrl data which is needed by generic recovery code.
> 
> Now looks pretty much good enough (yet the period is not needed in the Subject,
> but it's fine for your newbie submission — no need to resend or make a new
> version). Thank you!
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
