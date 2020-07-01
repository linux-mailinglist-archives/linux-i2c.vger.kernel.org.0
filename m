Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1D12105A9
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 10:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbgGAIEH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 04:04:07 -0400
Received: from mga01.intel.com ([192.55.52.88]:10609 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728258AbgGAIEG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Jul 2020 04:04:06 -0400
IronPort-SDR: sCi+dFlgKTXbB+SgwIPlYwBTizmhx6jZT0mMBVqm5OwPKYcmgS4bKTtZSi+nu/n8g1u7kOg/+o
 b04wwCxWH4Bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="164506902"
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; 
   d="scan'208";a="164506902"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 01:04:05 -0700
IronPort-SDR: vNezBBKcLiLMpmO1Wp6zWf3RihAcxbBrvz1FeO8XFq/J7uPqayNdJ+W9p2YIed5n20e4XPDoxN
 zajbHTqQgeGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; 
   d="scan'208";a="277694962"
Received: from mylly.fi.intel.com (HELO [10.237.72.70]) ([10.237.72.70])
  by orsmga003.jf.intel.com with ESMTP; 01 Jul 2020 01:04:02 -0700
Subject: Re: [PATCH v2] HID: i2c-hid: Use block reads when possible to save
 power
To:     Sultan Alsawaf <sultan@kerneltoast.com>
Cc:     aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com, jikos@kernel.org,
        kai.heng.feng@canonical.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com,
        wsa@kernel.org
References: <c4373272-e656-773c-dfd2-0efc4c53c92d@linux.intel.com>
 <20200616154951.3050-1-sultan@kerneltoast.com>
 <37ceaf7a-3421-e305-4355-a6b40ae54843@linux.intel.com>
 <20200629174328.GB1646@sultan-box.localdomain>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <ef949533-c614-7afb-f206-5c54d827deac@linux.intel.com>
Date:   Wed, 1 Jul 2020 11:04:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629174328.GB1646@sultan-box.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/29/20 8:43 PM, Sultan Alsawaf wrote:
> Hmm, for some reason in 5.8 I get the same problem, but 5.7 is fine. Could you
> try this on 5.7 and see if it works?
> 
> In the meantime I'll bisect 5.8 to see why it's causing problems for me...
> 
I see the same issue on top of v5.7:

[    9.330514] i2c_hid i2c-ELAN221D:00: Fetching the HID descriptor
[    9.334761] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=01 00
[    9.335716] i2c_hid i2c-ELAN221D:00: HID Descriptor: 1e 00 00 01 31 
02 02 00 03 00 43 00 04 00 ff 00 05 00 06 00 f3 04 1d 22 10 56 00 00 00 00
[    9.353408] i2c_hid i2c-ELAN221D:00: entering i2c_hid_parse
[    9.353416] i2c_hid i2c-ELAN221D:00: i2c_hid_hwreset
[    9.353502] i2c_hid i2c-ELAN221D:00: i2c_hid_set_power
[    9.353520] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=05 00 00 08
[    9.362304] i2c_hid i2c-ELAN221D:00: resetting...
[    9.370585] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=05 00 00 01
[    9.389175] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: waiting...
[   10.416458] i2c_designware i2c_designware.3: controller timed out
[   10.476853] i2c_designware i2c_designware.3: timeout in disabling adapter
[   11.983806] [<00000000fac753ed>] i2c_dw_isr [i2c_designware_core]
[   14.544499] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: finished.
[   14.552123] i2c_hid i2c-ELAN221D:00: failed to reset device.
[   14.559263] i2c_hid i2c-ELAN221D:00: i2c_hid_set_power
[   14.565822] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=05 00 01 08
[   14.600256] i2c_designware i2c_designware.3: timeout waiting for bus 
ready
[   14.608800] i2c_hid i2c-ELAN221D:00: failed to change power setting.
[   15.632103] i2c_hid i2c-ELAN221D:00: i2c_hid_hwreset
[   15.638460] i2c_hid i2c-ELAN221D:00: i2c_hid_set_power
[   15.646422] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=05 00 00 08
...

-- 
Jarkko
