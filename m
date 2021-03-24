Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4193476C6
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 12:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbhCXLGZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 07:06:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:46277 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230318AbhCXLGP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Mar 2021 07:06:15 -0400
IronPort-SDR: 8O4DmIOtRYR66qFzA1eN4C/5oTRAnlxzPv73UyZqdy+YZvZslHKyLm0vIEbTwYliAovMgRy1vb
 B55j8FNyus9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="178237462"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="178237462"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 04:06:14 -0700
IronPort-SDR: X5cTuCP8F8OdrSHhGFRehusBqOSRST4zmDHcUB4uPCwik2iVY7Z5qu097LmLJvt+zQLNAbOvRe
 bs9Y9u3xq3JQ==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="525204313"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 04:06:11 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lP1Ky-00FeHZ-SA; Wed, 24 Mar 2021 13:06:08 +0200
Date:   Wed, 24 Mar 2021 13:06:08 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, wsa@kernel.org,
        linux-i2c@vger.kernel.org, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        prime.zeng@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH v3 1/3] i2c: core: add managed function for adding i2c
 adapters
Message-ID: <YFsdIN6kuIo7sxMm@smile.fi.intel.com>
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-2-git-send-email-yangyicong@hisilicon.com>
 <c306cfc0-8574-9903-af4e-f27b99888d03@gmail.com>
 <23efcf01-5d04-242e-8574-bb9a5ef5face@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23efcf01-5d04-242e-8574-bb9a5ef5face@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 24, 2021 at 04:29:26PM +0800, Yicong Yang wrote:
> On 2021/3/23 0:45, Dmitry Osipenko wrote:
> > 22.03.2021 14:10, Yicong Yang пишет:

...

> >> +EXPORT_SYMBOL(devm_i2c_add_adapter);
> > 
> > EXPORT_SYMBOL_GPL
> 
> considering i2c_add_adapter exported with no GPL, i think the variant should
> keep the same.

Nope. You should follow other devm_*() APIs. Hint: they are using struct device
which is GPL.

Please, fix.

-- 
With Best Regards,
Andy Shevchenko


