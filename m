Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6CA814539E
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2020 12:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgAVLSl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jan 2020 06:18:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:37754 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbgAVLSl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jan 2020 06:18:41 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id EE58FB109;
        Wed, 22 Jan 2020 11:18:38 +0000 (UTC)
Date:   Wed, 22 Jan 2020 12:18:37 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 24/26] docs: i2c: old-module-parameters: clarify this is
 for obsolete kernels
Message-ID: <20200122121837.32da9bd7@endymion>
In-Reply-To: <20200106074639.13763-1-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200106074639.13763-1-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon,  6 Jan 2020 08:46:39 +0100, Luca Ceresoli wrote:
> This section applies only to code for very old kernels. Avoid people
> reading this unnecessarily.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/old-module-parameters.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/i2c/old-module-parameters.rst b/Documentation/i2c/old-module-parameters.rst
> index 0503d2f0b127..80fb117883fd 100644
> --- a/Documentation/i2c/old-module-parameters.rst
> +++ b/Documentation/i2c/old-module-parameters.rst
> @@ -2,6 +2,11 @@
>  I2C device driver binding control from user-space
>  =================================================
>  
> +.. NOTE::
> +   Note: this section is only relevant if you are handling some old code
> +   found in kernel 2.6. If you work with more recent kernels, you can
> +   safely skip this section.
> +
>  Up to kernel 2.6.32, many I2C drivers used helper macros provided by
>  <linux/i2c.h> which created standard module parameters to let the user
>  control how the driver would probe I2C buses and attach to devices. These

Reviewed-by: Jean Delvare <jdelvare@suse.de>


-- 
Jean Delvare
SUSE L3 Support
