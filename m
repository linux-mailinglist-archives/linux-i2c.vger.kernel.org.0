Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4407B30AEF2
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 19:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhBASSJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Feb 2021 13:18:09 -0500
Received: from mga04.intel.com ([192.55.52.120]:64944 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232201AbhBASRr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Feb 2021 13:17:47 -0500
IronPort-SDR: eRVRMB4c5v0PG2l99V/SKVgnrUXKpjLhfVrJfOaUNsIebXjs8W/9RUn/N/S1Xv3oFeGGtGs8NS
 Q7ud3/OauHxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="178166577"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="178166577"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 10:16:11 -0800
IronPort-SDR: 7ZTkZfhuXzF7tmOMmHnDrQnEHTXexXTrhVR8ghgtlvHHzTOhV1hOCID+pwkTOLSQBsCSzb5Y6H
 NuHbPBIMip5g==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="370025800"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 10:16:09 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l6dk6-001CGd-CH; Mon, 01 Feb 2021 20:16:06 +0200
Date:   Mon, 1 Feb 2021 20:16:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Richard Neumann <mail@richard-neumann.de>
Cc:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] i2c: i2c-amd-mp2: Remove NIH logging functions
Message-ID: <YBhFZikbVgyaFqNs@smile.fi.intel.com>
References: <20210201175138.8986-1-mail@richard-neumann.de>
 <20210201175138.8986-2-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201175138.8986-2-mail@richard-neumann.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 01, 2021 at 06:51:37PM +0100, Richard Neumann wrote:
> Use pci_{info,warn,err,dbg} functions of the kernel's PCI API.
> Remove unnecessary ndev_pdev(), ndev_name() and ndev_dev() macros.
> While at it, remove useless __func__ from logging.
> 
> Signed-off-by: Richard Neumann <mail@richard-neumann.de>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I haven't given you the tag for this patch, but this time it's okay,
no need to resend.

-- 
With Best Regards,
Andy Shevchenko


