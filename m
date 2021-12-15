Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDB3475A62
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 15:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhLOOPu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 09:15:50 -0500
Received: from mga17.intel.com ([192.55.52.151]:25671 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhLOOPt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 09:15:49 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="219918230"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="219918230"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 06:15:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="545589932"
Received: from mylly.fi.intel.com (HELO [10.237.72.88]) ([10.237.72.88])
  by orsmga001.jf.intel.com with ESMTP; 15 Dec 2021 06:15:46 -0800
Message-ID: <1a3928c8-cc3a-c1b4-335d-0efdcd227d32@linux.intel.com>
Date:   Wed, 15 Dec 2021 16:15:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/6] i2c: designware-pci: Use temporary variable for
 struct device
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
 <3d67442c-87a7-e05b-7f69-de501fc0ad29@linux.intel.com>
 <YbnyQcpAXxSs9R2K@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <YbnyQcpAXxSs9R2K@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/15/21 15:48, Andy Shevchenko wrote:
>> Yet another differently named
>> "device" pointer more to the mess (Inconsistent naming use of struct
>> dw_i2c_dev *dev, struct dw_i2c_dev *i_dev and struct device *dev in the
>> i2c-designware-*).
> 
> As I said, please fix this inconsistency yourself how you find it better
> and I will use that in the future contributions.
> 
I've been saving it for some new comer who is looking for first kernel 
contribution tasks :-)

Jarkko


