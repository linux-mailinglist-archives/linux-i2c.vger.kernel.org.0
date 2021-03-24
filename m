Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88F63471C0
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 07:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbhCXGmS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 02:42:18 -0400
Received: from mga01.intel.com ([192.55.52.88]:23554 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230041AbhCXGmA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Mar 2021 02:42:00 -0400
IronPort-SDR: pJ+/e3xqpSnxDb6hFyxUlXA6GLknd1Ou73xJLqk6zOjvGcHR5uRTWqKdkI7H89Khdn9kY0wmTp
 L4EShT7Z3mzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="210739756"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="210739756"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 23:42:00 -0700
IronPort-SDR: NT4+/DdOkxENlHgafw08wJsSqZLkPMNVtiS/Ygvbz2H1aAze1hTodXHcbVXPrXYZhmCDBgl4d3
 WIBkKVMSHv7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="442079888"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
  by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2021 23:41:55 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210324042046.idkctj2t7cxi53jf@vireshk-i7>
 <70908366-c270-848e-0be3-c85fec7958ec@intel.com>
 <20210324060907.nwilmghg2xcdz7nv@vireshk-i7>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <84f0bf1b-9b69-6fc0-011c-2aafde208435@intel.com>
Date:   Wed, 24 Mar 2021 14:41:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210324060907.nwilmghg2xcdz7nv@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/3/24 14:09, Viresh Kumar wrote:
> On 24-03-21, 14:05, Jie Deng wrote:
> Or, now that I think about it a bit more, another thing we can do here is see if
> virtqueue_get_buf() returns NULL, if it does then we should keep expecting more
> messages as it may be early interrupt. What do you say ?

I don't think we really need this because for this device, early 
interrupt is a bad operation
which should be avoided. I can't think of why this device need to send 
early interrupt, what
we can do is to clarify that this means loss of the remaining requests. 
A device should never
do this, if it does then loss is the expected result.


