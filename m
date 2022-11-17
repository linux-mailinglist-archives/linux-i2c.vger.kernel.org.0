Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D453D62D563
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Nov 2022 09:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234663AbiKQIrT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Nov 2022 03:47:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiKQIrS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Nov 2022 03:47:18 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D5EC03;
        Thu, 17 Nov 2022 00:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668674837; x=1700210837;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=6KcOzwaOfZlcBiEgPlkMskn+edpOXlDZLDpkAd0fjXc=;
  b=jzToVI4f2obVUayC0aujcHnqG/rt5vJavfaAul9tf30fUNNTKbSiXCCp
   JMtlkdTDGMWUkIT2mxTtGIIAo9O1qaEovY82IHM1y5KU+it09byjYJd7J
   RZADYYJQoIsnRYYXR9TV3VZRn7oToFdybUbfUwVFAbwdTuK9xZMOmLeHe
   32X1CZ/wsR0tkrP2dpNK9lupO+vNr0EVjjn+tPnIdDVdt04UNypyeEx19
   L8zZ4PbENfizOiXx7dh2vadzUqoUCca2Gv9abn1F+FaDhlOB5o0cy4Klp
   dPz9xnsU7QOdtsjjkrdYxcwfJ+c9BxIndqn8UIAIWXB6N5S2st+vZIPDv
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="292502752"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="292502752"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 00:47:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="703245803"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="703245803"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 17 Nov 2022 00:47:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ovaYA-00DV7I-2Q;
        Thu, 17 Nov 2022 10:47:10 +0200
Date:   Thu, 17 Nov 2022 10:47:10 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
Subject: Re: [PATCH v1 1/2] i2c: loongson: add bus driver for the loongson
 i2c controller
Message-ID: <Y3X1Dppjg/yGgLSS@smile.fi.intel.com>
References: <20221117075938.23379-1-zhuyinbo@loongson.cn>
 <Y3Xwt2xtAbd8ubkF@smile.fi.intel.com>
 <Y3XyU70QJruJUsI0@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3XyU70QJruJUsI0@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 17, 2022 at 09:35:31AM +0100, Wolfram Sang wrote:
> 
> > Can you split slave part as a separate change? It will help to review and
> > to understand the code better in the future by browsing the history.
> 
> Thanks for all your reviewing help, Andy! Regarding this comment, I
> don't think a split is needed. The driver is small enough with ~500
> lines, so I think it can stay this way. It would be different if the
> driver was 1000+ lines, then I'd totally agree. I will have a look at
> this driver soon.

Depends on the ratio "Comments per LoC" by the certain reviewer.

My experience with the other drivers for this architecture / platform that they
all need much more work before accepting them. And to reduce burden split would
be good.

But then it's up to you (to me it's a burden for even these 500 LoCs,
that are full of room to improvement).

-- 
With Best Regards,
Andy Shevchenko


