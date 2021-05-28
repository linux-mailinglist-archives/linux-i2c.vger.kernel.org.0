Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAAF8393FD4
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 11:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235991AbhE1JZP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 05:25:15 -0400
Received: from mga11.intel.com ([192.55.52.93]:63633 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236007AbhE1JZP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 05:25:15 -0400
IronPort-SDR: YyqMaewHJMiDRaROYAaP+F7muYyAgTzM/y8OSWhn5OGN9l4Q4N+dkSPqzLz6OkI6iShznyqt81
 8zbTCFMt7DbA==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="199887478"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="199887478"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:23:36 -0700
IronPort-SDR: OYJiS7GMVN3kdCP0T3Fk5QW14KYnzMOD98Qg35WhHpFHrXVXzw//2E/90UMf61risilBjandaz
 r9+dIO/YD33g==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="465818184"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 02:23:33 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lmYiJ-00FHHv-24; Fri, 28 May 2021 12:23:31 +0300
Date:   Fri, 28 May 2021 12:23:31 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/6] i2c: acpi: Export i2c_acpi_find_client_by_adev()
 for users
Message-ID: <YLC2k/5hqNNBnN6e@smile.fi.intel.com>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
 <YLAAedlB6UaJQh0X@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLAAedlB6UaJQh0X@kunai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 27, 2021 at 10:26:33PM +0200, Wolfram Sang wrote:
> On Wed, May 26, 2021 at 03:43:17PM +0300, Andy Shevchenko wrote:
> > There is at least one user that will gain from the
> > i2c_acpi_find_client_by_adev() being exported.
> 
> No objections per se. But as the user is in staging, I want to ask if
> the use there is really a solution we would also accept outside of
> staging? Or is it a hack?

The similar OF API is exported for users, although amount of users and their
locations are different. The AtomISP driver is not in the best shape, I agree,
but for now any possible steps to make it better would be good steps in my
opinion. Later we may see if we can do this piece of code differently (IIRC
current way is probably the best taking into account legacy platforms support).

-- 
With Best Regards,
Andy Shevchenko


