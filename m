Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2124E745CE1
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 15:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbjGCNJx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 09:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbjGCNJt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 09:09:49 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F6BE6E;
        Mon,  3 Jul 2023 06:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688389788; x=1719925788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QZ/zCTxgUvgYpyM9lZeEIyhV+aOwlC3KMlPBTVwkteI=;
  b=Oy10oJb4VeEyEwzsCyN5kXc5Ud7F0vao0jvxlccUh0ogXiZCqwxOJuXo
   SdeGnfYGHumLe5tZXNy1RuIX30H85b0IrAPZ1wqnX/vb1bPh+EBAz7qjJ
   mSmum4jdbM/ShjVBg4XEYDSHhru3F4QC0u+VXaKwzkGE2OOuYOz+cPYE+
   Irx8jL+Se8DD6RgWJuWJVE0lNY9rcybi/tIesE26pAz5aoaWxC2+Ul0uG
   ZnOVP+e4dM2lxc1TmPHQ0X7YhWY7ATJrCsQWVKFZBS9pfi7nfP7qJI3h9
   MosnPcfY/En7FfgR1b/mTC/5VormX+BKZueql6uJY/XraxODmyz8MJMHS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="342470211"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="342470211"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 06:09:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="842665070"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="842665070"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 03 Jul 2023 06:09:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qGJJ6-001ruT-2R;
        Mon, 03 Jul 2023 16:09:32 +0300
Date:   Mon, 3 Jul 2023 16:09:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v4 0/5] ACPI: platform: Fix SMB0001 enumeration on
 Kontron devices
Message-ID: <ZKLIjAgJ5p/usyK3@smile.fi.intel.com>
References: <20230703121411.69606-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703121411.69606-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 03, 2023 at 03:14:06PM +0300, Andy Shevchenko wrote:
> After switching i2c-scmi driver to be a plaform one, it stopped
> being enumerated on number of Kontron platforms, because it's
> listed in the forbidden_id_list.
> 
> To resolve the situation, add a flag and check if there are resources
> privided for the forbiden device. If it is the case, the device must
> be skipped.

...

> Changelog v4:
> - dropped applied patch
> - added kernel doc for new helper (Rafael)
> - rewritten the commit message for the reason of a new helper (Rafael)
> - added a couple of patches for ACPI scan.c that can be applied later on

- converted to use boolean instead of integer (Rafael)
- added tag (Andi)

> Changelog v3:
> - provided completely rewritten solution (Rafael)
> - due to above, added two new patches
> - due to above, dropped tags from patch 3

-- 
With Best Regards,
Andy Shevchenko


