Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2711E229725
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 13:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726153AbgGVLHQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 07:07:16 -0400
Received: from mga11.intel.com ([192.55.52.93]:56044 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbgGVLHQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 07:07:16 -0400
IronPort-SDR: isgXIEVo9whT9d2IzSQE7ZVA32XXAMQPf2m4toZdeyXUrStHs72k4AjbCkh5jlhDEgGcNrAvD5
 /Gf0kqE8ySwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="148241192"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; 
   d="scan'208";a="148241192"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2020 04:07:13 -0700
IronPort-SDR: s+Ji13/ZuR5HcMwMZftRZZSKUuLxfL/rVjaU/LHRZ21UChLMi8eHN1VmkJNNj8zXdkageINVO9
 I6jn2Y0qYFYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; 
   d="scan'208";a="326661799"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jul 2020 04:07:11 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jyCad-003FBy-8T; Wed, 22 Jul 2020 14:07:11 +0300
Date:   Wed, 22 Jul 2020 14:07:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Robert Richter <rrichter@marvell.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] add PEC support on slave side
Message-ID: <20200722110711.GY3703480@smile.fi.intel.com>
References: <20200717090155.10383-1-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717090155.10383-1-rayagonda.kokatanur@broadcom.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 17, 2020 at 02:31:53PM +0530, Rayagonda Kokatanur wrote:
> This patch set adds support for PEC on Slave side.

LGTM! FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Changes from v1:
>  -Address review comments from Andy Shevchenko
>   Update commit message,
>   Rewrite bcm_iproc_smbus_check_slave_pec() to remove local
>   variable ret and type casting,
>   Use positive condition.
> 
> Rayagonda Kokatanur (2):
>   i2c: add PEC error event
>   i2c: iproc: add slave pec support
> 
>  drivers/i2c/busses/i2c-bcm-iproc.c | 49 +++++++++++++++++++++++++++---
>  include/linux/i2c.h                |  1 +
>  2 files changed, 46 insertions(+), 4 deletions(-)
> 
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


