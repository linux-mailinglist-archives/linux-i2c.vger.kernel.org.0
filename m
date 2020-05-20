Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B07BE1DB2E1
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 14:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgETMPv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 08:15:51 -0400
Received: from mga07.intel.com ([134.134.136.100]:64783 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgETMPv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 08:15:51 -0400
IronPort-SDR: /nXgpn10MYs4R/z6EUM8pnBhYJc7hZn3D4lZaeUyTp3oiItL1hDbd9frUNxrxjdxQZ5I2clLxE
 y3wB91N5kKvA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 05:15:50 -0700
IronPort-SDR: YFW5zYdTb9SmJtp6AwGARWsB5kwLAa6+TBdQoaOHSuXDDLRPzNxh8Tgl1rJEtgAeTiXxfWCtSQ
 XcrpaXraMkeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,413,1583222400"; 
   d="scan'208";a="289330800"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga004.fm.intel.com with ESMTP; 20 May 2020 05:15:45 -0700
Subject: Re: [PATCH v2 06/12] i2c: designware: slave: Set DW I2C core module
 dependency
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Max Staudt <max@enpas.org>, Stefan Roese <sr@denx.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
 <20200510095019.20981-7-Sergey.Semin@baikalelectronics.ru>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <67c8f943-37fb-70a2-60b2-eb3c80d2502e@linux.intel.com>
Date:   Wed, 20 May 2020 15:15:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200510095019.20981-7-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/10/20 12:50 PM, Serge Semin wrote:
> DW APB I2C slave code in fact depends on the DW I2C driver core, but not
> on the platform code. Yes, the I2C slave interface is currently supported
> by the platform version of the IP core, but it doesn't make it dependent
> on it. So make sure the DW APB I2C slave config is only available if the
> I2C_DESIGNWARE_CORE config is enabled.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> ---
>   drivers/i2c/busses/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
