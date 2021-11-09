Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA37044AE4D
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 13:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237398AbhKINCN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 08:02:13 -0500
Received: from mga04.intel.com ([192.55.52.120]:12909 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237244AbhKINCN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Nov 2021 08:02:13 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="231158435"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="231158435"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 04:59:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="451882539"
Received: from mylly.fi.intel.com (HELO [10.237.72.159]) ([10.237.72.159])
  by orsmga006.jf.intel.com with ESMTP; 09 Nov 2021 04:59:14 -0800
Subject: Re: [PATCH v1 2/2] i2c: designware-pci: Set ideal timing parameters
 for Elkhart Lake PSE
To:     lakshmi.sowjanya.d@intel.com, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, wsa@kernel.org,
        bala.senthil@intel.com, pandith.n@intel.com
References: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
 <20211109103552.18677-2-lakshmi.sowjanya.d@intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <44b0646b-165a-065e-1029-026ef1b6cc27@linux.intel.com>
Date:   Tue, 9 Nov 2021 14:59:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211109103552.18677-2-lakshmi.sowjanya.d@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/9/21 12:35 PM, lakshmi.sowjanya.d@intel.com wrote:
> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> 
> Set optimal HCNT, LCNT and hold time values for all the speeds supported
> in Intel Programmable Service Engine I2C controller in Intel Elkhart
> Lake.
> 
> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
To both:

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
