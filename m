Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB5D263AAD1
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 15:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbiK1O1O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 09:27:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232459AbiK1O1K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 09:27:10 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3570205DD;
        Mon, 28 Nov 2022 06:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669645628; x=1701181628;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UuzB6TSRgIW/kb057Em/7FL4ymTEJaEua8wwWL+iiGA=;
  b=cDGkaGcdfWKucyoc/VM/kLVP6RjrKDDEzHH5Ngrsis8U/ViYhWXlpNPZ
   5vEykTovOv24Z9dRmyp9s3Fhc1PbN+FM1VvyMC+MYTial9ZFPSrsfp+9T
   MtEB9nPN93rquhHMHY6/COdpomtWeHfP3m0LaiNAUaZ+Ddzf1Zq6YodQs
   un+Kq7afKm8P1Qafu1rBgT+aiRs/geextL9tAHywbRfU45H8obYG/8hnb
   RmO/KHBJ5o/M58S6stOxHq7SzM4juKPk882vj1RaIn1/OzQQHqONCPtXO
   0RZVb0BxpzPa7ops6f7D9ex2Ov0cNjCyFjx7fShDCtc/lLSK32epvbj3h
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="379102864"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="379102864"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 06:27:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="817840409"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="817840409"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 28 Nov 2022 06:26:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ozf5Y-001B8B-1H;
        Mon, 28 Nov 2022 16:26:28 +0200
Date:   Mon, 28 Nov 2022 16:26:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Yinbo Zhu <zhuyinbo@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jan Dabros <jsd@semihalf.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: loongson: add bus driver for the loongson
 i2c controller
Message-ID: <Y4TFFPWrd7KPAsh+@smile.fi.intel.com>
References: <20221128130025.23184-1-zhuyinbo@loongson.cn>
 <Y4S/dh9lztpOHxkD@smile.fi.intel.com>
 <ee52f463-f54c-70cb-5a31-5748f26f40bc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee52f463-f54c-70cb-5a31-5748f26f40bc@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 28, 2022 at 03:12:54PM +0100, Krzysztof Kozlowski wrote:
> On 28/11/2022 15:02, Andy Shevchenko wrote:
> > On Mon, Nov 28, 2022 at 09:00:24PM +0800, Yinbo Zhu wrote:

...

> > It seems you ignored some of my comments...
> > I stopped here, please check what was given against v1 and try again.
> 
> I propose to wait with wasting more time on reviews because you might do
> the same work twice:
> 
> https://lore.kernel.org/all/822356908305580d601e5b3e424371ed7f220b85.1669359515.git.zhoubinbin@loongson.cn/

I see, thank for the pointer!

-- 
With Best Regards,
Andy Shevchenko


