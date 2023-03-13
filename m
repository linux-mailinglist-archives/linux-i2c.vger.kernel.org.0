Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 088E76B7401
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 11:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjCMK34 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 06:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjCMK3z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 06:29:55 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8115C420F;
        Mon, 13 Mar 2023 03:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678703394; x=1710239394;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hY9IIaZMl5c8h2OB+LsnXaFR+ZiNYkRDP9kkQkOMOFg=;
  b=YPQc/mZsLscBN7s+OFsX0yWTnk0SCzznmHw4l1k3F4NbWc63gMhgBh3A
   58wU+B+kJyr9VpVgQB1BcIDFpwItfB4OPyedEp7GbfUddJAGj2YAzzpVt
   /AC1LDdhpZ3EJgjxIJUcKZw2zhkGUt1xaEwNBP3Buioo+NzaT4aqsQe6t
   tB3Vi/mEGyEla4FjObVdQzYkFCuk+gdN0FoXpidZ/7dKGtRRyUs9P7kdx
   0Q0uaKahP0AOfBm6havLZx1wW7HA8KKO5RjewG0SfQNsRsImLmcCXd1i8
   ajeZpimsH/VYwwh9R8rog3+/wew4ek0mI7arSbnTT5/g1L+i2dxzy7g6S
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="316758940"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="316758940"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 03:29:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="924453399"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="924453399"
Received: from unknown (HELO [10.237.72.51]) ([10.237.72.51])
  by fmsmga006.fm.intel.com with ESMTP; 13 Mar 2023 03:29:51 -0700
Message-ID: <b18aefc2-dd07-5356-0d19-b4783ed500e6@linux.intel.com>
Date:   Mon, 13 Mar 2023 12:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v4 8/8] i2c: designware: Add doorbell support for Skyrim
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>, Rijo-john.Thomas@amd.com,
        Thomas.Lendacky@amd.com, herbert@gondor.apana.org.au,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Felix.Held@amd.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230310211954.2490-1-mario.limonciello@amd.com>
 <20230310211954.2490-9-mario.limonciello@amd.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230310211954.2490-9-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/10/23 23:19, Mario Limonciello wrote:
> Skyrim and later platform don't use the platform feature mailbox for
> communication for I2C arbitration, they rely upon ringing a doorbell.
> 
> Detect the platform by the device ID of the root port and choose the
> appropriate method.
> 
> Link: https://lore.kernel.org/linux-i2c/20220916131854.687371-3-jsd@semihalf.com/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v3->v4:
>   * Adjust to use PCI device ID and function pointers instead
> v2->v3:
>   * Use CPU ID rather than ACPI ID, this will be pushed to a later patch
> v1->v2:
>   * New patch
> ---
>   drivers/i2c/busses/i2c-designware-amdpsp.c | 40 ++++++++++++++++------
>   1 file changed, 30 insertions(+), 10 deletions(-)
> 
...

> @@ -276,6 +289,13 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
>   	if (psp_i2c_dev)
>   		return -EEXIST;
>   
> +	/* Cezanne uses platform mailbox, Skyrim and later use doorbell */
> +	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
> +	if (rdev->device == 0x1630)
> +		_psp_send_i2c_req = psp_send_i2c_req_cezanne;
> +	else
> +		_psp_send_i2c_req = psp_send_i2c_req_skyrim;
> +

Is there any possibility pci_get_domain_bus_and_slot() returns NULL? Or 
is 00:00.0 always present?
