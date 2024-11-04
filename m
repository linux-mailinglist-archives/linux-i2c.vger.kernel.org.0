Return-Path: <linux-i2c+bounces-7755-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F699BB53E
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 14:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EE8F282AE4
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 13:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60EC41B6CE2;
	Mon,  4 Nov 2024 13:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZIxjfnp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC66418A6B6;
	Mon,  4 Nov 2024 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730725311; cv=none; b=bVYLiAc7RrdnIEdEjrcypr6Yw0qAMSVF8cNR+dTdsmgi1BlN8lg7Hl9DcW50kKVMU/DMa0gFoPhfOsrWGIKwfmV0rOZyv6doOm430FWZiI9DrGwl6zPtUncgsoyIjTlVcFdc7/LQFhemBvUibttTpRdamGtFffQlFQk8KEVOLQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730725311; c=relaxed/simple;
	bh=J44/JPvySgw2nxSBKZizSV9MaJ7OyvkzhgCNOwdau6A=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DLE40T4YFO+gm6CZpqZOqglux+8+MYKsSyuq0uTp9oSYlZqfdY3+X/f/qrKv9DhiC9CSN3Embx7tQ0i+CAw1WZSkYrxrj+qLeovbFJhWev9D8qrva8O3/GzQmgFLOB7L+XyEWsmxdijxZcekI2ePKW/YA4kR3aANapJ//rKl+rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZIxjfnp; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-20cf3e36a76so43533525ad.0;
        Mon, 04 Nov 2024 05:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730725309; x=1731330109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bggMuP0j8I4Cl2VFvczgvzqyg/UZ6DBjAMKce4D1IhA=;
        b=HZIxjfnpFNa+5EjF+1JkohlduuLCo8aBlnvWJPIofBO3IuAENx5eqXoPaMtw6cUI8U
         Z1NzeVwjhOvPuEjW8ggOzAK0dc4HzMIcE5Z1OmZ8Da+MU8RVjhWc3jST7XK57l/Cur3c
         QkxmYBj+C4NfTETXavqK88I3CeDlLvy6a9lU6E9sRhbBiqIiI3fXArYbf9o7YP9EPkiP
         1BlSFyv7M+zNkTslWA/KUiPEmlKOhryEcgY4YVSSRJdjlfWRz3MmGlS4+zd5NJQ3twsG
         yJRR2FAk7VNiEQT0IAVGtgRF/9lGqjkYibSuXX1hGgP43jIkJUYqM6OrIZdTgH35w726
         4peQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730725309; x=1731330109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bggMuP0j8I4Cl2VFvczgvzqyg/UZ6DBjAMKce4D1IhA=;
        b=CedWo112Az9HMaW5sx3NLKCRNG6UP024VGaKslLOQxrcY09NI37fyxKNbPlOUqptQ9
         k5/m0jHN9aUat00nnpwS8E/VjiruFjF6T47/G0YLuX/Vy0DSsdSy/Zdiqxtp4EDTLHg8
         DmiLDM/ph4MvDMsCKbwF0Xs+qZJTUQ87V85ic3asXrZqZw3BECCmLL8X14YczTo97yN/
         aKR3gXzVecUtSJceg2Kq17ZJRirVhqAO/FH69Q+hIswblrGoT51Fbo/cOAyMeCftisNF
         FUR+BqUcJZJkv3mZyX7eZrhyb7xl22578dr5rExT2+EePYE4fwgIGEBYFS82WufuorFZ
         K8bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYxrNdFBQcJW2o0zH89C0VoGFSuI+8AI/hc7ipXm3XnmY3aY/rl+1xau/cLXbO0R+yAyltg3R4czMC@vger.kernel.org, AJvYcCVPzBKlKFrX3uatQ+xn/ABOxgHmlFvQRjICqJu4o3zzUq8jwchWHLq068gq+2lIN0OPB6Hufu8eQmhd@vger.kernel.org, AJvYcCWVeonLdsLh3a5g1UBHdUjSEUPee59VRKiDMx85OEHF1Ic6Z2kgDbLPc4tz9fVr7r/2OQCcDDpBkTCkFYUu@vger.kernel.org
X-Gm-Message-State: AOJu0YwnC9GLhHRzbUB5sueD38xGTQ90mzBQC0qVVxg81Uu5OuIhm814
	TfVpgd3QDhiYVP+0FLyzbeQUmGlWkoV4DRuVOA+NOnns85ydCMII
X-Google-Smtp-Source: AGHT+IGp9W2hxadwgRNmNykF2kMJxHkLvqXSziQp7OTyn0xuMYqTlQh0Q/87CZjhUI3SSdhNoev0dw==
X-Received: by 2002:a17:902:ecc3:b0:20c:ee48:94f3 with SMTP id d9443c01a7336-21103accfbbmr208730745ad.14.1730725308712;
        Mon, 04 Nov 2024 05:01:48 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a2bf7sm60238765ad.173.2024.11.04.05.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 05:01:48 -0800 (PST)
Message-ID: <6cce463e-25cc-4a07-971f-6260347cb581@gmail.com>
Date: Mon, 4 Nov 2024 21:01:41 +0800
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
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
 <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com>
 <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024/10/31 16:00, Krzysztof Kozlowski wrote:
> On Tue, Oct 29, 2024 at 04:36:00PM +0800, Troy Mitchell wrote:
>> On 2024/10/28 15:38, Krzysztof Kozlowski wrote:
>>> On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
>>>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>>>> and supports FIFO transmission.
>>>>
>>>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>>>> ---
Change in v2:
 - Change the maxItems of reg from 1 to 2 in properties
 - Change 'i2c' to 'I2C' in the commit message.
 - Drop fifo-disable property
 - Drop alias in dts example
 - Move `unevaluatedProperties` after `required:` block

>>>
>>> Where is the changelog? Nothing here, nothing in cover letter.
>>>
>>> I asked for several changes, so now I don't know if you implemented
>>> them.
>>
>> I deleted the FIFO property because I believe your suggestion is correct.
>> this should be decided by the driver, even though the FIFO is provided
>> by the hardware.
>>
>> Apologies for missing the changelog. To correct this, should I send a v3 
>> version with the changelog or resend v2?
> 
> Reply now with changelog. Your binding has some other unrelated and
> incorrect changes, which I do not understand.
> 
> Best regards,
> Krzysztof
> 

-- 
Troy Mitchell

