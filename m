Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EECE16BA9E
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 08:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgBYHao (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 02:30:44 -0500
Received: from mga17.intel.com ([192.55.52.151]:56991 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728987AbgBYHao (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 02:30:44 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 23:30:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,483,1574150400"; 
   d="scan'208";a="316999593"
Received: from mylly.fi.intel.com (HELO [10.237.72.61]) ([10.237.72.61])
  by orsmga001.jf.intel.com with ESMTP; 24 Feb 2020 23:30:41 -0800
Subject: Re: [PATCH v1 11/40] i2c: designware: Use generic definitions for bus
 frequencies
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200224151530.31713-11-andriy.shevchenko@linux.intel.com>
 <20200224163040.GQ2667@lahna.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <a80fe28f-b54d-bb0e-0de0-4d6d06326620@linux.intel.com>
Date:   Tue, 25 Feb 2020 09:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224163040.GQ2667@lahna.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/24/20 6:30 PM, Mika Westerberg wrote:
> On Mon, Feb 24, 2020 at 05:15:01PM +0200, Andy Shevchenko wrote:
>> Since we have generic definitions for bus frequencies, let's use them.
>>
>> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
