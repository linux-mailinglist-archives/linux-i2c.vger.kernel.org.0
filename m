Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5655EED60
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 07:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234807AbiI2FwU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 01:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbiI2FwT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 01:52:19 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C38F12B5F4;
        Wed, 28 Sep 2022 22:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664430738; x=1695966738;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+JM7FnWqMQ5QRZXbNzmgLbmnvFVR0sDQMozi4+AFapw=;
  b=i9vfbwlmRlLZ8xZYRcz+AFHA/whW7TfhgmDPBCcPrGGlDhQwY/wZutcr
   citPurLvJ/2uuohtBpsGstOV0qW2XdSqhwgNBwoVinvDF4AUBu5m8xXJq
   aMLMLpc639+erIRP6kHu2waXYIMLP7GNedC9iayvuOKbg3aF41FKVhIUk
   aWn2vY2PSvVWsy6Hp9xQw+D1UM9QMSs6c+H4VCG9QMklZl4i3uv6KMZlG
   ByEvSdDliddOsJuOJvXt0ep29F3e5wx6ro+lxssysZGTX8mCFkWBCwNKq
   Z7znRhX9MZX3VgbBWRIbKgE2SpLnfbimtW7AsJwwcZuMrpi9L45DgiB4J
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="301776258"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="301776258"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 22:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="764584211"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="764584211"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2022 22:52:16 -0700
Message-ID: <bc058878-4df4-cdcb-db6b-7c88e8814aa4@linux.intel.com>
Date:   Thu, 29 Sep 2022 08:52:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH v1 1/2] i2c: designware-pci: Group AMD NAVI quirk parts
 together
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
References: <20220928162116.66724-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220928162116.66724-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/28/22 19:21, Andy Shevchenko wrote:
> The code is ogranazed in a way that all related parts to
> the certain platform quirk go toghether. This is not the
> case for AMD NAVI. Shuffle code to make it happen.
> 
Perhaps you want to change ogranazed and toghether?

> While at it, drop the frequency definition and use
> hard coded value as it's done for other platforms and
> add a comment to the PCI ID list.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 30 +++++++++++-----------
>   1 file changed, 15 insertions(+), 15 deletions(-)
> 
You may add:
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
