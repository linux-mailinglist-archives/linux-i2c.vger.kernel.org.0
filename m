Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E6165BD25
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jan 2023 10:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbjACJ1e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Jan 2023 04:27:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237288AbjACJ1P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Jan 2023 04:27:15 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34BAE0DB
        for <linux-i2c@vger.kernel.org>; Tue,  3 Jan 2023 01:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672738031; x=1704274031;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qwXaQBpbAsQP+OrCvWcG1IV50ZFpZvCgrRhebSBeb0Y=;
  b=ArUS363gv6ZJHV2dXj49ESK8AQuGgMI8s0uxyINuf4i5/d7ngm/6kFxG
   rtSNaDcW5ytMK3vIKlk4T7/iMwskeqc20WMpZLZPY+wdIM0kdqVaemLJD
   p6+A4UZsPab7rWFccKXDQUo7arxFy1V2YTP4cKF0kDE7j9U2920UZlnqA
   S65Lrlv1XVJwBKmP+TUtArEP8Bk7e9gdeeobgfipptd3JuGztxl+2G0x+
   aIKHYBU984xtfd/ya+Pw6OvUlgSvr2QN6WhcD7dKzVkRRooanM+yYA9qY
   2IZlHNlblZx9sVFusdJPp9+UZZ485M6x6hL8RI1v7A+Z8PlSfY0tXKagx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="309390598"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; 
   d="scan'208";a="309390598"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 01:27:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="828794791"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; 
   d="scan'208";a="828794791"
Received: from mylly.fi.intel.com (HELO [10.237.72.55]) ([10.237.72.55])
  by orsmga005.jf.intel.com with ESMTP; 03 Jan 2023 01:27:08 -0800
Message-ID: <421a3556-2feb-48b9-0755-46ebae6939eb@linux.intel.com>
Date:   Tue, 3 Jan 2023 11:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH] i2c: designware-pci: Add new PCI IDs for AMD NAVI GPU
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     mika.westerberg@linux.intel.com, jsd@semihalf.com,
        linux-i2c@vger.kernel.org, Rajesh1.Kumar@amd.com,
        Sanath S <Sanath.S@amd.com>
References: <20230102170955.1750734-1-Basavaraj.Natikar@amd.com>
 <Y7MUeRqYJ6peB3eh@smile.fi.intel.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Y7MUeRqYJ6peB3eh@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/2/23 19:29, Andy Shevchenko wrote:
> On Mon, Jan 02, 2023 at 10:39:55PM +0530, Basavaraj Natikar wrote:
>> Add additional supported PCI IDs for latest AMD NAVI GPU card which
>> has an integrated Type-C controller and designware I2C with PCI
>> interface.
> 
> Obviously looks correct from the code and style perspectives.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
