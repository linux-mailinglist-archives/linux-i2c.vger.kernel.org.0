Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A90BC5F5D4
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2019 11:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfGDJkc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Jul 2019 05:40:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:45300 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727256AbfGDJkc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 4 Jul 2019 05:40:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 8526AAC8E;
        Thu,  4 Jul 2019 09:40:30 +0000 (UTC)
Date:   Thu, 4 Jul 2019 11:40:29 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/2] i2c: i801: Fix PCI ID sorting
Message-ID: <20190704114029.2115132d@endymion>
In-Reply-To: <20190701131534.19537-1-jarkko.nikula@linux.intel.com>
References: <20190701131534.19537-1-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 1 Jul 2019 16:15:33 +0300, Jarkko Nikula wrote:
> I managed to break sorting in PCI ID defines in my last two patches:

Omg this is so bad. Let me fetch my whip ;-)

> commit 5cd1c56c42be ("i2c: i801: Add support for Intel Comet Lake")
> commit 9be1485accd4 ("i2c: i801: Add support for Intel Elkhart Lake")
> 
> Fix them up.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
