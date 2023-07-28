Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8F4766D2E
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 14:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236099AbjG1M1M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jul 2023 08:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235279AbjG1M0j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jul 2023 08:26:39 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B69E44A6;
        Fri, 28 Jul 2023 05:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690547162; x=1722083162;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Z+uMfTjCUF0qRpVrI9/2vNl3B4Ax0Elwxre0Rq9ooZg=;
  b=BGKe816X+n/MYtQNEmYej1fN2nCAvW8ELnpL6wJKMR3vTAClya8cO6o+
   kGF5LTNsMfBkzXqZSGSiiPLM48RTyLo06WURFMqrs02e5sWYNrAFGsA6X
   4WblkYqF4nI7wqMeizUMd8dzlvDtS4Tz52M8sdD8PXYqMiug2ehFuK85X
   1VXXttBloKLjNJkcc20xYaZKY8+5IzFUb24dtg3y5N0rniADrTF825X/3
   V8QTUHvBcl/989QGwz3qxWK1sBZVgPGSfg/E5Zhmkm8bqGJuzwDFa/w5n
   odpjyBVaFPPEuQO4I5h0KFLzp5vk4lBIJ5pmLJU50jvqCqTezsjH0udTt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353488392"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="353488392"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 05:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="792926075"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="792926075"
Received: from mylly.fi.intel.com (HELO [10.237.72.59]) ([10.237.72.59])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jul 2023 05:25:59 -0700
Message-ID: <f0e0c31e-ad5e-c3ae-945e-c2af0d68beab@linux.intel.com>
Date:   Fri, 28 Jul 2023 15:25:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v1 4/9] i2c: designware: Propagate firmware node
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-5-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230725143023.86325-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/25/23 17:30, Andy Shevchenko wrote:
> Propagate firmware node by using a specific API call, i.e. device_set_node().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-core.h    | 6 ++++--
>   drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 --
>   drivers/i2c/busses/i2c-designware-platdrv.c | 2 --
>   3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 03f4d44ae94c..f0c683ad860f 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -10,11 +10,11 @@
>    */
>   
>   #include <linux/bits.h>
> -#include <linux/compiler_types.h>
>   #include <linux/completion.h>
> -#include <linux/dev_printk.h>
> +#include <linux/device.h>
>   #include <linux/errno.h>
>   #include <linux/i2c.h>
> +#include <linux/property.h>
>   #include <linux/regmap.h>
>   #include <linux/types.h>
>   
> @@ -363,6 +363,8 @@ static inline int i2c_dw_probe_slave(struct dw_i2c_dev *dev) { return -EINVAL; }
>   
>   static inline int i2c_dw_probe(struct dw_i2c_dev *dev)
>   {
> +	device_set_node(&dev->adapter.dev, dev_fwnode(dev->dev));
> +

Would this be better to put in the same place where ACPI_COMPANION_SET() 
is removed like below? I'd keep this static inline function in the 
header file as simple as possible. All extra code might invite adding 
even more.

>   	switch (dev->mode) {
>   	case DW_IC_SLAVE:
>   		return i2c_dw_probe_slave(dev);
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index 7f5a04538c71..a42a47e0032d 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -9,7 +9,6 @@
>    * Copyright (C) 2009 Provigent Ltd.
>    * Copyright (C) 2011, 2015, 2016 Intel Corporation.
>    */
> -#include <linux/acpi.h>
>   #include <linux/delay.h>
>   #include <linux/err.h>
>   #include <linux/errno.h>
> @@ -325,7 +324,6 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>   	adap = &dev->adapter;
>   	adap->owner = THIS_MODULE;
>   	adap->class = 0;
> -	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
>   	adap->nr = controller->bus_num;

