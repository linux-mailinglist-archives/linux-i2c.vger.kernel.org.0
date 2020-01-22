Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5D0145222
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2020 11:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbgAVKIH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jan 2020 05:08:07 -0500
Received: from mx2.suse.de ([195.135.220.15]:54120 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgAVKIH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jan 2020 05:08:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 58CA7AD9F;
        Wed, 22 Jan 2020 10:08:05 +0000 (UTC)
Date:   Wed, 22 Jan 2020 11:08:02 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/26] docs: i2c: instantiating-devices: use monospace
 for filenames
Message-ID: <20200122110802.02f24fd7@endymion>
In-Reply-To: <20200105225012.11701-22-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-22-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun,  5 Jan 2020 23:50:08 +0100, Luca Ceresoli wrote:
> Use a monospace (literal) formatting for better readability of filenames.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/instantiating-devices.rst | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/i2c/instantiating-devices.rst b/Documentation/i2c/instantiating-devices.rst
> index cbcafb36b417..f06d44c5b692 100644
> --- a/Documentation/i2c/instantiating-devices.rst
> +++ b/Documentation/i2c/instantiating-devices.rst
> @@ -224,15 +224,15 @@ In general, the kernel should know which I2C devices are connected and
>  what addresses they live at. However, in certain cases, it does not, so a
>  sysfs interface was added to let the user provide the information. This
>  interface is made of 2 attribute files which are created in every I2C bus
> -directory: new_device and delete_device. Both files are write only and you
> -must write the right parameters to them in order to properly instantiate,
> -respectively delete, an I2C device.
> +directory: ``new_device`` and ``delete_device``. Both files are write
> +only and you must write the right parameters to them in order to properly
> +instantiate, respectively delete, an I2C device.
>  
> -File new_device takes 2 parameters: the name of the I2C device (a string)
> -and the address of the I2C device (a number, typically expressed in
> -hexadecimal starting with 0x, but can also be expressed in decimal.)
> +File ``new_device`` takes 2 parameters: the name of the I2C device (a
> +string) and the address of the I2C device (a number, typically expressed
> +in hexadecimal starting with 0x, but can also be expressed in decimal.)
>  
> -File delete_device takes a single parameter: the address of the I2C
> +File ``delete_device`` takes a single parameter: the address of the I2C
>  device. As no two devices can live at the same address on a given I2C
>  segment, the address is sufficient to uniquely identify the device to be
>  deleted.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
