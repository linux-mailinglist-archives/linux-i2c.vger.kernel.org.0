Return-Path: <linux-i2c+bounces-1133-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F2A8250D7
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 10:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFA6FB230DB
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 09:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1D123755;
	Fri,  5 Jan 2024 09:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfO0CHj+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE522374D
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jan 2024 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-336c5b5c163so193660f8f.1
        for <linux-i2c@vger.kernel.org>; Fri, 05 Jan 2024 01:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704447140; x=1705051940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ta6ZY6ToK0KWkvtBPGTwq5cIuw8wSXbZ2kzdCixlb1A=;
        b=OfO0CHj+Yd4e4dJ8zemOQO7SUgMdyoyD3OGifus0cgAlVdiFXqFxyrI1yj0efevfBp
         r0Hd9HsmhQDklC1SGT/gj2sjzizvuNanyDUt8IWzt/MD95sGCTH7gMo3xGBJe9dFSP+7
         MtP5aXH+Vsp1erQBodLYsR6+Tz1scctzHFUN+X3H+V8Fs2RIR2RFeS1DzbC+SbkCgkGq
         33dbfv8XfXxkBAj2ZnvVF2uNFDiIIkVbrzTRrl4ZqPTrhJcixfYfv2QN7OjyROAivNne
         yc9G+UGzV8W7YeQFBIqZ81UFVH4eI6iOE4h7b8TOCKWoF6TfqFCYLUEnZBZp3665U38y
         5nkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704447140; x=1705051940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ta6ZY6ToK0KWkvtBPGTwq5cIuw8wSXbZ2kzdCixlb1A=;
        b=G/sMMndEQd654kQG2LAoRf39TJx7ct74HvnFwkgS+WVxgoz65lhu3WxNu3bgRPh5I6
         TWKPxHS3g+n4YxTsaf0xgCc++23TIDKVtVapSIgtGIZduj+4EGN8EVGXjIRhpRm9TAna
         ovLHU/uCKqFwMwhKPF5WcDcJHWkPqzI5N2tA8lNqcv3Ipc5hYgXb2M1xiqwVYalMF0vg
         ZRuT0P4CkMEkFUHH4j5X3Fp4EL7QehNHsTaamvc9QpJcPuM6wC9fft8MubovmvMqag0L
         R2w9zOrtPgJXlfPxB3lI3N9k5bSnmUYds3VaIyRDueZGlylq6l9Cq5px2r0v7cryn+jT
         8gdQ==
X-Gm-Message-State: AOJu0YzOAf/kjJlsDhy7bbWnysdRQ48dZTHRj0ciIZetmapd2r8TmeIi
	Y2VcL0lAahqXfZi3Q/fx4dlxO5TLiFg=
X-Google-Smtp-Source: AGHT+IFWWX5HyJVdyBxQ+cuB+B+O6ZVad4kfyWS6DambjKydXfKIY9cdKMUaoIEeBVPDfE4a5lv5xw==
X-Received: by 2002:adf:cd81:0:b0:336:8482:5259 with SMTP id q1-20020adfcd81000000b0033684825259mr1208664wrj.0.1704447139982;
        Fri, 05 Jan 2024 01:32:19 -0800 (PST)
Received: from ?IPV6:2a02:3100:9506:ff00:1844:295a:19c3:4c6d? (dynamic-2a02-3100-9506-ff00-1844-295a-19c3-4c6d.310.pool.telefonica.de. [2a02:3100:9506:ff00:1844:295a:19c3:4c6d])
        by smtp.googlemail.com with ESMTPSA id p3-20020a5d4e03000000b0033609584b9dsm1033934wrt.74.2024.01.05.01.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 01:32:19 -0800 (PST)
Message-ID: <a1e908ce-9d5b-4d0e-8002-b25d4b6a7172@gmail.com>
Date: Fri, 5 Jan 2024 10:32:20 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] eeprom: at24: Use pm_runtime_resume_and_get to simplify
 the code
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c3045427-da42-4f7c-8a96-3c4756646cd0@gmail.com>
 <CAMRc=MeKEVFFE6Pw3KBXTVgA3Y0sUswBKAWqEOSDyZk_QLhQQA@mail.gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <CAMRc=MeKEVFFE6Pw3KBXTVgA3Y0sUswBKAWqEOSDyZk_QLhQQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.01.2024 10:22, Bartosz Golaszewski wrote:
> On Wed, Dec 20, 2023 at 4:11 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> Use helper pm_runtime_resume_and_get() to simplify the code.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
> 
> This looks good, but I had already sent out my PR to Wolfram when you
> sent it, so I'll queue it for v6.9.
> 
I just received an automated note from Greg that he applied this patch
via the char-misc tree. The same applies to "eeprom: at24: Probe for
DDR3 thermal sensor in the SPD case"

> Bart
Heiner


