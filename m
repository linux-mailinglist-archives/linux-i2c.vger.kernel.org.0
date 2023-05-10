Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC8236FDAAD
	for <lists+linux-i2c@lfdr.de>; Wed, 10 May 2023 11:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235881AbjEJJY1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 May 2023 05:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236902AbjEJJXz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 May 2023 05:23:55 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF53D76A6;
        Wed, 10 May 2023 02:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683710616; x=1715246616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sa2pMLZS86n9O3EA5nbeZV1SzabxblnSiSLxM+zq2SM=;
  b=YlY4NYDrMt3RJIQi6WU2bZufxufU7lz8DiUWj/dDaGK+KMsLSW8kw0yu
   9fd3ZyT2SfcfcbGYRZAHYBYk243fgqWM7J/+4H2E4V2FSl84K9CTr3AC2
   yvlQezcp4yDwByi9EyNhjmYZMNlPyYms9dHbSwOZ6R9bkPVZrLl/EZwoO
   wkMNP4fvn6OoCsSF3dBnO3z9/IpxU701UQhBrW1jIPn77uB/yf+C/KlYO
   qyI4jfyrR/ORjQnLngHb8PfQXWSq0mZFD7RcG8tgVbgmPCvy8skA/CtLi
   RlNFjECef6fTrDR54MIsaF4cqluLQWMFFE/rXt7tS1DC2Z1Tt7Mk7Y/uq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="330534280"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="330534280"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 02:23:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="823487961"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="823487961"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 10 May 2023 02:23:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 57ACB23E; Wed, 10 May 2023 12:23:44 +0300 (EEST)
Date:   Wed, 10 May 2023 12:23:44 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     wangyouwan <wangyouwan@126.com>
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] i2c: fix crash with msgs is NULL points
Message-ID: <20230510092344.GP66750@black.fi.intel.com>
References: <20230510084057.17313-1-wangyouwan@126.com>
 <20230510090241.GO66750@black.fi.intel.com>
 <1943ca04.6ce1.18804f327f0.Coremail.wangyouwan@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1943ca04.6ce1.18804f327f0.Coremail.wangyouwan@126.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Wed, May 10, 2023 at 05:17:04PM +0800, wangyouwan wrote:
> After waking up from sleep, 100% of the time it occurred. I suspected
> that there was a firmware issue with the machine I was debugging, but
> other machines did not notice it. Therefore, I attempted to make a
> modification here to avoid it

Okay then I suggest to investigate what causes the ->msgs to be NULL and
fix that. When the transfer function is called we expect there to be
something to be sent out so this should not happen.
