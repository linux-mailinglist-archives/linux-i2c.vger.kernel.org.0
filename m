Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2093A377A0
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 17:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbfFFPSA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 11:18:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58866 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729029AbfFFPSA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 11:18:00 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 31276260D74;
        Thu,  6 Jun 2019 16:17:58 +0100 (BST)
Date:   Thu, 6 Jun 2019 17:17:55 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Vitor Soares <Vitor.Soares@synopsys.com>
Cc:     linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        bbrezillon@kernel.org, Joao.Pinto@synopsys.com,
        lorenzo.bianconi83@gmail.com
Subject: Re: [PATCH v2 2/3] i3c: add i3c_get_device_id helper
Message-ID: <20190606171755.0feb8998@collabora.com>
In-Reply-To: <eaa9eb66df6b4c9b577aec46fd440b99d763a5a2.1559831663.git.vitor.soares@synopsys.com>
References: <cover.1559831663.git.vitor.soares@synopsys.com>
        <eaa9eb66df6b4c9b577aec46fd440b99d763a5a2.1559831663.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu,  6 Jun 2019 17:12:03 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> This helper return the i3c_device_id structure in order the client
> have access to the driver data.
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
> Changes in v2:
>   move this function to drivers/i3c/device.c
> 
>  drivers/i3c/device.c       | 8 ++++++++
>  include/linux/i3c/device.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index 69cc040..a6d0796 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -200,6 +200,14 @@ struct i3c_device *dev_to_i3cdev(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(dev_to_i3cdev);
>  
> +const struct i3c_device_id *i3c_get_device_id(struct i3c_device *i3cdev)
> +{
> +	const struct i3c_driver *i3cdrv = drv_to_i3cdrv(i3cdev->dev.driver);
> +
> +	return i3cdrv->id_table;
> +}
> +EXPORT_SYMBOL_GPL(i3c_get_device_id);

That's not what I asked. I told you to expose i3c_device_match_id()
which already exists and is in master.c. What you really want is to get
the device_id entry that matches your device, not the first entry in
the table...

> +
>  /**
>   * i3c_driver_register_with_owner() - register an I3C device driver
>   *
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 5ecb055..e0415e1 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -187,6 +187,7 @@ static inline struct i3c_driver *drv_to_i3cdrv(struct device_driver *drv)
>  
>  struct device *i3cdev_to_dev(struct i3c_device *i3cdev);
>  struct i3c_device *dev_to_i3cdev(struct device *dev);
> +const struct i3c_device_id *i3c_get_device_id(struct i3c_device *i3cdev);
>  
>  static inline void i3cdev_set_drvdata(struct i3c_device *i3cdev,
>  				      void *data)

