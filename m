Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 048C04E7538
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 15:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346297AbiCYOkv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 10:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240425AbiCYOku (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 10:40:50 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D33197284;
        Fri, 25 Mar 2022 07:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648219156; x=1679755156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tGQr/XMGpfYl5XaqM3UKSbUCHx+0u+K3rYHZ2t5R3DI=;
  b=evd/wI+SK65lFqBE/Yh8z4VrwSl7AT6BT7A2AIDpVCq36clmesmTdLM/
   20wIADQUmRGE03YxJClcaP08ica/YsAR1nfy2uoDNeZQ+zUh7hzZXbLdq
   XN44LK35VTLdOpUT9MTAXY57yCoonr+szin4Y49H6fMAgRLncatFn6wsO
   cOa2br72kT3bgUE1uFrYwCRuJzXgCdCXxy9FwTmDHa14/F7S0/bGVpY4X
   PFWk89UlogebOo0V17zjLpLgumzfi6SKs/DmgQrwZQiXuPIb7DD47IG04
   bqjGVb+366+SKMMHIj2MthPzdktQLXEGVQMmYOQzyR5q+1eS4Ix8eK7Qy
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="240800603"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="240800603"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 07:39:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="650256948"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 07:39:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nXl5F-006RgT-8c;
        Fri, 25 Mar 2022 16:38:33 +0200
Date:   Fri, 25 Mar 2022 16:38:32 +0200
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
Subject: Re: [PATCH v3 8/9] i2c: mux: pinctrl: remove CONFIG_OF dependency
 and use fwnode API
Message-ID: <Yj3T6Is9kJYLrPiC@smile.fi.intel.com>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
 <20220325113148.588163-9-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220325113148.588163-9-clement.leger@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 25, 2022 at 12:31:47PM +0100, Clément Léger wrote:
> In order to use i2c muxes with all types of nodes, switch to fwnode
> API. The fwnode layer will allow to use this with both device_node and
> software_node.
> 
> This commits is simply replacing the use of "of_" prefixed functions
> with there fwnode equivalent.

What I meant by splitting to the patches is to be able to have first patch of
a such split to be independent of this series. And I believe one or two (if
you split to more logical pieces) may be done this way, means we have already
available APIs.

-- 
With Best Regards,
Andy Shevchenko


