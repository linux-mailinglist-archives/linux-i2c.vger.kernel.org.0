Return-Path: <linux-i2c+bounces-9121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3687EA138E4
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 12:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C12A51881ED1
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 11:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98091DE4DF;
	Thu, 16 Jan 2025 11:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="r+PA8e2H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-17.smtpout.orange.fr [193.252.22.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4931DDC10;
	Thu, 16 Jan 2025 11:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737026623; cv=none; b=amJ3WBvSZ0miuHiMi8wlKGbTrBKMySM9icY2izJVeqN4QrFtk93MUvAN9DTTSJoNkafo1M/fCZfWzQjc9c/B6/ymV0qOdQKICkTekZk8GPIp06QVmfEVT2wMj7vKbLcx5jC0PCeLLzdrmfZrkq26sJBbDNfBfPWqflAARlpV5wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737026623; c=relaxed/simple;
	bh=eLlU4xsWGD+mHJN9rdcGWXT0y2PG9/3+22ofQ+9OFhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+PecoWI0pgM/UFOfbcyVHGDsVN5AnwjataX0LNXP28sp0AdxsdvW0SYAQnAV3CQCPadmuEkFTeprxc7RszTnKJTs0ZvTvRw4qncz92bRN6eb9GpxHafJX4z2Wd7doxKjkQPRGjUXi/BMFxaxQEVotxAISyHFEjI92etRv1dc0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=r+PA8e2H; arc=none smtp.client-ip=193.252.22.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id YNxutnYQDyahuYNxztVNSW; Thu, 16 Jan 2025 12:23:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737026613;
	bh=KYSXBkxUAldmT4pYPhPuw4hrkQ16dgPfLzABFQ4aYjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=r+PA8e2HPj0was0mFKVLZQQZlfkqZ9GExTlwcp6rhiMGzEQwKEnBrNopYyLOjzkjV
	 Hfdax7NZsCpupQyoqdlwmQzjsvsG0DkF7oLJLVGhYaY6GGf3BXGE14jADr43wx5Gid
	 DJx+plHJ8/0hBS3lmssIyYc3hqm6ufoIjKk3PvnjTuUy3sfoxcUYF3UwT8tL3MzyML
	 6L31hUpUn+QiHtOyDswKNkoLHOaQoN8lSLBbtfpwtVwcb+h2lYFs97t7AIZvjzZDor
	 g+mi7taF6wxdo1pmH5bedVLC5J3xEDvZGFPoMyS/JHqMeMEuSZy0xn/MN4HEzAijg4
	 9POxQT1vi3S1Q==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 16 Jan 2025 12:23:33 +0100
X-ME-IP: 124.33.176.97
Message-ID: <bdab6511-0e38-4932-a615-033d888364b1@wanadoo.fr>
Date: Thu, 16 Jan 2025 20:23:09 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] can: Add Nuvoton NCT6694 CAN support
To: Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, tmyu0@nuvoton.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com,
 alexandre.belloni@bootlin.com
References: <20250114033010.2445925-1-a0282524688@gmail.com>
 <20250114033010.2445925-5-a0282524688@gmail.com>
 <cef1b9bf-59f6-484d-861e-82b405653ca1@wanadoo.fr>
 <CAOoeyxVK=iBmj3BDX=D8a9=GFBkE158jbq3Rnq-RuoA5HxMi7g@mail.gmail.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <CAOoeyxVK=iBmj3BDX=D8a9=GFBkE158jbq3Rnq-RuoA5HxMi7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/01/2025 at 15:34, Ming Yu wrote:
> Hi Vincent,
> 
> I will remove priv->tx_skb in the next patch, but it seems that
> can_flush_echo_skb() has not been EXPORT_SYMBOL_GPL().
> 
> I would like to know if nct6694_can_clean() requires modification.

Indeed, you can can_free_echo_skb(ndev, 0, NULL) instead of
can_flush_echo_skb(ndev). That one is exported.


Yours sincerely,
Vincent Mailhol


