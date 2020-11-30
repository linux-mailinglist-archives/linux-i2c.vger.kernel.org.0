Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81DF2C8B9D
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 18:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387470AbgK3Rqi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 12:46:38 -0500
Received: from mga14.intel.com ([192.55.52.115]:28016 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728531AbgK3Rqi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Nov 2020 12:46:38 -0500
IronPort-SDR: SvOJASuBD6pJ+/ZVnpb8mefeHSAfc3nmKINsNMdzASxcLzs/v/7fqlue9TQCNTEUlE8w4v6ns2
 kBPSNYb7ZNbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="171893094"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="171893094"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 09:44:47 -0800
IronPort-SDR: K4Lv8VYpHyuLxAvAG2Xpm2yVewTVRu28dNF0l6nBMlELHaKVXu14CV1XJ8Gqp3iWWE7ypM9g8H
 vTP4T4Saasgw==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="372578999"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 09:44:41 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kjnF8-00B69B-48; Mon, 30 Nov 2020 19:45:42 +0200
Date:   Mon, 30 Nov 2020 19:45:42 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 05/18] software_node: Alter
 software_node_unregister_nodes() to unregister the array in reverse order
Message-ID: <20201130174542.GQ4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-6-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-6-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 30, 2020 at 01:31:16PM +0000, Daniel Scally wrote:
> Software nodes that are children of another software node should be
> unregistered before their parent. To allow easy unregistering of an array
> of software_nodes ordered parent to child, reverse the order in which
> this function unregisters software_nodes.

Should be folded in the previous patch. Otherwise we will have a history point
where register() behaves differently to unregister().

...

> + * @nodes: Zero terminated array of software nodes to be unregistered. If
> + * parent pointers are set up in any of the software nodes then the array
> + * MUST be ordered such that parents come before their children.

Please, leave field description short. Rather add another note to the
Description below.

>   *
>   * Unregister multiple software nodes at once.
>   *
> - * NOTE: Be careful using this call if the nodes had parent pointers set up in
> - * them before registering.  If so, it is wiser to remove the nodes
> - * individually, in the correct order (child before parent) instead of relying
> - * on the sequential order of the list of nodes in the array.
> + * NOTE: If you are uncertain whether the array is ordered such that
> + * parents will be unregistered before their children, it is wiser to
> + * remove the nodes individually, in the correct order (child before
> + * parent).
>   */

-- 
With Best Regards,
Andy Shevchenko


