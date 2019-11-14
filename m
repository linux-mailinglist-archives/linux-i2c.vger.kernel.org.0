Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6719AFC0C8
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2019 08:31:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfKNHbW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Nov 2019 02:31:22 -0500
Received: from mga17.intel.com ([192.55.52.151]:36579 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbfKNHbW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Nov 2019 02:31:22 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Nov 2019 23:31:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; 
   d="scan'208";a="214484238"
Received: from unknown (HELO [10.237.72.180]) ([10.237.72.180])
  by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2019 23:31:19 -0800
Subject: Re: [PATCH v2] i2c: acpi: Force bus speed to 400KHz if a Silead
 touchscreen is present
To:     Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        youling 257 <youling257@gmail.com>
References: <20191113182938.279299-1-hdegoede@redhat.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <69d7f2a2-99fd-2652-1119-89ae7f3ac7f4@linux.intel.com>
Date:   Thu, 14 Nov 2019 09:31:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113182938.279299-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 11/13/19 8:29 PM, Hans de Goede wrote:
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
> ---
> Changes in v2:
> -Print a warning when we are forcing the bus to another speed then the
>   lowest speed of all devices the DSTD lists on the bus
> ---
>   drivers/i2c/i2c-core-acpi.c | 28 +++++++++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
> 
I think this is the only sane way to go forward, i.e. kernel figures it 
out not the user needing to have a custom DSDT.

Of course there is a small risk some device on the same bus cease 
working but benefit of this patch is worth of it. Otherwise these 
touchscreen devices keep not working and getting possible regression 
increases also knowledge.

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
