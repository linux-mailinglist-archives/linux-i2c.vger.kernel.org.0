Return-Path: <linux-i2c+bounces-2577-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ACE88A784
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 16:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7D22B6061E
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 13:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B300D129E9D;
	Mon, 25 Mar 2024 10:26:11 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [80.241.59.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2566180A9D;
	Mon, 25 Mar 2024 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.59.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711354678; cv=none; b=orltkfsepUc2ao2XAM2UuamiGeciUvw0UYCaS/mjFMg+ukm4WjBGrj2BO2ufnEftGwzribU+UgrVC5EWuUHnQc7zLzr3AGXwqEJsiOQ20AUc0vHCLPs78iYoqgqnzaSo2Zi+Ol3b371/nQObK+9DZy+YLm49N6SUbthJhNuO1Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711354678; c=relaxed/simple;
	bh=K5U+cs+US6PiUstJ6PPMTAHeJ9ZJdg/fnjJHc+bJpIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nvz5sOBKvHMO47TEWs0VtrSMSiQ9RMwEypASfxMtF7+o4duhJ5aG7l2oXlCPnvFFkCYXxkpRXFoHXBg3vIosUBzPAOBnH8oB8Qr+dRr0ZCGSZVzu8UZGVNpy9VlV6D23Do/r43i+2S0b/U1YjoOPrTakNAt7hH9x/TeryN6rW+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de; spf=fail smtp.mailfrom=denx.de; arc=none smtp.client-ip=80.241.59.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=denx.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4V35C525S3z9sTP;
	Mon, 25 Mar 2024 09:07:45 +0100 (CET)
Message-ID: <7da930c8-d6d1-47e3-b346-b0e9e75edb54@denx.de>
Date: Mon, 25 Mar 2024 09:07:43 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 37/64] i2c: mt7621: reword according to newest
 specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-38-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20240322132619.6389-38-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/22/24 14:25, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

> ---
>   drivers/i2c/busses/i2c-mt7621.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 81d46169bc1f..c567a2cf4a90 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -117,26 +117,26 @@ static int mtk_i2c_check_ack(struct mtk_i2c *i2c, u32 expected)
>   	return ((ack & ack_expected) == ack_expected) ? 0 : -ENXIO;
>   }
>   
> -static int mtk_i2c_master_start(struct mtk_i2c *i2c)
> +static int mtk_i2c_host_start(struct mtk_i2c *i2c)
>   {
>   	iowrite32(SM0CTL1_START | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
>   	return mtk_i2c_wait_idle(i2c);
>   }
>   
> -static int mtk_i2c_master_stop(struct mtk_i2c *i2c)
> +static int mtk_i2c_host_stop(struct mtk_i2c *i2c)
>   {
>   	iowrite32(SM0CTL1_STOP | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
>   	return mtk_i2c_wait_idle(i2c);
>   }
>   
> -static int mtk_i2c_master_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
> +static int mtk_i2c_host_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
>   {
>   	iowrite32(cmd | SM0CTL1_TRI | SM0CTL1_PGLEN(page_len),
>   		  i2c->base + REG_SM0CTL1_REG);
>   	return mtk_i2c_wait_idle(i2c);
>   }
>   
> -static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   			       int num)
>   {
>   	struct mtk_i2c *i2c;
> @@ -157,7 +157,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   			goto err_timeout;
>   
>   		/* start sequence */
> -		ret = mtk_i2c_master_start(i2c);
> +		ret = mtk_i2c_host_start(i2c);
>   		if (ret)
>   			goto err_timeout;
>   
> @@ -169,14 +169,14 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   			if (pmsg->flags & I2C_M_RD)
>   				addr |= 1;
>   			iowrite32(addr, i2c->base + REG_SM0D0_REG);
> -			ret = mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 2);
> +			ret = mtk_i2c_host_cmd(i2c, SM0CTL1_WRITE, 2);
>   			if (ret)
>   				goto err_timeout;
>   		} else {
>   			/* 7 bits address */
>   			addr = i2c_8bit_addr_from_msg(pmsg);
>   			iowrite32(addr, i2c->base + REG_SM0D0_REG);
> -			ret = mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 1);
> +			ret = mtk_i2c_host_cmd(i2c, SM0CTL1_WRITE, 1);
>   			if (ret)
>   				goto err_timeout;
>   		}
> @@ -202,7 +202,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   				cmd = SM0CTL1_WRITE;
>   			}
>   
> -			ret = mtk_i2c_master_cmd(i2c, cmd, page_len);
> +			ret = mtk_i2c_host_cmd(i2c, cmd, page_len);
>   			if (ret)
>   				goto err_timeout;
>   
> @@ -222,7 +222,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   		}
>   	}
>   
> -	ret = mtk_i2c_master_stop(i2c);
> +	ret = mtk_i2c_host_stop(i2c);
>   	if (ret)
>   		goto err_timeout;
>   
> @@ -230,7 +230,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   	return i;
>   
>   err_ack:
> -	ret = mtk_i2c_master_stop(i2c);
> +	ret = mtk_i2c_host_stop(i2c);
>   	if (ret)
>   		goto err_timeout;
>   	return -ENXIO;
> @@ -247,7 +247,7 @@ static u32 mtk_i2c_func(struct i2c_adapter *a)
>   }
>   
>   static const struct i2c_algorithm mtk_i2c_algo = {
> -	.master_xfer	= mtk_i2c_master_xfer,
> +	.xfer	= mtk_i2c_xfer,
>   	.functionality	= mtk_i2c_func,
>   };
>   

Viele Grüße,
Stefan Roese

-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-51 Fax: (+49)-8142-66989-80 Email: sr@denx.de

