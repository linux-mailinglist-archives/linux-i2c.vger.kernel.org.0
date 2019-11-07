Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1E05F35BE
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2019 18:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729830AbfKGRbz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Nov 2019 12:31:55 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:46455 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727132AbfKGRbz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Nov 2019 12:31:55 -0500
Received: from [109.168.11.45] (port=38784 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iSldO-005JY8-Rn; Thu, 07 Nov 2019 18:31:50 +0100
Subject: Re: [RFC PATCH 01/12] i2c: replace i2c_new_probed_device with an
 ERR_PTR variant
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-2-wsa+renesas@sang-engineering.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <cd25c799-bb10-aa59-8705-b079eff2165e@lucaceresoli.net>
Date:   Thu, 7 Nov 2019 18:31:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191106095033.25182-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 06/11/19 10:50, Wolfram Sang wrote:
> In the general move to have i2c_new_*_device functions which return
> ERR_PTR instead of NULL, this patch converts i2c_new_probed_device().
> 
> There are only few users, so this patch converts the I2C core and all
> users in one go. The function gets renamed to i2c_new_scanned_device()
> so out-of-tree users will get a build failure to understand they need to
> adapt their error checking code.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/i2c/instantiating-devices.rst | 10 ++++-----
>  Documentation/i2c/writing-clients.rst       |  8 +++----
>  drivers/i2c/i2c-core-base.c                 | 25 ++++++++++++++++-----
>  include/linux/i2c.h                         | 12 +++++++---
>  4 files changed, 37 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/i2c/instantiating-devices.rst b/Documentation/i2c/instantiating-devices.rst
> index 1238f1fa3382..875ebe9e78e3 100644
> --- a/Documentation/i2c/instantiating-devices.rst
> +++ b/Documentation/i2c/instantiating-devices.rst
> @@ -123,7 +123,7 @@ present or not (for example for an optional feature which is not present
>  on cheap variants of a board but you have no way to tell them apart), or
>  it may have different addresses from one board to the next (manufacturer
>  changing its design without notice). In this case, you can call
> -i2c_new_probed_device() instead of i2c_new_device().
> +i2c_new_scanned_device() instead of i2c_new_device().
>  
>  Example (from the nxp OHCI driver)::
>  
> @@ -139,8 +139,8 @@ Example (from the nxp OHCI driver)::
>  	i2c_adap = i2c_get_adapter(2);
>  	memset(&i2c_info, 0, sizeof(struct i2c_board_info));
>  	strscpy(i2c_info.type, "isp1301_nxp", sizeof(i2c_info.type));
> -	isp1301_i2c_client = i2c_new_probed_device(i2c_adap, &i2c_info,
> -						   normal_i2c, NULL);
> +	isp1301_i2c_client = i2c_new_scanned_device(i2c_adap, &i2c_info,
> +						    normal_i2c, NULL);
>  	i2c_put_adapter(i2c_adap);
>  	(...)
>    }
> @@ -153,14 +153,14 @@ simply gives up.
>  The driver which instantiated the I2C device is responsible for destroying
>  it on cleanup. This is done by calling i2c_unregister_device() on the
>  pointer that was earlier returned by i2c_new_device() or
> -i2c_new_probed_device().
> +i2c_new_scanned_device().
>  
>  
>  Method 3: Probe an I2C bus for certain devices
>  ----------------------------------------------
>  
>  Sometimes you do not have enough information about an I2C device, not even
> -to call i2c_new_probed_device(). The typical case is hardware monitoring
> +to call i2c_new_scanned_device(). The typical case is hardware monitoring
>  chips on PC mainboards. There are several dozen models, which can live
>  at 25 different addresses. Given the huge number of mainboards out there,
>  it is next to impossible to build an exhaustive list of the hardware
> diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/writing-clients.rst
> index dddf0a14ab7c..ced309b5e0cc 100644
> --- a/Documentation/i2c/writing-clients.rst
> +++ b/Documentation/i2c/writing-clients.rst
> @@ -185,14 +185,14 @@ Sometimes you know that a device is connected to a given I2C bus, but you
>  don't know the exact address it uses.  This happens on TV adapters for
>  example, where the same driver supports dozens of slightly different
>  models, and I2C device addresses change from one model to the next.  In
> -that case, you can use the i2c_new_probed_device() variant, which is
> +that case, you can use the i2c_new_scanned_device() variant, which is
>  similar to i2c_new_device(), except that it takes an additional list of
>  possible I2C addresses to probe.  A device is created for the first
>  responsive address in the list.  If you expect more than one device to be
> -present in the address range, simply call i2c_new_probed_device() that
> +present in the address range, simply call i2c_new_scanned_device() that
>  many times.
>  
> -The call to i2c_new_device() or i2c_new_probed_device() typically happens
> +The call to i2c_new_device() or i2c_new_scanned_device() typically happens
>  in the I2C bus driver. You may want to save the returned i2c_client
>  reference for later use.
>  
> @@ -237,7 +237,7 @@ Device Deletion
>  ---------------
>  
>  Each I2C device which has been created using i2c_new_device() or
> -i2c_new_probed_device() can be unregistered by calling
> +i2c_new_scanned_device() can be unregistered by calling
>  i2c_unregister_device().  If you don't call it explicitly, it will be
>  called automatically before the underlying I2C bus itself is removed, as a
>  device can't survive its parent in the device driver model.
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 6a5183cffdfc..380bde2dc23e 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2277,10 +2277,10 @@ int i2c_probe_func_quick_read(struct i2c_adapter *adap, unsigned short addr)
>  EXPORT_SYMBOL_GPL(i2c_probe_func_quick_read);
>  
>  struct i2c_client *
> -i2c_new_probed_device(struct i2c_adapter *adap,
> -		      struct i2c_board_info *info,
> -		      unsigned short const *addr_list,
> -		      int (*probe)(struct i2c_adapter *adap, unsigned short addr))
> +i2c_new_scanned_device(struct i2c_adapter *adap,
> +		       struct i2c_board_info *info,
> +		       unsigned short const *addr_list,
> +		       int (*probe)(struct i2c_adapter *adap, unsigned short addr))
>  {
>  	int i;
>  
> @@ -2310,11 +2310,24 @@ i2c_new_probed_device(struct i2c_adapter *adap,
>  
>  	if (addr_list[i] == I2C_CLIENT_END) {
>  		dev_dbg(&adap->dev, "Probing failed, no device found\n");
> -		return NULL;
> +		return ERR_PTR(-ENODEV);
>  	}
>  
>  	info->addr = addr_list[i];
> -	return i2c_new_device(adap, info);
> +	return i2c_new_client_device(adap, info);
> +}
> +EXPORT_SYMBOL_GPL(i2c_new_scanned_device);
> +
> +struct i2c_client *
> +i2c_new_probed_device(struct i2c_adapter *adap,
> +		      struct i2c_board_info *info,
> +		      unsigned short const *addr_list,
> +		      int (*probe)(struct i2c_adapter *adap, unsigned short addr))
> +{
> +	struct i2c_client *client;
> +
> +	client = i2c_new_scanned_device(adap, info, addr_list, probe);
> +	return IS_ERR(client) ? NULL : client;
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_probed_device);
>  
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index aaf57d9b41db..df3044513464 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -452,10 +452,16 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
>   * a default probing method is used.
>   */
>  extern struct i2c_client *
> +i2c_new_scanned_device(struct i2c_adapter *adap,
> +		       struct i2c_board_info *info,
> +		       unsigned short const *addr_list,
> +		       int (*probe)(struct i2c_adapter *adap, unsigned short addr));
> +
> +extern struct i2c_client *

I beg your pardon for the newbie question, perhaps a stupid one, kind of
nitpicking, and not even strictly related to this patch, but what's the
reason for these functions being declared extern?

For the rest LGTM, I did some grep checks before/after the patchset, ran
some build tests, and everything looks fine.

-- 
Luca
