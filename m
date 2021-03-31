Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC2B34FDE2
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 12:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234935AbhCaKRN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 06:17:13 -0400
Received: from mga09.intel.com ([134.134.136.24]:23079 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234860AbhCaKRF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 06:17:05 -0400
IronPort-SDR: xJFtICqJWGVklP00BnsgpCh0Zh1K/08wp+Um/lD01rTEI2932GfcOi2WUXHSPfEtaPM9/sf9nA
 yKxRkfNf2+Yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="192076449"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="192076449"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 03:17:04 -0700
IronPort-SDR: 7a+WPhz86lGLshlF/+hswA4/OUk0s30sW7IdotTiZ5JAXAxOMkOn+KV5lsA1fKSwHom1yAvraz
 64ClYVfoorWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="516833785"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 31 Mar 2021 03:17:02 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 31 Mar 2021 13:17:01 +0300
Date:   Wed, 31 Mar 2021 13:17:01 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] i2c: Adding support for software nodes
Message-ID: <YGRMHf63aHniHIJW@kuha.fi.intel.com>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210331092232.GL1025@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331092232.GL1025@ninjato>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 31, 2021 at 11:22:32AM +0200, Wolfram Sang wrote:
> 
> > The old device property API (device_add_properties()) is going to be
> > removed. These prepare the i2c subsystem and drivers for the change.
> > The change is fairly trivial in case of i2c. All we need to do is add
> > complete software nodes to the devices instead of only the device
> > properties in those nodes.
> 
> This looks like a nice cleanup!
> 
> Reviewed-by: Wolfram Sang <wsa@kernel.org> # for the I2C parts
> 
> Which tree should this go into? I can offer I2C but am also fine with
> another one...

I think these go via I2C tree.

thanks,

-- 
heikki
