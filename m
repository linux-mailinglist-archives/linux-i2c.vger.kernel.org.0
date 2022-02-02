Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D67664A7384
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 15:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbiBBOrE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 09:47:04 -0500
Received: from mga07.intel.com ([134.134.136.100]:34451 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231812AbiBBOrE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Feb 2022 09:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643813224; x=1675349224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e9ApRorwSHDr+0KV5qWN6o3xmkRImjO3SBNQu4ZKOSc=;
  b=Y3bkW4bPPlL6FLlOTDrPKfuT/ik8dScclo3w8mwDLIMgLKu/09BEEKWh
   9OGDX0iingbe3PKEpGh9ci6PreJWyDoYDmw1I4r//3jYfDDaPrBx3cAT4
   h9fR+5ISIGzpzeHYh751n0Ct9euftQq/meRxenJTGIRv7e+PHL2NYL7Ej
   t0s2OIWe4t5G1z01ndp/HGkSRvPrBU3ySaqmiQNFnh227bh/tVS/b/nFt
   /PrpifG26ppZQhPM/gy1VD0LpQDQmuzhLDixy8qud+Nb9c26NyHKiRcZ3
   zc/DmFYSJHtCV1V7w+vVBHqrwmcbo+k6YZ/x/mw5MdvooWXKPv7VygAqq
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="311236392"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="311236392"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 06:47:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="676454265"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 06:47:00 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 02 Feb 2022 16:46:58 +0200
Date:   Wed, 2 Feb 2022 16:46:58 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Wolfram Sang <wsa@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ACPI: Replace acpi_bus_get_device()
Message-ID: <YfqZYkVYrz4MEwGV@lahna>
References: <4374434.LvFx2qVVIh@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4374434.LvFx2qVVIh@kreacher>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 01, 2022 at 07:00:42PM +0100, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Replace acpi_bus_get_device() that is going to be dropped with
> acpi_fetch_acpi_dev().
> 
> No intentional functional impact.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
