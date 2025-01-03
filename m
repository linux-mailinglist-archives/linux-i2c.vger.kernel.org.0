Return-Path: <linux-i2c+bounces-8883-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D8A0084C
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 12:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BA5018846E6
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 11:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F196E1F9F59;
	Fri,  3 Jan 2025 11:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xhNr38+M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A6A1F9428
	for <linux-i2c@vger.kernel.org>; Fri,  3 Jan 2025 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902726; cv=none; b=DuJuH9jBHx4DQluN++52CUodDodkzskk120IWXO3jCrG5okXkipGNnYA3P+q/N9W7ED5G6bKQEtUdctJpf/bkIhPwEGdCGXHWbMuufpsthcXMxQMS7/2Q9NZF3GzE/RDSAJzZhESPihirLYWAysQpHRka5cZjyWAsh6wbYfJ79A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902726; c=relaxed/simple;
	bh=lGFGwODH5qNtH4RDKkJyeypOnyurQWFJKqc9t5ncCnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QKhYg5ZK8fbm9wCNZLetgRbRcKg9vOCnImyMZI96sLVtKbpZfTFOKi4ET7JWXj22/qkhbzHheGKck83S7uAiJFSGEO8MkURXZtEbq2Tttu4QloGVYGLJPPMjg7SrMmdowRL/nPeKpoSjfQPd7+oi51NuWqNg8mGOiY+E9EA9I1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xhNr38+M; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9e44654ae3so1990988066b.1
        for <linux-i2c@vger.kernel.org>; Fri, 03 Jan 2025 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735902721; x=1736507521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4iMzFEzzJ3QSTPBNtLdL31fQF76tgOrStwKGvcP4Gw=;
        b=xhNr38+M9dgopFlgZNephP5Z7FABcIPk3jgz/4G42h0vqjnxUB5B607s34QEaHVWPF
         fySQzK5fzZAvGYsaclPSBDM9prRPXvjmtISVXnT11wEIKywNPLkKYz7Wxz2BsMYLWEMo
         6h8D2bgwwclDOo2nZLqQGGCfC+nO6cNqKlSEF1NIrHm0/OfET0pq8khc79fmnvqdTcN8
         X2j4w1hH2MveUv9gOF0FCconFYzJrI84b3VsyGZ+4DqKXi9Hqwhg0rZox5XmWKyUYiwk
         TRtaPeva3IvAa0JSUtQ/adUnrBUNJIBpZV5WwBq0BUeMc6VjLREq/VKnHs0XkNO7X0a2
         y6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902721; x=1736507521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4iMzFEzzJ3QSTPBNtLdL31fQF76tgOrStwKGvcP4Gw=;
        b=XDSsqytRYcsIIKXP8mBk59cToLO3kEuzgp44HUGKBY0YhQ+3joVrS6mwAMu15Fexmc
         Bu/uRer393254OQshiRy2x8FYwdHcMu5/T6Ur+5f09QP9xEeQ9cvTNHpPkcaVOJd1OGm
         EoarZc8393SNjt7ydZT8FK38iARtJLNmGOK5xarEMqc6pRvj9sFNnZnOBZBfPUbBWbK+
         43o7ljDtJXZX6W+K4CK7TtSjsOzODlvzt+SKArVe0q8Vss0EZPIyoN+/5jIaPHK07K5R
         y8T3WjC/F+RT0NWo9jvnmC0TiCETu03abSKu1lXOddUjvIwBE1BYVPmXmQPpHhaNJR4M
         wIFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOvP5rfaOuBr+pQtCxtueyLi8p9JOS1cEHyWZNvOYgPo7ooi9y+uGV9zGU3nf9mGSOV+2Ckd6ERkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxtSvGsBZCLBJwzIMSWXBrALYNMFeg4cErDTdqzivAKx5nqBDg
	0rgetGLhyaQxg92GYATgVmO6d5P1CaEgIsIY1MB4flhQsoSC81PMqrWGQiN6WGI=
X-Gm-Gg: ASbGncukFQ5DZVqHE8AqLsnn7lmXuRQhnNBBE1N0QhdhFWXP1RCNedgZKbDs5ewLUKd
	/dZpI2itsiEWFaOA5sYwu+yPinmB5KDYilgNB2OVN184ucUCArpOZ6usr+JfMKesxIXQZrAskVU
	sTYmSdkLJiDSU5pB+Fy78XnLYuSdfPrEhFgPbuCYiccjx96YnOms33g6xQyDWdlyPZj0gVC72nt
	iXo5xRGo1jNn5JPkcq2j9c6IEU4D1TeujooOlZuG2O3GHZecI4EldIzkBZ5K9ba+Jb+zvdwx5OD
	oQ5sswLe6Zi0lJqAWSO1fXCFaw==
X-Google-Smtp-Source: AGHT+IGY3KCqXAMnzfDM8VRtAfveUdsHx9ReCbN6sAoZ3bDPUXRPiNKubpCdm919+ev6Z3E8BVckAw==
X-Received: by 2002:a17:907:6e8c:b0:aa9:1b4b:489e with SMTP id a640c23a62f3a-aac2ad8ea23mr4537239166b.24.1735902721429;
        Fri, 03 Jan 2025 03:12:01 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm1894101366b.183.2025.01.03.03.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:12:00 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 12:11:57 +0100
Subject: [PATCH 1/5] dt-bindings: eeprom: at24: Add compatible for Giantec
 GT24P128F
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-fp5-cam-eeprom-v1-1-88dee1b36f8e@fairphone.com>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the compatible for another 128Kb EEPROM from Giantec.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 590ba0ef5fa26180b7dda4789fd49ce9b27564ab..a2970c7c8f27600ad0d495a7e14875a3be611c03 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -134,6 +134,7 @@ properties:
           - const: atmel,24c64
       - items:
           - enum:
+              - giantec,gt24p128f
               - renesas,r1ex24128
               - samsung,s524ad0xd1
           - const: atmel,24c128

-- 
2.47.1


