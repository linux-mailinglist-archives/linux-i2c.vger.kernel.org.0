Return-Path: <linux-i2c+bounces-13658-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4D7BEFA3D
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 09:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B2573E4582
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 07:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB902DBF49;
	Mon, 20 Oct 2025 07:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6NYcsYD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197EF2D6E51
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760944681; cv=none; b=ltU0UnXKi5gXrgnOm3Q2Eftlb9gygfkYaNY/K9X7WQrQ6rkVDr5kCXTPqi8i4aDGuKCfPGXMXMOA58TzKeR0k3CFogLfOqvx4bxM03F9/cKw2jzWfxdAxFgEYngCqooLI01OJe2/8swNbi8oxo1qvpvhqQNDUIhVm6HDdxU7xzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760944681; c=relaxed/simple;
	bh=5vuOIHtLq7CFaEidcZicx94qxk7qZlaIZNjnBzwUQCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZIUApufSLJ5x3ZdKM4tlbIjc2idHsU1RHkLgXQ5Gfnt0l7WDa8oZhViz4dTOskunfEqFKAmhs8AnZ2s8qs756qJ+95OVOlYqlzNZrxqRI2SquP0l7Yb2LKeiftB7L6rqmoAxo8QjJiUuZeR7mZXSm+gKNlUnxzoHTa/34oq/tBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6NYcsYD; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3737d0920e6so42514821fa.1
        for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 00:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760944678; x=1761549478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFWIsHcR+hD5XAKLrrYCj9xMsNWxUYwTXzF4H7urqUQ=;
        b=f6NYcsYDfqQXcUFXxSKmX5xIqxdRWlHLi/to1+Srkt+Bb1urK1Dq3WssOlDf9yrjwE
         Cg0Rr7m3e5LydZTXAMOhNVgUaWn+ZP+pq5U433vfg25tOnmtQMutfbJf6qpmVt0Nd2dt
         q+CRCDyEI+rIVP3ZsmD+9cAkVwq/qVEtBmsSUlwyL5yB2HaWvwVbYY5GcKWokr1HrHDI
         aqWurkrCuuvrYhsEdaerhoN26SmrkDjaWoBeXbnNG3/m30RoNhfmrqYEso3BUB8u7gCY
         hPtxZti4HM/S8M+iGOC6nEHUi4uwhnwIC/4kOXp38zsSC86AUBY9MlzElDDGh67x4q2r
         lDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944678; x=1761549478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFWIsHcR+hD5XAKLrrYCj9xMsNWxUYwTXzF4H7urqUQ=;
        b=Y+6I293RmDdo5hFlAlPunObLpJ0/fLOWuIfH/R2A9DKwgKp/sBGAXukB6fZPoG6JtO
         XQsVLW0VxsZKJ3JVt1TSJUn9j3fZD3rQeyqzIWdl0iMmAMF+VP8mqfrnBH1wJE5PBn/S
         r0UfF8iInF8g7Zt9u6+oeyZ6g0kgRa2MaxhsVw6DWmMBwQ1mLRv1IPBbEaiQTX6oJ8R/
         9PuchTucQz5iuhHpXik1u7vjA/E1vozA74tsbyNhv8mXgSBTxDdgXIatlfhESb88PnjU
         5NtXqH0ASqNVf1idyjKr62otXUT1clMFBjeXNPtNvEPrSjqsV21td3hr7ttHDEs58/b6
         +24A==
X-Gm-Message-State: AOJu0Yx/H/u450crA4rbyyuXylXOY7ROTQ0LdMUk3KU8qHFIf7dzfYRk
	wOEwHTiuPdV3ku8fSVGH42qghp+NKt7Z1siwjS8Ku8IcEZ0jLlEoCkU+
X-Gm-Gg: ASbGncuuvQ6FiAAfVEw0YQacJVa4EKflwV8nxmHOvP7GxXfb1NlttBtq3FcBIzBo/oQ
	i/LztUL4AH2gKVHVQ25FN2q0gXE9b//rLrw7GQ4pSj6S3Lc2iWr6J18Am5zgWaOvkL3edNeA+3H
	Dq8VYgNKDkDk6s+q4hpI4xW5H26QUkjiSvmkqJ9xIsY1vStwiB7cYVm78MVqfI6/NIEy58SDmu5
	hsas6qW1XmkWZluhzbnCxiGrP42iVLeed/CAD0NTttHUDtGhYc861DsDvtf+9bUhtRUE8UeN5R7
	DXLWgEbaP3VB50HvyfOCtOBPMyXYjBhRyLTDENBNvXoasEzz1CrxyVtLI1CLnxq6U445Pg5hDmU
	R1lYsy5l4eZNtGYc/7lV8R4/lkz2otH7aR+XqFyIXKdhcy0Lvf1Kx3cQnLKkj+RMw5kqrDjd5gd
	FdkBZ4tAQa8vfiwQUmJFJxaCu0IBCwYAdG8oUvqMUbBXYBNZym41te+2s=
X-Google-Smtp-Source: AGHT+IHXByz8VitGJjgs3nH3R3vZgX618KuW3LJgEm0Ki4juvIMqSu3YilgibjYpLhrcCwdymQlHCQ==
X-Received: by 2002:a2e:9a0c:0:b0:351:786c:e533 with SMTP id 38308e7fff4ca-377978ab86cmr37067571fa.15.1760944677919;
        Mon, 20 Oct 2025 00:17:57 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921ae62sm18863341fa.21.2025.10.20.00.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:17:56 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 20 Oct 2025 09:17:24 +0200
Subject: [PATCH v3 1/5] i2c: core: add callback to change bus frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-i2c-mux-v3-1-908ac5cf9223@gmail.com>
References: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
In-Reply-To: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=5vuOIHtLq7CFaEidcZicx94qxk7qZlaIZNjnBzwUQCQ=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo9eIJOGymSysyiJWdt2FAXU9oW4MmgLIfe0XX0
 4y5pTaPSXaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPXiCQAKCRCIgE5vWV1S
 Mr39D/41YR5hxoU0Mg4dWKd+5pjXIF2UTG5GSN1R+tXLqNmx2OdXPIGIkovXdgmYHUjNa1tBR90
 2giVBkbZLDeXNYYQEAUtm5qvpvp/8usQxSjjP+uFPF/Aef5wokgaN7AgzeMxOzJMlHRgyJSrmzc
 wm7Skn/P2U/Y3s0fhc4oMR0yGN6CCtb28h5HEffgwi+MwgA3n791Rj9diEsokY/SgcgLR9hnk7Y
 S0/0lnkOvOHPAg4OSGYFTvHPTYilRhk3zn+7Z0oci8JYkOqafe2KPBn7z/+DJBZxLcQEUNENxKY
 RurpcfSDe4KfwHPWM9KZ3XU2S6gkt2cslYH5n575XjBwSy/MNYAGKNNbq0eg5z7S/ytUNniCisz
 f+O0QFKJyuWIo7KQMPoIxV6eGDqigYV0jgbcUP3+j4oC22UcCW70PFwFjBJPbPSF0A/UYefzf+z
 B49NvCs4Aa+xMUfz8w3jC1xOPHwvqKdxEWXzwJQRSO/JMrybif7ugMEqTYcmzigjajTUKgbTwJH
 Z+FgOE0KSUurN3H/H/6Ugsn6B1IFZAgxzvF/XxoVeeCsXIW0pnYP+xETiiZ+oJExzpC/2K6gc3v
 16WDV+P0PNZf9SBYt9hCcR5z9uusyMHsSjJwL8l+0JhkikVO3sS0nm0mvVVtLIxuhFB7ClWb3US
 eOBtKLUftn5S49g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

All devices on the same I2C bus share the same clock line and the bus
frequency has therefor be chosen so that all attached devices are able
to tolarate that clock rate. IOW, the bus speed must be set for the
slowest attached device.

With I2C multiplexers/switches on the other hand, it would be possible
to have different "domains" that runs with different speeds.

Prepare for such a feature by provide an optional callback function to
change bus frequency.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 include/linux/i2c.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..d147e388dbab27966beb4dfbf869928b429e082c 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -742,6 +742,8 @@ struct i2c_adapter {
 	struct rt_mutex mux_lock;
 
 	int timeout;			/* in jiffies */
+	int clock_hz;
+	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */
 	int retries;
 	struct device dev;		/* the adapter device */
 	unsigned long locked_flags;	/* owned by the I2C core */
@@ -835,6 +837,17 @@ i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
 	adapter->lock_ops->unlock_bus(adapter, flags);
 }
 
+static inline int
+i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_hz)
+{
+	int ret = -EOPNOTSUPP;
+
+	if (adapter->set_clk_freq)
+		ret = adapter->set_clk_freq(adapter, clock_hz);
+
+	return ret;
+}
+
 /**
  * i2c_mark_adapter_suspended - Report suspended state of the adapter to the core
  * @adap: Adapter to mark as suspended

-- 
2.50.1


