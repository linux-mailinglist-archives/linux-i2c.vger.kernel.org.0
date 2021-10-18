Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912D24328EF
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Oct 2021 23:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233730AbhJRVR3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Oct 2021 17:17:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:34884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232045AbhJRVR3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Oct 2021 17:17:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84994610A2;
        Mon, 18 Oct 2021 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634591717;
        bh=B2VOWNbfr2Ec8nOMEj4yZrlFiebEDRloREOoCsz+MBM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P/SOS8oNbx190hgij7zPHhywjewzuVnQFrXbI3+r7Ut7K828momsf9S2lDeSAW8NU
         vY+ATUzYSI9QuPWbH5ZGoTt4q4KpYiAXKmCcZLrzjobVtK27X6rcCv1ZpnFlC1bPW/
         ghthD98JMYwCLufVkxDqwszPyRoBpviVFZypln3kc8wYo6xy4/WMyXizvQD+HY6CTG
         tBfSolrrepu9+dtzuLWxTC2jgWeWaQldXNcPaINq7KEwAFpzEVnriPozAKHq6vjOjg
         r+eS96Lvza/UDUTbTl1oNzEVhaNbhLd9Z9Q+b2Ha60fiLVBcDaZ/U+Dzs2wp6U+KfS
         b7revybRkVRXw==
Date:   Mon, 18 Oct 2021 23:15:12 +0200
From:   Robert Richter <rric@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     jan.glauber@gmail.com, wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: thunderx: Fix some resource leak
Message-ID: <YW3j4MF/y4T6Rtzp@rric.localdomain>
References: <6657505309174d3ea6df14169d42b6df91298470.1634374036.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6657505309174d3ea6df14169d42b6df91298470.1634374036.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16.10.21 10:48:26, Christophe JAILLET wrote:
> We need to undo a 'pci_request_regions()' call in the error handling path
> of the probe function and in the remove function.

Isn't that devm and thus not needed?

> 
> Fixes: 22d40209de3b ("i2c: thunderx: Add i2c driver for ThunderX SOC")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> index 12c90aa0900e..2d37096a6968 100644
> --- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> @@ -177,8 +177,10 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
>  		return ret;
>  

There is a pcim_enable_device() call before all that, so the regions
should be removed on device release, see pcim_release().

-Robert

>  	i2c->twsi_base = pcim_iomap(pdev, 0, pci_resource_len(pdev, 0));
> -	if (!i2c->twsi_base)
> -		return -EINVAL;
> +	if (!i2c->twsi_base) {
> +		ret = -EINVAL;
> +		goto err_release_regions;
> +	}
>  
>  	thunder_i2c_clock_enable(dev, i2c);
>  	ret = device_property_read_u32(dev, "clock-frequency", &i2c->twsi_freq);
> @@ -231,6 +233,8 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
>  
>  error:
>  	thunder_i2c_clock_disable(dev, i2c->clk);
> +err_release_regions:
> +	pci_release_regions(pdev);
>  	return ret;
>  }
>  
> @@ -241,6 +245,7 @@ static void thunder_i2c_remove_pci(struct pci_dev *pdev)
>  	thunder_i2c_smbus_remove(i2c);
>  	thunder_i2c_clock_disable(&pdev->dev, i2c->clk);
>  	i2c_del_adapter(&i2c->adap);
> +	pci_release_regions(pdev);
>  }
>  
>  static const struct pci_device_id thunder_i2c_pci_id_table[] = {
> -- 
> 2.30.2
> 
