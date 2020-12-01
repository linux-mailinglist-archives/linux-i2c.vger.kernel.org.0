Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB692C97DD
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 08:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbgLAHLa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 02:11:30 -0500
Received: from mga03.intel.com ([134.134.136.65]:53468 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725859AbgLAHL3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Dec 2020 02:11:29 -0500
IronPort-SDR: rO9fOdvou2bGbH8N7ZQttr2HheNGPFRFQW8zOeHxJlfwjc2bh5uxMwGujkTIpriu9Z14TtJElT
 dP1Zsdwytv7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="172879120"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
   d="scan'208";a="172879120"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 23:09:48 -0800
IronPort-SDR: Vn09THofrQN9w7Vq4pwPzYjq94ZZPXk+iWJnCoCMvfl5OF6xgGcr0MUZKXmJ5UlVBupzz5Vitj
 9wqIElHxjxJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
   d="scan'208";a="480979673"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by orsmga004.jf.intel.com with ESMTP; 30 Nov 2020 23:09:40 -0800
Subject: Re: [PATCH 10/18] ipu3-cio2: Rename ipu3-cio2.c to allow module to be
 built from multiple source files retaining ipu3-cio2 name
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-11-djrscally@gmail.com>
 <832ce84b-0dba-826b-51c8-90162c2f7ab8@linux.intel.com>
Message-ID: <7861a56c-8cae-6b23-9ed6-55a11e993edc@linux.intel.com>
Date:   Tue, 1 Dec 2020 15:07:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <832ce84b-0dba-826b-51c8-90162c2f7ab8@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/1/20 2:56 PM, Bingbu Cao wrote:
> I see there will be multiple files, but there will be no conflict if keep as the main
> file name unchanged, right? If so, I prefer keep as it was.

Oops, I notice you try to build all the files into single module, so please ignore my
comment above.

> 
> On 11/30/20 9:31 PM, Daniel Scally wrote:
>> ipu3-cio2 driver needs extending with multiple files; rename the main
>> source file and specify the renamed file in Makefile to accommodate that.
>>
>> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes since RFC v3:
>>
>> 	- None
>>
>>  drivers/media/pci/intel/ipu3/Makefile                          | 2 ++
>>  drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} | 0
>>  2 files changed, 2 insertions(+)
>>  rename drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} (100%)
>>
>> diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
>> index 98ddd5beafe0..429d516452e4 100644
>> --- a/drivers/media/pci/intel/ipu3/Makefile
>> +++ b/drivers/media/pci/intel/ipu3/Makefile
>> @@ -1,2 +1,4 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
>> +
>> +ipu3-cio2-y += ipu3-cio2-main.o
>> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>> similarity index 100%
>> rename from drivers/media/pci/intel/ipu3/ipu3-cio2.c
>> rename to drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>>
> 

-- 
Best regards,
Bingbu Cao
