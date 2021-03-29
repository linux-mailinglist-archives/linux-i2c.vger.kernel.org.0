Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9281034D33D
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 17:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhC2PER (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 11:04:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:40984 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229711AbhC2PEE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 11:04:04 -0400
IronPort-SDR: hCpRzlmiI/2TGJVQ5HQe3QGk8rtq0ERUc++YX6ZS8lt89hR3D7Dab8mpKbjf5U9pB8H0D7sRaU
 2Q3N9b5xa0Lg==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="178694879"
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; 
   d="scan'208";a="178694879"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 08:04:02 -0700
IronPort-SDR: M4gkVW7u/AgypQOBXEwIVeagAuv7wqNZGsC6WKfkjdTrFQWMSX/O65nYfA2mMSx6rwNhPXDKFm
 N5c9qreGZmnQ==
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; 
   d="scan'208";a="376458095"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 08:03:56 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lQtQm-00H3Eu-RE; Mon, 29 Mar 2021 18:03:52 +0300
Date:   Mon, 29 Mar 2021 18:03:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, tfiga@chromium.org,
        sakari.ailus@linux.intel.com, rajmohan.mani@intel.com,
        rjw@rjwysocki.net, lenb@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, mgross@linux.intel.com,
        luzmaximilian@gmail.com, robert.moore@intel.com,
        erik.kaneda@intel.com, me@fabwu.ch, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org
Subject: Re: [PATCH v3 0/6] Introduce intel_skl_int3472 module
Message-ID: <YGHsWNXha0i1OwCN@smile.fi.intel.com>
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <fd2fbee6-e620-a594-8377-d2f22131af29@redhat.com>
 <5d336f50-5f25-fce2-04eb-5ad450c9cd5b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d336f50-5f25-fce2-04eb-5ad450c9cd5b@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 04, 2021 at 01:49:14PM +0000, Daniel Scally wrote:
> On 04/03/2021 13:37, Hans de Goede wrote:
> > On 2/22/21 2:07 PM, Daniel Scally wrote:

...

> >> The existing mfd/tps68470.c driver being thus superseded, it is removed.
> > Thank you for this patch series. Since there have already been a whole
> > bunch of review-comments, I've not taken a detailed look at this yet.
> 
> No problem, I'm hoping to do a v3 over the weekend anyway.

Do you mean v4?

I'm just wondering if you need any help.


-- 
With Best Regards,
Andy Shevchenko


