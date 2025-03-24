Return-Path: <linux-i2c+bounces-9992-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBEAA6DA93
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 13:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C0D87A1CBF
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 12:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43DB25E46C;
	Mon, 24 Mar 2025 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="lCSkA6Fq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0470A63D
	for <linux-i2c@vger.kernel.org>; Mon, 24 Mar 2025 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821062; cv=none; b=ToXkr4VWq7RFjih6nhwXQ8vrGgDM7kFA3Cqq+CRmZe52ba9vbF0G1IwmTjQCWBZcML86i1s2dDn4mdU90BtWin/vHw6T4g8un7H6swNBdp+FvRrVzLus5XbhDqCiDqxaeV+ROluUrIgkjoHhRorT/MkvtiIi/KeSRVXAbXPg3uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821062; c=relaxed/simple;
	bh=w1sIKw8VhqVpel2X4jkKgpcUEe1m4Bk1iPlqBxpEz9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lD/S+7/kkryQmTvg7jdgvBMN2CqzIlYGxhrMY86nM1sO7WMY91pkAzHnmVuSZoDGSPCzMrnc9yOd6bnbL4mXsF/54S+bq1maQbgQ6T4C+LcHGRMp1oMxsh5qty0Syj/41Azenth71hUbcdv0SaCl+bIGl8QFjMlxiIIwaBdXW7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=lCSkA6Fq; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72bbead793dso3057101a34.1
        for <linux-i2c@vger.kernel.org>; Mon, 24 Mar 2025 05:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742821060; x=1743425860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Im+9aepQleDf029Fpq6gerBYD6e3zBrydq5RA3dPhpA=;
        b=lCSkA6FqtUzejSeYM7v5GSq+0PRxeal4fECeZpokeKY/F2S+hLUcx16lf2CADCAceG
         BRdmhlBxLQacp/FqDxFSMmeGMj6YXPDFSZwsMgI+xaEocwhIKGIeiMA7oR7SwDar8VPc
         cmGJSRKR6v/4EPFpFeP1jD5Zqafkw1qshDqc4PsMArskMh5eoKvKnzgcaodCsQwyWFQi
         1LO+C/Ejk1VNFPmmYnkvkyX4tIYW4U+5vYUtLeDVfv185Apb0Xor6VxZgVlfS2V7kyFr
         65tac9+42jF60OzZKSNnMqLrjN9gjFJ9RGAfIsZcLyUQ3GZDWO31IRmeVg0t3bpJcRNp
         fWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742821060; x=1743425860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Im+9aepQleDf029Fpq6gerBYD6e3zBrydq5RA3dPhpA=;
        b=uXK2WJHftfGeonCAhksAnN4bne/MmvpZ+nv59mt/u5lVYSkDr9Hn4yDwghXuprldgq
         WotaaGB/b4JrtKCFqOOv6yj7lhzhHyevxWQFyZuCjokE6/awGJp4kOsfyS3KByhV9KQL
         o8HqHrVQ+x+Du1UWkwzlEfWNXNnp/tBK0hwY0Mxwi8IaHOU5QJLTMgj5SkziaJUEjZSY
         Y7BgsmvjnA2m/2r6mwRUJaW9g/z5kzKsmN3koBXLOIQPKNOd2IseQcTi6qsX4wObW14j
         ku2BQSItHEsSZ+t3hv88nm8Y4brCB1rmuwdDBL6kzCY7nGHjfwvZL2+j219sTCIdlCdY
         Jdzw==
X-Forwarded-Encrypted: i=1; AJvYcCXbckF0Wr9eFedbcGJ1E69oVJseuSfh35Da3b2Ebla+NeVedfRGqnU0sTKr3aBDSbLG7687pMXylvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoWIXWwleugt8D/F91wLo+9DbnxSCo6QtDMNKHb6Z7CAU5TfeN
	4HbsofebXyEGlS9sTolND5Q8cT8u6wkQAgAP3Wfc9bYshtLmZiInkYxWU2LtPxI=
X-Gm-Gg: ASbGncu8hOZhnJlib7BSP+5mrcsDOI3kHi1j9yJuZw+msyCZipr3w8uewj0O3QCHMVS
	k5ov5HjSH66IGHcABMoVB4pjyKdCqByfpXLcwtP3WALezx7CrU+F2KF3P8kZJW9tvUBTsJMWUGp
	m2EuEDf7VEph0yjQ7ty90gCCpIBp66nyc+qaiaXNamVbI92h0j7dgfQDUP+US1M3YqKDc046krz
	cnkdaXxyfpoe+4prhPgRfgtR/Dd/tcNbZAivPfeiXGda8BQID4qNFHILC9XcQwIdAr162j9PAyq
	jufFX8cNINMSnJA7Nen/Oyrrk1QscBVbXfmmarZ5VN9VkGPhVY+TgeqS4iLslWbbO+W3bqGyQgE
	igNeb4oRj
X-Google-Smtp-Source: AGHT+IE5aK4uB4tn7mHbF1k7Zswn65KeSQ5BvNMkopcTLJUJADT1mRVvPGIMYObU+wZiGGQym4pNMw==
X-Received: by 2002:a05:6830:64c7:b0:72b:a712:4b72 with SMTP id 46e09a7af769-72c0ae5d2f7mr9130707a34.9.1742821059582;
        Mon, 24 Mar 2025 05:57:39 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c77f05ec92sm2050688fac.35.2025.03.24.05.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:57:39 -0700 (PDT)
Message-ID: <92efd4e1-3257-474d-8b59-820627cf5262@riscstar.com>
Date: Mon, 24 Mar 2025 07:57:37 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: k1: Initialize variable before use
To: Andi Shyti <andi.shyti@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
 kernel test robot <lkp@intel.com>
References: <20250320113521.3966762-1-andi.shyti@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250320113521.3966762-1-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/25 6:35 AM, Andi Shyti wrote:
> Commit 95a8ca229032 ("i2c: spacemit: add support for SpacemiT K1
> SoC") introduced a check in the probe function to warn the user
> if the DTS has incorrect frequency settings. In such cases, the
> driver falls back to default values.
> 
> However, the return value of of_property_read_u32() was not
> stored, making the check ineffective. Fix this by storing the
> return value in 'ret' and evaluating it properly.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503200928.eBWfwnHG-lkp@intel.com/
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Troy Mitchell <troymitchell988@gmail.com>

This landed in my junk folder for some reason.  I noticed this
on an earlier version but didn't check in v8.  The fix looks
good (in case you haven't already applied it).

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> Cc: Alex Elder <elder@riscstar.com>
> 
>   drivers/i2c/busses/i2c-k1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 0d8763b852db..5965b4cf6220 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -514,7 +514,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>   	if (!i2c)
>   		return -ENOMEM;
>   
> -	of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
> +	ret = of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
>   	if (ret && ret != -EINVAL)
>   		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
>   


