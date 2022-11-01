Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3713D614D0C
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 15:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbiKAOrq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 10:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbiKAOrp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 10:47:45 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A45B175B7;
        Tue,  1 Nov 2022 07:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667314064; x=1698850064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=C/RryqlYG2pq3NMvhGm+Rlflkdb79G489C0aHrLOG64=;
  b=AZ/LBlaDasK/hC4/TtBfU6gXw3q858ghWBmUmzN+ydZf4wMGoatMPWNg
   o9E2nYYsbEkzKdsiqAUnks7KsuCGoUuwsgS/fMU4IimYgH/ovvcAHfRoa
   X67LXpe1FopcBefq4qV/ZBsf0sXvIeefJofZb2eX/sFnjpLM5jYQ97zEt
   JAiKpb8Bwa3hSgj4ZjkYNUhP6+vwIWEe1En0VBEWz2/JO+YJaDkLMFUGU
   FtMHcuuGBfh+1nPm5uJISn94lJWQTTKY6EIzTuA8y68pb8MhQQC0GHQ4k
   lhhebHZqxadgtIPZwZ4izMsmGNJ8vNAODlziDx6gr3DV0i+LPcDUWrZI/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="296579359"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="296579359"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 07:43:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="636418547"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="636418547"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 01 Nov 2022 07:43:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1opsUG-005dKC-0a;
        Tue, 01 Nov 2022 16:43:32 +0200
Date:   Tue, 1 Nov 2022 16:43:31 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     chenweilong <chenweilong@huawei.com>
Cc:     yangyicong@hisilicon.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, wsa@kernel.org,
        f.fainelli@gmail.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, william.zhang@broadcom.com, jsd@semihalf.com,
        conor.dooley@microchip.com, phil.edworthy@renesas.com,
        tharunkumar.pasumarthi@microchip.com, semen.protsenko@linaro.org,
        kfting@nuvoton.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH next v9 1/4] i2c: hisi: Add initial device tree support
Message-ID: <Y2Ewk5i/PAS87fa8@smile.fi.intel.com>
References: <20221029115937.179788-1-chenweilong@huawei.com>
 <Y170TZoIp1WBIwU4@smile.fi.intel.com>
 <dfc1c006-61c0-8f28-6164-060347c69d04@huawei.com>
 <Y1/s2iZFod/7qzU+@smile.fi.intel.com>
 <d96beadb-5693-6c73-8fee-3ac3b4cb9a44@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d96beadb-5693-6c73-8fee-3ac3b4cb9a44@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 01, 2022 at 03:23:29PM +0800, chenweilong wrote:
> On 2022/10/31 23:42, Andy Shevchenko wrote:

...

> Thanks very much for your detailed explanation.

You're welcome!

> By the way,  is it valuable to make a cleanup for the legacy not-up-to-dated drivers?
> 
> There's lots of of_match_ptr or ACPI_PTR...

Not on per se basis, only if there is a series which does something more useful
than that. E.g. enabling PRP0001 trick for discrete component drivers that may
be used on more than a single architecture.

-- 
With Best Regards,
Andy Shevchenko


