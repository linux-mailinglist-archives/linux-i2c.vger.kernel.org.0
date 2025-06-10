Return-Path: <linux-i2c+bounces-11337-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F51AD39CE
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 15:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D527B189C329
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 13:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2876E23ABAC;
	Tue, 10 Jun 2025 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjSrb2mA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAED29AB10;
	Tue, 10 Jun 2025 13:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563160; cv=none; b=e13P5bwMF9T4TmctmmBwwBkfdOoekQlNv67pQqKug4xmlQIvXaH6kJ7QHn8RaLBTex3QYYlKNTkmyCNjTNYOQRc0NyGwcqmaTqXssbWeLIUX2biV0xVfgVv5w3MUqYqilGHo/zdRG5x71G5Zx1J77Kj1apZBQUiEMIeoMHttaFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563160; c=relaxed/simple;
	bh=/Aqo6eZT8yO3l/bSFL2DWbLRnUJ/G9BOeA6amkvZLD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p46csxwuG2qREx1Cc1MxhAOm7IBAgf+3QW4DDoSrE7fwDi2Lq4UteA75MIaY+u1JB3zpu91KQko6oCEK9z3cK5arw+j/b6UoKU2ymFmyW7fvWWIx2zNFYrlnGuWezZNiMYJ8d4/7ElqFKtFPn4o+4Hb6stqkP55dskQo2fT+c6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjSrb2mA; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2c49373c15so3784130a12.3;
        Tue, 10 Jun 2025 06:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563158; x=1750167958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiSre9WglDpmIK4O0YsNl0nRwFB834XrXov3VRpC0FA=;
        b=BjSrb2mAirr4zu/vBMgHw2xQMs451HyXMgsng55Zza1+qXNuOQSGIRrrubCvUaRZ8L
         1FbjpLPqDdGF+IhdDY6qUx+wQnlBvc2D2nJJHG/LjmG45EP28MC+K2JbiYQmMuaI6lMv
         1E7fvYptMLU9QygpgZqsZP7xzIcNdY9vNRS041DJqOsrz+8q7psWj04zgGNdu0CFjJdB
         Vxnr5TvVPRKdOC+/crWhVCEuwOdTc+k68PZGcI1M8jEyi/His+C8XrrvaCFPWHaFMgbU
         V0BW6pA/iwIq/iSbWuq73MBYNiQ6RZ0jaWgpOjNnSYEivyqEhpaYSDEnrJ6nXziFMW/c
         DNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563158; x=1750167958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiSre9WglDpmIK4O0YsNl0nRwFB834XrXov3VRpC0FA=;
        b=rKRStE25/p+E4zNdhCWlxKthh7gS+yzpzJ+rqnQxS3onQDORVFaxQ+I8XObEhrDmTF
         cSm25MuUWoBTOBywzslxa1UZRb3/L79Ohw7RZa1OJSB+rwqfTDZBAnud8WLD52fiDjD9
         DLBIDj0zWLzSuJK4a71GOoWWm0E4KNxKDLPxa80fE0bzBsl/7FgrS1Qpp0lfUjH8n3pw
         ENNO40700ZotdfgU4hGgEmD0i7QGP22QPXCY4Yw9gqc2jNElHiDEeIvHllu6wKpL3buC
         5khISIE/JDpk6usNpFB10k+6uXQmqVoQcRJR0JWGd3WAfbfIgcuqyd+XAZcb+KF1d8HG
         q+eg==
X-Forwarded-Encrypted: i=1; AJvYcCUN712qqyLAhz+ZJkN7mLTJjK8JKJz2gUqYfwrOWG25Vdqp6ysDL1pNOuKoygBLC4MvtHTuvWCX35Y1wD+W@vger.kernel.org, AJvYcCV8y83AjvcdvZ+qpqqvQY1ojxj9YBi1wxJs2dl4JB3nP9PYz+J1rT3Hu7bjLx6awVvKF/G/uq3j8sqn@vger.kernel.org, AJvYcCVNSObA8ULT04b/yN7P+BJRaiVBKxh61DgYP0WVXOL5XWhrh4fp3tYyKhLf95gjCxMIP1Yz1MJeQKIl@vger.kernel.org
X-Gm-Message-State: AOJu0YxLLl06spI4j53hhFAzQARRzlv7HYPJppyjO/q8dzp4GJuPTL4W
	gQUcOK0PgEB7n8SjsTBqcqs3OUqvP9kTt6LviFQvgvWNWc04KYl9REzF
X-Gm-Gg: ASbGncsgwjlp/qZ+/uqxh73Kpe9B0Mun6EZhRUk6ByC/9yVOmeWxW+q82x+XEUeb9Iv
	YmYI3TMCyLMAYyBW26QyYqx4XpGiQhaqD8zRkc7UvX0k+/z9MOmWRdikk9MD2cC6q08EWmjkKPr
	+JYkZCHcSAe6FhM6loOjllbja6S/5GAsn2pp5NXd8r+wvGLJGK6q96J1mZQdu8VUVrcYjHtKQop
	jPxIBfuMMltCKKtBncW8aPslmEKdDZvjDRb+Xq9ZehcP4pCLPG3NMR0gx7jssCIeqqWX8I6pE3/
	JkO+qD2mO+9kG1nq2NFbV4pmlFK6lEcRlIq3PlS1Eu33e64i4dCahAt5H6FCsCiJ
X-Google-Smtp-Source: AGHT+IEPves9Z9ZVq/mhz6mgJlmIUE39OoniHpiNwnWv3yeacikEIo4HPGvzJFKEY0HfioUekMexVA==
X-Received: by 2002:a17:90b:1dc1:b0:312:e9bd:5d37 with SMTP id 98e67ed59e1d1-313472b5a14mr24196363a91.6.1749563157475;
        Tue, 10 Jun 2025 06:45:57 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:57 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:20 +0800
Subject: [PATCH v2 1/9] dt-bindings: i2c: apple,i2c: Document Apple A7-A11,
 T2 compatibles
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
In-Reply-To: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=959; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=/Aqo6eZT8yO3l/bSFL2DWbLRnUJ/G9BOeA6amkvZLD0=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcLMj5ZKRfP6FDNrg/uoHt0VE03NHDCCsm/L
 tjy7gyFgTGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3CwAKCRABygi3psUI
 JON+D/9mWe1wzDkLw5zxCc17gmi0oLsWgTp/gp4uIg7bRtRXS2I8RHG3l15Ne96FHKoIVpycAsS
 Pm6XUB3Q4j7RgkL1X7IDSkzaJNK/nV67mFAuF7LtR6DQ/dqhniNCCzQt/3osg9oMYBPwBl400A9
 hdYDWAneazlwNY0LU6UQYdE1y2a0wv5V8QEpib6iW8V5C1CpmCE/BC9X9o63x78K38UAnLIr2qR
 8NygF5muZixISiWMFY73C3UpfxH/4paxsnqGJ0SiexIucrhKfGV7oEvHPYL+UlBYKeRsHrxNJ7B
 ooCaaDzNhzbKCcmTd6pMNrunOvoz+0OnA2OHT8F6im5h6Bz5hForG2hwBdi5jY29KE2wkBMJArX
 gJDJ2Mr95ON9GJuRra5EwENT/zJVTHsyPzDr/fe1GLgyDHhGXv1j937k4lNKJXsWlWtQOigxNzR
 c/Jjl5mgiUQA/x3nRh/jN8PGl47MAQvOvp3IVmgmSOl7yOO0K+6KSzIQny5dzs7HcNTik28NfwZ
 hNLHp8fNGqEuXlGN5K2qds1wvnubCOM3tvrjFS02nbDJbc06ybYjXSHx4Ud0PUuYrMmdXPem8Fa
 H7CDbAdAyxBaV4n4oHyWBTxIvfB2Nilu5711+drKFj8tUFhLkQ/HoqH3JtvuHZl3F1fdX8XpxB+
 Fn+WFJk5dw9uSkQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

The I2C controllers found on Apple A7-A11, T2 SoCs are compatible with
the existing driver so add their per-SoC compatibles.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index 077d2a539c832ea8dbf28d2f9b436cbee6fb5d8c..fed3e1b8c43f67b8f5a19e5c1e046b0e17ab8017 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-i2c
+          - apple,t7000-i2c
+          - apple,s8000-i2c
+          - apple,t8010-i2c
+          - apple,t8015-i2c
           - apple,t8103-i2c
           - apple,t8112-i2c
           - apple,t6000-i2c

-- 
2.49.0


