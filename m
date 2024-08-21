Return-Path: <linux-i2c+bounces-5633-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B743195A60A
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 22:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7472E2833F1
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 20:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D10C1662E4;
	Wed, 21 Aug 2024 20:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbPzjNus"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84B51531C2
	for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 20:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724273174; cv=none; b=dMZGmxOnmvnQyM0XNFjB7LsjZBFoUgu4z15Vc6lAMmErgfvc3Ddw2okeAvwF9ysY7qIi70u2Px5Rp7KQ6qZkepMsa4ITXzgVUtgb+bSSMID3FvKJr9g96fKdNWN/VgVP3R5B18O+HBtIAg1B4YEOWYBz78DpF64NBVA8i7eleyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724273174; c=relaxed/simple;
	bh=ss3kMsZsWuzVz9QyLrHbNN2j/rkPy6yOTVij3tku16k=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=jvo4wPUF45GBMXbtJoWH7RLc/1W7FWKMSFuhwhJEK2pVMP3JNPzwaoDcDi2hFmkHI1nRKKjZ7QtDFU7Onc6JHBwqRuLD9BJtWk8wtb7x8OCvH1ImYDl7nNk3xriWhyxjSQfPlkYgGlOqcC111vQuHEhXy9H0RXPgDBdUZrx2+Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbPzjNus; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5bed83487aeso155841a12.2
        for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 13:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724273171; x=1724877971; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwM5whAsJ2Au4H8Uq2iOX7ix/DWDlLq8qs3fiLJVXZU=;
        b=UbPzjNusMwJfRmI2jHVRhNOFuxYsYzt0sQzigLtmA8EPeHZykA/7pssF0nNkjIRKU1
         N455PCg0INdp61xqCVKlnQDMuovNKeNPrvtFx6F5QEiVdvZa6eJ5fk7KXFNWXEo2/LIO
         zQiW99/m1LaN1BtHVbd5M/poqfuVVAdRmTir1bFUHTZXcpSoJykmsGLP3EFphIed47hr
         wZCxORYPMjGiVELBjgmIEKGK/w+4WNovxRy6bZR4tBK1u+FNNGk1FPmIpdy4ElmCBSqS
         rWdUZursAsyN2FTRwYf2W3UnUlEUwOnreU3VrbpesHy5G13ovLB+ALpRzT1O7E2ipoZi
         +Utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724273171; x=1724877971;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwM5whAsJ2Au4H8Uq2iOX7ix/DWDlLq8qs3fiLJVXZU=;
        b=neEX70TIMkQWaoV9q318QR4PgLunQDIjFxF72XhXtjhiTcSBvF+9W6MD175dKsNNE/
         T/BIc2HusoZ1XlhAbn0sHBjflv+Smlro2VW8roD45GPaYza8iFAP+wOutB8k46ITQDKx
         HFjEefEHW2bc6HKb0iB42YS67BDIdSYrCnzOKKpxfk3VUAL7oyuFxnC+R/fz1EfrUAvx
         Y8wITgF1UXGDMJUA1Ra/j/y7OCbLqi4Mt3juTeWq5pENTFPJphoyFLZ2w6XIBKeKrFW1
         P8VBnkZVfLGBFRZiUErRoS2qHZ7Kt8goluL+urcO0N4DQPOLds4Qog4LJe7Ld2NQcpgo
         XODQ==
X-Gm-Message-State: AOJu0YzWvxVpAuubi7BRWGTX2/lycLBKIcyC9+J6ykiDY717+IiojGac
	iP7WyIC4+NYsO+e6WcvkQ8wHie1xURF4KfYHB1Q8lLQZcx5Ja8kB
X-Google-Smtp-Source: AGHT+IHr5xclCt4AOvqKsG4gh9PCqiAFQPaWJKafSUZgvZ1sWyuzTie7HfaJOfWYEPE0G3US6h061w==
X-Received: by 2002:a05:6402:42cf:b0:57c:a422:677b with SMTP id 4fb4d7f45d1cf-5bf1f0a3dadmr2735482a12.8.1724273170581;
        Wed, 21 Aug 2024 13:46:10 -0700 (PDT)
Received: from ?IPV6:2a01:c22:76de:5100:1131:aa83:adfe:51dd? (dynamic-2a01-0c22-76de-5100-1131-aa83-adfe-51dd.c22.pool.telefonica.de. [2a01:c22:76de:5100:1131:aa83:adfe:51dd])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3ead28sm24192a12.56.2024.08.21.13.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 13:46:09 -0700 (PDT)
Message-ID: <9fabf29f-2b45-461e-ae6e-4391a40bcaca@gmail.com>
Date: Wed, 21 Aug 2024 22:46:08 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/3] i2c: Replace lists of special clients with flagging of
 such clients
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

So far lists are used to track special clients, i.e. auto-detected and
userspace-created clients. The same functionality can be achieved much
simpler by flagging such clients.

Heiner Kallweit (3):
  i2c: Replace list-based mechanism for handling auto-detected clients
  i2c: Replace list-based mechanism for handling userspace-created
    clients
  i2c: core: Remove obsolete members of i2c_adapter and i2c_client

 drivers/i2c/i2c-core-base.c | 108 +++++++++++-------------------------
 include/linux/i2c.h         |  10 +---
 2 files changed, 35 insertions(+), 83 deletions(-)

-- 
2.46.0


