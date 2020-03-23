Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B536E18F819
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 16:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgCWPDv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 11:03:51 -0400
Received: from mga05.intel.com ([192.55.52.43]:46999 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727050AbgCWPDv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Mar 2020 11:03:51 -0400
IronPort-SDR: LapmL+7/Kq9IMO4nKBKaaLiQK3N2mqszyHvyB8FGbczDxy/vDNJcQmAvxFBD+f0UCJdMQ6Uo4Z
 bx56YWDEsdWg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 08:03:48 -0700
IronPort-SDR: mHHNLNQ0A/+Zr0fMQurJa2EsXFsMlu2fBmkH6MHRuzF9OYszpfxRoiO3+8ENpbBRzAf6jj7yIa
 qbicpWu0OHiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,296,1580803200"; 
   d="scan'208";a="264800941"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 23 Mar 2020 08:03:44 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jGOcD-00CGr2-UD; Mon, 23 Mar 2020 17:03:45 +0200
Date:   Mon, 23 Mar 2020 17:03:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     brendanhiggins@google.com, avifishman70@gmail.com,
        tmaimon77@gmail.com, kfting@nuvoton.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        wsa@the-dreams.de, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C controller
Message-ID: <20200323150345.GP1922688@smile.fi.intel.com>
References: <20200323134437.259210-1-tali.perry1@gmail.com>
 <20200323134437.259210-2-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323134437.259210-2-tali.perry1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 23, 2020 at 03:44:35PM +0200, Tali Perry wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM I2C controller.
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/i2c/i2c-npcm7xx.txt   | 29 +++++++++++++++++++

Wouldn't be better to have it in YAML from the day 1?

-- 
With Best Regards,
Andy Shevchenko


