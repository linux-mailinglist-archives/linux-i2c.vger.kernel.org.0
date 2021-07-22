Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7926F3D2048
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Jul 2021 11:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbhGVIWY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jul 2021 04:22:24 -0400
Received: from mga06.intel.com ([134.134.136.31]:38335 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230330AbhGVIWW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 22 Jul 2021 04:22:22 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="272716522"
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; 
   d="scan'208";a="272716522"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2021 02:02:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; 
   d="scan'208";a="462701664"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2021 02:02:52 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1m6UbO-00GvE7-Gj; Thu, 22 Jul 2021 12:02:46 +0300
Date:   Thu, 22 Jul 2021 12:02:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 2/6] staging: atomisp: Replace open-coded
 i2c_acpi_find_client_by_adev()
Message-ID: <YPk0NpOQWhzX31Dj@smile.fi.intel.com>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
 <20210526124322.48915-2-andriy.shevchenko@linux.intel.com>
 <20210722105744.4a94d58d@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210722105744.4a94d58d@coco.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 22, 2021 at 10:57:44AM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 26 May 2021 15:43:18 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:
> 
> > gmin_i2c_dev_exists() is using open-coded variant of
> > i2c_acpi_find_client_by_adev(). Replace it with a corresponding call.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> At least on the top of v5.14-rc1, this patch causes a compilation
> issue:
> 
> 	drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c: In function ‘gmin_i2c_dev_exists’:
> 	drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:386:19: error: implicit declaration of function ‘i2c_acpi_find_client_by_adev’; did you mean ‘i2c_acpi_find_adapter_by_handle’? [-Werror=implicit-function-declaration]
> 	  386 |         *client = i2c_acpi_find_client_by_adev(adev);
> 	      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 	      |                   i2c_acpi_find_adapter_by_handle
> 	drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:386:17: warning: assignment to ‘struct i2c_client *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
> 	  386 |         *client = i2c_acpi_find_client_by_adev(adev);
> 	      |                 ^
> 
> The reason is because such function is static:
> 
> 	$ git grep i2c_acpi_find_client_by_adev
> 	drivers/i2c/i2c-core-acpi.c:static struct i2c_client *i2c_acpi_find_client_by_adev(struct acpi_device *adev)
> 
> IMO, a patch like that should be applied at the same tree as a patch
> dropping "static" from drivers/i2c/i2c-core-acpi.c. If you want to do
> so, feel free to add:
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks!

There is a v2 of this where the patch is dropped from.


-- 
With Best Regards,
Andy Shevchenko


