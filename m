Return-Path: <linux-i2c+bounces-8039-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 221B09D268B
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 14:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA1FF283588
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 13:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8991CCB28;
	Tue, 19 Nov 2024 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lN1Hr222"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB161CDA35
	for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 13:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732021842; cv=none; b=qsoUzeF74ZoQfySBgJw+rXcyPcS42QShf3V1qPHGjwfFcRzN8cWCP2MfvktWkfpCDwSSoT2CVzIk2P7paQx84bueWowey6NheNMXWNzbDVP3KVMapE2nYMD55w1DhQtwRIaMOiQeXenYKdDH94UjThZJabMxggJW2paOKXHvCTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732021842; c=relaxed/simple;
	bh=mDcY5C/zkyEjWvX86BTuV7N14ueWFOUTtJyzCAK1OyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RvUHB7NifhWvrEOs8/ykKMq9nd7FqbZHB53eM521xFNJLNzFI715eAssYCCVI8hM37GfZ1G4RCxRIPC9HB1Y8//V8r06BMQzGQ1Wt8W4QU/DHM0kYb78LIw2POdfZaE3ugUW6RCu8VgJSMTYOj91vmLwC4ydJkRhHVWtFNjtV4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lN1Hr222; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53da5a27771so3767704e87.2
        for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 05:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732021838; x=1732626638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3d7NYATTVdCHazYGuItvosFkWihvJYe7wijP8mDb3w=;
        b=lN1Hr222mGwxTQ9WN9VKjg1/HG1W3ygcNq3NDirZrxAHJs7fCJXsEXz3ZnFwi0vZkJ
         3eVzYfDe6PNgDH75KFyeC79j9LSEG3SU03uoLj/r3NWqwRLGI79wbgxuR2MG+4vNQMN5
         H32J4yQsyq2OLcJDMQ4u+wPkP7s0/nxZhPSlzHNumEc0PmaYJ9D1KuLwywp5xfrisZyr
         94/JVoqHt/Xmb2vXKrL+l2M78QMuZYG2qk+pT1oZN2Okui/0fYIgeXvmjGofWNEZTgUM
         2kjoqOfQdmgjLFrcdtydwCJonrL/2RiNj30/J/I7S7lHj/QM739k5mSgwfx6SejPZ/eT
         3xrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732021838; x=1732626638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3d7NYATTVdCHazYGuItvosFkWihvJYe7wijP8mDb3w=;
        b=KoBaDxXjoOeGzzJ37G0mRP+Q2O5U4eZiOH5e8wzIlkLZzNCOtAzY2sFaPKYtbWKgwv
         H/6TRfRO7XkUKNqHI8HEHaOPgx2NFqkGsu9fDxVdeKeE6efNRu65184ETkC5R8aTFrxX
         6egYKs+O5Ht/nfm89Hx20b23AWhzDqMDZqPaIJywCZbtzY8ZkHc/f3Vl8rRrLa/Sns+F
         Mdeyt5FoPyl5mskpj2LVB5C2DiP+FSqVjdbCrcM7td14F+pTi4P3UhEAGb68j2ExFdEK
         hYSOJeRqAFX0OnIktU+Lpef5vkgdllk1CSrRMdXArA0B9xe/lh16VBfEzemFtOwlgujX
         ttSw==
X-Gm-Message-State: AOJu0YzzizxZ55fEWY51zW/7Jyp+dBDvZlOZWFKpze7uPeDB6KGYlPzL
	FMVBaNWgPbRnc5r4E9K92y2LVWV92A9D8bHkRrJCbeYwUlaMncF7R6g26dz1q9Y=
X-Google-Smtp-Source: AGHT+IFGzy6hHRNfT1Xk0fv2qf5k8xsk+yHK97gHuQ3g7T1drOUPNgaJPiNy3RNlThsTeiDlVi+aVg==
X-Received: by 2002:a05:6512:a84:b0:53d:a99e:b765 with SMTP id 2adb3069b0e04-53dab2a2205mr6495158e87.27.1732021837629;
        Tue, 19 Nov 2024 05:10:37 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab76dafsm192016185e9.10.2024.11.19.05.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 05:10:37 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 19 Nov 2024 13:10:32 +0000
Subject: [PATCH 3/6] dt-bindings: clock: qcom: Add second power-domain to
 CAMCC
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-3-54075d75f654@linaro.org>
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

The x1e80100 has two power-domains for the CAMCC not one.

Capture this as:
minItems:1
maxItems:2

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 0766f66c7dc4f6b81afa01f156c490f4f742fcee..afb7e37118b691658fc5cc71e97b110dcee7f22a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -39,9 +39,10 @@ properties:
       - description: Sleep clock source
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
     description:
-      A phandle and PM domain specifier for the MMCX power domain.
+      A phandle and PM domain specifier for the MMCX or MCX power domains.
 
   required-opps:
     maxItems: 1

-- 
2.45.2


