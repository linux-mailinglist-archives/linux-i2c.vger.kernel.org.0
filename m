Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BED6445588
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Nov 2021 15:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbhKDOpC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Nov 2021 10:45:02 -0400
Received: from mga18.intel.com ([134.134.136.126]:64182 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230345AbhKDOpC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 4 Nov 2021 10:45:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="218617958"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; 
   d="scan'208";a="218617958"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 07:42:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; 
   d="scan'208";a="730078268"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2021 07:42:22 -0700
Subject: Re: [PATCH v2] i2c: i801: Fix interrupt storm from SMB_ALERT signal
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        ck+kernelbugzilla@bl4ckb0x.de, stephane.poignant@protonmail.com
References: <20211028145311.1401355-1-jarkko.nikula@linux.intel.com>
 <20211029162532.43e3f7b2@endymion>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <f5a69031-485a-e645-9634-c978b76fb512@linux.intel.com>
Date:   Thu, 4 Nov 2021 16:42:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211029162532.43e3f7b2@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/29/21 5:25 PM, Jean Delvare wrote:
> In my first review, I suggested restoring SMBHSTCNT_INTREN to its
> original value at driver unload time. I stand on this position. If
> SMBHSTCNT_INTREN was originally 0, it will be 1 after the first
> transaction run by the driver. That's fine as long as
> SMBSLVCMD_SMBALERT_DISABLE is set, however i801_disable_host_notify()
> will clear that bit when you unload the driver. At that point, SMBus
> Alerts will keep generating interrupts. I'm not sure what happens if
> nobody is listening to that interrupt. But in case of a shared
> interrupt, the other driver is going to be flooded with interrupts
> forever if SMBus Alerts are being generated for whatever reason.
> 
Ah, yeah and it's really happening. I wanted to debug it by installing a 
shared dummy handler in another driver :-)

> So I suggest something like:
> 
> --- linux-5.14.orig/drivers/i2c/busses/i2c-i801.c	2021-10-29 11:15:48.283807055 +0200
> +++ linux-5.14/drivers/i2c/busses/i2c-i801.c	2021-10-29 16:21:32.392978256 +0200
> @@ -259,6 +259,7 @@ struct i801_priv {
>   	struct i2c_adapter adapter;
>   	unsigned long smba;
>   	unsigned char original_hstcfg;
> +	unsigned char original_hstcnt;
>   	unsigned char original_slvcmd;
>   	struct pci_dev *pci_dev;
>   	unsigned int features;
> @@ -1811,7 +1812,8 @@ static int i801_probe(struct pci_dev *de
>   		outb_p(inb_p(SMBAUXCTL(priv)) &
>   		       ~(SMBAUXCTL_CRC | SMBAUXCTL_E32B), SMBAUXCTL(priv));
>   
> -	/* Remember original Host Notify setting */
> +	/* Remember original Interrupt and Host Notify settings */
> +	priv->original_hstcnt = inb_p(SMBHSTCNT(priv)) & ~SMBHSTCNT_KILL;
>   	if (priv->features & FEATURE_HOST_NOTIFY)
>   		priv->original_slvcmd = inb_p(SMBSLVCMD(priv));
>   
> @@ -1875,6 +1877,7 @@ static void i801_remove(struct pci_dev *
>   {
>   	struct i801_priv *priv = pci_get_drvdata(dev);
>   
> +	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>   	i801_disable_host_notify(priv);
>   	i801_del_mux(priv);
>   	i2c_del_adapter(&priv->adapter);
> @@ -1898,6 +1901,7 @@ static void i801_shutdown(struct pci_dev
>   	struct i801_priv *priv = pci_get_drvdata(dev);
>   
>   	/* Restore config registers to avoid hard hang on some systems */
> +	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>   	i801_disable_host_notify(priv);
>   	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
>   }
> 
> In addition to your changes. What do you think?
> 
I think this is worth of a separate patch before mine since it does one 
driver improvement and helps to stop interrupt flood coming from the 
SMBus controller by unloading the driver.

You may add my Tested-by if you plan to send a patch or I can add commit 
log from you and send both patches together.

Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
