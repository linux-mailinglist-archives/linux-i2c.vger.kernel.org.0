Return-Path: <linux-i2c+bounces-2622-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 277C988CF43
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 21:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04DA4B2C328
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0FB7442F;
	Tue, 26 Mar 2024 20:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfLdfsZy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D621018059
	for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 20:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711485429; cv=none; b=U0Q51YquOJmEi4w5s8qkOJqKfle7go5tsIO58n559jM5nQpNFsoLUUtycRis7D0PzIQ998m0KQJKI1aR8Wy5tv4oQTO0278EO3u2qYQRsSIp+0wom40W7QBvRRwPNeAi73Ss1MsUydx2moTCjOljnmpLSLXFodvDQjbAJ6MefLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711485429; c=relaxed/simple;
	bh=9l3MXJtj97tJR/uCgIQrg21OqJd2vE3vKNZeuQGbbAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=j00fWb+pCj5h686bFlGMUASuAsY1TO/vaftDcPMHzcMUfVNOo/hkyj1TtmKlK4eimOR/0QjdXGBG4u/t/9RefieN9UiFxI8Wy0iI2cPe1iH9/RCOrl+S3WwIGIbNaeEE5SC6Mlw1Xw/rBzo8MXjeNeEMCJqAcwnMNIGQyZU8txA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfLdfsZy; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a4749eecff7so371355966b.2
        for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 13:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711485426; x=1712090226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kEm305unRQiM6Bev6rSmnBMCsrjRaR0mOUUytm5V+iQ=;
        b=EfLdfsZyA+zECUFEmbKC3goi4yF0qQ+OHWGKGROw1XCkORTQAHCtjwWKMEH5zNrnXK
         wOhVvTvLlgvxYQ0Qbsb5zkfDto5PzC2SqGNDhzvBYd6XhwxwSLTzPwfDHBM08Ssv4ids
         GqWBWNE+ueQ86j18zO/uPdzLVX7uYFOxEo9sodd3gwk/wl18+ZPONhjaQCHaX7lqGyjC
         VQLzBcOMuhXVc244r2fqbetL79SsENzWLvITYRnhY+IoaVqz6kiIWtHeVFzniaG8qc/w
         47CRmoaKu8JtD2z5NAzJDWNQ+PZInDAZdPhAJYwnOO0qW2ejgY6/JZvl8horTFbqeVfd
         wDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711485426; x=1712090226;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEm305unRQiM6Bev6rSmnBMCsrjRaR0mOUUytm5V+iQ=;
        b=BOHybF8KtXZ/v45RQ9r3WEBa2RYpNgoAQLbWGQvdVuFtt0zPimoi7pffUGTHfo8fbr
         3mpZ+FM1mYpHHaBzrhJQO8DwN2eqa321UyUMBnEy9hbMHo+VPv8SUwDEqDyX8r49rc0r
         7yLeHQmk4G6Oyv14bKKHiUztq1PB4M6QLAy2Fb+z5tjIcUfgm9yjqSZJQDPDMDuzAwGz
         5iWRFcPn3YIt6zdfotXeZGOvJHJTomPyQgv9Zd1DPR0JxVeR8wCZuqzEvM2xZ2+6ytxb
         PcYFkWUHw7hEmi4nEgZNyYH/OczDImyzH+m6kGrcX6FNOhVy14mvqMVDQ7Tm0wF3dzMw
         d2ng==
X-Forwarded-Encrypted: i=1; AJvYcCVUfBQWOM9fNo+aBq2ImWEIM9Imzqk88Jkcw1GaH0o1HukyBcC0kvcpPNTkLN/RhoBRa3OsCHUM/G49qGGMWi4sTTrXD1sKKEuh
X-Gm-Message-State: AOJu0Yyg8uX8YYRqZSW488g7NQi4Rkgldppkb2GkmieWqrDgzqs0Cl2b
	ZM3lkEwRDwE67z5e98Qw4pvIkABa4/cxfVFPNcRQfX8WRNRnC67DMtfoEzSl
X-Google-Smtp-Source: AGHT+IFhdwiRhrQSyzQcw9SsUbpGx0N3RtBlntT9BB5SMy9hPF2HkIU39VMPcl27VNtUD5ZDBWc0sg==
X-Received: by 2002:a17:906:6a21:b0:a4d:edbd:a3fb with SMTP id qw33-20020a1709066a2100b00a4dedbda3fbmr3273445ejc.44.1711485425345;
        Tue, 26 Mar 2024 13:37:05 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6f11:a700:a877:8eb2:587c:b36f? (dynamic-2a01-0c22-6f11-a700-a877-8eb2-587c-b36f.c22.pool.telefonica.de. [2a01:c22:6f11:a700:a877:8eb2:587c:b36f])
        by smtp.googlemail.com with ESMTPSA id e5-20020a17090681c500b00a4a2bbee931sm2813939ejx.118.2024.03.26.13.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 13:37:04 -0700 (PDT)
Message-ID: <30891248-6c48-4dbf-a5c2-472224dd700e@gmail.com>
Date: Tue, 26 Mar 2024 21:37:05 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] i2c: i801: Call i2c_register_spd for muxed child
 segments
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
References: <eac54582-44f6-4101-93d9-012eb4ee3241@gmail.com>
 <cf8058db-03d2-4d47-bc39-2645c3d42e10@gmail.com> <Zdxprq9jukWj0XJF@shikoro>
 <b4cf0d37-f597-4218-9773-dc6eb8a0dc2a@gmail.com> <ZgG2BbOSO6GOo8yK@shikoro>
Content-Language: en-US
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZgG2BbOSO6GOo8yK@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2024 18:36, Wolfram Sang wrote:
> 
>> Now that 6.9-rc1 is out, we would have several weeks in linux-next
>> before 6.10-rc1. Would it be ok for you to apply the patch and see
>> whether we get any feedback from linux-next users?
> 
> Yes, we can do that.
> 
>> If yes, can you apply it as-is, or shall I resubmit the patch?
> 
> This is a question for Andi who picks up driver patches meanwhile.
> 
I have to rebase the patch anyway, so I'll resubmit.

