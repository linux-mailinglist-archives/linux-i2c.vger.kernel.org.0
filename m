Return-Path: <linux-i2c+bounces-1681-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDE38504E8
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Feb 2024 16:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B2A91F22A36
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Feb 2024 15:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB59A5BAD4;
	Sat, 10 Feb 2024 15:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Htk+fUCi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CCD36AF0
	for <linux-i2c@vger.kernel.org>; Sat, 10 Feb 2024 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707578733; cv=none; b=uZOUkkHjpT0450C8lQoQDQO/WKhRSt7OMPprfJSlyOl45igZjitvArKXXX3kCdSGwkDHEv9dX05iPMOr9CNmekEHkOdqsRAEyZGRNJW5b9vUC+AMWA1vriRc/kSjOMpBHlvZIRXs6K9ucdFRP1oZv/qI6l7gtWLDvkiS6prNmLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707578733; c=relaxed/simple;
	bh=o58JMPMrcoWnq+pLQo2Jb1S/Sy/oqvicAnx6QBPTLn0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=bBg68ih23eLue6dikhm0VfN0YjnNjzrGb7FXbBThUoZvEwdxVZUj+MYI46uGhqV6/3uU+QD1MI1cOGIVjERW/HXUX3gMERTd54uPiu7fgk7VwX2lxKisT3OistZpqRlkYefEa3K4AO4WlNrQko75zfR6+w9mRr+O2gwRYiu+kU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Htk+fUCi; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a3864258438so338772766b.0
        for <linux-i2c@vger.kernel.org>; Sat, 10 Feb 2024 07:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707578730; x=1708183530; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSZRWCtO1Gobend+drzkRTHYxyZNVojsJWVebdRujxM=;
        b=Htk+fUCiaWwzgaPucHrqqza0yRprA3rsNR3fRamcGFQVdiMaY2ZhlmakA6C5MMNRRc
         O2akXl86W49r8c+2F51stliJ/wvwfFTM+PdIeT/+9KYAwmrewgRSaTjClWeO9Q3cLqZ/
         vcRqH8bU28YPPi5NCB+tXwiD0hmqGBAbGLns+C0seg++5549Tyof7CntZ3V0r/WLLpf/
         X1t5VpKxDJLiITPN17LIa2AZmjzoRFyzrum1KnAVVAuP8w9dys2Kip8NWfTCl/zmfEWq
         nNX8Elso4WXsHrtlWC0FltEQqHrSUwD1B3WacRbSrB1RJRl8DDDtKoza1oI/DQP/qSDu
         BD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707578730; x=1708183530;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSZRWCtO1Gobend+drzkRTHYxyZNVojsJWVebdRujxM=;
        b=pOfNbjkYFPJxD3QWwHFjn+KPfXLWrWxw9LzkJFoLCo/BBUcP5bZTIQbGkbtvZKRfWD
         F/mGAfQAw4CmnHRVizuk6yXoRrU3aFyKjq3uoNVvsnfz7P/HQMz0///s98GKNpZqcZ2P
         a7tehU95ZrGisb/UV+qEivTMBPyvmxgFo4pxj7oHxomVVG8a5z5rAyllzZeCe4jhZq/Y
         AXpdZHQOMUEdcx04EoDKgYAoEDFYj5K2syQ47Iueh/F8yEKkKnBe8aGZ7Wzt1+Hn322A
         Yj6gdP45dwE+0VyFRT+60EyjPmW7QnA78zctvEY32HRKsez2TL0tuFQQC2tnZrlxSPvd
         3iIQ==
X-Gm-Message-State: AOJu0YyXu9m55GxPUTESLPoWchnUWlbFjS4b4tWxkIynNlYfqT/y3f7A
	ln3mY5JhViuOQW7QFAeLxJpJ7QPA3jOUfdzlzndQitehxSAt/h31k9PWlViP
X-Google-Smtp-Source: AGHT+IGYDEGNqI/1FXsJVrkmSrpyTcjEt3aO6cjS2j1xv/LSP2sFC3ip0Oo59ywRFc8Mwl0KGSnPJQ==
X-Received: by 2002:a17:907:da1:b0:a3c:698:635f with SMTP id go33-20020a1709070da100b00a3c0698635fmr3995340ejc.28.1707578730354;
        Sat, 10 Feb 2024 07:25:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWL6Vh9k/2mLI2G272og74PiLhtprn5FKJutNV0tcf/PFXHPZW6Pvn4L+/aVaNmDVNipbFjMaLUoFGXpbJctpijHJezK6I=
Received: from ?IPV6:2a01:c23:c5e3:d400:ad36:6b8:178b:1fc8? (dynamic-2a01-0c23-c5e3-d400-ad36-06b8-178b-1fc8.c23.pool.telefonica.de. [2a01:c23:c5e3:d400:ad36:6b8:178b:1fc8])
        by smtp.googlemail.com with ESMTPSA id wb9-20020a170907d50900b00a3515b35be4sm1891845ejc.104.2024.02.10.07.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Feb 2024 07:25:29 -0800 (PST)
Message-ID: <d761a722-d400-4d6b-8866-4bb25d349184@gmail.com>
Date: Sat, 10 Feb 2024 16:25:30 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/3] i2c: i801: Avoid potential issue in i801_check_post and
 cosmetic improvements
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This series avoids a potential issue in i801_check_post () and
includes smaller, more cosmetic improvements.

Heiner Kallweit (3):
  i2c: i801: Cosmetic improvements
  i2c: i801: Move i801_wait_intr and i801_wait_byte_done in the code
  i2c: i801: Improve too small kill wait time in i801_check_post

 drivers/i2c/busses/i2c-i801.c | 125 ++++++++++++++++------------------
 1 file changed, 57 insertions(+), 68 deletions(-)

-- 
2.43.0


