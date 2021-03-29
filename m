Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8615434D018
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 14:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhC2McS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 08:32:18 -0400
Received: from mga17.intel.com ([192.55.52.151]:11918 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231146AbhC2McM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 08:32:12 -0400
IronPort-SDR: 0xQvpAG1mY2cPWEjAPIllAS2rDCicg6XeGm3G7XAkSZ2DL5qg13eb2Mi0K3ArkdDJYJkkYdlex
 apPpo+o0fO8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="171551546"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="171551546"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 05:32:12 -0700
IronPort-SDR: XNUAT9FGvtKOOmAOJvi+MusdFSjG0rGuN8F+duCts71V2eODpQLH0SNAk5waqN9sVUKzZT1ISZ
 TxXnF3Jl6O9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="515994797"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 29 Mar 2021 05:32:10 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 29 Mar 2021 15:32:09 +0300
Date:   Mon, 29 Mar 2021 15:32:09 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/12] ARM: s3c: mini2440: Constify the software node
Message-ID: <YGHIyRu625C/kgRL@kuha.fi.intel.com>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-6-heikki.krogerus@linux.intel.com>
 <709e434f-9e35-bdd1-7785-1938b2fb80ee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <709e434f-9e35-bdd1-7785-1938b2fb80ee@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 29, 2021 at 12:58:41PM +0200, Krzysztof Kozlowski wrote:
> On 29/03/2021 12:50, Heikki Krogerus wrote:
> > Additional device properties are always just a part of a
> > software fwnode. If the device properties are constant, the
> > software node can also be constant.
> > 
> Hi,
> 
> Thanks for your work.
> 
> I did not get the cover letter nor other patches from this set and I
> don't see how the i2c uses the swnode. This makes difficult to judge
> whether this looks reasonable. At least without the context the title
> looks misleading - you add software_node or change to use software_node
> instead of constifying it.

OK, I'll try to open this up somehow...

Whenever additional device properties are added to devices by using
the old device property API (device_add_properties()) that also i2c
core code uses, in reality a software node is always created to hold
those properties. It's just always dynamically allocated.

The goal of this series is to prepare the i2c subsystem and drivers
for the removal of that old device property API, but I did not see
that as relevant info for this patch, because even if we did not in
the end remove that old API, this change is still useful.

The patch does exactly what the subject says. After this we supply the
device a constant software node instead of a dynamically allocated one.


thanks,

-- 
heikki
