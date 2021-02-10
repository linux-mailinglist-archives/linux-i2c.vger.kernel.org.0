Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B9931735B
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Feb 2021 23:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbhBJW3V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Feb 2021 17:29:21 -0500
Received: from mga04.intel.com ([192.55.52.120]:13270 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233231AbhBJW3U (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Feb 2021 17:29:20 -0500
IronPort-SDR: 6+RfduXYzluN3zFtHuKW2QgWX099b7aYUULdRsCK7udSE/CNPPvMpLU0WyXEJNgqBJJvwtlBAq
 iQjFKttJAH+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="179604665"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="179604665"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 14:27:28 -0800
IronPort-SDR: nDXiYRkUJhAiSE75pYaCXSq6Um6G1p5XlHc+q8pJ4F24vpuu2T8A/3GQth18rtFulhkgZF982K
 GwRnHHgiW9TQ==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="489084676"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 14:27:25 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 10BD420488;
        Thu, 11 Feb 2021 00:27:23 +0200 (EET)
Date:   Thu, 11 Feb 2021 00:27:23 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 2/7] i2c: Allow an ACPI driver to manage the device's
 power state during probe
Message-ID: <20210210222722.GF3@paasikivi.fi.intel.com>
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
 <20210205132505.20173-3-sakari.ailus@linux.intel.com>
 <20210209210410.GA2380@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209210410.GA2380@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 09, 2021 at 10:04:10PM +0100, Wolfram Sang wrote:
> 
> > + * @I2C_DRV_FL_ALLOW_LOW_POWER_PROBE: Let the ACPI driver manage the device's
> > + *				      power state during probe and remove
> 
> Well, for the functional change, I am happy if the ACPI guys are happy.
> The only minor nit for me would be removing the "_FL" snipplet from the

I'm actually renaming this as I2C_DRV_ACPI_WAIVE_D0_PROBE, with similar
changes to the function names. I opportunistically assume the ack holds
still. :-) I'll post v11 soon.

> name of the define because I think it is clear enough that this is a
> flag. If you need to resend anyhow, maybe it is worth a thought. It is
> not a big issue, so anyway:
> 
> Acked-by: Wolfram Sang <wsa@kernel.org>
> 
> because I assume this will go in via the ACPI tree?
> 

-- 
Sakari Ailus
