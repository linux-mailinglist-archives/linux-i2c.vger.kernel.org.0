Return-Path: <linux-i2c+bounces-4835-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F3492CE02
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 11:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 057D11C23072
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 09:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE4B18FA05;
	Wed, 10 Jul 2024 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gm2r9EeE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A120459160;
	Wed, 10 Jul 2024 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720602925; cv=none; b=nLBnozzXLeig4m/yHKqrij+tQoE5H7skithaZNASHt9ioKQqZj8GJEMqdaihfDHEBriHxg5m5qK+73Wj+caeZlNb6VI0tcq/b0E7W2Zm8ZkDC9oZk91zjMF520oVHsVzwFq4vV4BvAt61hsJJMNytp/ZzXCquz4ZlvaiNUz8lB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720602925; c=relaxed/simple;
	bh=U6uSuiOQr7cJdidG6Se5kn3otyFo/nVBww9vRyRM+ww=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=vEzwA3d6OlGByBmXqObQ64D7V0w7OJan8/NsjgA8wBLMZRghrVDnpyHq0vUeuLSf3vamKDrdbfRdUG0DHTggGz/iib4LYKFI8+v2DP2hGD7TRMZj3kH3rVNuw0WmRbNe34ZZX3j57GJs/zf4RGMFQYh336Zf/2HCWCMex3V7fb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gm2r9EeE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52e9c6b5a62so6637815e87.0;
        Wed, 10 Jul 2024 02:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720602921; x=1721207721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ArFh9MZnuzA5Ph/PTRIWLDz/F411ANgeX7cDdeu74A=;
        b=gm2r9EeEuvsQPHUuKKScXUIcVfFLSQaguju6B3lWTJWf4rMvwJCg+hj+/ZedzokJ1A
         AoMdp50vtYzHdpIk3KJdkBOy7gqZV5rmBwNDVB80nLGbEXIFxBj6Da+Cz1t05fvyLxQR
         vfPAee5SmV5/eU2B5uodhA8DWa1osU4cqo/a1gOGvIaU+k1glI5Lef8NShkzGY1K+ckF
         WrDM4RuOAURVTXFNZEGVWubNusVyE6y7aPN2Shryng0d86emvwPkw9IQ/59fQMd++AEa
         tj0qprd5YOWnx5djocJqflT7f+Em8Id6QBVbjH4DmR5ohnWAqoeCmHkl0k5fx3yXAwZQ
         tU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720602921; x=1721207721;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ArFh9MZnuzA5Ph/PTRIWLDz/F411ANgeX7cDdeu74A=;
        b=FyUq1YVhAzfcfz6AIXxxBt6ozWF9T+E7Z8HN4k4IUztBZPayQF1F4qFSXFvCvxeAIx
         9Hhj6G99KOpIjfngA80W3vMd9ND2+pISBbLRC/u/FyKjnqMFhgmRxUC01Mru4+6e9u5N
         QedNMM11KW+d8JmGTHpr1BgtnCJg+13Z2oCKBLYiT8lmktDoLq21L1M+L88P/WijJshQ
         9wVkRq+gT6lB4C4LPcDWVsLZDKyMN7YQZ1RWYUiZfCL51tMNa9kDmN9LPJknKvYy/MP1
         DVmR0aHAKvf5SqqHg32GgbhrlosaffsVbRlcnIFvSa649M6Qqju+YwhtlrHXGhLIv2nd
         nyEw==
X-Forwarded-Encrypted: i=1; AJvYcCVmx5W6EkCIzcQifVdTIfcNuKztoU/kt3BJkWNBzFeufmOYeKF3gGMvgvoB2jM3kr0qSjWftO4Vpwin4NXwhkRy3FnR0TKQ3xlSdFPNJqVZsTMEjMiEetcImnB9s9qMt4r+lwmNtwwWEAbIXnF7Clk8bRumnnxn8zn2CMKfNTrF1tBj4oaeZbmW9TQ=
X-Gm-Message-State: AOJu0YxaOVL5a5FKKNJ2kzpuPviO83OKRzKbzCGC6ZQEPptMlje0yAXU
	AaY1ufXKNNQ7FLc1w07LOd5Q8BVhkNEh46duvC3fHPa1/S91PPMEZdP5+g==
X-Google-Smtp-Source: AGHT+IEHwoR4lUflEvXgQp7sPamQNBBmvHBUPLpX8/fuj+E4rBxHFStvWzC7Tj16yYvw5wR/atq/GA==
X-Received: by 2002:ac2:4c56:0:b0:52e:be49:9d32 with SMTP id 2adb3069b0e04-52ebe499f4amr1417318e87.47.1720602921079;
        Wed, 10 Jul 2024 02:15:21 -0700 (PDT)
Received: from [192.168.1.105] ([31.173.87.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eb8e492ddsm537649e87.88.2024.07.10.02.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 02:15:20 -0700 (PDT)
Subject: Re: [PATCH] i2c: mark HostNotify target address as used
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Alain Volmat <alain.volmat@st.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240710085506.31267-2-wsa+renesas@sang-engineering.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <c8f837f5-16b1-a5da-c687-a95d2ec42fa0@gmail.com>
Date: Wed, 10 Jul 2024 12:15:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240710085506.31267-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/10/24 11:55 AM, Wolfram Sang wrote:

> I2C core handles the local target for receiving HostNotify alerts. There
> is no separate driver bound to that address. That means userspace can
> access it if desired, leading to further complications if controllers
> are not capable of reading their own local target. Bind the local target
> to the dummy driver so it will marked as "handled by the kernel" if the
                                ^ be? :-)

> HostNotify feature is used. That protects aginst userspace access and
> prevents other drivers binding to it.
> 
> Fixes: 2a71593da34d ("i2c: smbus: add core function handling SMBus host-notify")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
[...]

MBR, Sergey

