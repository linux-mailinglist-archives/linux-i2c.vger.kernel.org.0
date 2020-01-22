Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9DF01453FC
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2020 12:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgAVLpN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jan 2020 06:45:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:47366 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbgAVLpN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jan 2020 06:45:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 2775BAC81;
        Wed, 22 Jan 2020 11:45:11 +0000 (UTC)
Date:   Wed, 22 Jan 2020 12:45:09 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 25/26] docs: i2c: old-module-parameters: use monospace
 for filenames
Message-ID: <20200122124509.3ec8a3a3@endymion>
In-Reply-To: <20200106074654.13842-1-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200106074654.13842-1-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon,  6 Jan 2020 08:46:54 +0100, Luca Ceresoli wrote:
> Use a monospace (literal) formatting for better readability of filenames.

This description and the subject are confusing. The strings you are
formatting are not filenames. They may be visible as sysfs attributes
and thus correspond to a filename, but primarily they are module
parameters and I2C client names.

> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/old-module-parameters.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/i2c/old-module-parameters.rst b/Documentation/i2c/old-module-parameters.rst
> index 80fb117883fd..fdc470a5f999 100644
> --- a/Documentation/i2c/old-module-parameters.rst
> +++ b/Documentation/i2c/old-module-parameters.rst
> @@ -10,9 +10,9 @@ I2C device driver binding control from user-space
>  Up to kernel 2.6.32, many I2C drivers used helper macros provided by
>  <linux/i2c.h> which created standard module parameters to let the user
>  control how the driver would probe I2C buses and attach to devices. These
> -parameters were known as "probe" (to let the driver probe for an extra
> -address), "force" (to forcibly attach the driver to a given device) and
> -"ignore" (to prevent a driver from probing a given address).
> +parameters were known as ``probe`` (to let the driver probe for an extra
> +address), ``force`` (to forcibly attach the driver to a given device) and
> +``ignore`` (to prevent a driver from probing a given address).
>  
>  With the conversion of the I2C subsystem to the standard device driver
>  binding model, it became clear that these per-module parameters were no
> @@ -46,8 +46,8 @@ New method (sysfs interface)::
>    # echo dummy 0x2f > /sys/bus/i2c/devices/i2c-1/new_device
>    # modprobe <driver>
>  
> -Of course, it is important to instantiate the "dummy" device before loading
> +Of course, it is important to instantiate the ``dummy`` device before loading
>  the driver. The dummy device will be handled by i2c-core itself, preventing
>  other drivers from binding to it later on. If there is a real device at the
>  problematic address, and you want another driver to bind to it, then simply
> -pass the name of the device in question instead of "dummy".
> +pass the name of the device in question instead of ``dummy``.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
