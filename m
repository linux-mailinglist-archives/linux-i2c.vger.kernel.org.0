Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4C77A0D81
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 20:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241764AbjINSwA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 14:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242240AbjINSvY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 14:51:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D60E26A4;
        Thu, 14 Sep 2023 11:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694717258; x=1726253258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KszWFD7uEJMECze+ZzFhWWOJ6ppfHHEXQ57ZsZiQ0vU=;
  b=iPDDzN3aMZdxOMkafpqtlwHpjrdA03fxGF5QniT7p93ngK11y+rCvFxe
   JyWnMl7QKhHSdx0xxi490gqYWITc6ZoGMIzZBsI4kYa+Xb+UcMCEIzAu7
   K21Y+Pi8BFjxpRLMil/BnfznPTkkUAvPgih+dGlCoSBtqmGs3FKZZprt2
   QQkJwpwKWtYQ7NkDuN4XW31hyZNk3wz5xUj1VZ3G9LBOB1pgV90+xJ9o6
   t97vAVwW754C3hp/Wx14YML64jTVzIR7voBAM6tLTIaMGwwmKzQamMAIT
   z7ChdXxJ2Usb8XVrwnIeVlTD4XmgRupx/bRTDTMrItwmAaS6qpAOh8ghM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376380656"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="376380656"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 11:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="859824866"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="859824866"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 11:47:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qgrMz-00000008Lih-3amt;
        Thu, 14 Sep 2023 21:47:17 +0300
Date:   Thu, 14 Sep 2023 21:47:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Bottorff <janb@os.amperecomputing.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalrayinc.com>
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <ZQNVNfnJ56XOv+hS@smile.fi.intel.com>
References: <20230913232938.420423-1-janb@os.amperecomputing.com>
 <ZQNVCVHLQvA8s9F9@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQNVCVHLQvA8s9F9@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 14, 2023 at 09:46:34PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 13, 2023 at 04:29:38PM -0700, Jan Bottorff wrote:

> > ---
> 
> Changelog?

No need to resend, just reply with a bullet list of what has been done
in v1 --> v2.

-- 
With Best Regards,
Andy Shevchenko


