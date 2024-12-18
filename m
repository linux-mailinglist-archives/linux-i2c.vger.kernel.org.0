Return-Path: <linux-i2c+bounces-8604-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9289F69D4
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 16:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34F2E7A4977
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 15:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09C21F63E7;
	Wed, 18 Dec 2024 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOdUcn6C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6F61BEF60;
	Wed, 18 Dec 2024 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734534982; cv=none; b=ASSlfqKF/GBbRlr2hHj/yGT8xVMaqQ/y91ROG0g9IWbotNF8e/YG+6H0/bfC2rl1fL87ZkCH3S28cydvw1dk6/7uhKOK/DC/rXQRSEdmissCU+rFgOCx4awU0bJ4y/S4wydEVL7dHQ18cge4yzW8wtdXkZZg+drEwJMnM8ae+7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734534982; c=relaxed/simple;
	bh=KIFSAzZCtvU0AQbHh2suV2lt5t67895Hi4IfpyD5AWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6qKmEnH3JSdptIZI5jH565Gseh2FEQcpYIBy5KltGeXc4KTREFxYN4NWSyROOTcdG7oOHMt3nbyDbvOWnYoX+4lJHIx6cUcCLHMZauaPvOxWZWqNiLdx3Ughs/nV++3hTtMpQjgF+5J5CI14lvxZMLRtSOBzqvVXPldOr+orBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOdUcn6C; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-725ecc42d43so5685422b3a.3;
        Wed, 18 Dec 2024 07:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734534980; x=1735139780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MDhAGexGxj9ILO+hAO6dd/OKAIC/9t4T9EMrSgxzeQ=;
        b=HOdUcn6C4vEMQIgzZatMM3SR/Cc0Pd42/2Xu7i22TTpFEa+8BjTbu9YNd2uacmoUYT
         hJSqtkiTFnPnLTk7z29aGCcfzetsBR3FmEM9DPH/g6boREqXWc7pQYMikdihsHqmUCUs
         EnqHJE9Wg3mKt9YaUNE3XoB3BCLbWIMp5/V0VPQdN4md2TGwR5P9AMV8ihw2PByaVBhS
         R0w5pYVHtZDFgaC2PbaDhX1IPQsRaEQIqggctunaPipw9punAaSysA7GQx5JAOyu72g4
         tEKwB2yvTIp3/K1tPWtjPmMtmuFN95CKPPTOPG6/b3XM4lJ67RNcTSVg1PbZDX0Q88Qn
         LNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534980; x=1735139780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MDhAGexGxj9ILO+hAO6dd/OKAIC/9t4T9EMrSgxzeQ=;
        b=NxzuJ74wrtcjPZIDbAqT559QyribVOpcH5zzUiNOQnPyA8LTTpWQ7KRJ3pUwH53vc0
         w2A9VPt28FFGXmz/TLy79kWqz35g2qGbHib7HcH1OxAE+jsuVwgSBLrM8Z64Pi4KixQH
         xN/JbrcKly6jKsJla0h73P0Vn+yUBGZ9h4zfobyIor1FyfYb0uJLMPnfwdO8QK/fqE5n
         FzhG2T59GieUCcxyBltX3eEdcskTpFBvQA3pQdlxMYgYwPs9+SDLRBcnfyrJk77QbpoX
         MD261TlpAA7oGJkxWsmmvNxguVDsp5qE8JmegLLygSikxAcF8SDumRQ4LUMH8aqUlEHY
         WwRw==
X-Forwarded-Encrypted: i=1; AJvYcCU0yVdOWqDDsswzfWuJBEXCo8pa2K3VEs+7kfurP/ppUFrjgwfP8Bm/bt/I8WhUDOiaEvuBtts2GaWD@vger.kernel.org, AJvYcCW8qeRn3HcyNJsgA+k5nlEpPHHjlZkRrmZAryH7obebu7YnAtgexMRKh0j1AAp11CmSBcRZ3gYTFqrWGfD/@vger.kernel.org, AJvYcCWt/X/2Cl+QsXPalWGS4nNj5rLJnD6VCUJ9UY1uQrTAj5F3Pe8mcp2Ij475zC1T6IyZpcQcunaSo7+l@vger.kernel.org, AJvYcCX7b/VWYzYmPmeEYUUbHxeWg8WwjMNPZBlRQHnoIKzAHOByz4M9lJc8UPiCFpyMrPgU+XPKf7OdHhIi5MU=@vger.kernel.org, AJvYcCXmEaYcocLUoywEOiQlaV/wYQuYHI8acCgDtxcp5uDOal0oIEgFd84bJFic3t5cFfo37dPCrtaK5DNc@vger.kernel.org
X-Gm-Message-State: AOJu0YwnzgiZPWwcizTYjNKmjMZJHVFzHqGtLonLjW8IHblGeT/B1/Kw
	zXDX5xjbcLFvKGpx/bOtknCR5eNYDemaIyQ4CSEojiXJGH1mNb9W
X-Gm-Gg: ASbGncuJX8vk2tlyyEThsNWR1Ya8bGes49Y5OVweXR7xattbhzf+iWe0J5kZz4hbdxy
	Hjeskf/zKOQY6/5KqYBr9M/agmzg8sOJ856WX7XK+rvPeu/2WBK31oc2QrjwIWM5YTIHSqOZvXc
	hopRIDFoPugMnYelX7xIzj/ZZg9GPIzl9xjd52giTq08S2wlmKO2O0TLi2KiYVPJGn/yoJqt23z
	5YNlPMJSO50ssm1iofRdHQCGZhY4rlxPjoUxl7/TyTtH6dIfIvyIlAA1SUDPLKRus3uKg==
X-Google-Smtp-Source: AGHT+IEaKoEueLcUrwUOhuGDoVwbtg1fKAFRiScp1E/Qo9EgYejA1PQnAX+xAskmVNSPNqS5N9ErCg==
X-Received: by 2002:a05:6a20:c6c2:b0:1e1:ca25:8da3 with SMTP id adf61e73a8af0-1e5b4820f26mr5938589637.20.1734534980432;
        Wed, 18 Dec 2024 07:16:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5addb1asm6364819a12.46.2024.12.18.07.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:16:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 18 Dec 2024 07:16:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	eajames@linux.ibm.com, jdelvare@suse.com, corbet@lwn.net,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	Delphine_CC_Chiu@wiwynn.com, broonie@kernel.org,
	peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
	naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
	patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
	peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 4/4] ARM: dts: aspeed: system1: Use crps PSU driver
Message-ID: <d3de9f99-1cc2-491e-8dac-1a5d243e17f0@roeck-us.net>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
 <20241217173537.192331-5-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217173537.192331-5-ninad@linux.ibm.com>

On Tue, Dec 17, 2024 at 11:35:35AM -0600, Ninad Palsule wrote:
> The system1 uses Intel common redundant (crps185) power supplies so move
> to correct new crps driver.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

This patch will need to be applied through an arm tree.

Thanks,
Guenter

