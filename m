Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A50E60D189
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 18:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbiJYQWA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 12:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbiJYQV6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 12:21:58 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4513780EA5;
        Tue, 25 Oct 2022 09:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666714917; x=1698250917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JIY/0KwS4tqdqoinWPwzk3zy7GThTftpHV5/elSMquw=;
  b=Bn08f7uxVp4J8F+sc0CO4Uppw6gp1HkYW6f6L/Bl52+17aZXfCyaJPwR
   a9nTfA9jNoMDH8XdIM7kiS/edrvxDXaGEv1O0YpZWGS4NpOXC+cYKPtxM
   +tSmaxDq2zcZi7s9oaQVurddRI4HgYQPNq8PlIn8Gd5ohcInI7k8UzkPL
   e011CTtyR4bumPcSQEH2OxEbOngs86yWh6EUcsjl3HtcMtK6M56JM+8x4
   hpp0qFk0KFeSneNWDYhEVgr+eQRvDCKvXKIbO2JgSOEnGFx2BOEZJd5uR
   DEkgYKvd2RazvqAHESPQ5Qg6S3oHnsJ5afVpap7ymsLWlIBkDAsH6wIU0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="371937328"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="371937328"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 09:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="609628147"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="609628147"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 25 Oct 2022 09:21:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onMgI-00267N-32;
        Tue, 25 Oct 2022 19:21:34 +0300
Date:   Tue, 25 Oct 2022 19:21:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drivers: fwnode: fix fwnode_irq_get_byname()
Message-ID: <Y1gNDtE4dRC4WuP/@smile.fi.intel.com>
References: <cover.1666710197.git.mazziesaccount@gmail.com>
 <a3bf7094a9f9ebf114736dc7944553dcc701fe73.1666710197.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3bf7094a9f9ebf114736dc7944553dcc701fe73.1666710197.git.mazziesaccount@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 25, 2022 at 06:11:49PM +0300, Matti Vaittinen wrote:
> The fwnode_irq_get_byname() does return 0 upon device-tree IRQ mapping
> failure. This is contradicting the function documentation and can
> potentially be a source of errors like:
> 
> int probe(...) {
> 	...
> 
> 	irq = fwnode_irq_get_byname();
> 	if (irq <= 0)
> 		return irq;
> 
> 	...
> }
> 
> Here we do correctly check the return value from fwnode_irq_get_byname()
> but the driver probe will now return success. (There was already one
> such user in-tree).
> 
> Change the fwnode_irq_get_byname() to work as documented and according to
> the common convention and abd always return a negative errno upon failure.

and abd ?

...

> +	ret = fwnode_irq_get(fwnode, index);
> +	/* We treat mapping errors as invalid case */
> +	if (ret == 0)
> +		return -EINVAL;
> +
> +	return ret;

This looks good.

-- 
With Best Regards,
Andy Shevchenko


