Return-Path: <linux-i2c+bounces-10439-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E055A90E7A
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 00:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB2BB19074DB
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 22:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757C224887F;
	Wed, 16 Apr 2025 22:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="cW1jJYDP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-76.smtpout.orange.fr [80.12.242.76])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E863223E337;
	Wed, 16 Apr 2025 22:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744841593; cv=none; b=qn+LvRPXIUNAWVEF9X8qc0YJ+Gv+A6UaJb6a+qBd4Jkg+zVuaK1QPvIyMAKnCJsDxFtCI2WP0kggoIO/pueUR5mIQSPVFPIYjNEr5F08OYwWSVdxNwJdGPKiIX8b8hqM9wVuY4psIlUX0OPmUK/CIH+yP0Dv8B5N+sMYuByKABQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744841593; c=relaxed/simple;
	bh=3bKyZYWUalNrwQszDcOUxuHDdhvZgg/fHH3jT5lMJc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQex/BgEYwBBku+xLh2rlYni6onLLCrdjl/nnSSVpeDocu81BYwW1SlcRgudRgbXOY+KMrVRhR4nIsu4ft67C3V2tc+K/6lpX6w7gClJtrP4e9vSKRGUSHOQsKwBAfssrWZP6ZZ75sJ1DA9U/0KFq5HBPQaFrvy/0dKmn7lR/n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=cW1jJYDP; arc=none smtp.client-ip=80.12.242.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 5Az3ua0kIGpxt5Az7uBigD; Thu, 17 Apr 2025 00:11:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1744841517;
	bh=SjrNmlRrkGDIQEmcssUoZOv3MOsPjmBKRLcUPgyGHhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=cW1jJYDPKWw12QGyMUYkRY2pm9O5E96diRTHIjM04AJY7rvn4jkcD6nFPDv1/tcz/
	 smZnekfvEQuasuXGjF5oRPxOy3ZYGzp2lFV80lBBjYXw0gVOeg2g9E8ZLbyHqTBKqO
	 TixXXmfedo9zn8kURpjj75VmYXqqsbj7+NV1UoEhYB6AkVHXk2xzoNk/5XvRdP0eHJ
	 73TrAC2Ln4NDLpbDBNwJE2/qetoc10BaboQePhbOcXAdlZs5brc6HtsF6/SzwaUj/5
	 iz3WHY/vZMPb+S0DR7lew0VisfrIsBd5qgqExmrMqPCLDav72PpK9j7fwc0ZNqy4DI
	 ixR7c0BGBXOsQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 17 Apr 2025 00:11:57 +0200
X-ME-IP: 90.11.132.44
Message-ID: <f4742d44-0ea3-4af1-91ab-8bb5af6d781b@wanadoo.fr>
Date: Thu, 17 Apr 2025 00:11:53 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: Fix reference leak in of_i2c_register_devices
To: Sunny Patel <nueralspacetech@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1dacfce7-c66d-44c6-9a0c-2dd00bc24ffc@wanadoo.fr>
 <20250414154224.27836-1-nueralspacetech@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250414154224.27836-1-nueralspacetech@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 14/04/2025 à 17:42, Sunny Patel a écrit :
> Fix a potential reference leak in of_i2c_register_devices where the
> reference to the node is not released if device registration fails.
> This ensures proper reference management and avoids memory leaks.
> 
> Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
> ---
>   drivers/i2c/i2c-core-of.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index 02feee6c9ba9..7c50905de8f1 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -107,6 +107,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>   				 "Failed to create I2C device for %pOF\n",
>   				 node);
>   			of_node_clear_flag(node, OF_POPULATED);
> +			of_node_put(node);
>   		}
>   	}
>   

Hi,

Why resending this patch?
it is the same has before,, so my understanding is still the same and I 
still think that it is just wrong.

See [1].

CJ

[1]: 
https://lore.kernel.org/all/1dacfce7-c66d-44c6-9a0c-2dd00bc24ffc@wanadoo.fr/

