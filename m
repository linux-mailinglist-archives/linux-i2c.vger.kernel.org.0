Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3A8114B71
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 16:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfEFODh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 10:03:37 -0400
Received: from mga12.intel.com ([192.55.52.136]:48642 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbfEFODg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 May 2019 10:03:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 May 2019 07:03:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; 
   d="scan'208";a="321973271"
Received: from mylly.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by orsmga005.jf.intel.com with ESMTP; 06 May 2019 07:03:21 -0700
Subject: Re: [PATCH 2/2] eeprom: ee1004: Deal with nack on page selection
To:     Jean Delvare <jdelvare@suse.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20190506151539.69ee75e8@endymion>
 <20190506151656.47494e56@endymion>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <04843f27-bb0f-d631-32c8-80cd122b7399@linux.intel.com>
Date:   Mon, 6 May 2019 17:03:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506151656.47494e56@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/6/19 4:16 PM, Jean Delvare wrote:
> Some EE1004 implementations will not properly ack page selection
> commands. They still set the page correctly, so there is no actual
> error. Deal with this case gracefully by checking the currently
> selected page after we receive a nack. If the page is set right then
> we can continue.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   drivers/misc/eeprom/ee1004.c |   12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
Does Dreamcat4 deserve reported and tested by tags here? I guess 
anonymous address is fine with those tags?

(I re-tested these two patches on top of v5.1 and they make decode-dimms 
working on a machine with 2-4 * Crucial DD4 dimms)

-- 
Jarkko
