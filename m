Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4AC71C39AD
	for <lists+linux-i2c@lfdr.de>; Mon,  4 May 2020 14:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbgEDMoL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 May 2020 08:44:11 -0400
Received: from mga05.intel.com ([192.55.52.43]:4802 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726467AbgEDMoL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 May 2020 08:44:11 -0400
IronPort-SDR: pTnbN3NxNuMJrVASEPkhGquB6BELgJtENOfCe5qjU6cd2h09OXXtsYdgU6OSMu4AzT/2Rh053D
 z44Zlq8FGVdg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 05:44:11 -0700
IronPort-SDR: KhqKDB+iYXA1TW4urdP/SgxrIP6f3/fC+8/32rcZlxiVDgJWWofN7Aq/Rw3tQdAOwiriXUzUuY
 QeEBl1QfGwIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,352,1583222400"; 
   d="scan'208";a="434089333"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 04 May 2020 05:44:07 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jVaS9-004cHw-To; Mon, 04 May 2020 15:44:09 +0300
Date:   Mon, 4 May 2020 15:44:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
Cc:     Thor Thayer <thor.thayer@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: drivers: Remove superfluous error message
Message-ID: <20200504124409.GG185537@smile.fi.intel.com>
References: <20200503120847.13528-1-aishwaryarj100@gmail.com>
 <20200504114408.9128-1-aishwaryarj100@gmail.com>
 <20200504124256.GF185537@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504124256.GF185537@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 04, 2020 at 03:42:56PM +0300, Andy Shevchenko wrote:
> On Mon, May 04, 2020 at 05:14:06PM +0530, Aishwarya Ramakrishnan wrote:
> > The function platform_get_irq can log an error by itself.
> > This omit a redundant message for exception handling in the
> > calling function.
> 
> FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Wolfram, I didn't notice any updates in your public tree. Do you have plans to
push them this week?

-- 
With Best Regards,
Andy Shevchenko


