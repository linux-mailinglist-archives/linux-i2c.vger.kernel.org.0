Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6DC4E7523
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 15:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245273AbiCYOiK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 10:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237056AbiCYOiI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 10:38:08 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10D08BF4C;
        Fri, 25 Mar 2022 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648218993; x=1679754993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xQGvRo4HU9Rb+vPiftyGreOW6tL0xuEtF9yrwLhZK88=;
  b=b34xpsWOnWBKCnmS7AhN0eTRy7goyxjg1Yr7ks0mve4EyNXGZEFb5pdr
   TjJOMJvS/1gv2HfAjx+PTkMPC0ltWTa9KVqWU2+W+M/3QDxg1JNnONlk5
   rdRKbhu5rzaQBqKjRUdAMYxEEHfl5kQkP+ulfklOsgLUDsV5oc3vvP5zv
   dyw46j+qtFABjdfhj05csTDZMOf7nxb/P9uZVHyt8XXLxGna6dk4L1Ljj
   PhRwEIxjn5BwD05MPxfnnbgFdg57sr2qvZPm+WM7hjkXUUEEqEIgmccuG
   cWdCDh6aWGvBCzKaoxvUfxf3Ogc1f8BkVV8lHGUdNUi+ZkQ3oN7+qOf0c
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="321837920"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="321837920"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 07:36:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="617142210"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 07:36:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nXl2e-006Rc8-KB;
        Fri, 25 Mar 2022 16:35:52 +0200
Date:   Fri, 25 Mar 2022 16:35:52 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 6/9] i2c: fwnode: add fwnode_find_i2c_adapter_by_node()
Message-ID: <Yj3TSBEY/P7d8XJj@smile.fi.intel.com>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
 <20220325113148.588163-7-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220325113148.588163-7-clement.leger@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 25, 2022 at 12:31:45PM +0100, Clément Léger wrote:
> Add fwnode_find_i2c_adapter_by_node() which allows to retrieve a i2c
> adapter using a fwnode. Since dev_fwnode() uses the fwnode provided by
> the of_node member of the device, this will also work for devices were
> the of_node has been set and not the fwnode field.
> For acpi nodes, the check for parent node is skipped since
> i2c_acpi_find_adapter_by_handle() does not check it and we don't want
> to change this behavior.

...

> +#include <linux/device.h>
> +#include <linux/i2c.h>

Missed headers so far:
acpi.h

...

> +static int fwnode_dev_or_parent_node_match(struct device *dev, const void *data)
> +{
> +	if (device_match_fwnode(dev, data))
> +		return 1;
> +
> +	/*
> +	 * For ACPI device node, the behavior is to not match the parent (see
> +	 * i2c_acpi_find_adapter_by_handle())
> +	 */

Would it be harmful to drop this check?

> +	if (!is_acpi_device_node(dev_fwnode(dev)) && dev->parent)
> +		return device_match_fwnode(dev->parent, data);
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


