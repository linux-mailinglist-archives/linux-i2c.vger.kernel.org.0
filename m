Return-Path: <linux-i2c+bounces-7774-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E329BC49B
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 06:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B48DD28301F
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 05:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789E41B394A;
	Tue,  5 Nov 2024 05:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXH0m6o/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE0A383;
	Tue,  5 Nov 2024 05:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730784022; cv=none; b=WyuH0FZak9WECxOWFN5g/8Z8hf/1wY1tQxqh2vVqLzhQj2X6GwrEaktBwcU4ktUftyrunvbQhPkMUnGHbHFDF/MnwglgVeJzGSaJus6fJJ5a3iHH1wsWPQCiiRYQSEOHhwxrUImJlaN87hQKSfJJfPlQFmnjW9vHg43V8ArRBsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730784022; c=relaxed/simple;
	bh=DcCXBVV7pog0hH2FiRHTOFsdbNvQVoTARwYL/sPJMog=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uSXUfgOFII21NmoBSKwFRjCr5wsU2N6JI8SRkElhwHB3e29HqMsi8j2IPuxPWoDmmYX9RoxgzqlZoAGdzsXx0K//tmJd8Va+XOGoutcFvC21HYayKTIYmpQrrgC9aCPwuDNSx2U9xsSa1HHnqDu9XLdlv48Hah63R82J68S8QUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXH0m6o/; arc=none smtp.client-ip=209.85.167.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f193.google.com with SMTP id 5614622812f47-3e606cba08eso2846888b6e.0;
        Mon, 04 Nov 2024 21:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730784020; x=1731388820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OVIDqyMFPmN4cUigm8mgpzwe7aTulhrXs9SX4YLqJfs=;
        b=EXH0m6o/WGCb8lAGK7jc1VipKzQ+qPuhyNDdVExwLaBPvtV2f1/mgz1ZJAHCf6fJHj
         lXTa1qNeV2Z5rssmaj3qMrH2cA8LvFrxrDD+/CEW7Pu8Ei/TDbjg5i5T8tbQQb1PgK+t
         xbqk5IytS574k11LK64/HkVgDIneXKLfV6BqMVh+GHvs6keVAmDVArstjMlhFoEr2E+S
         VI7eS3tLQONK0CJ/9D+z77sgsLJwpANBUNwf5tR6ws1f9zR/nRx2mcSeC6LLJY8ZNCHO
         qK0T35Wiiqd3xXRrt2YVBTemMZORb3Y8hoWsi8kPb2pAm2hCzut4xfz/OKEVkSafWIKr
         0huQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730784020; x=1731388820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVIDqyMFPmN4cUigm8mgpzwe7aTulhrXs9SX4YLqJfs=;
        b=EFwNCraCExMWuW1MSRljgS/WhzEJso5+HQM0Cue+bMUOohUzXL/4mToY7AodY92NC7
         jVnwrZ+zkaHV7P2oDurKcDWleVgK7cgnpohq5QvcQ60zmINsG/F/kXt3lnN0XV1VoJXB
         3u22cbyGy64of5AMwUD5qF5TVNVpfv8bRi2AsumsW/OLqZ5IoCiM8t3xtLUEzTunqSMP
         7NOkz/KMAhbMkxGJCkYUrxcfGqHBSKtPWgz6vShJjC+ozkNMvNR3TsQd/Nyiis/pOlo2
         Q+V3cBftNohcoXYjSmG5XHjWXw9blHntnYaerxzVeOBxvpPNX0H0xFF3VeP/UdCoyU4R
         1F1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2kUTHjNwkBqI+2aq0MSQQf/7M+FdpXcREYS3jA0LpgxO7s3dooDVTsS+pZ175ukufLncjPLP70V0l@vger.kernel.org, AJvYcCUqyZtsEmWeJYaif+2zIY5YkpmFHkYllsfkr46ZDIq50frBjXRaM/nLyV/yn3cXjR6p5pUSAV5Ggkzi@vger.kernel.org, AJvYcCXGzOt0FD2LDi2/o1T/PTfFaG3OHKp6o3MgfcXm0ifVxUZ0q5JTo3DXsw7DCVVs6V4L2up+UHohhB0F4SRj@vger.kernel.org
X-Gm-Message-State: AOJu0YxUeK1Giq6ffYBK0ZKxbPwGvQEIONeCf+SnGcMpYNlFqQrNrri+
	eJX9gY8E+UndC/hoeQE47BF25pYZAcJtSdOFOqkSWja57D1tjirS
X-Google-Smtp-Source: AGHT+IHoumst3uPdf4NL+OrVtBSVt4fmNllaSCy38++T/BPGlXiWWEGwidCLdjrRMdlBJygYmO+0AA==
X-Received: by 2002:a05:6808:3a06:b0:3e6:5b8c:d95a with SMTP id 5614622812f47-3e65b8cd9cbmr17613629b6e.20.1730784019859;
        Mon, 04 Nov 2024 21:20:19 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee459feaadsm7899842a12.69.2024.11.04.21.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 21:20:19 -0800 (PST)
Message-ID: <190e9d7b-daaa-4c7d-9954-ca143925a08d@gmail.com>
Date: Tue, 5 Nov 2024 13:20:12 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Samuel Holland <samuel.holland@sifive.com>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
 <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com>
 <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
 <6cce463e-25cc-4a07-971f-6260347cb581@gmail.com>
 <502b0b14-0e1f-4a59-85ad-7edeb9d3033d@kernel.org>
 <a08384bf-6747-4975-b025-f8fd3685fc30@gmail.com>
 <8a04f84b-453b-44e5-9053-204a08d38e19@sifive.com>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <8a04f84b-453b-44e5-9053-204a08d38e19@sifive.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024/11/5 10:50, Samuel Holland wrote:
> One "<address size>" element is just one item. maxItems > 1 would be for
> hardware with multiple discontiguous register ranges: <address1 size1>,
> <address2 size2>.
got it.I will fix it in next version.
> 
> Regards,
> Samuel

-- 
Troy Mitchell

