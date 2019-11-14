Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92072FC0DC
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2019 08:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbfKNHhM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Nov 2019 02:37:12 -0500
Received: from mga12.intel.com ([192.55.52.136]:62695 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbfKNHhL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Nov 2019 02:37:11 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Nov 2019 23:37:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; 
   d="scan'208";a="214485166"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 13 Nov 2019 23:37:07 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 14 Nov 2019 09:37:06 +0200
Date:   Thu, 14 Nov 2019 09:37:06 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, youling 257 <youling257@gmail.com>
Subject: Re: [PATCH v2] i2c: acpi: Force bus speed to 400KHz if a Silead
 touchscreen is present
Message-ID: <20191114073706.GG34425@lahna.fi.intel.com>
References: <20191113182938.279299-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113182938.279299-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 13, 2019 at 07:29:38PM +0100, Hans de Goede wrote:
> Many cheap devices use Silead touchscreen controllers. Testing has shown
> repeatedly that these touchscreen controllers work fine at 400KHz, but for
> unknown reasons do not work properly at 100KHz. This has been seen on
> both ARM and x86 devices using totally different i2c controllers.
> 
> On some devices the ACPI tables list another device at the same I2C-bus
> as only being capable of 100KHz, testing has shown that these other
> devices work fine at 400KHz (as can be expected of any recent I2C hw).
> 
> This commit makes i2c_acpi_find_bus_speed() always return 400KHz if a
> Silead touchscreen controller is present, fixing the touchscreen not
> working on devices which ACPI tables' wrongly list another device on the
> same bus as only being capable of 100KHz.
> 
> Specifically this fixes the touchscreen on the Jumper EZpad 6 m4 not
> working.
> 
> Reported-and-tested-by: youling 257 <youling257@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
