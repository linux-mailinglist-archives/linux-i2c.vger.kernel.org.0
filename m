Return-Path: <linux-i2c+bounces-8735-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FA09FCF4C
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 01:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1864F7A1628
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 00:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074F1BA45;
	Fri, 27 Dec 2024 00:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pdtl9TsN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B84184F;
	Fri, 27 Dec 2024 00:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735259908; cv=none; b=l+lHeYGZvKO7ZyUi5OIHqA113raPmtJ4P7yGXB2SYLw+zWFFA7BVubH0WlqMNtTXMP97QIUOofnN/NKeALMS2gWGTLXZCgg0COxpmCa5f0cflV+PFOGhGPOI+pl60TS7QR3m6Av7yPe7LYDD5t618Qofn8rzR8yWfI/xAFm6KtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735259908; c=relaxed/simple;
	bh=QYzQx3fJtxFf/kFN+hqMx+i8Lscl27dsjoLsccZaqxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOuke9eh75AHHF4P4UfiiBGL7YgMS4JugXhKwZB+bc/dYJpADTO1OAfdEjACHd8c2vQMPo2KJ8mim50lI6JH2X9DfrP58v+zcxuO6+Mf1qvkkTGEdfZlvL6d/3PwPe+nDXYb5zINg+j0TndNrttd9wsSXD/JX6AFcrnLzJIQ1uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pdtl9TsN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E51CC4CED1;
	Fri, 27 Dec 2024 00:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735259908;
	bh=QYzQx3fJtxFf/kFN+hqMx+i8Lscl27dsjoLsccZaqxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pdtl9TsNLp09G/nHT+TFIxQvhXeMRS++6sBC7JCR/0C8/v+HyAOrQcgY81ZoBwDuX
	 sag9tS+bHXFqNyFeralGwBzFUBydtZgeuWhwlWFEbm5w3kOjovSZgsB5841zQ/OLwy
	 TxNXfZM5QQajKBBMbAMBL0oRn0Sp7mQLjnG/oSzqYY0+xtnKcUBwVmBCvlO/IVLn8h
	 /ubzetD/Qr5zLk9mKqGTiV3pATBkNVpIrzUsZo4ALAlrQg0L/me1Ra70pxi4cCXGeM
	 M/NhEKZFFTeK2DMOCrB1bYkuf5jXgGdePvAx+PPHThgWm+S8mtj6WpM0JKNBs2EaTc
	 VzbN8nxqJQA0Q==
Date: Fri, 27 Dec 2024 01:38:23 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, frank.li@nxp.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6] i2c: imx-lpi2c: add eDMA mode support for LPI2C
Message-ID: <ly7mzakvws75xcjncm6x24rie4xewt6ll4dlkz2kl5cblihi6n@7kivy2uqdwvp>
References: <20241125142909.1613245-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125142909.1613245-1-carlos.song@nxp.com>

Hi Carlos,

On Mon, Nov 25, 2024 at 10:29:09PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add eDMA mode support for LPI2C.
> 
> There are some differences between TX DMA mode and RX DMA mode.
> LPI2C MTDR register is Controller Transmit Data Register.
> When lpi2c send data, it is tx cmd register and tx data fifo.
> When lpi2c receive data, it is just a rx cmd register. LPI2C MRDR
> register is Controller Receive Data Register, received data are
> stored in this.
> 
> MTDR[8:10] is CMD field and MTDR[0:7] is DATA filed.
> +-----------+-------------------------------+
> |  C  M  D  |          D  A  T  A           |
> +---+---+---+---+---+---+---+---+---+---+---+
> | 10| 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
> +---+---+---+---+---+---+---+---+---+---+---+
> 
> MRDR is Controller Receive Data Register.
> MRDR[0:7] is DATA filed.
> +-------------------------------+
> |          D  A  T  A           |
> +---+---+---+---+---+---+---+---+
> | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
> +---+---+---+---+---+---+---+---+
> 
> When the LPI2C controller needs to send data, tx cmd and 8-bit data
> should be written into MTDR:
> CMD: 000b: Transmit the value in DATA[7:0].
> DATA: 8-bit data.
> 
> If lpi2c controller needs to send N 8-bit data, just write N times
> (CMD(W) + DATA(u8)) to MTDR.
> 
> When the LPI2C controller needs to receive data, rx cmd should be
> written into MTDR, the received data will be stored in the MRDR.
> 
> MTDR(CMD): 001b: Receive (DATA[7:0] + 1) 8-bit data.
> MTDR(DATA): byte counter.
> MRDR(DATA): 8-bit data.
> 
> So when lpi2c controller needs to receive N 8-bit data,
> 1. N <= 256:
> Write 1 time (CMD(R) + BYTE COUNT(N-1)) into MTDR and receive data from
> MRDR.
> 2. N > 256:
> Write N/256 times (CMD(R) + BYTE COUNT(255)) + 1 time (CMD(R) + BYTE
> COUNT(N%256)) into MTDR and receive data from MRDR.
> 
> Due to these differences, when lpi2c is in DMA TX mode, only enable TX
> channel to send data. But when lpi2c is in DMA RX mode, TX and RX channel
> are both enabled, TX channel is used to send RX cmd and RX channel is
> used to receive data.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Frank Li <frank.li@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

