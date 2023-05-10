Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39A9A6FDA4C
	for <lists+linux-i2c@lfdr.de>; Wed, 10 May 2023 11:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235762AbjEJJCs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 May 2023 05:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236146AbjEJJCo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 May 2023 05:02:44 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2DDEE;
        Wed, 10 May 2023 02:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683709363; x=1715245363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6C2agmSbZSwTDSfdtmIub+xFb/NojGZUrPYyBA6qtkc=;
  b=RxkQX5Yx6JEhID6pYTBW5k2CZVuykJPZZq4vt2v3UYw6+mVa6e4Fate0
   zDmrHTUxj/qu3W9m7EZ3nzlxWyyaA/Ot6/Ga7TbiI5f8n+VCp0nNQypYd
   2xfQq0dpFII9ovkFmXj7k8Iu4Kpd6kwaqOsfXKG4E4PIq5YHac2Mh8vmT
   ctV+p805aCYauLQSuENLI0rCCdVTyZd+OemYVxhpND3PPvgESu6UuoowL
   fOdT913yBK1Mk7JP1R/Zo6U6f0OTv3TGKyF16PrMMY9lGEJklVygZ1ME/
   LoquwwtBnpihrcu74z8SrtHFC2YJmqOQE9RwQ6xKf5CnskZnrj5yus5zR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="330529930"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="330529930"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 02:02:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="1029133060"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="1029133060"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 10 May 2023 02:02:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id D88C623E; Wed, 10 May 2023 12:02:41 +0300 (EEST)
Date:   Wed, 10 May 2023 12:02:41 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     wangyouwan@126.com
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: fix crash with msgs is NULL points
Message-ID: <20230510090241.GO66750@black.fi.intel.com>
References: <20230510084057.17313-1-wangyouwan@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230510084057.17313-1-wangyouwan@126.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 10, 2023 at 04:40:57PM +0800, wangyouwan@126.com wrote:
> From: youwan Wang <wangyouwan@126.com>
> 
> There is some probability that msgs is empty

What probabability 0/100? ;-) Can you point a real case when this can
happen?
