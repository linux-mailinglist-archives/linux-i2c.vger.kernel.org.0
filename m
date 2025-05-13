Return-Path: <linux-i2c+bounces-10966-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF98EAB5E35
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 23:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D60C8643CE
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 21:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947821E9B07;
	Tue, 13 May 2025 21:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIE0hmty"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABC618DB3D
	for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 21:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747170026; cv=none; b=oQgkIY5Kn+2LhXuk5Ek4JhunZXWZG3VSPckCaZlyLHBU7BWQQSkHAbRu468euskWzwnlFMjYiWpkED9HwOA8Z2NpHzqphLwEucULrOVZH/dPc+98eaj4XRLPyUpvkZtjpXu9O/o8rHii2mEg1yNQmhrCf8MTpTwFJwEP9Lpwzzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747170026; c=relaxed/simple;
	bh=l5zvFHyeugEXUJy8rHxMjAK7DdnJrDlD7VDbdxQKJCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNhjmTRfQchZfjyHDWn76H7i8uaDj1K1VoxUNjzU+p181VVlr8qcaXPgKb4Rbj+E+yq5YVxFv8YCMmr/bwoqLepua3D33yh0IB5wB0lUTu0pzW0HWA53c7IaatQhKiKLGlPUBn3X1U9Fz0whObfrZRUhXYc6UC8VcGBynfScu2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIE0hmty; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a1d8c09674so3423469f8f.1
        for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 14:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747170023; x=1747774823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5zvFHyeugEXUJy8rHxMjAK7DdnJrDlD7VDbdxQKJCc=;
        b=MIE0hmtyvn9MY4YPJjpfn1BOGFlb9QO4c1JG5vlvMIur7UCovBBNXgKm+eulvbady/
         39HHEVSHNGWxGwNg/bjJelV50lNuyAQSo0hvPEjh++UR0U1jwLQMmrVLqXfgOA3ga4m5
         q64g7vGcV1ccdnxzI6mEOjBcHSDUvs/tYJvUhSR3idAoeKVCD0Ax2KoBUe8XlIqOIwqZ
         eWJvVixi2WBDLFrjznMBL/lg1YFLw1H8mjj751L8C6JbTA6DzcDbLFt0hAkpcOhyCSZ0
         KKfFnNA3fSDW2q3Q19F4rh8VqQExMhcQZgLE+z0Ta3qcMfPQkc3ChH0sbUbNMOOnHyAh
         tqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747170023; x=1747774823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5zvFHyeugEXUJy8rHxMjAK7DdnJrDlD7VDbdxQKJCc=;
        b=WaiUJZEYnY+k72en7/d3Wq7Utppp5bAH60oiD1jGsIyya5GDl+1powQKbM6X/BN0kB
         e4S7QoQMrdVjFXx5qanK86eyLNMd8Ym8fYIOVDp0D6zLxGEOYABCODznz/0XGzb8it8r
         XF8tMSqfnF8TEYIdn2mZK6KnFX2IIQx6KyGxIEv/dN6ppzMaLZFXlcNmRWkTtULPIfl6
         ynqhQLh1Hl/Hpp1wi/hMLbib86yprliQNIchi7jp8SIddasp6klXwuCQ8RoXN8WA0Juu
         tXSRALvN0ncwfTrx9QqXOwZXEq/TTAY2IIEqHShpLLdpthq2lvukCDp6zNwbgkqqhPvh
         jzHw==
X-Gm-Message-State: AOJu0YyUmpGRb1osxYmI2CuG4mt7Y+FebXLTRnvIYQnofeYi4P42MRCE
	xu8SngAoaHANMhDzbdJEg4yHbbIfKqnjxhWYsR8tOtu23fBlqFLDv7Y28A==
X-Gm-Gg: ASbGncufUxZF8YPNTfPmKfn/yk881apZLiLw7Hljej/ZcOMTWPyJ7TUCawYMlVMxBGJ
	reRAHZksGjGuYnASAUS3+2b/jjN9SaJDD68PUpmJBGhcI3g+wmgY/562x8zGL8W+fglR2c8/rHz
	iNeQVScwSNTk54WVLftux0tSwATF6pXxtqPCCovN4hAFpt99kXW2OjCC2ZyGrFGWBefImOwg6fV
	JBIGvJ0tEoYIyen/hZmgy+hEv4v5o7yx04hUiE3r/HC5+uA2sgn5EfoRDdW+7mMUl4pNelYqb5i
	X7VoiJSdu7W1R0p+EKqXG9sPjEkxp9cWsRNSvb7pnfyc1BeIIBcQWtBsko60+XfxS4VPliU4Rw1
	Xtw5sviaFSXpGCP6oKCtuXjnlltjkrA==
X-Google-Smtp-Source: AGHT+IEq0Pm0FLVrLLmCkJPhvTqLx6HAJEbsD4hPrI0XwOAZ3i6gBxnBXOq1hgJJhNpLLB7C+mvIWQ==
X-Received: by 2002:a05:6000:3105:b0:38d:d701:419c with SMTP id ffacd0b85a97d-3a3499231d3mr548453f8f.41.1747170022574;
        Tue, 13 May 2025 14:00:22 -0700 (PDT)
Received: from [192.168.37.78] (mob-194-230-145-210.cgn.sunrise.net. [194.230.145.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec98dsm17282738f8f.25.2025.05.13.14.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 14:00:22 -0700 (PDT)
Message-ID: <55b1f4f7-43e3-4a50-be9a-9e89b5d0ac8c@gmail.com>
Date: Tue, 13 May 2025 23:00:19 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] i2c: viai2c-wmt: Replace dev_err() with
 dev_err_probe() in probe function
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org
References: <20250415183447.396277-1-e.zanda1@gmail.com>
 <20250415183447.396277-5-e.zanda1@gmail.com>
 <rycxzatwyq3yoavajz533xv572sjshv7xb4ps2bdmainul5sex@mxfk4lomxqvt>
Content-Language: en-US
From: Enrico Zanda <e.zanda1@gmail.com>
In-Reply-To: <rycxzatwyq3yoavajz533xv572sjshv7xb4ps2bdmainul5sex@mxfk4lomxqvt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andi,

On 4/16/25 22:42, Andi Shyti wrote:

> reset hardware is only called by the probe, so that inside reset
> hardware we could alraedy use dev_err_probe() and...


> just remove this printout which is redundant.


I will apply the suggested changes in the new version.

Thanks,
Enrico

