Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513DD1DB40B
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 14:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgETMqV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 08:46:21 -0400
Received: from mga14.intel.com ([192.55.52.115]:15615 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgETMqU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 08:46:20 -0400
IronPort-SDR: Eu2VlE2GRbcpXYVXmEuRhA+bOmmeTMOpzOtSTH6faSKoXPkPQuPEtLABpnhZHzIusBO1BxXltE
 Kh7+Zj1g2+Lg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 05:46:16 -0700
IronPort-SDR: V6E/Ng3sk5KplKOJ4ojalPDdqw5sr7/ivO8RmkZKGAyG8bBoS9rBKNudLOOSWl9jP9CFatvZ/G
 33VvxL6a2tcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; 
   d="scan'208";a="289337876"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga004.fm.intel.com with ESMTP; 20 May 2020 05:46:12 -0700
Subject: Re: [PATCH v2 08/12] i2c: designware: Introduce platform drivers glue
 layer interface
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
 <20200510095019.20981-9-Sergey.Semin@baikalelectronics.ru>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <4950bb1e-302f-947e-1924-452a8169b504@linux.intel.com>
Date:   Wed, 20 May 2020 15:46:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200510095019.20981-9-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 5/10/20 12:50 PM, Serge Semin wrote:
> Seeing the DW I2C platform driver is getting overcomplicated with a lot of
> vendor-specific configs let's introduce a glue-layer interface so new
> platforms which equipped with Synopsys Designware APB I2C IP-core would
> be able to handle their peculiarities in the dedicated objects.
> 
Comment to this patch and patches 9/12 and 12/12:

Currently i2c-designware-platdrv.c is about 500 lines of code so I don't 
think it's too overcomplicated. But I feel we have already too many 
Kconfig options and source modules for i2c-designware and obviously 
would like to push back a little from adding more.

I don't think i2c-designware-platdrv.c becomes yet too complicated if 
Baikal related code is added there, perhaps under #ifdef CONFIG_OF like 
MSCC Ocelot code is currently.

-- 
Jarkko
