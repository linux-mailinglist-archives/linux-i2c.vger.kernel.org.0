Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A691F659E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jun 2020 12:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgFKKYf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Jun 2020 06:24:35 -0400
Received: from mga18.intel.com ([134.134.136.126]:47372 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727109AbgFKKYQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Jun 2020 06:24:16 -0400
IronPort-SDR: eATJIVbIFPtHnPKoZ78eEdHfPQRUm4ado4ti3nsOquuivgU+MC5ftY3CnYYisdmhqsItb6LHa2
 i46gzBO6dlBw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 03:24:15 -0700
IronPort-SDR: UEqAa5lR/dyBqxSH246g0J/oYmdn0+8tN/odmaaWGsUVnFeaxWZcloqEL6rhRkdZhqt6bmiIBo
 otevF4U7LfYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,499,1583222400"; 
   d="scan'208";a="473655215"
Received: from mylly.fi.intel.com (HELO [10.237.72.69]) ([10.237.72.69])
  by fmsmga006.fm.intel.com with ESMTP; 11 Jun 2020 03:24:14 -0700
Subject: Re: [PATCH] i2c: Drop stray comma in MODULE_AUTHOR statements
To:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
References: <20200611120347.4514e126@endymion>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <8d031eba-b152-98fa-49ff-ad912153b30a@linux.intel.com>
Date:   Thu, 11 Jun 2020 13:24:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200611120347.4514e126@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/11/20 1:03 PM, Jean Delvare wrote:
> It is not the common usage to have a comma between the name and the
> email address, so remove it.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   drivers/i2c/busses/i2c-exynos5.c |    4 ++--
>   drivers/i2c/busses/i2c-s3c2410.c |    2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> --- linux-5.7.orig/drivers/i2c/busses/i2c-exynos5.c	2020-06-01 01:49:15.000000000 +0200
> +++ linux-5.7/drivers/i2c/busses/i2c-exynos5.c	2020-06-11 11:58:27.645731676 +0200
> @@ -879,6 +879,6 @@ static struct platform_driver exynos5_i2
>   module_platform_driver(exynos5_i2c_driver);
>   
>   MODULE_DESCRIPTION("Exynos5 HS-I2C Bus driver");
> -MODULE_AUTHOR("Naveen Krishna Chatradhi, <ch.naveen@samsung.com>");
> -MODULE_AUTHOR("Taekgyun Ko, <taeggyun.ko@samsung.com>");
> +MODULE_AUTHOR("Naveen Krishna Chatradhi <ch.naveen@samsung.com>");
> +MODULE_AUTHOR("Taekgyun Ko <taeggyun.ko@samsung.com>");
>   MODULE_LICENSE("GPL v2");
> --- linux-5.7.orig/drivers/i2c/busses/i2c-s3c2410.c	2020-06-01 01:49:15.000000000 +0200
> +++ linux-5.7/drivers/i2c/busses/i2c-s3c2410.c	2020-06-11 11:58:34.216801885 +0200
> @@ -1267,5 +1267,5 @@ static void __exit i2c_adap_s3c_exit(voi
>   module_exit(i2c_adap_s3c_exit);
>   
>   MODULE_DESCRIPTION("S3C24XX I2C Bus driver");
> -MODULE_AUTHOR("Ben Dooks, <ben@simtec.co.uk>");
> +MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
>   MODULE_LICENSE("GPL");
> 
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
