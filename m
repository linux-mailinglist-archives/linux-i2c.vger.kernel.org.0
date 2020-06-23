Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2017205093
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 13:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732314AbgFWLVX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 07:21:23 -0400
Received: from mga18.intel.com ([134.134.136.126]:48991 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732191AbgFWLVW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jun 2020 07:21:22 -0400
IronPort-SDR: c6Shx7XJVWrUIz7YhEG7ToLjeLKEu6FdPTNnzYDe+wM9tJXFhsdhZM/JOCv0KS3VJm+ig/r7Ej
 NHPRPdXjhiFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="131441458"
X-IronPort-AV: E=Sophos;i="5.75,271,1589266800"; 
   d="scan'208";a="131441458"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 04:21:22 -0700
IronPort-SDR: Em2JAu6SbcjGNL4zkn6zZlh9r39nJxrLrSrQ+vAKgffk8c7GSfEFY0oMEZb+C3y9oxSdnl5eU6
 Z1h+PDUQmddg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,271,1589266800"; 
   d="scan'208";a="301219385"
Received: from mylly.fi.intel.com (HELO [10.237.72.87]) ([10.237.72.87])
  by fmsmga004.fm.intel.com with ESMTP; 23 Jun 2020 04:21:19 -0700
Subject: Re: [PATCH v1] i2c: designware: Adjust bus speed independently of
 ACPI
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     John Stultz <john.stultz@linaro.org>
References: <20200623091501.50070-1-andriy.shevchenko@linux.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <89518c6c-f687-c45a-0315-a188d85d333a@linux.intel.com>
Date:   Tue, 23 Jun 2020 14:21:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623091501.50070-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/23/20 12:15 PM, Andy Shevchenko wrote:
> John Stultz reported that commit f9288fcc5c615 ("i2c: designware: Move
> ACPI parts into common module") caused a regression on the HiKey board
> where adv7511 HDMI bridge driver wasn't probing anymore due the I2C bus
> failed to start.
> 
> It seems the change caused the bus speed being zero when CONFIG_ACPI
> not set and neither speed based on "clock-frequency" device property
> or default fast mode is set.
> 
> Fix this by splitting i2c_dw_acpi_adjust_bus_speed() to
> i2c_dw_acpi_round_bus_speed() and i2c_dw_adjust_bus_speed(), where
> the latter one has the code that runs independently of ACPI.
> 
> Fixes: f9288fcc5c615 ("i2c: designware: Move ACPI parts into common module")
> Reported-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-common.c  | 25 ++++++++++++++-------
>   drivers/i2c/busses/i2c-designware-core.h    |  3 +--
>   drivers/i2c/busses/i2c-designware-pcidrv.c  |  2 +-
>   drivers/i2c/busses/i2c-designware-platdrv.c |  2 +-
>   4 files changed, 20 insertions(+), 12 deletions(-)
> 
Looks good to me. Let's wait for John's test result.

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
