Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 438332D673
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2019 09:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfE2HgG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 May 2019 03:36:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:17089 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725895AbfE2HgG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 May 2019 03:36:06 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 00:36:06 -0700
X-ExtLoop1: 1
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 29 May 2019 00:36:02 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 29 May 2019 10:36:01 +0300
Date:   Wed, 29 May 2019 10:36:01 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v3 3/6] i2c: acpi: Factor out getting the IRQ from ACPI
Message-ID: <20190529073601.GS2781@lahna.fi.intel.com>
References: <20190528142900.24147-1-ckeepax@opensource.cirrus.com>
 <20190528142900.24147-3-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528142900.24147-3-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 28, 2019 at 03:28:57PM +0100, Charles Keepax wrote:
> In preparation for future refactoring factor out the fetch of the IRQ
> into its own helper function.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
