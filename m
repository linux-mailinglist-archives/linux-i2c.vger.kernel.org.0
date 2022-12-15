Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD0D64D988
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Dec 2022 11:28:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiLOK2C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Dec 2022 05:28:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiLOK17 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Dec 2022 05:27:59 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 989ED2B60B;
        Thu, 15 Dec 2022 02:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671100078; x=1702636078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qi28k1GX3tjuQZRSTlv4FNTYPFHyVrbTkUewvlsuX54=;
  b=eh9+fbEOcH5btExXNX80Lz2qCdyazVIoyp37DBfR2P59aYefMVYJnAwE
   KipGP8ZPvVYmKf8ntKfjKuRZN+M0s0ELThQG8UhFECMof5iSNcoToA4cd
   kkVk+xAz1qv1pQ46DNaVO+zxm3/r581YwgPRXeB78WITnq4zcA6NQYbSF
   ZjasCXDOtOrbSynqla0SxCsdkdOauyllpqpOQAy/4ux10FxamZor7gXdF
   K20rXsx9Bj+FC5EtjOf8jL6RnUqtgYym0TfsvBjYjFIpDd+QDxSENLYcp
   dh7Pl+faIhpJJI2VnP8eM6/ZvPa6UyEBaoiT503h7+Pb3OqsoEqW6djjN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="404911291"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="404911291"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 02:27:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="791582131"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="791582131"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2022 02:27:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p5lSw-00AHVn-0U;
        Thu, 15 Dec 2022 12:27:50 +0200
Date:   Thu, 15 Dec 2022 12:27:49 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Hawa, Hanna" <hhhawa@amazon.com>, Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH v2 1/1] i2c: designware: set pinctrl recovery information
 from device pinctrl
Message-ID: <Y5r2pZhe17dVBMme@smile.fi.intel.com>
References: <20221214142725.23881-1-hhhawa@amazon.com>
 <Y5n1U1lYbcbJ5U1k@smile.fi.intel.com>
 <efa9171f-98ac-f518-e59e-f6c4d7d3d4e6@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efa9171f-98ac-f518-e59e-f6c4d7d3d4e6@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 15, 2022 at 10:15:35AM +0200, Hawa, Hanna wrote:
> On 12/14/2022 6:09 PM, Andy Shevchenko wrote:

...

> > > +     if (dev->dev->pins && dev->dev->pins->p)
> > > +             rinfo->pinctrl = dev->dev->pins->p;
> > Hmm... I don't see how this field is being used.
> > Can you elaborate?
> 
> This field is used in i2c_generic_scl_recovery(), if it's not NULL then the
> flow will set the state to GPIO before running the recovery mechanism.
>         if (bri->pinctrl)
>                 pinctrl_select_state(bri->pinctrl, bri->pins_gpio);

OK, but why that function doesn't use the dev->pins->p if it's defined?
(As a fallback when rinfo->pinctrl is NULL.)

Wolfram?

Hanna, it seems you missed I²C maintainer to Cc...

...

> I saw that that the change failed in complication for SPARC architecture, as
> the pins field is wraparound with CONFIG_PINCTRL in device struct. I though
> on two options to solve the compilation error, first by adding wraparound of
> CONFIG_PINCTRL when accessing the pins field. And the second option is to
> add get function in pinctrl/devinfo.h file, which return the pins field, or
> NULL in case the PINCTRL is not defined. Which option you think we can go
> with?

Getter with a stub sounds better to me, so you won't access some device core
fields.

Linus, what do you think about all these (including previous paragraph)?

-- 
With Best Regards,
Andy Shevchenko


