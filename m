Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90911FCC0F
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 13:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgFQLRP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Jun 2020 07:17:15 -0400
Received: from mga03.intel.com ([134.134.136.65]:3305 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726271AbgFQLRN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Jun 2020 07:17:13 -0400
IronPort-SDR: 2cQ//fR0bK5LvEwzu1Raw+g02ODw0vSpQmj9Q3fmUMy8R2Zd/gmZ4Ip9wUN64OlkX6ELATDn0t
 +3PvdgAnmD5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2020 04:17:12 -0700
IronPort-SDR: ZwzoQh8XRnqvgl1o/juzdSHL1P1Do1ViuL+y4pfrxO0BdJvUCb9Td4XuqI2Hiz3Tx4kbSczD3a
 d2OxDRAazCdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,522,1583222400"; 
   d="scan'208";a="261710413"
Received: from mylly.fi.intel.com (HELO [10.237.72.153]) ([10.237.72.153])
  by fmsmga007.fm.intel.com with ESMTP; 17 Jun 2020 04:17:08 -0700
Subject: Re: [PATCH v2] i2c: designware: Only check the first byte for SMBus
 block read length
To:     Sultan Alsawaf <sultan@kerneltoast.com>
Cc:     aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com, jikos@kernel.org,
        kai.heng.feng@canonical.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com,
        wsa@kernel.org
References: <9782f44e-4e01-4e5d-cc50-ab9e2219085c@linux.intel.com>
 <20200616154328.2866-1-sultan@kerneltoast.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <791f22ae-e11a-047f-0a29-a9e27782b0fa@linux.intel.com>
Date:   Wed, 17 Jun 2020 14:08:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616154328.2866-1-sultan@kerneltoast.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/16/20 6:43 PM, Sultan Alsawaf wrote:
> From: Sultan Alsawaf <sultan@kerneltoast.com>
> 
> SMBus block reads can be broken because the read function will just skip
> over bytes it doesn't like until reaching a byte that conforms to the
> length restrictions for block reads. This is problematic when it isn't
> known if the incoming payload is indeed a conforming block read.
> 
> According to the SMBus specification, block reads will only send the
> payload length in the first byte, so we can fix this by only considering
> the first byte in a sequence for block read length purposes.
> 
> Fixes: c3ae106050b9 ("i2c: designware: Implement support for SMBus block read and write")
> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
