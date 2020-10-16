Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD69728FFD2
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Oct 2020 10:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404936AbgJPINl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Oct 2020 04:13:41 -0400
Received: from mga02.intel.com ([134.134.136.20]:21833 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404930AbgJPINl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Oct 2020 04:13:41 -0400
IronPort-SDR: ivCpVz+kvWduWeEQ5y0NsNIAGRV7VyhiM16MLYRm9xNNCYVXmgFA37YzPgfp3hCJ5YIcu4q0dd
 pko2R0FH8GIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="153475724"
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; 
   d="scan'208";a="153475724"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2020 01:13:40 -0700
IronPort-SDR: QU9hTsRT+YQbDXfFoVN+7UIXMtc3qJ0XZzGwjpTWK38JUooAaDrciUt5ssIFJ0prwpV1/XhAXV
 p4bgpTKKDkuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; 
   d="scan'208";a="357306524"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Oct 2020 01:13:38 -0700
Subject: Re: Designeware I2C slave confusing IC_INTR_STOP_DET handle
To:     Michael.Wu@vatics.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, morgan.chang@vatics.com,
        dean.hsiao@vatics.com, paul.chen@vatics.com
References: <5DB475451BAA174CB158B5E897FC1525B1293AB2@MBS07.vivotek.tw>
 <655eb758-c94b-d319-1866-6f1db413d337@linux.intel.com>
 <5DB475451BAA174CB158B5E897FC1525B12944EA@MBS07.vivotek.tw>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <124bea4c-f202-2dee-ea88-03215d229387@linux.intel.com>
Date:   Fri, 16 Oct 2020 11:13:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5DB475451BAA174CB158B5E897FC1525B12944EA@MBS07.vivotek.tw>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/16/20 10:26 AM, Michael.Wu@vatics.com wrote:
> I would like to submit your patch in order to do my modification based on this idea.
> You're the author but you didn't leave commit description.
> 
> I prepared one for this patch.
...
> 
> I'll submit it if you accept it, or you have other suggestions....?
> 
Please go ahead :-)

My patch was just one quick idea part of the discussion and I can freely 
let you take the authorship to real commits since obviously you have 
done more work to discover issue, test and write actual commits with 
change logs :-)

-- 
Jarkko

