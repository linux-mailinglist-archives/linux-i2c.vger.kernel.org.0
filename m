Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493A844C2FC
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 15:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232090AbhKJOec (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 09:34:32 -0500
Received: from mga06.intel.com ([134.134.136.31]:1159 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231969AbhKJOea (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Nov 2021 09:34:30 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="293509003"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; 
   d="scan'208";a="293509003"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2021 06:31:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; 
   d="scan'208";a="669819389"
Received: from mylly.fi.intel.com (HELO [10.237.72.159]) ([10.237.72.159])
  by orsmga005.jf.intel.com with ESMTP; 10 Nov 2021 06:31:42 -0800
Subject: Re: [PATCH] i2c: i801: Restore INTREN on unload
To:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
References: <20211109160257.4c089eef@endymion>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <d4f76584-7548-baae-837d-b87300086196@linux.intel.com>
Date:   Wed, 10 Nov 2021 16:31:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211109160257.4c089eef@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/9/21 5:02 PM, Jean Delvare wrote:
> If driver interrupts are enabled, SMBHSTCNT_INTREN will be 1 after
> the first transaction, and will stay to that value forever. This
> means that interrupts will be generated for both host-initiated
> transactions and also SMBus Alert events even after the driver is
> unloaded. To be on the safe side, we should restore the initial state
> of this bit at suspend and reboot time, as we do for several other
> configuration bits already and for the same reason: the BIOS should
> be handed the device in the same configuration state in which we
> received it. Otherwise interrupts may be generated which nobody
> will process.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> This probably doesn't change much on its own in practice, however it
> is mandatory to make this change before Jarkko's fix for the SMB_ALERT
> interrupt storm gets applied, otherwise the fix will be incomplete.
> 
> Jarkko, this is not exactly the patch you tested, I added restoration
> to the suspend path as well to be 100% safe.
> 
Same Tested-by holds here.

We have one laptop with RMI4 SMBus connected touchpad and trackpad. I 
wanted to check it does the suspend path here cease them to not work but 
they work after your patch.

Now we restore INTREN on suspend but do not explicitly enable it after 
resume. I didn't fully get how RMI4 stack resumes but perhaps they will 
do some power on, reset, etc command transaction and that gets the 
INTREN enabled and allow host notify.

Jarkko
