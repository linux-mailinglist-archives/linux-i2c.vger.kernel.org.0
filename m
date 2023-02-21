Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4A969E182
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Feb 2023 14:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbjBUNkR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Feb 2023 08:40:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234111AbjBUNkO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Feb 2023 08:40:14 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC60298E5;
        Tue, 21 Feb 2023 05:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676986810; x=1708522810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Fcsp3vX50fP7S4No3pb7xRBH3g335DQpVHo+94NekhA=;
  b=NqJcoaSrYxkhnv7zG5g3l/rurpbPdgd8bfrvO5JHR5Nf9KCsEXy3e539
   TzH0IzX7RiCC8/82jmC4vnucIT1N3R2/7TcjZ/NiVi+4AFDILG9tyzQqw
   zsMMqGojWW3zq94vmTfDnwftpzQfXDVG6D6d2A58GevS2aAey4/aInJaW
   cl5u062pFO7w6+yklAkYSNgVVEK3cSxUd1QMFrCbrnqXVEI2HrGmvS3+u
   P2LD7zqbaFs+CYk3h/zJwNaBVkaAvKNLZeolNhdU1zb4uyKkGgA42rasx
   KXCbKF4JQRX8v8ZOsSMdqXmmqj4U1KHfnfiCCyn9ONqQFL6dRwa1T45hz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="360103267"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="360103267"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 05:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="671657877"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="671657877"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 21 Feb 2023 05:40:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pUSsG-009yFq-09;
        Tue, 21 Feb 2023 15:40:04 +0200
Date:   Tue, 21 Feb 2023 15:40:03 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 2/3] auxdisplay: ht16k33: Make use of
 device_get_match_data()
Message-ID: <Y/TJs+Arban0ats8@smile.fi.intel.com>
References: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
 <20230221133307.20287-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230221133307.20287-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 21, 2023 at 03:33:06PM +0200, Andy Shevchenko wrote:
> Switching to use device_get_match_data() helps getting of
> i2c_of_match_device() API.

...

> -	id = i2c_of_match_device(dev->driver->of_match_table, client);
> -	if (id)
> -		priv->type = (uintptr_t)id->data;
> +	priv->type = (uintptr_t)device_get_match_data(dev);

Looking closer the I²C ID table should provide DISP_MATRIX to keep default and
this needs to be not dropped.

So, the question is what to do with unknown type then, return -EINVAL from
probe()?

P.S. I would like to collect other comments anyway, so I will send a v2 later.

-- 
With Best Regards,
Andy Shevchenko


