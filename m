Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95D816A07BA
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Feb 2023 12:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbjBWLxZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Feb 2023 06:53:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233389AbjBWLxY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Feb 2023 06:53:24 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962032449E;
        Thu, 23 Feb 2023 03:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677153202; x=1708689202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9UQVMZWr2tJmrTeaqBt8QBAvocH3yVm9kr/ecibUREE=;
  b=l8FPqp7WMYZWbhXdCKmHcwX2JazhHbfJly4xqwXuUtkcy/6SJLNQ+lbe
   BmCWKm30pdsEmmJ0xgNd2IjGae76pOZdnKmazIoavbgAfNerG1JXgut8O
   DYDKB3NygRRmsAxUJUrXJEpTA2yqXwolnsFrQd9YXKyxks2YrmSnzCWnE
   NSZH3PkD4aWxFwVtOjNWmnViUTiNbDgLWDg/Hk2N9JYmXSEsSQlWC3ZFy
   0KxToN/nIYk3NHUP+StT72kod431nwaa8J15eQe5kau6w2/t1HwGRabBa
   8QlqQSac44y2SJE7Xi04w3Kpe1qIaZKEa+4NV8Xl2vthhH9vZ1Ed2Wgvj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="321339616"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="321339616"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 03:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="815303383"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="815303383"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2023 03:53:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pVA9z-00AvWb-2W;
        Thu, 23 Feb 2023 13:53:15 +0200
Date:   Thu, 23 Feb 2023 13:53:15 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Robin van der Gracht <robin@protonic.nl>,
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
Message-ID: <Y/dTqynpTWn86wUy@smile.fi.intel.com>
References: <20230221133307.20287-3-andriy.shevchenko@linux.intel.com>
 <Y/TJs+Arban0ats8@smile.fi.intel.com>
 <be203dfd290e67c8ce74d11c5c9478a4@protonic.nl>
 <Y/UD3HWNy8uKYShC@smile.fi.intel.com>
 <0235f0fed989a8b027db720663699f5d@protonic.nl>
 <Y/ZKdN4nuHcL4DgE@smile.fi.intel.com>
 <Y/ZOyGo8X7r258EC@smile.fi.intel.com>
 <06f29d66-f16a-039c-ecd0-155bdcce00c1@linaro.org>
 <Y/ZoyaV10TCWhloT@smile.fi.intel.com>
 <CAMuHMdXbYapqG1eirbRoxS9akue+URKOV338efMp1c0CbwUEKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXbYapqG1eirbRoxS9akue+URKOV338efMp1c0CbwUEKg@mail.gmail.com>
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

On Thu, Feb 23, 2023 at 10:55:15AM +0100, Geert Uytterhoeven wrote:
> On Wed, Feb 22, 2023 at 8:21 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Feb 22, 2023 at 07:46:25PM +0100, Krzysztof Kozlowski wrote:

...

> > I.o.w. the part after comma in the compatible strings of the I²C devices must
> > be unique globally to make that enumeration disambiguous.
> 
> Which is not unique to this driver?
> I bet you can find other compatible values that become non-unique
> after stripping the manufacturer.

Yes, exactly my point.
So this all schema is error prone. Hence I would not rely on it at all.


-- 
With Best Regards,
Andy Shevchenko


