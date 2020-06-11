Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F111F6542
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jun 2020 12:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgFKKC0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Jun 2020 06:02:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:55038 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726864AbgFKKC0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Jun 2020 06:02:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id EEF8DAEC3;
        Thu, 11 Jun 2020 10:02:28 +0000 (UTC)
Date:   Thu, 11 Jun 2020 12:02:18 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH] i2c: Use separate MODULE_AUTHOR() statements for
 multiple authors
Message-ID: <20200611120218.7324a7a7@endymion>
In-Reply-To: <20200610141142.2598882-1-jarkko.nikula@linux.intel.com>
References: <20200610141142.2598882-1-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jarrko,

On Wed, 10 Jun 2020 17:11:42 +0300, Jarkko Nikula wrote:
> Modules with multiple authors should use multiple MODULE_AUTHOR()
> statements. Split the i2c modules with multiple authors to use multiple
> MODULE_AUTHOR() statements.

Out of curiosity, is this documented anywhere, and what is the
rationale? FWIW, this change slightly increases the binary size of the
modules.

> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> I decided to change all these modules in one patch. I can split if needed.
> ---
>  drivers/i2c/algos/i2c-algo-pca.c   | 4 ++--
>  drivers/i2c/busses/i2c-ali1535.c   | 8 ++++----
>  drivers/i2c/busses/i2c-ali15x3.c   | 6 +++---
>  drivers/i2c/busses/i2c-emev2.c     | 3 ++-
>  drivers/i2c/busses/i2c-i801.c      | 3 ++-
>  drivers/i2c/busses/i2c-piix4.c     | 4 ++--
>  drivers/i2c/busses/i2c-pnx.c       | 3 ++-
>  drivers/i2c/busses/i2c-sh_mobile.c | 3 ++-
>  drivers/i2c/busses/i2c-sibyte.c    | 3 ++-
>  drivers/i2c/i2c-dev.c              | 4 ++--
>  10 files changed, 23 insertions(+), 18 deletions(-)
> (...)

If that's the way we are going then the patch looks good.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

However I see multi-author MODULE_AUTHOR() statements left in
i2c-nomadik.c, i2c-sirf.c and i2c-viapro.c, any reason why these are
not included in your patch?

-- 
Jean Delvare
SUSE L3 Support
