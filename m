Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACE226DE17
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 16:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbgIQOW2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 10:22:28 -0400
Received: from mga01.intel.com ([192.55.52.88]:28652 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726794AbgIQNzN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 17 Sep 2020 09:55:13 -0400
X-Greylist: delayed 311 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 09:55:13 EDT
IronPort-SDR: aoQ2yfbA+VB18GNHhXTVEkHpmlrsMj1gABpColDFG0Vd/DN59+uIPHBuXISNoiAd7380gQjLc3
 HAEN8KT8WNmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="177791956"
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; 
   d="scan'208";a="177791956"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 06:46:22 -0700
IronPort-SDR: zT5iIOf4unlK1SgFAVXPYQucFc18m7rBc3aM8BzyqSheN9QbAo/2NDoF1iqeRll4O/PJAXdUZE
 76KarLVxtjvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; 
   d="scan'208";a="307471975"
Received: from mylly.fi.intel.com (HELO [10.237.72.153]) ([10.237.72.153])
  by orsmga006.jf.intel.com with ESMTP; 17 Sep 2020 06:46:18 -0700
Subject: Re: [PATCH v2 2/4] i2c: designware: Ensure tx_buf_len is nonzero for
 SMBus block reads
To:     Sultan Alsawaf <sultan@kerneltoast.com>, linux-i2c@vger.kernel.org
Cc:     jikos@kernel.org, aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com,
        kai.heng.feng@canonical.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com,
        vicamo.yang@canonical.com, wsa@kernel.org
References: <20200917052256.5770-1-sultan@kerneltoast.com>
 <20200917052256.5770-3-sultan@kerneltoast.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <4698b23c-7af6-3f44-975d-b1f692ae3f00@linux.intel.com>
Date:   Thu, 17 Sep 2020 16:44:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917052256.5770-3-sultan@kerneltoast.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/17/20 8:22 AM, Sultan Alsawaf wrote:
> From: Sultan Alsawaf <sultan@kerneltoast.com>
> 
> The point of adding a byte to len in i2c_dw_recv_len() is to make sure
> that tx_buf_len is nonzero, so that i2c_dw_xfer_msg() can let the i2c
> controller know that the i2c transaction can end. Otherwise, the i2c
> controller will think that the transaction can never end for block
> reads, which results in the stop-detection bit never being set and thus
> the transaction timing out.
> 
> Adding a byte to len is not a reliable way to do this though; sometimes
> it lets tx_buf_len become zero, which results in the scenario described
> above. Therefore, just directly ensure tx_buf_len cannot be zero to fix
> the issue.
> 
> Fixes: c3ae106050b9 ("i2c: designware: Implement support for SMBus block read and write")
> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
Were other patches in series dropped somewhere? I received only this.

Jarkko
