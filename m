Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA4B94E751C
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 15:34:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351220AbiCYOgJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 10:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237056AbiCYOgI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 10:36:08 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F079853E2C;
        Fri, 25 Mar 2022 07:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648218875; x=1679754875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zUmqoASe1g47J7WaVh6lOsEwgkOYKF3XKkW5XTAmW/c=;
  b=Ek2zmGs7TJya4TdRy9DsP71aKoUZXVcsI3dGHJL0+o3GeNb1JlccOfep
   AGB+Luj2ELB7V2u3z/DTYRJJ9VKHES5KcHf9Bp4Y5PPRnfNijWPUf8b5x
   RIaSEk/GOAk9dyDMSh7JuthXL0efePf/L5yZpNVWf3oUjZf6KKLkPyj5H
   DxWKImmUiX+UB2s6SSvHQR+MoaCLMDPxJV9jsvtq3APcS9ITRmkGFx225
   4mKTRWUGEFjHEAEt7uq73AqOtlf9sbZVATXMMEbK4znMNfBle0xNn427M
   kgeEnqzaHtahRIZ03P4yib4uTUUDS3mCW3iV2fSg409vOFi2exzUt55Xc
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="246120474"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="246120474"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 07:34:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="602067416"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 07:34:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nXl0k-006RYj-8d;
        Fri, 25 Mar 2022 16:33:54 +0200
Date:   Fri, 25 Mar 2022 16:33:54 +0200
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
Subject: Re: [PATCH v3 4/9] device property: add
 fwnode_property_read_string_index()
Message-ID: <Yj3S0g9kaykY6S+A@smile.fi.intel.com>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
 <20220325113148.588163-5-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220325113148.588163-5-clement.leger@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 25, 2022 at 12:31:43PM +0100, Clément Léger wrote:
> Add fwnode_property_read_string_index() function which allows to
> retrieve a single string from an array by its index. This function is
> the equivalent of of_property_read_string_index() but for fwnode
> support.

...

> +	ret = fwnode_call_int_op(fwnode, property_read_string_array, propname,
> +				 string, 1, index);
> +	if (ret == -EINVAL && !IS_ERR_OR_NULL(fwnode) &&
> +	    !IS_ERR_OR_NULL(fwnode->secondary))
> +		ret = fwnode_call_int_op(fwnode->secondary,
> +					 property_read_string_array, propname,
> +					 string, 1, index);

This is not fully correct. See [1] for the details.
I hope to send the new version just after the merge window ends.

[1]: https://lore.kernel.org/lkml/20220308123712.18613-1-andriy.shevchenko@linux.intel.com/

-- 
With Best Regards,
Andy Shevchenko


