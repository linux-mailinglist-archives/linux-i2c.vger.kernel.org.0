Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B472A016A
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2019 14:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbfH1MQS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 28 Aug 2019 08:16:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:39040 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726300AbfH1MQS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 28 Aug 2019 08:16:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D43C2AC2C;
        Wed, 28 Aug 2019 12:16:16 +0000 (UTC)
Date:   Wed, 28 Aug 2019 14:16:23 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v1] i2c: i801: Avoid memory leak in
 check_acpi_smo88xx_device()
Message-ID: <20190828141623.5749c6d2@endymion>
In-Reply-To: <20190816131705.77750-1-andriy.shevchenko@linux.intel.com>
References: <20190816131705.77750-1-andriy.shevchenko@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Fri, 16 Aug 2019 16:17:05 +0300, Andy Shevchenko wrote:
> check_acpi_smo88xx_device() utilizes acpi_get_object_info() which in its turn
> allocates a buffer. User is responsible to clean allocated resources. The last
> has been missed in the original code. Fix it here.

FYI checkpatch.pl recommends not exceeding 75 columns for patch
descriptions (presumably because you get 4 blanks added in front by git
later).

> 
> While here, replace !ACPI_SUCCESS() with ACPI_FAILURE().
> 
> Fixes: 19b07cb4a187 ("i2c: i801: Register optional lis3lv02d I2C device on Dell machines")
> Cc: Pali Rohár <pali.rohar@gmail.com>
> Cc: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> (...)

Good catch.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
