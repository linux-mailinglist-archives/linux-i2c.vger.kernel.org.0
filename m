Return-Path: <linux-i2c+bounces-5557-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B07195772C
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 00:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBED3284259
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 22:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDA81DD382;
	Mon, 19 Aug 2024 22:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F46Dbcah"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725E61DC48B;
	Mon, 19 Aug 2024 22:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724105462; cv=none; b=pe2lFATF2maMbsUgM/g3rKXhRTT62W1V/fZlc/5M8AvymEOARuUyRbKz9fSVJvmjmjqw9GNodWPrT+fpBgaiDvBzHcQFcwfykONuiU7Dnc9fKETSRVwWybMohPDV8DWW90ldAGMP1dDYekDenaPl8YEVvYHn6fKMwuO0t3+1rbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724105462; c=relaxed/simple;
	bh=gAn0H0EN/A5/qAmmgql4FiI37FpaJzQk5Y3LrUCLEjE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6j2wrPdolCsDp9t3ncazPeA4B9rIGPlA+jbKfvcgN7ry5QDb8AJrWeFYr4X22Mmq5ShRiQaQxF1RXv7L9ZowlJ1IP8o4wvEuUsTFhZ70Rw6qpnCl0rYi2V7Bu/gZpmFMKLZHdz+16x+Ns5hQUN2/arAN+0Dvh0kV18W0h0Ggso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F46Dbcah; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6bf7a2035d9so37024136d6.1;
        Mon, 19 Aug 2024 15:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724105458; x=1724710258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1AzGBccvDMbMwX4PIKd4VChrBM6yOFTEVtOfCF+28E=;
        b=F46Dbcah02uNRo83+wpqQaCSHvcVPLYNtSra+S2KXzcaJQnWgjTXOAUdorPrvgip/U
         uQz/XQ9bNj8KMUyZLtArKZvvyyz5cZ+rSEtlcnWxxho0gTink1CCuD0S+Jm5XQxmxTCu
         po1Ex0dWvgHjwsvTVr+TVflEi1+bwpgASY21j7mMRoJaFucj+g/094rpI2jjRB2+bUoS
         e+AZ25iOT4640FLFWNiiRUxazDOoIwoTTOR+okY1btGWZNpbla04OFhns4OroDwNe7zX
         flXWmqxF1/kShGYhSUwZTkBaGgJShPukrpV7zbAs9Q0dcrLXNq0DYjXQhRDx3O6WWTor
         SDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724105458; x=1724710258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1AzGBccvDMbMwX4PIKd4VChrBM6yOFTEVtOfCF+28E=;
        b=F0kbJZAbLT6vtzXT0KMQeglE/IqBLImrthrapE8bX0t9dNVRtU97VV6u2axMTT3He+
         wanWZ3uQd6EPADCJFrlTph07mtJxRYbuz6yPltZwr03OpOK1THwf3O0fJ9XAekdPnKRq
         cbK2+SmG3kw5pNe32BE7y7OCMvpCgoINfBc7RsYyqc6tfkPv2IqXkx9UqzztRtcMEg+N
         OyJ8C21/0845Ar9JZgaCyOLIaflICGSF8X+y/KHR2hvGL/KvJZpP3H9esUgYoG9MJv9G
         17sxUVB0lisYogiLeVpVpCFGZvE4JSqf47jjABoSTHROxDUqWx8+cUKCLLBLwen1IUgA
         AWMw==
X-Forwarded-Encrypted: i=1; AJvYcCU8rleTr4wc+jmFW2Alub3pBm/+GfqzB5c7hbLbdiLPscBjiuezRa2t5chvsTlPNXgQMnYokBuMfDS+osE=@vger.kernel.org, AJvYcCV/R8Itdb/X6IO8p/GXCwslu+Gfh+Q8qOuPLd6AUZbqSgAJyGjFxDqNz6SFjTRQVCslXjiAXrWcKoCH@vger.kernel.org, AJvYcCVsPG9jC1FOH4c77zLadDHsNebu704y6qAj0A5OH+2kt1b+auJF8RWETpAtgweOorqzviAIQXtrOCal8biGag==@vger.kernel.org, AJvYcCXJnYXzPi1nUgJwuS6SHs/EMkdI+d09Pp1glsR/A50XmQ3JhlIA6rQEAebKDiet5N6D0Idf/ystK4Ph@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg8j5Yi2JBMGqSH4lwL+zCWsqcKyrTRAQb1SoL9Tvo+Kfy+/sc
	QQ+TEgcferevCdex7x3t0S35ejC/VVcAyGyTv1c8teFq+zp+mF0g
X-Google-Smtp-Source: AGHT+IFQSvbvwGVOyuqOmSP599T/pJASuKU0CYGknQuBQZ854dA5P4qAoACesO2mCFzqXz1UloVXJw==
X-Received: by 2002:ad4:5dec:0:b0:6bf:7efc:1117 with SMTP id 6a1803df08f44-6bfa88e56f1mr16332046d6.9.1724105458158;
        Mon, 19 Aug 2024 15:10:58 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf763cb74fsm43801386d6.112.2024.08.19.15.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 15:10:57 -0700 (PDT)
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
	Richard Acayan <mailingradian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: i2c: qcom-cci: Document SDM670 compatible
Date: Mon, 19 Aug 2024 18:10:53 -0400
Message-ID: <20240819221051.31489-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819221051.31489-7-mailingradian@gmail.com>
References: <20240819221051.31489-7-mailingradian@gmail.com>
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
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index c33ae7b63b84..af6dd9a34fd4 100644
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
@@ -138,6 +139,23 @@ allOf:
             - const: cci
             - const: camss_ahb
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm670-cci
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          items:
+            - const: camnoc_axi
+            - const: soc_ahb
+            - const: cpas_ahb
+            - const: cci
+
   - if:
       properties:
         compatible:
-- 
2.46.0


