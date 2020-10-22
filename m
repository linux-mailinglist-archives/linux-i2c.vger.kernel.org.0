Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3938629605A
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Oct 2020 15:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S368027AbgJVNuL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Oct 2020 09:50:11 -0400
Received: from mga05.intel.com ([192.55.52.43]:30260 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S368021AbgJVNuK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 22 Oct 2020 09:50:10 -0400
IronPort-SDR: J/3rNtxkYhJTxLu2+PUhEJ/QDABaI8Kd6Pp+BXPl4EfFPUDR6e7g0klBrEYc0vz3ANToopeBdm
 3Zqjh7OI+Z9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="252226602"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="252226602"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 06:50:06 -0700
IronPort-SDR: UmvmZgYrQJluVawmVk0ysP1kYPZEoyDPFdcl8i1Z/Kkio6aApOwta6WI7pybKS4m49t2vq7e3a
 /GHcBHk4xaVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="359865513"
Received: from mylly.fi.intel.com (HELO [10.237.72.187]) ([10.237.72.187])
  by orsmga007.jf.intel.com with ESMTP; 22 Oct 2020 06:50:04 -0700
Subject: Re: [PATCH v2] i2c: designware: call
 i2c_dw_read_clear_intrbits_slave() once
To:     Michael Wu <michael.wu@vatics.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Morgan Chang <morgan.chang@vatics.com>
References: <20201022054625.21969-1-michael.wu@vatics.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <c96a6a99-5638-76c6-358e-e355f0f6b114@linux.intel.com>
Date:   Thu, 22 Oct 2020 16:50:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022054625.21969-1-michael.wu@vatics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 10/22/20 8:46 AM, Michael Wu wrote:
> @@ -217,10 +214,8 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
>   		if (!i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
>   				     &val))
>   			dev_vdbg(dev->dev, "Byte %X acked!", val);
> -	} else {
> +	} else
>   		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
> -		stat = i2c_dw_read_clear_intrbits_slave(dev);
> -	}
>   
Minor nit.  Please don't remove braces here since the upper part of if 
statement has them.

 From Documentation/process/coding-style.rst:
"
This does not apply if only one branch of a conditional statement is a 
single
statement; in the latter case use braces in both branches:

.. code-block:: c

         if (condition) {
                 do_this();
                 do_that();
         } else {
                 otherwise();
         }
"

Otherwise looks good to me.

Jarkko
