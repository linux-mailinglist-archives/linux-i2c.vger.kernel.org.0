Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43BE377F1D1
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 10:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348731AbjHQIIA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 04:08:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348767AbjHQIHk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 04:07:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7824B30C1;
        Thu, 17 Aug 2023 01:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692259657; x=1723795657;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oQUdF+oJMm6aBKGxgfq9tfveb09R6sP9jV92mZIe/Fs=;
  b=SvWRpsQmXZoCtJ4e/JeV5sa7TXaTWAKj89UGkKU02p9kzfIcqUdIJRNQ
   uEXNw/WzPvZaCA1fkgR1KltPf4/fv6Cm69N5Sj0TkmIyFN5oGyTNFs6Z5
   Cf+lI/UJpCPY2N84EC6BEHtYNTCuAafBCP3QDCR2XPy9zczMbjpatTKJ9
   LWzohPsZCYU3c13hQo0cRo7ZBsqIfhEsVgat54kWYWyB++7mIcYyngRj7
   6kBiS/HREF+fimwvAT2T/ZjV3R3EEEdx2Vh3AV/Khi0j/6hz0QAM+W5bk
   QJsoFtN+5T2hj/1dV4RD5IoLQeS6/w5DoD5HiyQvtz7JrSHxZBE3WnF1f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403724494"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="403724494"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 01:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1065153257"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="1065153257"
Received: from mylly.fi.intel.com (HELO [10.237.72.62]) ([10.237.72.62])
  by fmsmga005.fm.intel.com with ESMTP; 17 Aug 2023 01:07:34 -0700
Message-ID: <97d62909-551b-4abd-a743-5be09e617665@linux.intel.com>
Date:   Thu, 17 Aug 2023 11:07:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: add support for pinctrl for recovery
To:     Yann Sionneau <yann@sionneau.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>
References: <20230816095015.23705-1-yann@sionneau.net>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230816095015.23705-1-yann@sionneau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 8/16/23 12:50, Yann Sionneau wrote:
> From: Yann Sionneau <ysionneau@kalray.eu>
> 
> Currently if the SoC needs pinctrl to switch the SCL and SDA
> from the I2C function to GPIO function, the recovery won't work.
> 
> scl-gpio = <>;
> sda-gpio = <>;
> 
> Are not enough for some SoCs to have a working recovery.
> Some need:
> 
> scl-gpio = <>;
> sda-gpio = <>;
> pinctrl-names = "default", "recovery";
> pinctrl-0 = <&i2c_pins_hw>;
> pinctrl-1 = <&i2c_pins_gpio>;
> 
> The driver was not filling rinfo->pinctrl with the device node
> pinctrl data which is needed by generic recovery code.
> 
> Tested-by: Yann Sionneau <ysionneau@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>

Tested-by from author is needless. Expectation is that author has tested 
the patch while not always true :-)

> @@ -905,6 +906,15 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
>   		return PTR_ERR(gpio);
>   	rinfo->sda_gpiod = gpio;
>   
> +	rinfo->pinctrl = devm_pinctrl_get(dev->dev);
> +	if (IS_ERR(rinfo->pinctrl)) {
> +		if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
> +			return PTR_ERR(rinfo->pinctrl);
> +
> +		rinfo->pinctrl = NULL;
> +		dev_info(dev->dev, "can't get pinctrl, bus recovery might not work\n");

I think dev_dbg() suits better here or is it needed at all? End user may 
not be able to do anything when sees this in dmesg. I.e. more like 
development time dev_dbg() information.

Does i2c-core-base.c: i2c_gpio_init_pinctrl_recovery() already do 
dev_info() print when pinctrl & GPIO are set properly making above also 
kind of needless?

Jarkko
