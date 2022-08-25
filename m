Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBD85A156E
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 17:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241032AbiHYPQ7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 11:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233165AbiHYPQx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 11:16:53 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B82A69F5E
        for <linux-i2c@vger.kernel.org>; Thu, 25 Aug 2022 08:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661440611; x=1692976611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p6Jaa1YXhABsS3rxmlQZBaAAhbytC6nykMY3Ksai7X4=;
  b=BX1E9nOnQNH3is7hAfI0BqYlWoh0FCjVNbUXLc0V3sPoaCyafuZfRc6D
   47VApC2t1y4YZ26MrkvWRMk/HAIrWgudJGDSO0TZbgNK5GrnlZakbmRkc
   uwmUkl2i1tTJ3KZSgZe/bb1ZubtD4JPBMy7hNHQLW0c7CY88xMorY9oiE
   NJNO7jslydkie2USQfMET46XkSCoAAgRP9sDw75Q5Wjcmr4agqekZ1SIB
   fse4TC0RLwnXQQQvsQnm5C2S01B11U0zQZV4btDjJaujx3pA34IF55SL/
   X8ThPJuGLwypzDbpJvGN024fOwlm1B4d7B7ue0/7amHgm0O7fxY1nUWXA
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="358232717"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="358232717"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 08:14:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="639633798"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 08:14:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oREYg-003RdV-33;
        Thu, 25 Aug 2022 18:14:14 +0300
Date:   Thu, 25 Aug 2022 18:14:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Josef Johansson <josef@oderland.se>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3 1/1] i2c: scmi: Replace open coded
 device_get_match_data()
Message-ID: <YweRxiJl5zzufXUl@smile.fi.intel.com>
References: <20220708120958.74034-1-andriy.shevchenkolinux!intel!com>
 <4d2d5b04-0b6c-1cb1-a63f-dc06dfe1b5da@oderland.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d2d5b04-0b6c-1cb1-a63f-dc06dfe1b5da@oderland.se>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 16, 2022 at 08:03:33AM +0200, Josef Johansson wrote:
> On 7/8/22 14:09, Andy Shevchenko wrote:

> I tried build Linux 6.0 and run under Xen 4.14.5. I got a kernel null pointer dereferenced while booting. Reverting this commit allowed the system to boot.
> 
> Since I do not have any way of capturing the error except camera (it's a long message), here's my best try.
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000000

I think I know what happens there. Can you test a hackpatch (below)
with my patch _not being reverted_?

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 79798fc7462a..3ed1758706b0 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -426,6 +426,9 @@ static struct acpi_driver acpi_smbus_cmi_driver = {
 		.add = acpi_smbus_cmi_add,
 		.remove = acpi_smbus_cmi_remove,
 	},
+	.drv = {
+		.acpi_match_table = acpi_smbus_cmi_ids,
+	},
 };
 module_acpi_driver(acpi_smbus_cmi_driver);
 

-- 
With Best Regards,
Andy Shevchenko


