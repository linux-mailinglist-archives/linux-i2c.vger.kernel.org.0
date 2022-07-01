Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25A035632E9
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Jul 2022 13:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235360AbiGALv1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Jul 2022 07:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiGALv0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 07:51:26 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9978C7B357;
        Fri,  1 Jul 2022 04:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656676285; x=1688212285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v6Eq39sB20EiGC0wrMRgHxbWYwWP29XyaO6nAPbLTOY=;
  b=KXzrQHNPFTW6gR4P+2k2IwTkw3Z1c4jSCwHrTJAWqVQswlFm0lzt1PNF
   EqAnRXEA4VdAokmWBB7qPeoWG5oDHPK043juuF6v01Into7fPH8wLr/Yy
   vRLYJzHEzQkuy6RM3af/fus4C+7URTrgr8v0Vs5E2t2Y/QjQ5rjUUYMX8
   dZICFRtqac96GrCbUn3khqDi1oJnoWplc4lCFU/r9StElq3EYQqWIhJLN
   cYxHqndlhlKii0H+6fDu07fhJfOmnjDiFwhqVzHEgu88SY7iupnay5OlA
   yg6VXpZh/THz7JMoPgF/HafTnSNOjLyErvzq+MmQHoSzDAsAvfUqhZYob
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="280185299"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; 
   d="scan'208";a="280185299"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2022 04:51:25 -0700
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; 
   d="scan'208";a="618384895"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2022 04:51:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o7FBB-000zKC-Hu;
        Fri, 01 Jul 2022 14:51:21 +0300
Date:   Fri, 1 Jul 2022 14:51:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v1 1/1] i2c: scmi: Replace open coded acpi_match_device()
Message-ID: <Yr7fuWADLhJSeYdZ@smile.fi.intel.com>
References: <20220630195541.4368-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630195541.4368-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 30, 2022 at 10:55:41PM +0300, Andy Shevchenko wrote:
> Replace open coded acpi_match_device() in acpi_smbus_cmi_add().

Discard this, a last minute change that makes it not buildable.

-- 
With Best Regards,
Andy Shevchenko


