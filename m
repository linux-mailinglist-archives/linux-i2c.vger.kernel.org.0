Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD8ED75F489
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 13:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbjGXLIx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 07:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbjGXLIw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 07:08:52 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE2ED1999;
        Mon, 24 Jul 2023 04:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690196908; x=1721732908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+1j8E6OR+tTRC7B3HEG2kv2mifO+1v0elbswuTwovg0=;
  b=DHmHFFpPQ9eL3u/pfxAOBfcXMIbSXToCALcNmF8N0/06mBRyIVszk2ZE
   F8pfgOJFblVIjcLjLyZYe3Yvp5SXrzs+dn897qUY16q434FR2X+8o1z8i
   J4M0MXHAz3Oqc5G+Dw6ZMj/dtRPlLh+5ZPEvNUU1fdZ1NxPeg/dsF+lZY
   og08bVJhz/tM5g+ivDR4qt5Vwh2FBSoWuczSyotSiPXO6bEoyGHqYB6rR
   AeCso9rv+NYyvgbnbLx27kxsBm56PbiPGTHKjw8pYfOnDOzq4lP0CCcIw
   R18+ceWoJSwUUYpMpGW9wYh1LY6EbuwNBmwhbWl8OcyjN7a459lJpP15g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="398314299"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="398314299"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 04:06:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="790915230"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="790915230"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jul 2023 04:06:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qNtOB-009umI-1F;
        Mon, 24 Jul 2023 14:06:07 +0300
Date:   Mon, 24 Jul 2023 14:06:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend device_get_match_data()
 to struct bus_type
Message-ID: <ZL5bH10uJWDe2SPY@smile.fi.intel.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230723083721.35384-2-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jul 23, 2023 at 09:37:20AM +0100, Biju Das wrote:

Thank you for your contribution!
My comments below.

> Extend device_get_match_data() to buses (for eg: I2C) by adding a
> callback device_get_match_data() to struct bus_type() and call this method
> as a fallback for generic fwnode based device_get_match_data().

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

You can't just throw one's SoB tag without clear understanding what's going on
here (either wrong authorship or missing Co-developed-by or...?).

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

...

>  const void *device_get_match_data(const struct device *dev)
>  {
> -	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
> +	const void *data;
> +
> +	data = fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
> +	if (!data && dev->bus && dev->bus->get_match_data)
> +		data = dev->bus->get_match_data(dev);
> +
> +	return data;

Much better looking is

	data = fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
	if (data)
		return data;

	if (dev->bus && dev->bus->get_match_data)
		return dev->bus->get_match_data(dev);

	return NULL;

>  }

-- 
With Best Regards,
Andy Shevchenko


