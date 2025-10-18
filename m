Return-Path: <linux-i2c+bounces-13635-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC87CBEDB3B
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 22:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C25019C11B3
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 20:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBC528D83F;
	Sat, 18 Oct 2025 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOXP0MvY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E766E283FCF
	for <linux-i2c@vger.kernel.org>; Sat, 18 Oct 2025 20:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760818065; cv=none; b=JR1MaL5DI2UK82O0YYmfWbyFDsMYhP20lMP2PKMHoMPv9zZgP2iQ72lGR8Y/5fF9BV4KjLd4FsdL47lprfuBdO+u1LvCZyYGodxTrjcBQIBW+QKL77+Z4w+hXoIini57FTJyQ2bBO/CS38G7uW3AhIIei65ubpyCd4Jyf1RnBcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760818065; c=relaxed/simple;
	bh=V8Sp8AI5cQ1pwfKqvJGHuK38wPmAmCAGzcaTCFQNtrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ab2upzRArp1bcKOUzpMEB3dPRO4B1Q3bZTw6nuxRaGhPGfoN5m6xInzXnlCTij6ubtF7ZJjVg0CMD0meh1WZjrbNFMKquFBq7VpVbcCdVi2nr4XRAMrs6bxN6UC1aSV3DupCyPAlReSUPM4QEykJ2oozsZ2hHvNzsks0V2upCIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOXP0MvY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ece1102998so2558655f8f.2
        for <linux-i2c@vger.kernel.org>; Sat, 18 Oct 2025 13:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760818062; x=1761422862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=40FdC/ChqfjXPXUQOE2PrqPGi6ryWMaZIxqN+c4hN1k=;
        b=XOXP0MvYiuXv+KVd6oF1fCQ7KzZaRlcehx/TfFcRbcaF3aJ6rt+g6QNJaSnAT1c2r3
         H4msCYyTLUhDc2E5gBiEa/1JuMUZwXoXh4To/pozhbWDQ4nMD9bdyjAH9WKZ+KA6r1vL
         fdo3smc7EYTRXMXrk0ZfpNzFJ95zmTTgHUEXuLvZ5n1E48PRkDDFwzmDy4msWiCOTAov
         /Rs88ihLN2LdXE7R5/vQ4RbjRhQIVR9xnHfiRfjmjza/aJdLRyMA4EPkd9zYvubnhdfc
         xVMYcHGtoI3o05/+aZxqbNkVzlJ2ZpbLJ0W1L5WuSZmrNlI7lyrGHEfyE5W4QJSWbK29
         mgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760818062; x=1761422862;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40FdC/ChqfjXPXUQOE2PrqPGi6ryWMaZIxqN+c4hN1k=;
        b=MU/W82ytOrr7Wq3D6v9ML3AontC7jc3xqRq7FkqNSZeOTkyBZlwPxBE4zhP2gFGegy
         P3HMzrRPSD3hNdyBCfplEknXHxFJFK+mvRYb8VNth6QD8ihgPHgDDqHNselx7N84oVgY
         7EcU8GxM/oT4LcW58q2i6Yi+ogs8G2EJ9tRe0J+ejflVEN+dHVL0AbiM0XBdqAHtoDBM
         IDwAJGp2BP0uYMP8CdRxIoz7u7WvonEG2h55H2Tias2+RRVxnn+hLULbMkm2BFV02CLk
         WRxSEKMIf54jiUqYEN7doYilFZC3VWhxmjkHHzXCfnhvlCfZXyNsQ119x16+eJpoRO1t
         p80w==
X-Gm-Message-State: AOJu0Yz7RdRS9kLnqNhhULeTl3s6FBc/pXmD6YfjoEr4ICxF6h/omugW
	x+RHcQ9rmZBXHwCXIYoJVTfYLx9tfyz3+IlYUgh1YNfy0ATC1387VHIk
X-Gm-Gg: ASbGncv0oOfFXrCNRC/VEsVMukoucEkE1KYl55JL+g0Ke7VDLMgTKiIZn30MHu7+DGz
	fEkGkJcM1rDxkwefsrsPBEbrMB1vIcZ2oCIIufhVW+osJtHGJyEwwRNm3KB/4hkaGG+67oQTBII
	0pWL4N4mSljjLVNmzcpMqrk6q/YTqS4boJBG1VApsYrrUKwOuGONpiSYqWj8kPgTaykkjzd7omi
	B+sGZHD4/3PJpLpk72minEJuySbd7habiNU7juW2/iAlfCLKg5wwI1ULTforIAUcQpJ++WUFgio
	A64wZ0URuYBWpukgtY2k33AkmG09DRUlmMfqO7Z8gXylmVezan6nYE/hBoCEzA6iWYVwl7x4WAE
	NB/xZOktM+rWg2hIboshmQi+yGbqK1Z5N1x5NxTrixQr2psmsmO3muFhdAoOyKNg0OZWrGkDrTN
	SuWN2LuD1ln25ZrKhRF8vyzGTfKPyVumqn0pzhkH7J89mPpCDWrTQiGU4ir0rJQimFwiyDPo5bb
	MJTmKovebKpeLQulWyikzuQCSI6nNVu/dP+XNMsHqYPJRxq
X-Google-Smtp-Source: AGHT+IE3dySN7Fhll29qTOw6VSNon+qQG4FmnYU9o6XffaxVlwuf8vnwqNY3v5vOuLypvNSm2XJXOQ==
X-Received: by 2002:a05:6000:250d:b0:426:d53a:fbb6 with SMTP id ffacd0b85a97d-42704db5befmr5304535f8f.31.1760818062054;
        Sat, 18 Oct 2025 13:07:42 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f04:d100:f060:eb:b826:a912? (p200300ea8f04d100f06000ebb826a912.dip0.t-ipconnect.de. [2003:ea:8f04:d100:f060:eb:b826:a912])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427f009a75bsm6622842f8f.23.2025.10.18.13.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 13:07:40 -0700 (PDT)
Message-ID: <8438d7d5-4f71-4244-a436-b3c747cdb81d@gmail.com>
Date: Sat, 18 Oct 2025 22:08:04 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i2c-boardinfo: Annotate code used in init phase only
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <8d09aa09-b656-4b69-b01f-3ea40418b7ff@gmail.com>
 <29ec0082-4dd4-4120-acd2-44b35b4b9487@oss.qualcomm.com>
 <aOoydT_I7d3khXuh@ninjato>
 <dfa9078d-7c08-4fc1-9926-e5996d10a1c2@oss.qualcomm.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <dfa9078d-7c08-4fc1-9926-e5996d10a1c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2025 6:14 PM, Konrad Dybcio wrote:
> On 10/11/25 12:33 PM, Wolfram Sang wrote:
>> Hi Konrad,
>>
>>> Hi, this seems to break booting on Qualcomm X1E80100 Surface Laptop 7
>>> (arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi)
>>>
>>> gcc-14.2 and clang-20.x
>>>
>>> Funnily enough when I build this (albeit on another computer, but also
>>> with clang-20.x) and boot another X1E80100-based device (x1-crd.dtsi
>>> in the same DT dir), it boots up fine
>>
>> I reverted the commit now, but please if you can find out more details
>> about the boot regression, this would be extremly helpful (maybe
>> earlycon helps?).
> 
> I'll try to poke at it the upcoming week, thanks
> 
Any result? It's somewhat unfortunate to revert a change just because of a
vague report w/o evidence / logs / bisect results.

> Konrad


