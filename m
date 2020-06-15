Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE401F91A4
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 10:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbgFOIhP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 04:37:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:47578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728603AbgFOIhO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 04:37:14 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 284562067B;
        Mon, 15 Jun 2020 08:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592210234;
        bh=wLAQMOP7sUI7QW1xWDZ25vUVU0vunXdDeSZzftuei+k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hyMmJdPowVHu1mOFM4vJ7GRMRbYbqAzUrkzkMhiGtwzejuwM/49hRrIEz717PRTAZ
         jAaT4JLSVKEqwgqHse2wKzA8mlHeu0lnUgIJ3HHjvGO9LSmvtdoJo/JQu9xabompNq
         dzsGxznodwlsMMW9yD0VJkBL2oJkPvfo+7J7G/Q0=
Date:   Mon, 15 Jun 2020 10:37:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] Documentation: media: convert to use
 i2c_new_client_device()
Message-ID: <20200615103710.5e61104c@coco.lan>
In-Reply-To: <20200615075816.2848-6-wsa+renesas@sang-engineering.com>
References: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
        <20200615075816.2848-6-wsa+renesas@sang-engineering.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Em Mon, 15 Jun 2020 09:58:14 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> escreveu:

> Move away from the deprecated API and advertise the new one.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> I'd like to push it via I2C for 5.8-rc2.

OK!

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> 
>  Documentation/driver-api/media/v4l2-subdev.rst    | 2 +-
>  Documentation/userspace-api/media/conf_nitpick.py | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index 6e71f67455bb..bc7e1fc40a9d 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -451,7 +451,7 @@ The bridge driver also has some helper functions it can use:
>  					"module_foo", "chipid", 0x36, NULL);
>  
>  This loads the given module (can be ``NULL`` if no module needs to be loaded)
> -and calls :c:func:`i2c_new_device` with the given ``i2c_adapter`` and
> +and calls :c:func:`i2c_new_client_device` with the given ``i2c_adapter`` and
>  chip/address arguments. If all goes well, then it registers the subdev with
>  the v4l2_device.
>  
> diff --git a/Documentation/userspace-api/media/conf_nitpick.py b/Documentation/userspace-api/media/conf_nitpick.py
> index d0c50d75f518..0a8e236d07ab 100644
> --- a/Documentation/userspace-api/media/conf_nitpick.py
> +++ b/Documentation/userspace-api/media/conf_nitpick.py
> @@ -27,7 +27,7 @@ nitpick_ignore = [
>      ("c:func", "copy_to_user"),
>      ("c:func", "determine_valid_ioctls"),
>      ("c:func", "ERR_PTR"),
> -    ("c:func", "i2c_new_device"),
> +    ("c:func", "i2c_new_client_device"),
>      ("c:func", "ioctl"),
>      ("c:func", "IS_ERR"),
>      ("c:func", "KERNEL_VERSION"),



Thanks,
Mauro
