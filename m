Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF54D1F68F3
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jun 2020 15:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgFKNSl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Jun 2020 09:18:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:39974 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727037AbgFKNSl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Jun 2020 09:18:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id D338FAD17;
        Thu, 11 Jun 2020 13:18:43 +0000 (UTC)
Date:   Thu, 11 Jun 2020 15:18:38 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Barry Song <baohua@kernel.org>
Subject: Re: [PATCH v2] i2c: Use separate MODULE_AUTHOR() statements for
 multiple authors
Message-ID: <20200611151838.48451dfc@endymion>
In-Reply-To: <20200611110534.3274710-1-jarkko.nikula@linux.intel.com>
References: <20200611110534.3274710-1-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 11 Jun 2020 14:05:34 +0300, Jarkko Nikula wrote:
> Modules with multiple authors should use multiple MODULE_AUTHOR()
> statements according to comment in include/linux/module.h.
> 
> Split the i2c modules with multiple authors to use multiple
> MODULE_AUTHOR() statements.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> v2: Jean Delvare noticed i2c-nomadik.c, i2c-sirf.c and i2c-viapro.c were
> missing. Refer to module.h comment in commit log message.
> I decided to change all these modules in one patch. I can split if needed.
> ---
>  drivers/i2c/algos/i2c-algo-pca.c   | 4 ++--
>  drivers/i2c/busses/i2c-ali1535.c   | 8 ++++----
>  drivers/i2c/busses/i2c-ali15x3.c   | 6 +++---
>  drivers/i2c/busses/i2c-emev2.c     | 3 ++-
>  drivers/i2c/busses/i2c-i801.c      | 3 ++-
>  drivers/i2c/busses/i2c-nomadik.c   | 3 ++-
>  drivers/i2c/busses/i2c-piix4.c     | 4 ++--
>  drivers/i2c/busses/i2c-pnx.c       | 3 ++-
>  drivers/i2c/busses/i2c-sh_mobile.c | 3 ++-
>  drivers/i2c/busses/i2c-sibyte.c    | 3 ++-
>  drivers/i2c/busses/i2c-sirf.c      | 4 ++--
>  drivers/i2c/busses/i2c-viapro.c    | 6 +++---
>  drivers/i2c/i2c-dev.c              | 4 ++--
>  13 files changed, 30 insertions(+), 24 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
