Return-Path: <linux-i2c+bounces-4469-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD38191BE7B
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 14:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C18E284794
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 12:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501792E64B;
	Fri, 28 Jun 2024 12:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bE5MOK8r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0FB1BF37
	for <linux-i2c@vger.kernel.org>; Fri, 28 Jun 2024 12:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719577557; cv=none; b=E5u5PrbI+oID9C2pS+F0hR9SKT5bfmsJTdtqOAdhg9L+a7+a1g5693Ketvxlz2+uDJQhUY4gpHks/TtZoCKzqEjtWVE4FQBmXnB7SnROOLmQHV5aP2t5DJE68dJIyEqn06brXdJ49e6sAe7G2EtlqxBTYETpjJL+KAEGx1OuwVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719577557; c=relaxed/simple;
	bh=ZLw6FD7HC6bTLgCkKPX8q2gtXMLwYolVZLyuq8o3t1c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=itM3iG9c54+Y7my+xkGvVehakrympIhpPvuKA+6iafRh0gmubV/BEPjEwS2fRmAuCEHy6yNEanAecZa0iomfK+FWzOmJYJ8XX3WBJA7SnDL2Wk8NadJ6KXpgHuK8plFAgD20zzxI0su7a7XAOgq9C/S4HbLkjHc2xWgMG2UV/Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bE5MOK8r; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec10324791so5219461fa.1
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jun 2024 05:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719577553; x=1720182353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5h491pa+3RrKCF5O7+9fT+kAjgsR0lx+Zh+csWf5b7A=;
        b=bE5MOK8rB8c9S/zfqVgt5uuSEj4Px0NW8te8CxFV228S+MRfJr4jkdMH+7/vU0RG5c
         o9K8kUHCw7BqJiZFX3PZ53jcnBsJ3GyivFwBa3DWQprNBO5WS9CqMuHYn0o6/jMqleef
         dGvyFi21/aj3RbS94ZcAe5jGe/FQ/NSHAA9K/HWArxvMUl6e5TrTxQAU7AEzURPg+UjV
         qYare+Uc+cUSsixslpH1OKPGWHxA6h6RHfH9i3FnU9VMIUW5pJSYlJBhvQjV286Qe0oS
         2S2lcOmkp88qfKnw5cO3kDboWwQPceGtfe9WuCgjXBc1E3R+KE+TagyEhaiHpcy3Co/e
         QHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719577553; x=1720182353;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5h491pa+3RrKCF5O7+9fT+kAjgsR0lx+Zh+csWf5b7A=;
        b=vctp6DCNvrExY24Sg+KbB39vxV+wWKRiFwETChey63kZOK+QQDgm46/J9L34cE32Wh
         uWvibr7Od/kxvpsNQXbtaWbK6PqrRL4Q5nae/gbXaRpSy9pe1oe4BPew9tA1QxZ4YtTv
         8NwaRJ1dhmr5F4+x6PjJN4e5cIihZZWS/IQwHSsyZzVYjaP+qFxzRvJjFG3pPhTNk6a4
         NZrbG7Vc4YunmY82tGR5F9SLn8OmnLcdELL0k+UYywRfOZGA3CtjNNLaJmvWbcjbbVYq
         IVEZTc4cThVRG1WKiytUbXBkc+9B0JvZFDS53YRrzcwJ4n+O5h88ums7w9AdR6NgvxOE
         kxcA==
X-Gm-Message-State: AOJu0YxoU/eF9f5790+xbeAh5bqtFv4V4cXnfoFjN1VS+M5lhD4naI6x
	DHGOnJupIfoHBB8NHtzyILEMaPIjqJtCW/93Vvjr8StgIISAQ2uqucO8mt2t3TM+LB8N/rhyAJo
	s6QY=
X-Google-Smtp-Source: AGHT+IF7WsPXXtqkv2OxDtr+SNxuzmrIo/l3R25+gTeiBTRBBW3Gg5m8xSfV71ZCVtgxNUXn/z4HJg==
X-Received: by 2002:a2e:918a:0:b0:2ec:56ce:d50e with SMTP id 38308e7fff4ca-2ec5b26952dmr103419991fa.3.1719577553430;
        Fri, 28 Jun 2024 05:25:53 -0700 (PDT)
Received: from srini-hackbase.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424a2abc2desm103293895e9.1.2024.06.28.05.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:25:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-i2c@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20240627233747.82341-1-marex@denx.de>
References: <20240627233747.82341-1-marex@denx.de>
Subject: Re: [PATCH v4 1/4] nvmem: Replace spaces with tab in documentation
Message-Id: <171957755256.50097.9012356701198666803.b4-ty@linaro.org>
Date: Fri, 28 Jun 2024 13:25:52 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Fri, 28 Jun 2024 01:37:27 +0200, Marek Vasut wrote:
> Replace two spaces with tab in the sysfs attribute documentation.
> No functional change.
> 
> 

Applied, thanks!

[1/4] nvmem: Replace spaces with tab in documentation
      commit: c86a30c762e78fcabba878a72de5a1d6dc8fb813
[2/4] nvmem: Document type attribute
      commit: 850499fede5bba639616e5b113e46c08a6400a0a
[3/4] nvmem: Use sysfs_emit() for type attribute
      commit: 95542b7572d7b124ff2fad6c0ad682916cd4f814
[4/4] nvmem: core: Implement force_ro sysfs attribute
      commit: cd638012bae81c222e5e128b9ff1f7db64176f27

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


