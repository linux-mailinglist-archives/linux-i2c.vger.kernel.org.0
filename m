Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5103DF32E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Aug 2021 18:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237401AbhHCQuq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Aug 2021 12:50:46 -0400
Received: from mga07.intel.com ([134.134.136.100]:16468 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237397AbhHCQul (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Aug 2021 12:50:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="277495954"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; 
   d="scan'208";a="277495954"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2021 09:50:29 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; 
   d="scan'208";a="419110879"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2021 09:50:26 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 03 Aug 2021 19:50:23 +0300
Date:   Tue, 3 Aug 2021 19:50:23 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH 1/4] i2c: acpi: Add an i2c_acpi_client_count() helper
 function
Message-ID: <YQlzzy933V9XMHqt@lahna>
References: <20210803160044.158802-1-hdegoede@redhat.com>
 <20210803160044.158802-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803160044.158802-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 03, 2021 at 06:00:41PM +0200, Hans de Goede wrote:
> We have 3 files now which have the need to count the number of
> I2cSerialBus resources in an ACPI-device's resource-list.
> 
> Currently all implement their own helper function for this,
> add a generic helper function to replace the 3 implementations.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
