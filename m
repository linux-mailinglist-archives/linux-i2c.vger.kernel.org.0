Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 548D8244CF9
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Aug 2020 18:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgHNQtN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 12:49:13 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:54034 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbgHNQtM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Aug 2020 12:49:12 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1k6ct9-009PqS-7V; Fri, 14 Aug 2020 18:49:07 +0200
Date:   Fri, 14 Aug 2020 18:49:07 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Mohammed Billoo <mab@mab-labs.com>
Cc:     peter@korsgaard.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: ocores: add gaisler to platform data
Message-ID: <20200814164907.GB2239279@lunn.ch>
References: <20200814163134.29493-1-mab@mab-labs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814163134.29493-1-mab@mab-labs.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 14, 2020 at 12:31:33PM -0400, Mohammed Billoo wrote:
> There may be instances when the device tree is not suitable to interface
> with the ocores implementation. For example, when the FPGA/ASIC is
> not on the same silicon die (e.g. the communication between the CPU and
> the FPGA/ASIC is over PCI), information about the ocore implementation,
> such as whether the gaisler implementation is used, must be determined
> during runtime. In this case, the client driver would prepopulate the
> platform data during device instantiation. Thus, a boolean needs to be
> added in the platform data, to instruct the i2c-ocores driver whether
> the gaisler register callbacks should be used.
> 
> Signed-off-by: Mohammed Billoo <mab@mab-labs.com>
> ---
>  drivers/i2c/busses/i2c-ocores.c          | 4 ++++
>  include/linux/platform_data/i2c-ocores.h | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
> index f5fc75b65a19..0975f6797069 100644
> --- a/drivers/i2c/busses/i2c-ocores.c
> +++ b/drivers/i2c/busses/i2c-ocores.c
> @@ -647,6 +647,10 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>  			i2c->bus_clock_khz = pdata->bus_khz;
>  		else
>  			i2c->bus_clock_khz = 100;
> +		if (pdata->gaisler) {
> +			i2c->setreg = oc_setreg_grlib;
> +			i2c->getreg = oc_getreg_grlib;
> +		}
>  	} else {
>  		ret = ocores_i2c_of_probe(pdev, i2c);
>  		if (ret)
> diff --git a/include/linux/platform_data/i2c-ocores.h b/include/linux/platform_data/i2c-ocores.h
> index e6326cbafe59..8a5849f1e267 100644
> --- a/include/linux/platform_data/i2c-ocores.h
> +++ b/include/linux/platform_data/i2c-ocores.h
> @@ -14,6 +14,7 @@ struct ocores_i2c_platform_data {
>  	u32 clock_khz; /* input clock in kHz */
>  	u32 bus_khz; /* bus clock in kHz */
>  	bool big_endian; /* registers are big endian */
> +	bool gaisler; /* use grlib accessors */

Hi Mohammed

A collection of bools does not scale too well. How about an enum. And
you could add values for all the current accessorrs.

It is also possible to add a device tree node to a PCI device. So
platform data is not the only way to do this.

	 Andrew
