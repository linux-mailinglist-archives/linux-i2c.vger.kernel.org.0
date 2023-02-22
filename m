Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E71E869FBC5
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Feb 2023 20:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbjBVTLO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Feb 2023 14:11:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbjBVTLN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Feb 2023 14:11:13 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36B938B59;
        Wed, 22 Feb 2023 11:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677093071; x=1708629071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=X4wQ+O3eBVoGDjrrVinp2PRl4OgU1Fc491UedwVGnKs=;
  b=Qo46ycor//CApUGO0xcuccJo0vbrzwW4gvMugdUkZLOCa9uj5s38uQin
   1++FKtO7b4wrxUJLCYCPHINdh8kVnMwOCTXI5pDLhYIkwoHlwMUzwdnJ2
   23LWmO3x3m5qfLwFlydGExHD04raySoHIkyxbwSl3QZ1A2NpqwWMh1PD6
   RhqwGO0DAXEdvz6+JC7E+mP539LqzugJbGPsi/IQcqSJVCypYcFKRk1md
   qj/c5hwPV137ifBASsGfHHbUDpma5WWyyRD/kBmEgIEpEo9/0l36Gsv5p
   NI1OG4i/hbxoayVFQXwU2MrjSRCFXXWbPdMs5BksCOPcMRbDNL/f6Djyr
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="333022472"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="333022472"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 11:11:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="761058560"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="761058560"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2023 11:11:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pUuW9-00AaOx-30;
        Wed, 22 Feb 2023 21:11:05 +0200
Date:   Wed, 22 Feb 2023 21:11:05 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/3] auxdisplay: ht16k33: Make use of
 device_get_match_data()
Message-ID: <Y/ZoyaV10TCWhloT@smile.fi.intel.com>
References: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
 <20230221133307.20287-3-andriy.shevchenko@linux.intel.com>
 <Y/TJs+Arban0ats8@smile.fi.intel.com>
 <be203dfd290e67c8ce74d11c5c9478a4@protonic.nl>
 <Y/UD3HWNy8uKYShC@smile.fi.intel.com>
 <0235f0fed989a8b027db720663699f5d@protonic.nl>
 <Y/ZKdN4nuHcL4DgE@smile.fi.intel.com>
 <Y/ZOyGo8X7r258EC@smile.fi.intel.com>
 <06f29d66-f16a-039c-ecd0-155bdcce00c1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06f29d66-f16a-039c-ecd0-155bdcce00c1@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 22, 2023 at 07:46:25PM +0100, Krzysztof Kozlowski wrote:
> On 22/02/2023 18:20, Andy Shevchenko wrote:
> >>
> >>> Which effectively breaks i.e. user-space instantiation for other display
> >>> types which now do work due to i2c_of_match_device().
> >>> (so my suggestion above is not sufficient).
> >>>
> >>> Are you proposing extending and searching the I2C ID table to work around
> >>> that?
> >>
> >> See (1) above. This is the downside I have noticed after sending this series.
> >> So, the I²C ID table match has to be restored, but the above mentioned issues
> >> with existing table are not gone, hence they need to be addressed in the next
> >> version.
> > 
> > I see now what you mean. So, we have even more issues in this driver:
> > - I²C table is not in sync with all devices supported
> 
> Does anything actually rely on i2c_device_id table? ACPI would match
> either via ACPI or OF tables. All modern ARM systems (e.g. imx6) are
> DT-based. Maybe just drop the I2C ID table?

For I²C it's still possible to enumerate the device via sysfs, which is ABI.

> > - the OF ID table seems has something really badly formed for adafruit
> >   (just a number after a comma)
> 
> Maybe it is a model number? It was documented:
> Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml

Yes, it's not a problem for ACPI/DT platforms, the problem is for the above
way of enumeration, so if we have more than 1 manufacturer that uses plain
numbers for the model, I²C framework may not distinguish which driver to use.

I.o.w. the part after comma in the compatible strings of the I²C devices must
be unique globally to make that enumeration disambiguous.

> > The latter shows how broken it is. The I²C ID table mechanism is used as
> > a backward compatibility to the OF. Unfortunately, user space may not provide
> > the data except in form of DT overlays, so for the legacy enumeration we
> > have only device name, which is a set of 4 digits for adafruit case.
> > 
> > Now imagine if by some reason we will get adafruit2 (you name it) with
> > the same schema. How I²C framework can understand that you meant adafruit
> > and not adafruit2? Or did I miss something?

-- 
With Best Regards,
Andy Shevchenko


