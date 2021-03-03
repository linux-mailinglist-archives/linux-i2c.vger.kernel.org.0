Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A42332C875
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Mar 2021 02:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238416AbhCDAtd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Mar 2021 19:49:33 -0500
Received: from mga17.intel.com ([192.55.52.151]:50123 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356507AbhCCKrh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Mar 2021 05:47:37 -0500
IronPort-SDR: oqeQfvXOFMO5qTf8EOHr0kEP7hqjGabRftgsQH72rLLDZ5LF+k9Nt+e1xGZibPyTcX4Mp5KFLe
 hX/N4AUH6Mdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="167049145"
X-IronPort-AV: E=Sophos;i="5.81,219,1610438400"; 
   d="scan'208";a="167049145"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 01:27:44 -0800
IronPort-SDR: JWQ4GYZNL/PGnPAfZQx9BLJ0pPS9sEg+0r0Lw8XZVMBpL4rUlyZxCMchHOm9zx3o232FIhaZpl
 EE9xmUUOhPRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,219,1610438400"; 
   d="scan'208";a="506723803"
Received: from mylly.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2021 01:27:41 -0800
Subject: Re: [PATCH v5 3/4] i2c: designware: Use pcim_alloc_irq_vectors() to
 allocate IRQ vectors
To:     Dejin Zheng <zhengdejin5@gmail.com>, corbet@lwn.net,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, bhelgaas@google.com, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20210226155056.1068534-1-zhengdejin5@gmail.com>
 <20210226155056.1068534-4-zhengdejin5@gmail.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <95c9e172-222f-32b7-1176-a3aa4b404f0a@linux.intel.com>
Date:   Wed, 3 Mar 2021 11:27:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210226155056.1068534-4-zhengdejin5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/26/21 5:50 PM, Dejin Zheng wrote:
> The pcim_alloc_irq_vectors() function, an explicit device-managed version
> of pci_alloc_irq_vectors(). If pcim_enable_device() has been called
> before, then pci_alloc_irq_vectors() is actually a device-managed
> function. It is used here as a device-managed function, So replace it
> with pcim_alloc_irq_vectors(). At the same time, Remove the
> pci_free_irq_vectors() function to simplify the error handling path.
> the freeing resources will take automatically when device is gone.
> 
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
