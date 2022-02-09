Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900514AF155
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 13:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbiBIMV0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 07:21:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233283AbiBIMVD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 07:21:03 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90653C1038D1;
        Wed,  9 Feb 2022 04:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644408832; x=1675944832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A1nFX9ixfBK5ywl/htqB+PmF4Zj1kCQgA/ekV8GHAh0=;
  b=YLf1PxG7d4rVQe8B/m/4R4gTLn01lePHI+ia8SkJjWOu+2Hjp4Z27bWu
   l2Kco0RnzVmVTLBdSlkcwxbQwUDAPOaAHOehm6QbHC+o7LnWW7JKT7t2H
   FUgA4+qCMjSSABT89ZQRvX2q1+6PxP3ERr1h1Us1rHqxuyZQHpVP/hfq5
   mg/M9CBxQtX7RgNaj16CZXVLBqpR2v1Rj9oiPdrtIyp0z1x+9PdvSEwXn
   qrx2two+3+X4Nq4zLOsqtP5DxIDnToazIwan5j1xA3E5fQCcelF4oVub2
   P2j+dx5ZMNliqESiwbtIExmb4ywmuFJmNDdnyNdnVSqQ51boonuVoXPAO
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="273726044"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="273726044"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 04:13:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; 
   d="scan'208";a="633198612"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 04:13:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nHlq6-002baF-Cw;
        Wed, 09 Feb 2022 14:12:50 +0200
Date:   Wed, 9 Feb 2022 14:12:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@huawei.com>
Cc:     Yicong Yang <yangyicong@hisilicon.com>,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, prime.zeng@hisilicon.com,
        linuxarm@huawei.com, irina.tirdea@intel.com,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: hisi: Add generic GPIO bus recovery support
Message-ID: <YgOvwg4pEiVF99fu@smile.fi.intel.com>
References: <20220125124930.50369-1-yangyicong@hisilicon.com>
 <20220125124930.50369-2-yangyicong@hisilicon.com>
 <YgD/3Xi0yLPHCu+L@smile.fi.intel.com>
 <YgEAeOmobDhqRMGx@smile.fi.intel.com>
 <5de8e304-05b7-48ec-6b8f-e1f856e86697@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5de8e304-05b7-48ec-6b8f-e1f856e86697@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 08, 2022 at 10:15:44AM +0800, Yicong Yang wrote:
> On 2022/2/7 19:20, Andy Shevchenko wrote:
> > On Mon, Feb 07, 2022 at 01:17:49PM +0200, Andy Shevchenko wrote:
> >> On Tue, Jan 25, 2022 at 08:49:29PM +0800, Yicong Yang wrote:
> >>> Add generic GPIO bus recovery support for i2c-hisi driver
> >>> by registering the recovery information with core provided
> >>> i2c_generic_scl_recovery() method.
> >>>
> >>> As the SCL/SDA pins are multiplexed with GPIO, we need to
> >>> switch the pins mux to GPIO before recovery and switch back
> >>> after recovery. It's implemented by the ACPI method in
> >>> the i2c_bus_recovery_info->{prepare,unprepare}_recovery()
> >>> method.
> >>
> >> NAK.
> >>
> >> ACPI has its own resources for that. What is missed is the layer between ACPI
> >> and pin control.
> 
> I think that's where the problem is and why we use this approach. When I looked into
> devm_pinctrl_get(), it stops when fails to retrieve the pin info from device tree.
> So I cannot use it on our ACPI server for the pinmux.
> 
> I looked into the history that Irina raised an RFC for adding the ACPI support in pinctrl[1],
> but at that time seems it lacks some standard support. But maybe now we can support it?

Not that way. ACPI has its own resources as I pointed out. Irina tried to
mimic DT, which has been refused by maintainers. Since that ACPI gained
the native resources.

> But based on the current situation maybe the implementation of this patch suits best.
> And currently we don't have a pinctrl driver for doing the multiplexing (though I think it's
> easy to add one but maybe only configures 2 pins for now).

This patch (i2c hisi) is a hack on all levels, starting with ACPI DSDT.
Please, fix tables to use PinConfig() / PinFunction() (or corresponding
*Group() variants) in the DSDT for the starter.

> [1] https://lore.kernel.org/all/CACRpkdbj==q5wp2Z5-ZXkbfeXa4y+beLF_3YN-vS3CtyAKGwkg@mail.gmail.com/
> 
> Thanks,
> Yicong
> 
> > To be more precise,
> > 
> > https://uefi.org/specs/ACPI/6.4/19_ASL_Reference/ACPI_Source_Language_Reference.html?highlight=pinfunction#pinconfig-pin-configuration-descriptor-macro
> > 
> > https://uefi.org/specs/ACPI/6.4/19_ASL_Reference/ACPI_Source_Language_Reference.html?highlight=pinfunction#pinfunction-pin-function-descriptor-macro
> > 
> > https://uefi.org/specs/ACPI/6.4/19_ASL_Reference/ACPI_Source_Language_Reference.html?highlight=pinfunction#pingroup-pin-group-descriptor-macro
> > 
> > https://uefi.org/specs/ACPI/6.4/19_ASL_Reference/ACPI_Source_Language_Reference.html?highlight=pinfunction#pingroupconfig-pin-group-configuration-descriptor-macro

-- 
With Best Regards,
Andy Shevchenko


