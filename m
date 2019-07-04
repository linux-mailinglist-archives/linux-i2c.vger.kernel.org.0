Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5655F7A3
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2019 14:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbfGDMGL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Jul 2019 08:06:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:53832 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727622AbfGDMGL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 4 Jul 2019 08:06:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 8C7D9AE8D;
        Thu,  4 Jul 2019 12:06:09 +0000 (UTC)
Date:   Thu, 4 Jul 2019 14:06:08 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 2/2] i2c: i801: Add support for Intel Tiger Lake
Message-ID: <20190704140608.4c523fcf@endymion>
In-Reply-To: <20190701131534.19537-2-jarkko.nikula@linux.intel.com>
References: <20190701131534.19537-1-jarkko.nikula@linux.intel.com>
        <20190701131534.19537-2-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 1 Jul 2019 16:15:34 +0300, Jarkko Nikula wrote:
> Add SMBUS PCI ID for Intel Tiger Lake -LP.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  Documentation/i2c/busses/i2c-i801 | 1 +
>  drivers/i2c/busses/Kconfig        | 1 +
>  drivers/i2c/busses/i2c-i801.c     | 4 ++++
>  3 files changed, 6 insertions(+)
> (...)

LGTM.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support
