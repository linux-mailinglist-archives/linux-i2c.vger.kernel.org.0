Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A783C3A80
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2019 18:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfJAQ3X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Oct 2019 12:29:23 -0400
Received: from mga17.intel.com ([192.55.52.151]:55629 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728536AbfJAQ3X (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Oct 2019 12:29:23 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 09:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="221062600"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2019 09:29:16 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iFL1V-0002p6-Sv; Tue, 01 Oct 2019 19:29:13 +0300
Date:   Tue, 1 Oct 2019 19:29:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Patrick Williams <alpawi@amazon.com>
Cc:     Patrick Williams <patrick@stwcx.xyz>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Max Staudt <max@enpas.org>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>,
        Ajay Gupta <ajayg@nvidia.com>, Stefan Roese <sr@denx.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Enrico Weigelt <info@metux.net>,
        Allison Randal <allison@lohutok.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: pxa: migrate to new i2c_slave APIs
Message-ID: <20191001162913.GR32742@smile.fi.intel.com>
References: <20191001160001.2388-1-alpawi@amazon.com>
 <20191001160001.2388-2-alpawi@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001160001.2388-2-alpawi@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On Tue, Oct 01, 2019 at 10:59:59AM -0500, Patrick Williams wrote:
> The i2c subsystem was enhanced circa 2015 to support operating as
> an i2c-slave device.  Prior to that, the i2c-pxa driver supported
> an i2c-slave but had its own APIs.  There are no existing in-kernel
> drivers or platforms that utilize the i2c-pxa APIs.
> 
> Migrate the i2c-pxa driver to the general i2c-slave APIs so that
> existing drivers, such as the i2c-slave-eeprom, can be used.
> 
> This has been tested with a Marvell EspressoBin, using i2c-pxa and
> i2c-slave-eeprom, acting as a slave, and a RaspeberryPi 3, using the
> at24 driver, acting as a master.

There are quite a few people in the Cc list. I'm not sure they all are
interested in this. I deliberately dropped few names, sorry, if I was mistaken.

> +		if (isr & ISR_RWM) {
> +			u8 byte = 0;
> +
> +			i2c_slave_event(i2c->slave, I2C_SLAVE_READ_REQUESTED,
> +					&byte);
> +			writel(byte, _IDBR(i2c));
> +		} else {
> +			i2c_slave_event(i2c->slave, I2C_SLAVE_WRITE_REQUESTED,
> +					NULL);
> +		}

Hmm... Perhaps

		u8 byte = 0;

		i2c_slave_event(i2c->slave, I2C_SLAVE_READ_REQUESTED, &byte);
		if (isr & ISR_RWM)
			writel(byte, _IDBR(i2c));

-- 
With Best Regards,
Andy Shevchenko


