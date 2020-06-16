Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47CE61FBCA0
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jun 2020 19:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgFPRTC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 13:19:02 -0400
Received: from mga11.intel.com ([192.55.52.93]:36599 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726630AbgFPRTB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Jun 2020 13:19:01 -0400
IronPort-SDR: Kb2nRk8r/1qvENrJmyPawleHqzB4tdft2mApEndQCe9uxR06KPXcNV8ZkvpsoUhbXz4NCPIkQi
 TQ/jBTZp9hDg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 10:19:00 -0700
IronPort-SDR: HPPTnoVMM9cF4ZrV3z6gERadUOEYz01w9Pc8K1U0rwqGA/pHFooWfUooLD5cImk7Tkjn3gqczO
 P9u1ee/Ft3xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="298984794"
Received: from unknown (HELO intel.com) ([10.251.95.102])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2020 10:18:54 -0700
Date:   Tue, 16 Jun 2020 20:18:54 +0300
From:   Andi Shyti <andi.shyti@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sultan Alsawaf <sultan@kerneltoast.com>,
        jarkko.nikula@linux.intel.com, aaron.ma@canonical.com,
        admin@kryma.net, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com, jikos@kernel.org,
        kai.heng.feng@canonical.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com,
        wsa@kernel.org
Subject: Re: [PATCH v2] HID: i2c-hid: Use block reads when possible to save
 power
Message-ID: <20200616171854.GA1415@intel.intel>
References: <c4373272-e656-773c-dfd2-0efc4c53c92d@linux.intel.com>
 <20200616154951.3050-1-sultan@kerneltoast.com>
 <20200616164101.GY2428291@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616164101.GY2428291@smile.fi.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

> > so the only strategy available up until now has been to always retrieve
> > the maximum possible report length over i2c, which can be quite
> > inefficient. For devices that send reports in block read format, the i2c
> > controller driver can read the payload length on the fly and terminate
> > the i2c transaction early, resulting in considerable power savings.
> > 
> > On a Dell Precision 15 5540 with an i9-9880H, resting my finger on the
> > touchpad causes psys power readings to go up by about 4W and hover there
> > until I remove my finger. With this patch, my psys readings go from 4.7W
> > down to 3.1W, yielding about 1.6W in savings. This is because my
> > touchpad's max report length is 60 bytes, but all of the regular reports
> > it sends for touch events are only 32 bytes, so the i2c transfer is
> > roughly halved for the common case.
> 
> > +	/* Try to do a block read if the size fits in one byte */
> > +	flags = size > 255 ? I2C_M_RD : I2C_M_RD | I2C_M_RECV_LEN;
> 
> AFAIR SMBus specification tells about 256. Why 255?
> 
> Andi, am I correct?

Actually the SMBUS 3.0 protocol from 2015[*] says 255:

"
D.6 255 Bytes in Process Call

The maximum number of bytes allowed in the Block Write-Block Read
Process Call (Section 6.5.8) was increased from 32 to 255.
"

But why does it matter... I see the patch is detatching itself
from smbus.

And, actually, I wonder if this is the right way to fix it, isn't
it better to fix smbus instead?

I have a patch ready that fixes the smbus transfer size, perhaps
I should rebase, test and send it.

Andi

[*] http://smbus.org/specs/SMBus_3_0_20141220.pdf
