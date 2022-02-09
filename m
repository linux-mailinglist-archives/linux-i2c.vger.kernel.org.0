Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 407EB4AF4CF
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 16:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235445AbiBIPL1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 10:11:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbiBIPL0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 10:11:26 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B818C06157B;
        Wed,  9 Feb 2022 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644419490; x=1675955490;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lyXsC9OD4Jl0p7hHGMHZMEYslqW8vtmmjINc6IzC0jk=;
  b=WS6E7KNxpvmx59iH2xZwqAJe9giLUElfJteGiHuO5CZ1JDirGLGJjW+X
   ZAX6OuI2TCmQMsyq/+o+wacNYh/f9lwUddg/7cE01+mzhWW+XWV0oouVT
   9B+58HLQxqTcNx3EZ1j+tF/A7PaGWBvvK3apFc5dbfNC3inib9Rr2K3Yb
   T6QbUZz/dsUsHlYd7iMW8oE04OiGuQ/NsrDxONbLaA5EwLWSBY/wif+iv
   WkQFZjD3CdwnrGRB2fRHdL7xFlWhGG6D3qfqgrOBddSiGTmKX16AWD9++
   p1Q2BFg9HAfXqV4nD6RuVl+Oll5JO8H9/sFjhldCJLlLo7hDLHUcNRUGb
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="246806617"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="246806617"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 07:11:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="485272949"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by orsmga006.jf.intel.com with ESMTP; 09 Feb 2022 07:11:25 -0800
Message-ID: <2551b3f1-0dc0-aaf1-680c-9634d2a6b65d@linux.intel.com>
Date:   Wed, 9 Feb 2022 17:11:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH v4 0/2] i2c-designware: Add support for AMD PSP semaphore
Content-Language: en-US
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, andriy.shevchenko@linux.intel.com
Cc:     mika.westerberg@linux.intel.com, hdegoede@redhat.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com, thomas.lendacky@amd.com,
        alexander.deucher@amd.com, Nimesh.Easow@amd.com,
        mario.limonciello@amd.com, kernel test robot <lkp@intel.com>
References: <20220208141218.2049591-1-jsd@semihalf.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220208141218.2049591-1-jsd@semihalf.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/8/22 16:12, Jan Dabros wrote:
> This patchset comprises support for new i2c-designware controller setup on some
> AMD Cezanne SoCs, where x86 is sharing i2c bus with PSP. PSP uses the same
> controller and acts as an i2c arbitrator there (x86 is leasing bus from it).
> 
> First commit aims to improve generic i2c-designware code by adding extra locking
> on probe() and disable() paths. I would like to ask someone with access to
> boards which use Intel BayTrail(CONFIG_I2C_DESIGNWARE_BAYTRAIL) to verify
> behavior of my changes on such setup.
> 
I'm going to run overnight with both patches a test case that used to 
cause some activity on a shared I2C bus on Baytrail based MRD 7 tablet. 
Test below used to trigger system hang after a few hours - days before 
some PUNIT - graphics related issue was fixed a few years ago:

#!/bin/sh
X &
export DISPLAY=:0
sleep 2
xclock -update 30 -digital -geometry 500x50+1+1027 &
xload -update 60 -bg black -hl red -fg green -geometry 1916x250+1+774 &
sleep 1
xsetroot -solid red
xset s noblank s off -dpms
glxgears >/dev/null &
while :; do acpi -b; sleep 1.2; done
