Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A636D5F94A
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2019 15:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfGDNoT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Jul 2019 09:44:19 -0400
Received: from mga04.intel.com ([192.55.52.120]:51371 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727026AbfGDNoT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 4 Jul 2019 09:44:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jul 2019 06:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,451,1557212400"; 
   d="scan'208";a="164642923"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by fmsmga008.fm.intel.com with ESMTP; 04 Jul 2019 06:44:17 -0700
Subject: Re: [PATCH] i2c: i801: Documentation update
To:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>
References: <20190704113402.3ade31cb@endymion>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <59fb0d4d-3b72-8645-474c-495cca8f0ca1@linux.intel.com>
Date:   Thu, 4 Jul 2019 16:44:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704113402.3ade31cb@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/4/19 12:34 PM, Jean Delvare wrote:
> The i2c-i801 driver documentation needs some dusting:
> * Mention disable_features flag 0x20.
> * The i2c_ec driver has been removed from the kernel long ago. Driver
>    i2c-scmi serves the same purpose for more recent hardware.
> * Replace obsolete /proc paths with equivalent /sys paths.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> ---
>   Documentation/i2c/busses/i2c-i801 |   16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
