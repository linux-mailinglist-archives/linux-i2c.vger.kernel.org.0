Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00AA435996E
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Apr 2021 11:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbhDIJjn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Apr 2021 05:39:43 -0400
Received: from mga07.intel.com ([134.134.136.100]:58684 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230181AbhDIJjm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Apr 2021 05:39:42 -0400
IronPort-SDR: 3szgRF2x0NvipUZ1oXfZRfKVwDvKr5R5l4Eqeks5AUReMW1moIBmp5ClrZQAGt8PXUGfXyWhIa
 VggM+EfBmEZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="257710010"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="257710010"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 02:39:29 -0700
IronPort-SDR: hlETcu2U9uopbVL739WfoLNIFw1qKM5Cdj/mjvgfX5CKRhfYRm9Aro+fNaobMmcUfIbOWNJEG4
 ubDgjx6oQlpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="520225189"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Apr 2021 02:39:26 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 09 Apr 2021 12:39:26 +0300
Date:   Fri, 9 Apr 2021 12:39:26 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] i2c: Adding support for software nodes
Message-ID: <YHAgzunMHrnX2K2K@kuha.fi.intel.com>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210408215323.GK1900@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408215323.GK1900@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 08, 2021 at 11:53:23PM +0200, Wolfram Sang wrote:
> On Mon, Mar 29, 2021 at 01:50:35PM +0300, Heikki Krogerus wrote:
> > Hi,
> > 
> > The old device property API (device_add_properties()) is going to be
> > removed. These prepare the i2c subsystem and drivers for the change.
> > The change is fairly trivial in case of i2c. All we need to do is add
> > complete software nodes to the devices instead of only the device
> > properties in those nodes.
> > 
> > thanks,
> > 
> > Heikki Krogerus (12):
> >   i2c: Add support for software nodes
> >   ARM: davinci: Constify the software nodes
> >   ARM: omap1: osk: Constify the software node
> >   ARM: pxa: stargate2: Constify the software node
> >   ARM: s3c: mini2440: Constify the software node
> >   platform/x86: intel_cht_int33fe_microb: Constify the software node
> >   i2c: cht-wc: Constify the software node
> >   i2c: nvidia-gpu: Constify the software node
> >   i2c: icy: Constify the software node
> >   platform/chrome: chromeos_laptop - Prepare complete software nodes
> >   Input: elantech - Prepare a complete software node for the device
> >   i2c: Remove support for dangling device properties
> 
> I applied all patches to an immutable branch "i2c/software-nodes" now.
> Once buildbot successfully checked this branch, I will merge it into
> for-next and advertise it to interested parties.

Thank you!


-- 
heikki
