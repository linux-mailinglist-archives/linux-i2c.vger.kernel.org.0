Return-Path: <linux-i2c+bounces-12193-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D80B1F719
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 00:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59564177F4C
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 22:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A139277815;
	Sat,  9 Aug 2025 22:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbP5LOr6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D274A2AE84;
	Sat,  9 Aug 2025 22:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754777484; cv=none; b=fTTV7GM6MOU7L6UcQQhpO93XdXihJ+KlYQ0D4lw/VMjGx1bxcs7T7SY55OwQN+tq74NQwmBjRwrZTSXinawp+rCcfFgsc8uSAo3PF6HvYNd8OTO+WVgMya5oLN5YcwV13aFBZA3Ay48FO+PlICmc3Pbn3RSwaG3IJ734lzzrBro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754777484; c=relaxed/simple;
	bh=CyKdCLPGTToqh2o1gFAActl2h/O8Zjet60prjlxM7C8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FO3PzmCnMw9agXWuqdqprKFRuOZ/MI/Fy+Ip6MLgvkQ6dY0GL7KkhWjVbsLG3CuZBkN4uzRJMyHwnQkluDtS3knfnfNVoB5d/8RlXYSxcNalQ9FF1XUYlc6cxft30nvnyoJQD2qHpJqOna1uGtD22RhsvpLVBdMGmNJ0ExqcyBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbP5LOr6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45994a72356so25091495e9.0;
        Sat, 09 Aug 2025 15:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754777481; x=1755382281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kWyuqnnM831kHmXUyyqa9K5BLHE5Wnfr+uFjW9Eqgrk=;
        b=LbP5LOr6ld1cvnip+L+WI2HWGYFG1njV/AKLZWqVITAuof/un2k0KnBAXERl+tkS12
         1pyY5m1zMjFnLEZ35coO1LsCkP4cRB0jb9weP6rxn1+VnVmT0DgNVQljMe+Xli86nsXm
         NDkuobUlzZQCTrxhSY9IpKifHo7AVe58f9YPzejNj+0M1RVV4+rMjqsok7A/jtf+Vo1z
         xsvfAOwPXLJHItbiaONpM6cXDkHSG1v8bu+c3MZq+ZIr2dPlO0ltaM5KEE2Vcf5iUPA2
         xk11BnJSDikHggCxdYcCfVn1N6J5okSFV8dZJkQ2+PKYPdTOlD2n8s7t66KN2QImEHRJ
         PMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777481; x=1755382281;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWyuqnnM831kHmXUyyqa9K5BLHE5Wnfr+uFjW9Eqgrk=;
        b=oOK9O2PwKBP3MCKzKOfK7QmOlrk/WRa1nuAeS63KHmrzcdw3ft1doEFDB6QU2vdbgQ
         Nbi+Rou+kKbumsznT2ehbdTa3fBXuCLaKdANv8oUBzgbZfVY6PSjKQ0G3qm4tnYwalzY
         v25FHtKevdkFUJ8EEM+9GqosGs2Vcyu0qv10QfbHU0lEdViBP8dUHSNukzgoJkenNqX9
         SAc+5lHSeAk5Qixmalg/ESZ+qbAQCp8SFAlZT/rrxlpa3bQtjhNzBJPzdsiK12oD8Jet
         6aOQPCgl7jRL7h1FwKRTNY544NDGFGNEgQpLubpipJAQUD7YdsxzTtoEnq4naNTYGzxI
         cwQg==
X-Forwarded-Encrypted: i=1; AJvYcCUh9HQ7OiD4uyowrnNMOqvUed3mf8G64x+GLCDQHTHRHQQ0afL2i3R3JvYFPvmIjrObLCkjAibRHDvu0CM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjV+gvw/l8OU/MqdsHoo3eeCc+B4g9tkYOPossAVqgfYxO+M23
	uC4O0z2RlgOXfe5h+T6zdg9513buR+Wpr2IabAOZOrn9crbaNDmy5+o9
X-Gm-Gg: ASbGncvFbHs2JaDJ4cRghQ//owgHGEjG12ZiSR5uaFbPUKOXeKwnT8dEZZorcm4fuA5
	JZEwcGwtgvH4ZpygCjb7CPjeJl/f38DLLvi3yXrff0BO8XW+Rr74OgeEi2pcETWcGwdTuz9tCe1
	A0VI3BNHvldazie/jJOeFyssqiSBaz8tJeQ+5nkYQ8oijEFcDzbbTye5jQiTX/1boaaIMkCRl+r
	9j/JyYskyI+1OHVmaqbctD5l3Zn0BcelWyqxVDPwF4Y1OUOHBk3Z1fhjhtc0Jh2I9RBzZQ1pCrX
	TPvM8lnkAokCEBBsmQI+IkiPUw6fE0AWOAobWrIdFdFTE5QabwMMGgLV9VoKZrYMaESoqhU7M8B
	82Ds+9TIGgyU2rJhZRXRjh2d1KBU7RW0a/w2JTOmKvUrpFIv4ClvCdhZyTVOkIMitZTtErjGFPc
	ZwwSv7hc7uwm3PwA/fEDAV2w==
X-Google-Smtp-Source: AGHT+IFYf6olDIH9fyHWCMbqbkxZHbQ1BIDwefn9eFC8Zz0ceeVxyDgzJx3yIdA1+DdqYOeoC3CfNw==
X-Received: by 2002:a05:600c:3b1b:b0:459:e39e:e5a5 with SMTP id 5b1f17b1804b1-459f51a7fbamr67662745e9.5.1754777480967;
        Sat, 09 Aug 2025 15:11:20 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f126:ce32:5d9b:45f7:a91d:3c6b? ([2001:9e8:f126:ce32:5d9b:45f7:a91d:3c6b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ececdsm166418865e9.1.2025.08.09.15.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Aug 2025 15:11:20 -0700 (PDT)
Message-ID: <4e192acc-3364-4318-b31b-120a37af6a2f@gmail.com>
Date: Sun, 10 Aug 2025 00:11:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i2c-host v4 5/5] i2c: rtl9300: Implement I2C block read
 and write
Content-Language: en-GB
To: Sven Eckelmann <sven@narfation.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Harshal Gohel <hg@simonwunderlich.de>,
 Simon Wunderlich <sw@simonwunderlich.de>
References: <20250809-i2c-rtl9300-multi-byte-v4-0-d71dd5eb6121@narfation.org>
 <20250809-i2c-rtl9300-multi-byte-v4-5-d71dd5eb6121@narfation.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20250809-i2c-rtl9300-multi-byte-v4-5-d71dd5eb6121@narfation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sven,

On 09.08.2025 08:40, Sven Eckelmann wrote:
> @@ -314,6 +343,7 @@ static u32 rtl9300_i2c_func(struct i2c_adapter *a)
>  {
>  	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
>  	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
> +	       I2C_FUNC_SMBUS_READ_I2C_BLOCK | I2C_FUNC_SMBUS_WRITE_I2C_BLOCK |
>  	       I2C_FUNC_SMBUS_BLOCK_DATA;
>  }
>  

Is there a specific reason you explicitly use I2C_FUNC_SMBUS_READ_I2C_BLOCK and
*_WRITE_* instead of I2C_FUNC_SMBUS_I2C_BLOCK ?

Best regards,
Jonas Jelonek

