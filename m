Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 973902C95A8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 04:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbgLADQk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 22:16:40 -0500
Received: from mga12.intel.com ([192.55.52.136]:58292 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725859AbgLADQk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Nov 2020 22:16:40 -0500
IronPort-SDR: ZfpFTG97BeWRb7vA9GrsWyGUpbSR9ZnBowxT6CLlxX/sYzPKGQsjX7MEqbnm0Pj1h1eEDIMoO9
 86PyLRzlC4bw==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="152008496"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="152008496"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 19:14:59 -0800
IronPort-SDR: eNtYnhHKzeTY2Y9EOQeDGQqiLrtAEjPmi28lETZw0+LclIHrGibdzWSrk50Lk8HReSBNirYl5y
 1cZ6z9WBv9sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="480913086"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by orsmga004.jf.intel.com with ESMTP; 30 Nov 2020 19:14:49 -0800
Subject: Re: [PATCH 01/18] property: Return true in fwnode_device_is_available
 for node types that do not implement this operation
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
 <20201130133129.1024662-2-djrscally@gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <7da1d242-b32a-58f5-e50b-15441730aa0f@linux.intel.com>
Date:   Tue, 1 Dec 2020 11:12:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130133129.1024662-2-djrscally@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Daniel, thanks for your patch.

On 11/30/20 9:31 PM, Daniel Scally wrote:
> Some types of fwnode_handle do not implement the device_is_available()
> check, such as those created by software_nodes. There isn't really a
> meaningful way to check for the availability of a device that doesn't
> actually exist, so if the check isn't implemented just assume that the
> "device" is present.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since RFC v3:
> 
> 	patch introduced
> 
>  drivers/base/property.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 4c43d30145c6..a5ca2306796f 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -785,9 +785,14 @@ EXPORT_SYMBOL_GPL(fwnode_handle_put);
>  /**
>   * fwnode_device_is_available - check if a device is available for use
>   * @fwnode: Pointer to the fwnode of the device.
> + *
> + * For fwnode node types that don't implement the .device_is_available()
> + * operation, this function returns true.
>   */
>  bool fwnode_device_is_available(const struct fwnode_handle *fwnode)
>  {
> +	if (!fwnode_has_op(fwnode, device_is_available))
> +		return true;

blank line here?

>  	return fwnode_call_bool_op(fwnode, device_is_available);
>  }
>  EXPORT_SYMBOL_GPL(fwnode_device_is_available);
> 

-- 
Best regards,
Bingbu Cao
