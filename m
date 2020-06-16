Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3CE1FB264
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jun 2020 15:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728780AbgFPNns (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 09:43:48 -0400
Received: from mga18.intel.com ([134.134.136.126]:54320 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728716AbgFPNns (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Jun 2020 09:43:48 -0400
IronPort-SDR: QiLXGhGVt0/RGIYugZaAWCbKPZ+IEaNTzeWSNz3Y/qFS56rC8VvArCkeBnXJaw//d2d5Tq3W+2
 Nmhu8Bw/eyMQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 06:43:47 -0700
IronPort-SDR: UlN3qSw3HadyyxqoA8Wd+oVzrQhLxVNmSJP4GMrvRbJvjjWleLYzzTToY6pJe1OiSjO42XOMyw
 6n5M/v4yGSXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="298905989"
Received: from mylly.fi.intel.com (HELO [10.237.72.87]) ([10.237.72.87])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2020 06:43:43 -0700
Subject: Re: [PATCH 2/2] HID: i2c-hid: Use block reads when possible to save
 power
To:     Sultan Alsawaf <sultan@kerneltoast.com>,
        Aaron Ma <aaron.ma@canonical.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Jiri Kosina <jikos@kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Pavel Balan <admin@kryma.net>, Tin Huynh <tnhuynh@apm.com>,
        Wolfram Sang <wsa@kernel.org>,
        You-Sheng Yang <vicamo.yang@canonical.com>
References: <20200614210255.4641-1-sultan@kerneltoast.com>
 <20200614210255.4641-3-sultan@kerneltoast.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <c4373272-e656-773c-dfd2-0efc4c53c92d@linux.intel.com>
Date:   Tue, 16 Jun 2020 16:43:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200614210255.4641-3-sultan@kerneltoast.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/15/20 12:02 AM, Sultan Alsawaf wrote:
> From: Sultan Alsawaf <sultan@kerneltoast.com>
> 
> We have no way of knowing how large an incoming payload is going to be,
> so the only strategy available up until now has been to always retrieve
> the maximum possible report length over i2c, which can be quite
> inefficient. For devices that send reports in block read format, the i2c
> controller driver can read the payload length on the fly and terminate
> the i2c transaction early, resulting in considerable power savings.
> 
> On a Dell Precision 15 5540 with an i9-9880H, resting my finger on the
> touchpad causes psys power readings to go up by about 4W and hover there
> until I remove my finger. With this patch, my psys readings go from 4.7W
> down to 3.1W, yielding about 1.6W in savings. This is because my
> touchpad's max report length is 60 bytes, but all of the regular reports
> it sends for touch events are only 32 bytes, so the i2c transfer is
> roughly halved for the common case.
> 
> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> ---
>   drivers/hid/i2c-hid/i2c-hid-core.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 294c84e136d7..4b507de48d70 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -476,7 +476,8 @@ static void i2c_hid_get_input(struct i2c_hid *ihid)
>   	if (size > ihid->bufsize)
>   		size = ihid->bufsize;
>   
> -	ret = i2c_master_recv(ihid->client, ihid->inbuf, size);
> +	ret = i2c_transfer_buffer_flags(ihid->client, ihid->inbuf, size,
> +					I2C_M_RD | I2C_M_RECV_LEN);

This causes i2c-hid compatible touchscreen to stop working for me.

Ok (with patch 1/2)

[    9.346134] i2c_hid i2c-ELAN221D:00: Fetching the HID descriptor
[    9.346141] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=01 00
[    9.362082] i2c_hid i2c-ELAN221D:00: HID Descriptor: 1e 00 00 01 31 
02 02 00 03 00 43 00 04 00 ff 00 05 00 06 00 f3 04 1d 22 10 56 00 00 00 00
[    9.385897] i2c_hid i2c-ELAN221D:00: entering i2c_hid_parse
[    9.386547] i2c_hid i2c-ELAN221D:00: i2c_hid_hwreset
[    9.386598] i2c_hid i2c-ELAN221D:00: i2c_hid_set_power
[    9.386616] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=05 00 00 08
[    9.391595] i2c_hid i2c-ELAN221D:00: resetting...
[    9.408864] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=05 00 00 01
[    9.410162] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: waiting...
[    9.418223] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: finished.
[    9.418231] i2c_hid i2c-ELAN221D:00: i2c_hid_set_power
[    9.418236] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=05 00 00 08
[    9.418531] i2c_hid i2c-ELAN221D:00: asking HID report descriptor
[    9.418537] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=02 00
[    9.440093] i2c_hid i2c-ELAN221D:00: Report Descriptor: 05 0d 09 04 
a1 01 85 01 09 22 a1 02 09 42 15 00 25 01 75 01 95 01 81 02 75 01 81 03 
75 06 09 51 25 3f 81 02 26 ff 00 75 08 09 48 81 02 09 49 81 02 95 01 05 
01 a4 26 c0 0c 75 10 55 0f 65 11 09

Not ok (with patches 1-2/2)

[    9.428690] i2c_hid i2c-ELAN221D:00: Fetching the HID descriptor
[    9.428698] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=01 00
[    9.430017] i2c_hid i2c-ELAN221D:00: HID Descriptor: 1e 00 00 01 31 
02 02 00 03 00 43 00 04 00 ff 00 05 00 06 00 f3 04 1d 22 10 56 00 00 00 00
[    9.430836] i2c_hid i2c-ELAN221D:00: entering i2c_hid_parse
[    9.431205] i2c_hid i2c-ELAN221D:00: i2c_hid_hwreset
[    9.431294] i2c_hid i2c-ELAN221D:00: i2c_hid_set_power
[    9.431314] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=05 00 00 08
[    9.435937] i2c_hid i2c-ELAN221D:00: resetting...
[    9.435944] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=05 00 00 01
[    9.436150] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: waiting...
[   10.461304] i2c_designware i2c_designware.3: controller timed out
[   10.498312] i2c_designware i2c_designware.3: timeout in disabling adapter
[   14.525115] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: finished.
[   14.525130] i2c_hid i2c-ELAN221D:00: failed to reset device.
[   14.532507] i2c_hid i2c-ELAN221D:00: i2c_hid_set_power
[   14.532520] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=05 00 01 08
[   14.553027] i2c_designware i2c_designware.3: timeout waiting for bus 
ready
...

I don't know what causes the breakage but according to HID Over I2C 
Protocol Specification the descriptor length is 16 bits. Maybe the code 
misses the last byte and/or the data is off by one byte by taking the 
2nd length byte as 1st data byte?

-- 
Jarkko
