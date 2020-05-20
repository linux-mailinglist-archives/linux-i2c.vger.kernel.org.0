Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13ED41DB2E5
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 14:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgETMQH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 08:16:07 -0400
Received: from mga17.intel.com ([192.55.52.151]:24808 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgETMQG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 08:16:06 -0400
IronPort-SDR: UIncpspnrRRBHG00Xtx/I/fIv60vW8L/LDzl8q/VaFFNwmiPn7bJsGfUVzWxqsAnF5zSH0yKBo
 idTRxmMhbglg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 05:16:06 -0700
IronPort-SDR: pv17pbgS2GGtmInTpjcd5g8rVRY56BtISvGSwa76r48JnssIR1JDoIxqq2cJJcJ6WHAUbJSHTf
 z4ZsADvZ4Iow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,413,1583222400"; 
   d="scan'208";a="289330835"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga004.fm.intel.com with ESMTP; 20 May 2020 05:16:00 -0700
Subject: Re: [PATCH v2 05/12] i2c: designware: Use `-y` to build multi-object
 modules
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
        Jean Delvare <jdelvare@suse.de>, Max Staudt <max@enpas.org>,
        Stefan Roese <sr@denx.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
 <20200510095019.20981-6-Sergey.Semin@baikalelectronics.ru>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <a28c29d6-76d5-4029-cee6-6b82ccc5ab9d@linux.intel.com>
Date:   Wed, 20 May 2020 15:16:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200510095019.20981-6-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/10/20 12:50 PM, Serge Semin wrote:
> Since commit 4f8272802739 ("Documentation: update kbuild loadable modules
> goals & examples") `-objs` is fitted for building host programs, lets
> change DW I2C core, platform and PCI driver kbuild directives to using
> `-y`, which more straightforward for device drivers. By doing so we can
> discard the ifeq construction in favor to the more natural and less bulky
> `<module>-$(CONFIG_X) += x.o`
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
>   drivers/i2c/busses/Makefile | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
