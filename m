Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA801FCC3D
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 13:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgFQL1C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Jun 2020 07:27:02 -0400
Received: from mga03.intel.com ([134.134.136.65]:4022 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgFQL1C (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Jun 2020 07:27:02 -0400
IronPort-SDR: l7jq627Ux9Yag1bT0UcwQRam8WGYqUOt9HDkQyN9pN6poDmZmL+jO+4ZEerlQvh9R+yUQu90rh
 f8haxB1HyXWA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2020 04:27:01 -0700
IronPort-SDR: BkgVvAArN+IaKNT1afXL7/zlb6HR0/Lb6xP/PQ7EfcA+OXVcDfzLjKLL0D5VLc6ybSumlsDK5d
 EG9NiQ63CN4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,522,1583222400"; 
   d="scan'208";a="263296609"
Received: from mylly.fi.intel.com (HELO [10.237.72.153]) ([10.237.72.153])
  by fmsmga008.fm.intel.com with ESMTP; 17 Jun 2020 04:26:58 -0700
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
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <37ceaf7a-3421-e305-4355-a6b40ae54843@linux.intel.com>
Date:   Wed, 17 Jun 2020 14:17:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616154951.3050-1-sultan@kerneltoast.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/16/20 6:49 PM, Sultan Alsawaf wrote:
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
> Jarkko, could you try this?
>   drivers/hid/i2c-hid/i2c-hid-core.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 294c84e136d7..739dccfc57e1 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -472,11 +472,14 @@ static void i2c_hid_get_input(struct i2c_hid *ihid)
>   	int ret;
>   	u32 ret_size;
>   	int size = le16_to_cpu(ihid->hdesc.wMaxInputLength);
> +	u16 flags;
>   
>   	if (size > ihid->bufsize)
>   		size = ihid->bufsize;
>   
> -	ret = i2c_master_recv(ihid->client, ihid->inbuf, size);
> +	/* Try to do a block read if the size fits in one byte */
> +	flags = size > 255 ? I2C_M_RD : I2C_M_RD | I2C_M_RECV_LEN;
> +	ret = i2c_transfer_buffer_flags(ihid->client, ihid->inbuf, size, flags);
>   	if (ret != size) {
>   		if (ret < 0)
>   			return;

This still causes a regression for me.

[    9.457656] i2c_hid i2c-ELAN221D:00: Fetching the HID descriptor
[    9.457663] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=01 00
[    9.458591] i2c_hid i2c-ELAN221D:00: HID Descriptor: 1e 00 00 01 31 
02 02 00 03 00 43 00 04 00 ff 00 05 00 06 00 f3 04 1d 22 10 56 00 00 00 00
[    9.459519] i2c_hid i2c-ELAN221D:00: entering i2c_hid_parse
[    9.459526] i2c_hid i2c-ELAN221D:00: i2c_hid_hwreset
[    9.459576] i2c_hid i2c-ELAN221D:00: i2c_hid_set_power
[    9.459591] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=05 00 00 08
[    9.464070] i2c_hid i2c-ELAN221D:00: resetting...
[    9.464078] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=05 00 00 01
[    9.464346] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: waiting...
[   10.497169] i2c_designware i2c_designware.3: controller timed out
[   10.533940] i2c_designware i2c_designware.3: timeout in disabling adapter
[   14.528677] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: finished.
[   14.528695] i2c_hid i2c-ELAN221D:00: failed to reset device.
[   14.536125] i2c_hid i2c-ELAN221D:00: i2c_hid_set_power
[   14.536141] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=05 00 01 08
[   14.556335] i2c_designware i2c_designware.3: timeout waiting for bus 
ready
[   14.565086] i2c_hid i2c-ELAN221D:00: failed to change power setting.
[   15.584374] i2c_hid i2c-ELAN221D:00: i2c_hid_hwreset
[   15.584395] i2c_hid i2c-ELAN221D:00: i2c_hid_set_power
[   15.584410] i2c_hid i2c-ELAN221D:00: __i2c_hid_command: cmd=05 00 00 08
[   15.605683] i2c_designware i2c_designware.3: timeout waiting for bus 
ready
[   15.614304] i2c_hid i2c-ELAN221D:00: failed to change power setting.
...

-- 
Jarkko
