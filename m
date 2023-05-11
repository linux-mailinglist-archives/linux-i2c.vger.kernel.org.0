Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59D376FEDD8
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 10:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbjEKI2z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 04:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjEKI2y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 04:28:54 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D1A4EF7
        for <linux-i2c@vger.kernel.org>; Thu, 11 May 2023 01:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683793733; x=1715329733;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UfErCu/he2nSiZC/d+l2LFrnr8PZqDi2MuAofxFVoYc=;
  b=aXDgaI9bvoXo2HP8C1TYe1x5UWQv1nUQ4kBamh2iyrZl2/lO9kymjd7z
   o+May1mxgwTOTu871JmYSbRgJnbNyXMVwz+4Y/FyV1C+p1U3Urf8UscLs
   cMy52ZXM8nGZDLPy+LqAhiwUrJQBZJx4QyZUHJtcsPAtabkl4xo5riuaP
   fk3nu3Md4h6yD75zZj1yn/PQUw0FTD+Kzb1++uoN7nREJGZcaGhJtHvtQ
   uyL+1DIEGbEUOGgHmgb6H1+3teUY4B1uqnzBo+vZP5uHTnQlzJblY/Gdf
   RthB2uEeK5A0GnGpCMCZMf7oaMlgSSjgNCRJxpiP0xksqh/gntG7j1mkc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="334916367"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="334916367"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 01:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="946047238"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="946047238"
Received: from mylly.fi.intel.com (HELO [10.237.72.143]) ([10.237.72.143])
  by fmsmga006.fm.intel.com with ESMTP; 11 May 2023 01:28:50 -0700
Message-ID: <520c349e-c178-8424-d704-3ef9463bf0fe@linux.intel.com>
Date:   Thu, 11 May 2023 11:28:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 18/89] i2c: designware-platdrv: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-19-u.kleine-koenig@pengutronix.de>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230508205306.1474415-19-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/8/23 23:51, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
