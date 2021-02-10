Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8533171A3
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Feb 2021 21:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbhBJUsI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Feb 2021 15:48:08 -0500
Received: from mga05.intel.com ([192.55.52.43]:55007 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232045AbhBJUsH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Feb 2021 15:48:07 -0500
IronPort-SDR: LUQnrxFF90Ccit3/4s8Yne5ZJZxS7MVzoo5rxwSEBr+9VurlqCc0/9qGs0b+RI9QCCLAwpU0XE
 JCKSmRXbwgmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="266989951"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="266989951"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 12:46:21 -0800
IronPort-SDR: lfrxqcEe4qvK2F9xrVIUg5SgwA6wit7M6Xgz98/oT3Fah64JTxbj6tKKPv0iOV1pfP/FvwJha4
 JjfuD5G3DL9w==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="578541017"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 12:46:17 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id B021E2011B;
        Wed, 10 Feb 2021 22:46:15 +0200 (EET)
Date:   Wed, 10 Feb 2021 22:46:15 +0200
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
Message-ID: <20210210204615.GC3@paasikivi.fi.intel.com>
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

Hi Wolfram,

On Tue, Feb 09, 2021 at 10:04:10PM +0100, Wolfram Sang wrote:
> 
> > + * @I2C_DRV_FL_ALLOW_LOW_POWER_PROBE: Let the ACPI driver manage the device's
> > + *				      power state during probe and remove
> 
> Well, for the functional change, I am happy if the ACPI guys are happy.
> The only minor nit for me would be removing the "_FL" snipplet from the
> name of the define because I think it is clear enough that this is a
> flag. If you need to resend anyhow, maybe it is worth a thought. It is

I'll remove _FL for v11.

> not a big issue, so anyway:
> 
> Acked-by: Wolfram Sang <wsa@kernel.org>

Thank you!

> 
> because I assume this will go in via the ACPI tree?

I think so, yes, if no-one has objections. Most of the changes are for ACPI
framework and docs.

-- 
Kind regards,

Sakari Ailus
