Return-Path: <linux-i2c+bounces-1540-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C39E842E03
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 21:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD3D228AD0C
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 20:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29AC762C7;
	Tue, 30 Jan 2024 20:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICkrUb/1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE97E79953
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 20:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706647093; cv=none; b=lJd8NVDJCVeD5IKFLPKJRErNKvKYnTG7gybvdRfeVw4E5MQf78qgA5vMwwpSPhlIKlK54Ch7LF6PZJw259xzVAGZVNtgj2HYDcfTlQy+uQcxwJfxdcnY1tOfiE+NnokaMuESEV1nLO4ltzmC5IA64NM03XfaFHNrB8+nieI6my8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706647093; c=relaxed/simple;
	bh=PLZADcUsQ8uZ0lcr4akg6RaaA4hx8zE96pHbQwD2n9w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TwMqbd3bCYZkNaQBFgpxrKo3E6+mArDOBQyeo+0vQbzleL0RL9kYK7ea4hf+XY6szbVFBWhHif02b7PvmZGyBs80Cc4e59aWmQtUoec6FKSodni2s37duTSV3GNhh5z3wsY7j7rDHJrqrIvN4GkBVeebq71T2zflVsVrEXeDVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICkrUb/1; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-511206d1c89so945631e87.1
        for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 12:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706647090; x=1707251890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HVs0JO/LcfUS2eefHKQ5Wy+jkcPRvnbAWaaA9SiWfXs=;
        b=ICkrUb/1SBM0JbbaJeJlZ4zDTp7XXK6Y5rfG8V7gpCFb3AiraLiPHDv1em6eWKqLSX
         7CsdJ9VauQHkUyWwEfAomTL+EjMfxcl+rQgOWLGpWeb+MdYpPuZ85oJEhdn9Hm958i1X
         t0js3CPpUBYkGTscekoT+Hu+gqnw8Kvag0NTL9eYCefvFPUZiVgtX/KZkPbuJeVzjpDY
         PjtNpfWvCpkT2fsHdrUERi+vKTw8PmW+ZjhM4Aed0FNTn5HwUJiOVk3i9oc5kK6C7hdR
         hCdy1oRWn/oavkGDyRe6vrLcf3fWaw8Vl0V1aWt9nv04WrZ0DV4SOZE0TiQ+vGaMySoy
         r4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706647090; x=1707251890;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVs0JO/LcfUS2eefHKQ5Wy+jkcPRvnbAWaaA9SiWfXs=;
        b=Fxvr9MIEwBVxsfgPCQfk/7igO19nbJcovykTYqBfrsug3NKxQx6ue+XhFH8m6NYjQo
         ZgxyzD45M/JVMfZ5G2M/vfGg++QD4NovE/zfiit071Th88n3cg0Du92JnqZ5YKLt/fvc
         cnqxeg4oDSD2z3TLRudEZ315XYYaKjbO2Ev1pCZb06jLQ2arXRpzAEKHLHlY2i1hb/Im
         +3AK+faMlCfq4SVpH6Hh4+ixxfAeIXBu6KdRRM+xCpMzhZVMj0ndpEEHMry+8BUqtsFb
         6vhhVRrLEOMrC4lfWiWvvwzxHbN4Y5oZUz7ese4l8S5E03FCAJurLYxgjDcLPnWjrLqV
         EfSA==
X-Gm-Message-State: AOJu0YwRExn9nrxQQyV2b8+q8FCuzH9VFVXD9BehtcO86k9V+MWBGONi
	z8bzUhUsGsNnWqNEfvDR2kn3l8dbg+ZqYMf0Ys8vdU75u0mu7O3PWpuLIgrd
X-Google-Smtp-Source: AGHT+IG06B/5pOenNY4dyQG1oxfMe3uvfNYrl8D4yZZk9rR7yoCSvM34udroYIY890HdQIA4ad3vSg==
X-Received: by 2002:a19:5206:0:b0:510:407:60e6 with SMTP id m6-20020a195206000000b00510040760e6mr6127669lfb.66.1706647089641;
        Tue, 30 Jan 2024 12:38:09 -0800 (PST)
Received: from ?IPV6:2a01:c22:7399:9100:1c50:e52f:e8a8:3ab5? (dynamic-2a01-0c22-7399-9100-1c50-e52f-e8a8-3ab5.c22.pool.telefonica.de. [2a01:c22:7399:9100:1c50:e52f:e8a8:3ab5])
        by smtp.googlemail.com with ESMTPSA id ci11-20020a170906c34b00b00a2f181266f6sm5530028ejb.148.2024.01.30.12.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 12:38:09 -0800 (PST)
Message-ID: <112849af-705b-46c9-8a85-4505a9c1fe04@gmail.com>
Date: Tue, 30 Jan 2024 21:38:08 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] i2c: i801: collection of further improvements /
 refactorings
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.09.2023 21:32, Heiner Kallweit wrote:
> This series contains further improvements and refactorings.
> 
> Heiner Kallweit (8):
>   i2c: i801: Replace magic value with constant in
>     dmi_check_onboard_devices
>   i2c: i801: Remove unused argument from tco functions
>   i2c: i801: Use i2c core default adapter timeout
>   i2c: i801: Define FEATURES_ICH5 as an extension of FEATURES_ICH4
>   i2c: i801: Add helper i801_check_and_clear_pec_error
>   i2c: i801: Split i801_block_transaction
>   i2c: i801: Add SMBUS_LEN_SENTINEL
>   i2c: i801: Add helper i801_get_block_len
> 
>  drivers/i2c/busses/i2c-i801.c | 216 +++++++++++++++++-----------------
>  1 file changed, 106 insertions(+), 110 deletions(-)
> 
Thanks for the prompt review. Let's see what Jean thinks
about patch 3. Then I can incorporate the feedback and
provide a v2 of the series.


