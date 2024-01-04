Return-Path: <linux-i2c+bounces-1117-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8FE824502
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 16:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F3BA1F257E9
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 15:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88A424209;
	Thu,  4 Jan 2024 15:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="krvH+vf8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F02D241FD;
	Thu,  4 Jan 2024 15:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F40FC433C8;
	Thu,  4 Jan 2024 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704382349;
	bh=iRcnDzw86EyKYKY1HoAEg7+jfRyhxW/8AJdQHVxMfJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=krvH+vf8alA3OYa9PQUG7prv2rIPcjCZ5kuHMdK+c3PwsxStQqpFCYmx5FNFsyai3
	 2i/0ruoxpd1QKA7a2mNiz8Q/gPGO9rhfdj9HEFN1mP+HmO/IAN7ocfDmJVt4+nGnZw
	 zWZobXaYovtT3amQgB9QV2L45gttEzKA9QzuBn+0=
Date: Thu, 4 Jan 2024 16:32:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
	alim.akhtar@samsung.com, jirislaby@kernel.org,
	s.nawrocki@samsung.com, tomasz.figa@gmail.com,
	cw00.choi@samsung.com, arnd@arndb.de, semen.protsenko@linaro.org,
	andre.draszik@linaro.org, saravanak@google.com,
	willmcvicker@google.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v2 04/12] tty: serial: samsung: prepare for different IO
 types
Message-ID: <2024010432-taco-moneyless-53e2@gregkh>
References: <20231228125805.661725-1-tudor.ambarus@linaro.org>
 <20231228125805.661725-5-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231228125805.661725-5-tudor.ambarus@linaro.org>

On Thu, Dec 28, 2023 at 12:57:57PM +0000, Tudor Ambarus wrote:
> GS101's Connectivity Peripheral blocks (peric0/1 blocks) which
> include the I3C and USI (I2C, SPI, UART) only allow 32-bit
> register accesses. If using 8-bit register accesses, a SError
> Interrupt is raised causing the system unusable.
> 
> Instead of specifying the reg-io-width = 4 everywhere, for each node,
> the requirement should be deduced from the compatible.
> 
> Prepare the samsung tty driver to allow IO types different than
> UPIO_MEM. ``struct uart_port::iotype`` is an unsigned char where all
> its 8 bits are exposed to uapi. We can't make NULL checks on it to
> verify if it's set, thus always set it from the driver's data.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> v2: new patch
> 
>  drivers/tty/serial/samsung_tty.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 66bd6c090ace..97ce4b2424af 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -72,6 +72,7 @@ struct s3c24xx_uart_info {
>  	const char		*name;
>  	enum s3c24xx_port_type	type;
>  	unsigned int		port_type;
> +	unsigned char		iotype;
>  	unsigned int		fifosize;
>  	unsigned long		rx_fifomask;
>  	unsigned long		rx_fifoshift;

Is there a reason you are trying to add unused memory spaces to this
structure for no valid reason?  I don't think you could have picked a
more incorrect place in there to add this :)

Please fix.

thanks,

greg k-h

