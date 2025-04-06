Return-Path: <linux-i2c+bounces-10103-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ECBA7CF67
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Apr 2025 20:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32F3A188C821
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Apr 2025 18:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3529154BF0;
	Sun,  6 Apr 2025 18:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="WkqRMuJl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0527955E69;
	Sun,  6 Apr 2025 18:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743963362; cv=none; b=h5yitPt3G2QykQrob7WXJK+/6RQzmslPIuKKHkPckowk8IEAmEImyhSvwMeB+TUFPDDTzNJpWKtBpBE7pzzM19QeOTHIgIwopSnUwWh9JxG66bpp8wMSOcx/+VP+FhSDnvqESjlJxn/IQJVZvkYpabwCTJM9lMvp6lXOJmuH+ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743963362; c=relaxed/simple;
	bh=Or+lF0/ZbsQ6jbELO4bHg88MpeiUXKXg0thJ3mseWi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmuLJGvQ62xfedWef4w+5QE0aeHbj2SMmjm3UcTspNz6GUqHM0M5zMxYSaZ18Z7EFCiVvdbr2yTRv/38JAhQjYx6dET/kKfJB1jHDvDW00IzWAev7E5BdK+oQZ+xIGY2/ZSVQEVTBNKrwYbkWLMD2EA73khcavcSu9rfCosWLe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=WkqRMuJl; arc=none smtp.client-ip=80.12.242.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 1UO6uCEDqk6Kc1UO9uCYzb; Sun, 06 Apr 2025 20:06:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743962794;
	bh=ZZuZBuWpQ4m4QhPze/IZCZP8nQ/j+5lRNXj0SrvdVBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=WkqRMuJlGbPB+qrqKCc9gws3bwnl5Sdqdeb6x61nRE/jrLiDqJG/pyPruUf+5RheZ
	 OJdGRY5+yJqOLpmrRnM1kbfLAR+1IO0Vpi2mTgwZ5p08g3nz//7AFQ1eWZ/jqefpFu
	 AzwaV2ynKksfXICF48gR4orUXXYxJeajWrNkBhc4sVK/Us8P847YKmCBx0kgTXvGKj
	 6sScMbOKirunK4c9zsnQ0lfasMNK2wh5oHD68jQ61anspQygd/jts37FFa8UezjDTS
	 3PMM1w2Jdq3/Pi7H07PtrRJbpzWXYP4GhcY/gP674tef8rP+cm6HLyxAhFXHW13/JK
	 dJIR9o4HVYf2w==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 06 Apr 2025 20:06:34 +0200
X-ME-IP: 90.11.132.44
Message-ID: <33bf15be-f99a-40c1-a97c-a51ca8fa4c9e@wanadoo.fr>
Date: Sun, 6 Apr 2025 20:06:29 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: Fix reference leak in of_i2c_register_devices
To: Sunny Patel <nueralspacetech@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250406134843.67702-1-nueralspacetech@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250406134843.67702-1-nueralspacetech@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 06/04/2025 à 15:48, Sunny Patel a écrit :
> Fix a potential reference leak in of_i2c_register_devices where the
> reference to the node is not released if device registration fails.
> This ensures proper reference management and avoids memory leaks.

There is no early exit path in the for_each_available_child_of_node() 
block, so of_node_put((node) is called for all the nodes that are iterated.

Can you elaborate and explain how the reference leak can occur?

CJ

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


