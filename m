Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55B2114525E
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2020 11:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728900AbgAVKQ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jan 2020 05:16:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:58942 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726004AbgAVKQ3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jan 2020 05:16:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 3AFFFB2FA;
        Wed, 22 Jan 2020 10:16:27 +0000 (UTC)
Date:   Wed, 22 Jan 2020 11:16:25 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 23/26] docs: i2c: old-module-parameters: fix internal
 hyperlink
Message-ID: <20200122111625.6685b606@endymion>
In-Reply-To: <20200105225012.11701-23-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-23-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun,  5 Jan 2020 23:50:09 +0100, Luca Ceresoli wrote:
> Use ReST syntax so that a proper hyperlink is generated.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/old-module-parameters.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/i2c/old-module-parameters.rst b/Documentation/i2c/old-module-parameters.rst
> index 78a6950e5763..0503d2f0b127 100644
> --- a/Documentation/i2c/old-module-parameters.rst
> +++ b/Documentation/i2c/old-module-parameters.rst
> @@ -12,8 +12,7 @@ address), "force" (to forcibly attach the driver to a given device) and
>  With the conversion of the I2C subsystem to the standard device driver
>  binding model, it became clear that these per-module parameters were no
>  longer needed, and that a centralized implementation was possible. The new,
> -sysfs-based interface is described in the documentation file
> -"instantiating-devices", section "Method 4: Instantiate from user-space".
> +sysfs-based interface is described in :doc:`instantiating-devices`.

I object to removing the reference to the section. I think this is
saving the reader some time so it is valuable.

>  
>  Below is a mapping from the old module parameters to the new interface.
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
