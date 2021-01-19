Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D19DA2FC3B1
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 23:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392063AbhASOgs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:36:48 -0500
Received: from mga14.intel.com ([192.55.52.115]:24189 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392507AbhASMLB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Jan 2021 07:11:01 -0500
IronPort-SDR: 1Pw/fl4YQkGK9dL5hnNMHPauftIiGwcT3MWeFDmw8wcX4kdCw5Tz8F6m+RYlgHoUVdVin8g2o6
 M8QxvAOesd0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="178137054"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="178137054"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 04:09:15 -0800
IronPort-SDR: xMqb8hfeOPLnTkkbAiPy4i8xYqxSZoP0r+/GV70D63gCQIewrtUKZXIvzrfuksudIYUE7v+TZF
 P52yM7EvwsBw==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="365727692"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 04:09:13 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1ppv-003Ut6-H7; Tue, 19 Jan 2021 14:10:15 +0200
Date:   Tue, 19 Jan 2021 14:10:15 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa@kernel.org>, Evan Green <evgreen@chromium.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v3 2/2] i2c: i2c-mux-gpio: Enable this driver in
 ACPI land
Message-ID: <20210119121015.GV4077@smile.fi.intel.com>
References: <20201118234025.376412-1-evgreen@chromium.org>
 <20201118153951.RESEND.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
 <CAHp75VdtwyCj7emc7Bk87q7kMQA0sSX81-aK-fMq4qTfTF-c_g@mail.gmail.com>
 <CAE=gft4OW7_pWfco4+kY65tbUGUDzXXDfsVMCP8MN93inVem4A@mail.gmail.com>
 <20210105102505.GG2000@ninjato>
 <CAE=gft42nQECU9Sn9yC-o8+VE9EDoRgLmqVR0Uwma+vBTiEh-Q@mail.gmail.com>
 <20210114195330.GA16693@kunai>
 <6fd88320-740e-2fd6-8823-500032d0e541@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fd88320-740e-2fd6-8823-500032d0e541@axentia.se>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 15, 2021 at 10:29:46AM +0100, Peter Rosin wrote:
> On 2021-01-14 20:53, Wolfram Sang wrote:
> >> Can this be accepted as-is, or should I resend?
> > 
> > Peter, can you have a look here as well?
> 
> I have no issues, but I was waiting for a response from Andy here. I have
> little knowledge of ACPI, and have previously made ignorant mistakes in
> that area. I would greatly appreciate Andy following through with his
> line of thinking...
> 
> So, if we ignore Andys review comments, then:
> 
> Acked-by: Peter Rosin <peda@axentia.se>

Sorry guys for me being silent, I have a lot of stuff which makes me under
DDoS-like attack (metaphorically speaking). I'm going to look at this just now.

-- 
With Best Regards,
Andy Shevchenko


