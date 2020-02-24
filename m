Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9735F16AB60
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 17:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbgBXQ2h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 11:28:37 -0500
Received: from mga01.intel.com ([192.55.52.88]:10512 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727299AbgBXQ2h (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 11:28:37 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 08:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="349948152"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 24 Feb 2020 08:28:34 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 24 Feb 2020 18:28:33 +0200
Date:   Mon, 24 Feb 2020 18:28:33 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 03/40] i2c: core: Use generic definitions for bus
 frequencies
Message-ID: <20200224162833.GP2667@lahna.fi.intel.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200224151530.31713-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224151530.31713-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 24, 2020 at 05:14:53PM +0200, Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
