Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF30E62D508
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Nov 2022 09:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239095AbiKQI3C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Nov 2022 03:29:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239554AbiKQI2t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Nov 2022 03:28:49 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 040721F9F6;
        Thu, 17 Nov 2022 00:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668673727; x=1700209727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/JCCdl2h5+PM9X0mxvGrky+PhMRG4ua+zibm+Re3NT8=;
  b=Wqdjb/4pRTJ5Y2l3yw2aliXEnbBKRIzilFltTaxb3hfz/KxgJmvGLaBK
   CExFWP9X0VBZiFAdcUmyaFWW0dZLygGYMPFK2gbxHWEyU9dNsVVMGoUVX
   tGd8mfUBZZSQAabZVc2q62wP5iky7/5k6cb0tUTPyRNa1t3DXN5dk5QEf
   GrNEjuJDkEcEngiIu4Ks+eye+GX6cLQ9oN3dMTiV2FyN6NQ5scOi1gb7y
   7Lv/MvZImH/l8d4oCaRNg5RdcvIOgFlMn93JeBPHK1cP4o+26hpkbP1MZ
   lWrYkuO9W5uQS27dATKFf2rgKoNhI2MzjS+6bL4m3vUFhTIYu+IyH/ODk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="296156411"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="296156411"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 00:28:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="745439868"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="745439868"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2022 00:28:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ovaGF-00DUo9-1f;
        Thu, 17 Nov 2022 10:28:39 +0200
Date:   Thu, 17 Nov 2022 10:28:39 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
Subject: Re: [PATCH v1 1/2] i2c: loongson: add bus driver for the loongson
 i2c controller
Message-ID: <Y3Xwt2xtAbd8ubkF@smile.fi.intel.com>
References: <20221117075938.23379-1-zhuyinbo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117075938.23379-1-zhuyinbo@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 17, 2022 at 03:59:37PM +0800, Yinbo Zhu wrote:
> This bus driver supports the Loongson i2c hardware controller in the
> Loongson platforms and supports to use DTS and ACPI framework to
> register i2c adapter device resources.
> 
> The Loongson i2c controller supports operating frequencty is 50MHZ
> and supports the maximum transmission rate is 400kbps.

Can you split slave part as a separate change? It will help to review and
to understand the code better in the future by browsing the history.

-- 
With Best Regards,
Andy Shevchenko


