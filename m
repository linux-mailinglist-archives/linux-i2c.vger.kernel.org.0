Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540CE481BEA
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 13:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhL3MEG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 07:04:06 -0500
Received: from mga05.intel.com ([192.55.52.43]:30674 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229463AbhL3MEG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 30 Dec 2021 07:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640865846; x=1672401846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZLoHuM4dXn79jCK53xCIAkvKyvkG0LYKUHR2ZiCAZHk=;
  b=Tf9/KQU/KHPXhSVJmF7exibHWM1gobOnL8ajEqjjQM6wMDQcb55wj7j4
   Oaf0pZX+JxgmkhZnho9qa7MEYM7uwo33rFz1mUt9q/NFbT+OKp34QDRLt
   tjIelRkVLUv/t/vgZzq2/Zs/VyvZ3+LNwMhJApYicPbVqoW5lib/kWyeR
   uiq8xP9zODqxCd2R5/6yeDuNNyLxj6NlUB8PHsBA3Zcw+vU8ikg28+AUs
   O3+IY9XO4WAzkvjMdOtEmBwfSyU87fcX1yBEUWDtMDdGTEhkkQjsJg8Td
   uFw3OIeriFZfz0XOxbZmMnjYSvZEyYz9pS3zocDs4WacfliiSUEQPvy8t
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10212"; a="327992703"
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600"; 
   d="scan'208";a="327992703"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2021 04:04:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600"; 
   d="scan'208";a="554787292"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2021 04:04:01 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 30 Dec 2021 14:03:59 +0200
Date:   Thu, 30 Dec 2021 14:03:59 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-i2c@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH 02/12] i2c: acpi: Do not instantiate I2C-clients on
 boards with known bogus DSDT entries
Message-ID: <Yc2gL6aLJ0lfrUXv@lahna>
References: <20211229231431.437982-1-hdegoede@redhat.com>
 <20211229231431.437982-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211229231431.437982-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 30, 2021 at 12:14:21AM +0100, Hans de Goede wrote:
> x86 ACPI devices which ship with only Android as their factory image
> usually declare a whole bunch of bogus I2C devices in their ACPI tables.
> 
> Instantiating I2C clients for these bogus devices causes various issues,
> e.g. GPIO/IRQ resource conflicts because sometimes drivers do bind to them.
> The Android x86 kernel fork shipped on these devices has some special code
> to remove these bogus devices, instead of just fixing the DSDT <sigh>.
> 
> Use the new acpi_quirk_skip_i2c_client_enumeration() helper to
> identify known boards with this issue, and on these boards ignore I2C
> devices described in ACPI, with a few exceptions which are known to
> always be correct (and in case of the audio-codecs where the drivers
> heavily rely on the codec being enumerated through ACPI).
> 
> Note these boards typically do actually have I2C devices, just
> different ones then the ones described in their DSDT. The devices
> which are actually present are manually instantiated by the
> drivers/platform/x86/x86-android-tablets.c kernel module.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
