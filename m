Return-Path: <linux-i2c+bounces-14079-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A72CC5A13A
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Nov 2025 22:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B900C3419CD
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Nov 2025 21:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451CA3168E8;
	Thu, 13 Nov 2025 21:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="bqKXDbY1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from honeydew.cherry.relay.mailchannels.net (honeydew.cherry.relay.mailchannels.net [23.83.223.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E3A30F923;
	Thu, 13 Nov 2025 21:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763068472; cv=pass; b=ihAE4P8TIf7llecdjfAjtk4y1u2uGGr2l1BUXGXMgY/cQ3qArfUCgiag63XVp3CSf+GKcu9W2TRyjchZNVpUeeeza0yDTvCib7Gwzwc0O1h+sjek87rtHeb1FU4ZOrHaDFYii9qdcoM5+dSw1UHSz41fYPYSfx3BZgDHlfondK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763068472; c=relaxed/simple;
	bh=0qwrqizuyTJDSMAjVUdzIob7Re4FFYGijGPGnc5fkVE=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=i1Ig8p6H/lXucpvR3Zsdz3XAsvYhyQhk7liDmRQWBKYdVeomO6Pk+xOgHMFJKZBMSexSpBepWfjnAQZzJwKmot1eKTkXvSt3MOExxczv5XUDBP7ZrugzljntJpNxr/zyyEInaG+urb2W6gOtAhAB6ZYOvquBmQ635HkOo48hlfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=bqKXDbY1; arc=pass smtp.client-ip=23.83.223.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D4863460E7B;
	Thu, 13 Nov 2025 15:37:42 +0000 (UTC)
Received: from de-fra-smtpout9.hostinger.io (trex-green-3.trex.outbound.svc.cluster.local [100.98.43.10])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 74840462AAB;
	Thu, 13 Nov 2025 15:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1763048262;
	b=WfN9pjWKCLWylrFj+CTL6zpWw5MbGns6LqA1inBPHVl0alyjR4M+0jZULuosCRooXJupq4
	dyWFoEhXB8pT0rZs8sjqqYKgnhcyCkYIGk4OduogSRIj1tJHJBPMjbyU9lvQUcgEhmgvT5
	ZxOn8MvW2m3OVKZljyG47M3k8TwF3gl1Xt9BYsNsE2E/52vxiBld7S7aa1W3rFQv6LtI5b
	qxnmOIKRDYLS+WupN29UVjJIqXa8mWqrFlVTHGGDGyOYMbLiXid9mO7tHuDPu6MW7aiFlS
	32S8X/jamUJmTI1Nm0VjXi1rQEG8N8pn+2ptIY9YXhHdQSo/Dd7b7bacen3UpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1763048262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=RLzGjijAU/vFlwllSrp/plQWYmo7ZirLidDII9/zecY=;
	b=bMJ6ZfEx8FlM4RNsTCCAXVeZqt6d3/mSK9044VkgE/d26CmSPIp5PrIr8Al5H4zj80bb66
	gQmenIiYKGocU5xSY2838QYvRfOdPLIQqOQZSofOFRLiRSk0vpeorqbnQ+TCDuDQoyx4GF
	NiNhbb2TahporgRvzdKJMj8i/nFCPvf8pokgWgP/t/G13RACUGqtkRCvrRRXj1uRKHUrhU
	vfeS5JxysjqWNVRcQc20mw6A+S67ALL10MKxQW3A+6ZbjLZAsyZO4lgttTyBvMJKqdcmEQ
	AlSx1ZCBDoCEvafojbAKRKGymmh6CMyAbpLM9KxF+OlKxm0pTIv/ydqokhyXsQ==
ARC-Authentication-Results: i=1;
	rspamd-dd986fb9b-fznqz;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Good
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Lonely-Reign: 774cccee34596b8a_1763048262648_2896961944
X-MC-Loop-Signature: 1763048262648:987442191
X-MC-Ingress-Time: 1763048262648
Received: from de-fra-smtpout9.hostinger.io (de-fra-smtpout9.hostinger.io
 [148.222.55.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.43.10 (trex/7.1.3);
	Thu, 13 Nov 2025 15:37:42 +0000
Received: from [IPV6:2001:861:4450:d360:cade:11b7:4e69:5c21] (unknown [IPv6:2001:861:4450:d360:cade:11b7:4e69:5c21])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d6kt50vCQz3xF7;
	Thu, 13 Nov 2025 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1763048258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RLzGjijAU/vFlwllSrp/plQWYmo7ZirLidDII9/zecY=;
	b=bqKXDbY1clyKL0zMRudEmMHQphlIbXIKPgJisbZjhly3m94Hv2FxMw63bIB8Kq60nJSmCH
	Wdxe8Jb2ACuiU78/nk8sZ7r0HgzDC5hWU3AW+LSi1Z9RNhZ0n4QAHiLXew3qVoFj7hptZC
	irbxbgG9WZmehyTeu0Bmmxx2TpH3bw5Pr6Z5QCRZsE2NsvYieOftcllyEA5ht6+C6urHwp
	pfV+YAoXk64+GrAZlkdPvDMonew//YJkREZfBzy7vGZwNnMVf4bGvSZKMT/B1pEBxCU9Ue
	pzef4i3gdSC9G8wIiYrA1VFfWgvDVkAU1inBQeK2lWJH7O3N0ibTtWSOeAAvbg==
Message-ID: <5b1fd3ee-474f-48b7-8709-d07000a9a113@rootcommit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
Subject: Re: [PATCH v2] i2c: spacemit: fix detect issue
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Alex Elder <elder@riscstar.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 13 Nov 2025 15:37:32 +0000 (UTC)
X-CM-Envelope: MS4xfHmhrsb8bA0VkPMAIGI8nk/pQZRBKxgooQgAy9xq5AQS+n2VYLvF9tS+o9QewDLs199PBagyXd+kzGLzsycivcn6G96O73hf6rzwtH8CvrD23ld4rEux 6WpN5zIiQZDWT/SaXXgHWBRQOvzvefNl68fWuCsPhgy5/9iTzGd/k/LzppksccW1wT1L9YYvzs1yORb2PIu1dbJHVnQGWQ7yziUDj74M8VjJkO5mdTlIVLLg 06iA2+CeDBLtFJyID4AjkMB2/jleSANjnNKuyQXtQDbcGPMPE5eKPkzvJXb86OW1g9/tJXlbpRW9cADuzMorZqLXpTtUvEoywcASBaBn+TIX1i4rAeGPWMRU /VBX2EXRD8DR1nmRWipNu3HTvSnSDASAQFNWg9mZRLD3d93+f0LrKfhzfIstiqh7XhVU1LKS1m25o/8aiZB8HhOUCA1eW97hMOV8OBhErL/3ryEdPKMdnz1R Vhp/1X5E3fUDf4MJrjkp4fEu1lYXLpC6caC/relwCnmSreApXcqj5OQE4gQQwgF2KT8TJtTj+Dg1gFEsUryxkWPCKGR0F/gMEeBR8xXCZAeAb+SP9bLjhBZr GVTqfehO4S4u1226xXnjF38cV2DH4BF3yddbcXgHaYPywY/gJ2fl+QZhXt7CLzO359OpRWXadJ5smXIs6Ae19IJ+DnQgNh7BPkWGJlAg9yMCrWnxLt/Mcu6R 4dquFGHti7Y=
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=6915fb42 a=SdTD4+BzWsD3271SwPFwqg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=lv0vYI88AAAA:8 a=d70CFdQeAAAA:8 a=hXZgYZo4AAAA:8 a=hVukwZAqnudBvs4O1UQA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9qqun4PRrEabIEPCFt1_:22 a=NcxpMcIZDGm-g932nG_k:22 a=37BJPeUnzxYkbV1yBC-1:22
X-AuthUser: michael.opdenacker@rootcommit.com

Hi Troy

Thanks for the fix!

On 11/13/25 14:21, Troy Mitchell wrote:
> This commit addresses two issues causing i2c detect to fail.
>
> The identified issues are:
>
> 1. Incorrect error handling for BED (Bus Error No ACK/NAK):
>     Before this commit, Both ALD (Arbitration Loss Detected) and
>     BED returned -EAGAIN.
> 2. Missing interrupt status clear after initialization in xfer():
>     On the K1 SoC, simply fixing the first issue changed the error
>     from -EAGAIN to -ETIMEOUT. Through tracing, it was determined that
>     this is likely due to MSD (Master Stop Detected) latency issues.
>
>     That means the MSD bit in the ISR may still be set on the next transfer.
>     As a result, the controller won't work — we can see from the scope that
>     it doesn't issue any signal.
>     (This only occurs during rapid consecutive I2C transfers.
>     That explains why the issue only shows up with i2cdetect.)
>
> With these two fixes, i2c device detection now functions correctly on the K1 SoC.
>
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v2:
> - handle ALD and BED errors separately in spacemit_i2c_handle_err()
> - move clear_int_status() above spacemit_i2c_init()
> - move clear_int_status() from xfer() into spacemit_i2c_init()
> - Link to v1: https://lore.kernel.org/all/20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com/
> ---
>   drivers/i2c/busses/i2c-k1.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612e098b8ad17418f420d87c94df166..d42c03ef5db5984ea8e06b3d7eb485b4f899e616 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -158,11 +158,16 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
>   {
>   	dev_dbg(i2c->dev, "i2c error status: 0x%08x\n", i2c->status);
>   
> -	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
> +	/* Arbitration Loss Detected */
> +	if (i2c->status & SPACEMIT_SR_ALD) {
>   		spacemit_i2c_reset(i2c);
>   		return -EAGAIN;
>   	}
>   
> +	/* Bus Error No ACK/NAK */
> +	if (i2c->status & SPACEMIT_SR_BED)
> +		spacemit_i2c_reset(i2c);
> +
>   	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
>   }
>   
> @@ -224,6 +229,12 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
>   	}
>   }
>   
> +static inline void
> +spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
> +{
> +	writel(mask & SPACEMIT_I2C_INT_STATUS_MASK, i2c->base + SPACEMIT_ISR);
> +}
> +
>   static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>   {
>   	u32 val;
> @@ -267,12 +278,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>   	val = readl(i2c->base + SPACEMIT_IRCR);
>   	val |= SPACEMIT_RCR_SDA_GLITCH_NOFIX;
>   	writel(val, i2c->base + SPACEMIT_IRCR);
> -}
>   
> -static inline void
> -spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
> -{
> -	writel(mask & SPACEMIT_I2C_INT_STATUS_MASK, i2c->base + SPACEMIT_ISR);
> +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
>   }
>   
>   static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>
> ---
> base-commit: 6fa9041b7177f6771817b95e83f6df17b147c8c6
> change-id: 20251113-fix-k1-detect-failure-63483e45168b

Tested successfully on OrangePi RV2.

Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Thanks again
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


