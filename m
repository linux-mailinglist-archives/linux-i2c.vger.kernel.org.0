Return-Path: <linux-i2c+bounces-425-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B027F5F8E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 13:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D53501C210DF
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 12:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB8D24B2B;
	Thu, 23 Nov 2023 12:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GQ8R7LoB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDBA249E9;
	Thu, 23 Nov 2023 12:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9131AC433C7;
	Thu, 23 Nov 2023 12:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700743976;
	bh=LHLHykxtIY2xxp+TU7ZVrj990Mtu/u0AeZhrUyYHGvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQ8R7LoBhZ7EK6WnOltHoEC/NN/TSrT/yOilyqvE1NAO4f+THqV6cXgmpq9/qzeE3
	 jtNZ1vWaHgTGqBF9w7uyZkWle8CkUP+3CuG5C6kj+MIBzsh7au2eYQH4NNrx2BkgXs
	 E8l2pT9hdxQOqNt+m6GgpRCjmvxRdgwGbXHV0ER0=
Date: Thu, 23 Nov 2023 12:47:06 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	linux-i2c@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] drivers/staging/greybus/i2c.c: Don't let i2c
 adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Message-ID: <2023112359-urgency-flashbulb-b870@gregkh>
References: <20231118180504.1785-1-hkallweit1@gmail.com>
 <20231118180504.1785-3-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118180504.1785-3-hkallweit1@gmail.com>

On Sat, Nov 18, 2023 at 07:04:56PM +0100, Heiner Kallweit wrote:
> After removal of the legacy eeprom driver the only remaining I2C
> client device driver supporting I2C_CLASS_SPD is jc42. Because this
> driver also supports I2C_CLASS_HWMON, adapters don't have to
> declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
> It's one step towards getting rid of I2C_CLASS_SPD mid-term.
> 
> Series was created supported by Coccinelle and its splitpatch.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> ---
>  drivers/staging/greybus/i2c.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

