Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A846650984
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 10:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbiLSJtC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 04:49:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiLSJtC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 04:49:02 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CACA198;
        Mon, 19 Dec 2022 01:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671443341; x=1702979341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tgB/eer+Nn8UbItkoP+8n6tFDvBmvw2POlYQ41/VwAc=;
  b=SPqQaMoo2xMlIlH8npgQlyZdjQ4IeGIe4kaSeOTuLzFqbjNNG5csTSpL
   hF3PiXuvdIYfvSF55h+KnahCpsIz7E+2hCBKfTC+/5wsmiVrr2gCRJTE7
   hNAD2gANyT0u28QPHw6zub78LS5QTgWEbq3QKEhnCfUr3VDxEDLHwRxga
   4Uyz2bGuF2ARvXinq7vLqshpmaKaarn18JqV85HLPCtG2T4lSwoin4HCO
   m/AgVWO+CXkk3xeoHzKZdxO7OpaEAOY7bOpzz0v0ddjnz+eDhjmgEcdQY
   DBm7ggmqKUbFRZWSg+8Bfa8f3n1sHYcIBADiImgZ0OgxhCi4KZ/mjO5Ac
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="298986885"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="298986885"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 01:49:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="681165056"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="681165056"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 19 Dec 2022 01:48:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p7ClP-00CE3g-1S;
        Mon, 19 Dec 2022 11:48:51 +0200
Date:   Mon, 19 Dec 2022 11:48:51 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v5 1/8] i2c: core: let adapters be notified of client
 attach/detach
Message-ID: <Y6Azg9GJ/ntUlS+P@smile.fi.intel.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-2-tomi.valkeinen@ideasonboard.com>
 <Y5YLi2md2571NQrY@pendragon.ideasonboard.com>
 <20221219095143.4b49b447@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219095143.4b49b447@booty>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 19, 2022 at 09:51:43AM +0100, Luca Ceresoli wrote:
> On Sun, 11 Dec 2022 18:55:39 +0200
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > On Thu, Dec 08, 2022 at 12:39:59PM +0200, Tomi Valkeinen wrote:

...

> > This may be a stupid question, but couldn't you instead use the
> > BUS_NOTIFY_ADD_DEVICE and BUS_NOTIFY_DEL_DEVICE bus notifiers ?
> 
> I'm not sure they would be the correct tool for this task. Bus
> notifiers inform about new events on the 'struct bus_type, i.e. any
> event on the global i2c bus type. In the i2c world this means being
> notified about new _adapters_, which is exactly what
> drivers/i2c/i2c-dev.c does.
> 
> Here, however, we need to be informed about new _clients_ being added
> under a specific adapter.

This is for example exactly what ACPI integration in I2C framework does. But...

> I'm not sure whether the bus notifiers can
> inform about new clients in addition of new adapters, but they at least
> seem unable to provide per-adapter notification.

...personally I don't like notifiers, they looks like overkill for this task.

> Does that seem correct?

-- 
With Best Regards,
Andy Shevchenko


