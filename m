Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFE541D85
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 09:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731366AbfFLHVB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 03:21:01 -0400
Received: from mga06.intel.com ([134.134.136.31]:11353 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731362AbfFLHVA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jun 2019 03:21:00 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jun 2019 00:20:59 -0700
X-ExtLoop1: 1
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 12 Jun 2019 00:20:56 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 12 Jun 2019 10:20:55 +0300
Date:   Wed, 12 Jun 2019 10:20:55 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v4 4/7] i2c: core: Make i2c_acpi_get_irq available to the
 rest of the I2C core
Message-ID: <20190612072055.GR2640@lahna.fi.intel.com>
References: <20190611123101.25264-1-ckeepax@opensource.cirrus.com>
 <20190611123101.25264-5-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611123101.25264-5-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 11, 2019 at 01:30:58PM +0100, Charles Keepax wrote:
> In preparation for more refactoring make i2c_acpi_get_irq available
> outside i2c-core-acpi.c.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
