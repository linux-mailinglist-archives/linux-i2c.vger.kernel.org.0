Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD952C97C4
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 08:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbgLAHBY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 02:01:24 -0500
Received: from mga14.intel.com ([192.55.52.115]:32226 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725859AbgLAHBX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Dec 2020 02:01:23 -0500
IronPort-SDR: ohkrdD2+5PTnof/K0QoIrxJT0CoS/QODrK7ykYQWm/L2hvzw6Fc1pJg8mpHZMH5qER8xceFnWj
 NUquMB1KtA+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="171992899"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
   d="scan'208";a="171992899"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 22:59:42 -0800
IronPort-SDR: qoNTbTEA9W0UKLwvPZRNJXWsOWknVdAvvuGdS55D3bf0CxJjHKkYfKbFJYciVoghtjMNo/tiux
 c5HKDQXfFXWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
   d="scan'208";a="480974992"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by orsmga004.jf.intel.com with ESMTP; 30 Nov 2020 22:59:32 -0800
Subject: Re: [PATCH 10/18] ipu3-cio2: Rename ipu3-cio2.c to allow module to be
 built from multiple source files retaining ipu3-cio2 name
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
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <832ce84b-0dba-826b-51c8-90162c2f7ab8@linux.intel.com>
Date:   Tue, 1 Dec 2020 14:56:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130133129.1024662-11-djrscally@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I see there will be multiple files, but there will be no conflict if keep as the main
file name unchanged, right? If so, I prefer keep as it was.

On 11/30/20 9:31 PM, Daniel Scally wrote:
> ipu3-cio2 driver needs extending with multiple files; rename the main
> source file and specify the renamed file in Makefile to accommodate that.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since RFC v3:
> 
> 	- None
> 
>  drivers/media/pci/intel/ipu3/Makefile                          | 2 ++
>  drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} | 0
>  2 files changed, 2 insertions(+)
>  rename drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} (100%)
> 
> diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
> index 98ddd5beafe0..429d516452e4 100644
> --- a/drivers/media/pci/intel/ipu3/Makefile
> +++ b/drivers/media/pci/intel/ipu3/Makefile
> @@ -1,2 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
> +
> +ipu3-cio2-y += ipu3-cio2-main.o
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> similarity index 100%
> rename from drivers/media/pci/intel/ipu3/ipu3-cio2.c
> rename to drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> 

-- 
Best regards,
Bingbu Cao
