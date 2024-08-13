Return-Path: <linux-i2c+bounces-5352-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C185E95100C
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 01:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78C58287633
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 23:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA161AB53E;
	Tue, 13 Aug 2024 23:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIF4nPpp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C753B1AB52D;
	Tue, 13 Aug 2024 23:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723590052; cv=none; b=qvnKOCufC0f0XaeYg6B7bHfC2u8khT0wbU/Oxv2jwWcZlhG8avOD5AXWNvRUpDD9n/KMtSIAjj6N8at3lFXx/YxCk7IMd0s7F17++T6RDfLAnpYkCB4ZxdpfMAMzQHAKkIFG+0ejR9P1x2qScrDr2QBHTOwQamwa7Bm8iahotEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723590052; c=relaxed/simple;
	bh=tUVsrR3UmP6exVgP+K283XAPgpieF6IeNkCxRW9t18k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZsqPslQPEVlZ8AjgLN3l3PrAClxe49bVk2Wfrk/hKSY3B4teQwueQlAghMA5Ep0lhqG9yOcsZK0BTQc7NSBFcXM1F0KxCboUQAB6z1zyJeUYs8RuqvUgQiJu7E86LX1uKgB4j0fnoEBT45wJvqwcfjBdGHYVG+6azS6b8RC5xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIF4nPpp; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a1d5f6c56fso344728585a.0;
        Tue, 13 Aug 2024 16:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723590050; x=1724194850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saMoUZRIGH1h+EWOkyRu+WmF8voJw7aMAURbI1aUKas=;
        b=EIF4nPppDhTTm7p06eSSnNKJOgPMXrzLMHCnNOWAvbi5hklotoA2Qd8V15fs6q8/fN
         XjCrEfl/VqhcEpqpR//qQRqdHomYkOiIoD4sxiE5l2XXCXxevLgwqFtk5KR7m/yWcZLy
         a86ynI+mObORwK6uOfCTL3f6STXC3x4LVxRbt3RFgSAJSCQUsgtJzLejrDmf+Qyi4Ekr
         9UnxEHyyX+Mnpw62qzIVO+ipqsAPEUhy6A7nRMtF2FzcEkJs/5pKVR2yPHXRWfMkUtv4
         /+jA0ZYBJWnJAovPADZCfxVA7bTTovejbNx0r8hVVYEVzFnDKF2cCOAEGtWeNX1r+8Da
         UPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723590050; x=1724194850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saMoUZRIGH1h+EWOkyRu+WmF8voJw7aMAURbI1aUKas=;
        b=PqqkjzprG+cbgSfclgmOHeD+5m9UUm5/lMioFbFpFaNYsJrOni9gWktHDrILPb0YzP
         CRq/XzOMQxJy9SGFXSEboBH0rf/S1mzFO+JmooBPhyI3wmReEg6ESyv6RZMrf/7YDEff
         2ybWVfRU0XXJwh8LokLrYEIGG0HNa+mXCNDVoIrUkjWwgbmW3VkQoHNwD6ZJjjIT+DN5
         8fbX68QMyFAZ10zJ6X+Jroiht2UkWUyJrp/aWwwLSl71SW7ScoPOBEbvvu+s0tCpQ+Zn
         /5ihpFW21OYACdC7irhwQWjDENy3cKNzJ0sGmwLeQUsUr0QguNdBf4hkIcCt4HTOAmtS
         IF1g==
X-Forwarded-Encrypted: i=1; AJvYcCWCYSUo1tQD3X8IkPelaGBxFlq4fCXWJ+IZ/nPnq/SwLmtDw9Q0tjnELld0XprSMVPWBmUjVwiI4ARylhIIA8Xg3WbpJND49L+yR/f33n5Gf04J1f0M9cT+DoX7y/WI8Tl82WmSICrMw1wIordWW56/0mLKRwfQvF0ZK0TVJUstBZgSDFCqmUkn79Qzi2yWS0h9SBnR9KsHvO7HeaLXe6QJ/w==
X-Gm-Message-State: AOJu0YxyqSHotOWP7qpjCf5MsGGJsxmWSkL8eOw4P4JnBVHjjk8j+nI6
	Et41yY5KPoY5p0vtXuYzjSvITl1I/IkDfn1KIATx4EQCzOV53pLY
X-Google-Smtp-Source: AGHT+IHbkGwGdtNT2VqYuMklhPwrPnGYsbDb+Pc8D3l6VzJoFwbLw/9bJu4Yp3SgaH4SIVAX1Fnvaw==
X-Received: by 2002:a05:620a:2a0f:b0:7a1:62ad:9d89 with SMTP id af79cd13be357-7a4ee3e5045mr148387085a.64.1723590049489;
        Tue, 13 Aug 2024 16:00:49 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7e05658sm379696885a.121.2024.08.13.16.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 16:00:49 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 1/5] dt-bindings: i2c: qcom-cci: Document SDM670 compatible
Date: Tue, 13 Aug 2024 19:00:40 -0400
Message-ID: <20240813230037.84004-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240813230037.84004-8-mailingradian@gmail.com>
References: <20240813230037.84004-8-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CCI on the Snapdragon 670 is the interface for controlling camera
hardware over I2C. Add the compatible so it can be added to the SDM670
device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index c33ae7b63b84..87f5e5bdbbe7 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
+              - qcom,sdm670-cci
               - qcom,sdm845-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -143,6 +144,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sdm670-cci
               - qcom,sdm845-cci
               - qcom,sm6350-cci
     then:
-- 
2.46.0


