Return-Path: <linux-i2c+bounces-1931-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F09D860596
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 23:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7CA8288812
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 22:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D701E12D21C;
	Thu, 22 Feb 2024 22:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJ3wDOI7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4B632C84
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 22:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708640643; cv=none; b=R2ZW6QbpKJMUaK1XxSk0Yp9So2uN4lypOqDsbXJ/HpeimanxlppWIzCcOe3QYTHHfqB8kTooAFR6/KDQbU+cUtyBNZUkvYtbr0l72mUQqrJsCnBAzSNdXQVrHLPZb1NUQhnj0aOhcOLphTHTrHUP2wWdlYv+WsdG8tveayFcL2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708640643; c=relaxed/simple;
	bh=GFMoFv/l8fBsK/ubUe3yAwgj0urzvGnGC5umDQPS3Tk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=qxaFbVu0qWYcjijrxsKJK6wZl8jZw7tEEuxJPpn7lj/IFSYTri5Pw3fmlRpQXcHwKMWGGhwr8//AOhtkq9E5Z2sZJkZWL3mtp1MEVc6f84aanerv7c8J5m+5ce2pMvCrmskxmipvUZvq2ww83qMLNYnZUs32seLD0L6hxz/ZiyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJ3wDOI7; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3e7ce7dac9so28402966b.1
        for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 14:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708640640; x=1709245440; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yoz1tcljZlDPGdBDAMWt2PuBZzr7Fbqbqet4Ndfahb0=;
        b=UJ3wDOI7nePp/dZe6mol4WehNJbw2+iqiKeCJmj9gaqycujm0cVtddTGS+O412mLQB
         eWKipsjjeJBrc9U9bu8E16v2ppnEzoYolpGJJvBVfBuVml/gZE7Uzs4SRfLunVK1erLS
         qXg6iyFdpuNZLN/JHDmconSkhQSucPC7Cj9jr9SDmiDgCJQ/SpwLTv3brPq0rSm8r55S
         /Pnh3jmmPEoBUOaR5lXWdKcY5EghhuWKHw7KrOOHSDMC8u0EFkmtfyOLsxpm7FQIM+AA
         cOkCWwlJlgJ9nGKjqU+fOn39Vp1N6oxSFMJWa0RWtWsglngm/nj3+C3B4q4NfQDrrKpK
         TtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708640640; x=1709245440;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yoz1tcljZlDPGdBDAMWt2PuBZzr7Fbqbqet4Ndfahb0=;
        b=CK2t+HjVpLvY684Uh/Pb3dhYYxU2ae67SsX8BP1liCqm3xsmAfBC69nkZMnpGGgGpk
         nxdmumK0IYvM9EdOy7GqA6bABXDfU7E6n0FVUruv7fG4if7XKXKPbPEltO+9ZDSPuyAK
         +PAuxQu3wing0shqO+QH/f12+DU5vJ/e0bm9UNPy+oE8uLAMmYVll4jnk/sy5ofmIvnC
         pzJxjXfw84M5VEprawcBD03O7Vq+WGA2rMOildeBD49Rnk45X+8PaNqZlH6rCkNqCUGS
         gZ0DFGDuQodLBl8sBXjfU9AJCaNzPXLS7xlrK6oaQNrHkpWQBJQrws8x0D71Mi/Yce9p
         QtHg==
X-Gm-Message-State: AOJu0Yys1goQfYElYUqO8+ib3FuB67r4jhxV1/rx2b5fz2P80l09Cy96
	kzoQY2xXlmRH0r/Q8eTZk5rrOR2ZPGDz7OPW0l2A2mA4Sp2yDKEi
X-Google-Smtp-Source: AGHT+IGLgoDjRI8CEzsSAHbyIPmhda8bDttOjZL73uFEZDTltY63yWw9BeYsSEy2Qt/Htgs+ubqK9Q==
X-Received: by 2002:a17:906:154e:b0:a3e:eebe:7a2f with SMTP id c14-20020a170906154e00b00a3eeebe7a2fmr108341ejd.35.1708640640080;
        Thu, 22 Feb 2024 14:24:00 -0800 (PST)
Received: from ?IPV6:2a01:c22:7266:d800:30f8:c84f:4a91:c419? (dynamic-2a01-0c22-7266-d800-30f8-c84f-4a91-c419.c22.pool.telefonica.de. [2a01:c22:7266:d800:30f8:c84f:4a91:c419])
        by smtp.googlemail.com with ESMTPSA id vi11-20020a170907d40b00b00a3fb9f1f10csm145712ejc.161.2024.02.22.14.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 14:23:59 -0800 (PST)
Message-ID: <eac54582-44f6-4101-93d9-012eb4ee3241@gmail.com>
Date: Thu, 22 Feb 2024 23:24:02 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jean Delvare <jdelvare@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RFC 0/2] i2c: i801: Call i2c_register_spd for muxed child
 segments
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Once the gpio mux driver binds to the "i2c-mux-gpio" platform device,
this creates the i2c adapters for the muxed child segments.
We can use the bus notifier mechanism to check for creation of the
child i2d adapters, and call i2c_register_spd() for them. This allows
to detect all DIMM's on systems with more than 8 memory slots.

I tested that the events are properly recognized. However I don't have
hw with a muxed SMBUS, so I can't test the actual functionality.

Heiner Kallweit (2):
  i2c: smbus: Prepare i2c_register_spd for usage on muxed segments
  i2c: i801: Call i2c_register_spd for muxed child segments

 drivers/i2c/busses/i2c-i801.c | 23 +++++++++++++++++++++++
 drivers/i2c/i2c-smbus.c       | 18 +++++++++++-------
 2 files changed, 34 insertions(+), 7 deletions(-)

-- 
2.43.2


