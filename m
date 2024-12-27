Return-Path: <linux-i2c+bounces-8763-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E819FD4AC
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 14:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 059DC7A14A6
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 13:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227761F2388;
	Fri, 27 Dec 2024 13:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y2JWP4gn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069AB1E48A
	for <linux-i2c@vger.kernel.org>; Fri, 27 Dec 2024 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735305137; cv=none; b=tlExhxkgibbVOIHZs+/nPeCus2fskN/R5n+iEROuQBTz73MIDhnWNm1WmeNdiY0z7R6eBFG1Y12WGZlMfZJ9FtE5LfLrBv8dUiBoncWjadc1oJCstBIwG1KMvCZu1zZdqrjuduZqlCOKo/CK940wGdUxMsgBLXFW5HY82d+0MYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735305137; c=relaxed/simple;
	bh=W46aOzgaP6TdX6ichSpQ2dPsT4ngVEhSZ+rnWAPjmyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P+a1gOTwz0oN01hHYrUpPZvJFrSXNLw8pHjmTdOuCykLfxcL0XC4TsU+vfyjI15CrAEiaUT6vTf7aGN5mBZo6NHYsmLbXB3tBSDjjnxEjvMGrswe4N9DTw26I2uNDvMtxiL7eyBoqCfnjAf9stS7a3NS8pQDzZdcLm/bRnfnLaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y2JWP4gn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385df53e559so5660127f8f.3
        for <linux-i2c@vger.kernel.org>; Fri, 27 Dec 2024 05:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735305134; x=1735909934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enHviFwSFCpeHQweyddaphrH7Y3AaJTqZkigXyqmGJw=;
        b=y2JWP4gnfb9CYD2PYlpcGp9WI2tSRM6ZZjClZeEYXyyfv/BdKgXmCaDXpxrGwXnvHz
         sE6aOYkwt1TBrBOMB8Ge4lHNJ00fUXs60xIvMqvOXrafygr9lpTbXkTV/3R91GgXQ+ug
         xNYikVPBh1sBEuKF3hK1VeUhSoabb4xCq/rns1lBprwgsTKBFPZP/9YvSN5yJneHY7gq
         vpQwzs/mV2ZtNGxT/NOMKL7NU/vK0HW26mWevzUNURX192LWfD4e8HfcLH1lwKoLkFKc
         j8F1REWCIbJ0fABkoAFrJjtZ2/yuDmWcHr6QPjfWfAgm0h4Zbvf3qbiAXeJtHzOBPPGt
         zw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735305134; x=1735909934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enHviFwSFCpeHQweyddaphrH7Y3AaJTqZkigXyqmGJw=;
        b=iNKvoVwJpH4R/pNh1M7S2seud48HNkiGSFdNE3uA2dZdjDyY2TSHWC0NhQVdMkFjS0
         Clgf2RlsvIpYihlfYb5QyfG3HNj74iGPXwOdqxTUCiblzOgiwBZgJlE5ZavW6XjP/AIK
         BdibGQuWEPFmM5H557W24W13lQB6eYRRQklrhq63MREuOCfQ8q8HUXkFnxnvpDM9zEa3
         1VSP0IHLb4AULPhsXiTgYLhjC+ITXe4aHoRBuUFcVHxObQYYZVFWiaAK2fQbAT6SQe/g
         aA/sz29IRnMFiKk0Mkva5Px4zSqm3oVVAB2FfppYJ8U0Yl/tJQHmt5UJEfd8R4NUzSrg
         SbGQ==
X-Gm-Message-State: AOJu0YwSdUFSVM31KxZ9Z7Lw30QuaW3ZT6IKQVeVgsT+lucSoGMq1hG9
	afDkv5U/eD1GbApVK6GsoHNMRGigSqsrxHU13y04PdlhKQDdqaogP82+/xlOuB0=
X-Gm-Gg: ASbGncstGFBaTpYISfyODm9MFEqFrDxbH8mTe2wlok70AliQFCHha34HRBsq4zch4nr
	QRrAWwcdRc5KTFhcc+eOFjuyJhrP3IxyeWxOAxW9uo9wxrKu2DgmPrjx0xNJ9h0otByeS0WyKY+
	FYpFbpqt9/QErzQ9BiqmzQfaewiR+q3WG5PO368QLr7VnFVErsICuERK5gWFos6ekbApjcfh1IV
	S0vcSzPIlXf8Ao9D7UlPfDcBAkoJBpS5FhnNRybHzLaR3GgnVbMnZqB2p7BNjDiEA==
X-Google-Smtp-Source: AGHT+IHOR04wC4k4ghQc7+WmGypE2kBkaWFaqs+gZ0PoCMcLtBCwMwyfNpf6kNyKRiIob3vJkPHJow==
X-Received: by 2002:a5d:6da1:0:b0:385:e5d8:2bea with SMTP id ffacd0b85a97d-38a221fa065mr22623129f8f.20.1735305134373;
        Fri, 27 Dec 2024 05:12:14 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c42sm298899425e9.9.2024.12.27.05.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:12:13 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 27 Dec 2024 13:11:34 +0000
Subject: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document x1e80100
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-1-06fdd5a7d5bb@linaro.org>
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
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
X-Mailer: b4 0.15-dev-1b0d6

Add the x1e80100 CCI device string compatible.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index ef26ba6eda28e95875853fe5043fe11deb5af088..73144473b9b24e574bfc6bd7d8908f2f3895e087 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -34,6 +34,7 @@ properties:
               - qcom,sm8450-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
+              - qcom,x1e80100-cci
           - const: qcom,msm8996-cci # CCI v2
 
   "#address-cells":
@@ -224,6 +225,7 @@ allOf:
             enum:
               - qcom,sm8550-cci
               - qcom,sm8650-cci
+              - qcom,x1e80100-cci
     then:
       properties:
         clocks:

-- 
2.45.2


