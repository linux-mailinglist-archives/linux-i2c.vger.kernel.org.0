Return-Path: <linux-i2c+bounces-2608-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0123288CE75
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 21:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DE9C1F81CB4
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77E513E3E0;
	Tue, 26 Mar 2024 20:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/2rzaFz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914A613E02A
	for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 20:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484655; cv=none; b=PtUMByGYTf0ePAGLo74O4lHfY5AwsBPCGjRT6TZ91pSuKMuOFBrLD5r/ZWtkKNwlVrDoysijVQUp7O/iCX9cIek3kJtqVT0VsIENnzGh7R3WtUMJTa7nmbgFirwMu/6JxIldDhPkbuS0rZqDMc+YUFLQU4FubNOR+kpu3z3fz+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484655; c=relaxed/simple;
	bh=qJLPwum/AqfspnIzmOWzjV1qrgzPZNJu8uLTx/4rahU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KaHuZjiIrxpXScMdQmAzkiWe+P0uwjJR6JJGZhQHRN9sVegu8q9NzWrOuDLMMo4gVC0BZp4fPoOGodD5vDlPlZ9nfvtxz+xgdJBkLR1mIw2OzMTdK9bOsmEGRNwCgdCJgx2V51c3x7Dp5LI2xpjgpFVA03xWmFsdma4eGm8oA0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/2rzaFz; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a4a39ab1a10so344218166b.1
        for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 13:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484651; x=1712089451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8vNMvR/OqCzTXRIjmHHetW4mCviwFQpqMvTFrU4HAQ=;
        b=h/2rzaFz8etYmFuESE+xgJ7y8EAtjxXIdBlvXeq4T+krto9Y2POz+/k3mz5YWn38sm
         gIb8bcF1u1AvOtf5LG5kFJdWCbeldOYpa50m+/iZPT/3qwIpakGYk5qmyo8doIeDE/I7
         d81XAmjbXYbcLrgyvTB48fozu/b4hKN5xIRhB5huN1bmynbkJAOpNzCBKbJty5Ye4w48
         ztcabBJbPXiY1QyclVeiSyl6KmKlmsongCQcmFugSgZt2+tQEpYQ+7Hswnl7jai1Y0wT
         JC9X6vAQUTj5Kj6aaDwuSMxMMlaadal8XRkIv1xdt79GbCFm0UczDLR4KDmelFyQOj5z
         ACmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484651; x=1712089451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8vNMvR/OqCzTXRIjmHHetW4mCviwFQpqMvTFrU4HAQ=;
        b=mxjY/u9nMVF0SXQH4peJ3vm/aywr7X3CIHUXQw1pMUZiq6hJU8lpW59cIQXVaf5r//
         polNnlD8LDaEXszpjNrCIca6Sr9xizNnec8q1tmMj2uZ0Wfsax5y6l1src7MI0VRMKIg
         5hUjNKKVSrLQwJpWqeDAw13Ll1eaP11fwMtp6J3Zbl3wQvC6xi9IFkYI5RY2NHyIoBPH
         Toe452fiPg9jgl3EnNyz6CSIMImrkT78tqvdopjcijQdPKUHNVgvbjQYVkISKWPmYkA0
         R1OqA80Dnwt/AhUFTKwQjlZeDfSC+e7GN3xcaRlXNttRTRAwFt5R8Tn+4miGVyzZchrW
         gdSw==
X-Forwarded-Encrypted: i=1; AJvYcCXYz68xxSblnH0KiQp3p5H7BWFs0loQa00hTxdfWWOoUtfFpG2n+O8A+yyh7EgMtp3cLKJ2IeQynOj7r4a1ViceT6zp7Tg0rYVA
X-Gm-Message-State: AOJu0YxJ3v0zhE8qgOklmFpGZwn6CX+QE9TcoZghZL2/IoBHBoe3MZih
	axHqaexV3o9hQMXzqkAuvfz4qmG55o5kO6gn9Lq7C2+O6qN7IubJbFjcsF/hcU8=
X-Google-Smtp-Source: AGHT+IFb4JEt2HEwLreIO/b4GLNhMD6s6Nzsjk02Z8m3sgEQ5lUEmRg8HRX0TbD5U8VN/PyYeY8C4w==
X-Received: by 2002:a17:906:1713:b0:a47:3378:48f4 with SMTP id c19-20020a170906171300b00a47337848f4mr534451eje.35.1711484651709;
        Tue, 26 Mar 2024 13:24:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:24:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:36 +0100
Subject: [PATCH 06/19] coresight: funnel: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-module-owner-amba-v1-6-4517b091385b@linaro.org>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-input@vger.kernel.org, kvm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qJLPwum/AqfspnIzmOWzjV1qrgzPZNJu8uLTx/4rahU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7Qj2fX0r64FyoRM6EkM5j80xY3af0pmQvFg
 5BtZqFcjQmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu0AAKCRDBN2bmhouD
 1yzGD/4+JGxstrlsdoGYXZj4Ccq4FlQ4VMQFVLyDR7OuFttT2Y1L6Ak9C3zCZZH3Tb/bTppGteK
 ERowKV3waVO5ki0+f6G1rO3fqJn4srZhbqcx70gZurYIkOx8fX4j2qOJAOeYJtVm3ZiQTMsXQAv
 +cPaJulOwu1vBCC7/VjmfQz3ZWkQzHhV3gOQ/6RCjlmflitrfMC3T3v7bqUf2Jm/4MFTW+vYd6K
 dcOUoVmnwq0YDW+IECWoEawjWsU/IeJb64FZDnTF73pcwbZGi8QLGoC0WFO61LjqAXC0tNK1dUr
 hw/oFUL8O9uuhglMRm6kE0XdanRQUedGCFzK0ouqZZow4/x7EMa5C+X8JvVkrASkB2VfWVJmbOm
 DTIeVDfzcI6hr+ZZbAc1dvIqWf2TMTUKKGt4tPz/pOUwVg1KLi7nsDd+r5P6WZHlqvnhwpzusCQ
 CxPZrqUXumahYa5rssLLQWl8N2pE7qWBeFKJMpagZo409EEo5KuHWjU9j2p3378JVPiiInfmaxE
 JawL+ByFkETQw7RNwMOHJlUY6hQYCaGUmGzyx7FsIQR/86JIsrARRnq2M3qx+sKqHR+e6OFbpGx
 bwqotl6/tN4sf28DppeTKsvCy9FiaYdFjeGGb4FzBiW/sEXNLFoPXIGrmvztGjfYYVstUpVC4Sl
 9Wf5eZ2xqdbvs2w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-funnel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index ef1a0abfee4e..5ab1f592917a 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -399,7 +399,6 @@ MODULE_DEVICE_TABLE(amba, dynamic_funnel_ids);
 static struct amba_driver dynamic_funnel_driver = {
 	.drv = {
 		.name	= "coresight-dynamic-funnel",
-		.owner	= THIS_MODULE,
 		.pm	= &funnel_dev_pm_ops,
 		.suppress_bind_attrs = true,
 	},

-- 
2.34.1


