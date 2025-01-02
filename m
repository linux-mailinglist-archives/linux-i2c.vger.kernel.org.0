Return-Path: <linux-i2c+bounces-8857-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7839FFBA4
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 17:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39421162A9C
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 16:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C6912EBE7;
	Thu,  2 Jan 2025 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L5QZGzPj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109D612D1F1
	for <linux-i2c@vger.kernel.org>; Thu,  2 Jan 2025 16:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835652; cv=none; b=NJ1ZSgFZaSU8c/SvCv6CN6e5A6NmpfeSS6IGJ/gsVcXNrNVL4qnlMrJBW0JwGmff9GenMHdpWFXqUFWjtw6irdqlZooSIFwxOPO9wGiNGoE4DXFBFMLLUJ4Peda4jOGzgsK33nb4JvY19/2a5Erc19/73/MTmiyOizGESKeQgk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835652; c=relaxed/simple;
	bh=wHTBdBmiu42htNicZa0OxfE7W0v/WQ//2woGL/Qi/lA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cOBbvuejwy8glv+TyQ5+UAlQlIyrXkKSvHmPDr93H4Siowh/hWXNfSWRgZ2F72cmn+kaPKwa3cWs/kVq0SkeQPdmB07UdtFQd3PF/epKVjC3hwyLCahanUAQaNtAC8mbUrCJdO4OLsCSmm9vlq55QSFWKWoj+0+PdMfu9pmTv2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L5QZGzPj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43622267b2eso121916085e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 02 Jan 2025 08:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735835648; x=1736440448; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/iPfVF3oCxMg1L1jShb3koLb6DQG0P/sNBtbIVIH9sg=;
        b=L5QZGzPjy7JWfS2IeiXiUX6SuWW2vNq3OP5gSZW9P4fAyDkyGR14MvPNvSA3efObVw
         z3U7mlHO9xauUxfaw9aw32gmrxo//ec1hO+qxtHCoCTNjqPgnzYV4drjNHafBYEAU4gX
         KPlMlQ/24zdgQ9NTjInQJ3K4qtwcfVn7osh7FwO9J1Pxyuruh+ljZok76Bx+hJpNKkSC
         Ca+9ThbyJ8sGWuCeiCQSlOP/oWfV8hmiypOgbPhTdq3Nko8aekJC6dQ8OCQthKGVE2qj
         i+V+YDCrkT5DiUxfpX+CaPhlcuvKApwG/9Xg0yGryMxW5IznXBduBHxDacDilK32JBvm
         Dcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735835648; x=1736440448;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iPfVF3oCxMg1L1jShb3koLb6DQG0P/sNBtbIVIH9sg=;
        b=ZIu/d2VT+Xgb1TQdhC6hkd16ugIKPyLluvDvx6gY13gEfzFjIgMxTuJ1KIUQ0UAytL
         Tpjh569dmwUUUIMRcjkFm5BnoVs621DoNod/qfWmSvR2F+IYsdlMy1xL2QNVZWlZt68c
         fZkEukFxRZprpMjym8oOw1p01edg3h7cTQwkNuKBKpAQGjtITMipuerL9TEJgEuZVHL1
         MEv1PEfDBa0wNpl7yG6jav6Ig3eZSoJH3cD+dLLZ7J+/GLjV4xiuY5TZZIXx3kZWbSgb
         QTuaxR0hMuDFoDSO3Yxg9U64ASM7nISnjNkQwu83CktioHyPQ0RRlQ0uXyhK++UVpZL3
         ChjA==
X-Gm-Message-State: AOJu0YxseXvX8F85l9NoGzOKlKEp4QSptnIFYbRUiWqSZ8m94Li0OLKL
	IhvvsG+Tyhx9xoHNubA8VKWXaXxO9Rb8AKShKZiNkvlBJsUw9PKKCd/VPcjgRZg=
X-Gm-Gg: ASbGncsCjfbVLYhD1eQKKPbSoVmHWTSgU/DjverVprK+OO1MO5kuaGxEelO19S8oCfA
	wQwXlSuGicfojAebveH2XVGvKwgHCLiSUZJ9h4uO93Jwlt1ITHmjj8X7nguI+q0/BHug/gco75e
	36NJShGzrMIglQUhN+L8tv0MkYO46heG/Xo3lD8wIAXMSSbCrJ5OZYdBOCFfl9QGEtlG8nm37Y1
	IalisuJrSmKTnpjJv2jCBlg+NUv+ZdFuXAekEKM/iPPU7EkD4mUA2tbas3k15nHfg==
X-Google-Smtp-Source: AGHT+IFY3T9wM6oTHZCvFUtFoVeaSUwJTlMZcbumnlzMQ8N2h0yJKFnw67TkGRF6GQ0TRXEGc4+jxQ==
X-Received: by 2002:a05:600c:468f:b0:434:a30b:5455 with SMTP id 5b1f17b1804b1-43668b78728mr372555415e9.27.1735835648137;
        Thu, 02 Jan 2025 08:34:08 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b295sm499265665e9.33.2025.01.02.08.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 08:34:07 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 0/6] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Date: Thu, 02 Jan 2025 16:32:05 +0000
Message-Id: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIW/dmcC/52Nyw6CMBBFf8V07ZjO0Ae68j+Mi0ILNFEwLTYYw
 r9b2BiXujw3uefMLLrgXWSn3cyCSz76oc9Q7Hes7kzfOvA2MyNOAhGPUAm4+f45Qe+mEUgAImA
 JdoweJnQlR86hNvcYoSSjCl0oyzWxLHwE1/hpi12umTsfxyG8tnbCdf0rkxA4SMG1tFo2Sopzf
 powHIbQsrWT6OMm0j+5Kbu5aqyVRltZVV/uZVne20ualkEBAAA=
X-Change-ID: 20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-82a63736d072
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-1b0d6

v3:
- Fixes ordering of headers in dtsi - Vlad
- Changes camcc to always on - Vlad
- Applies RB as indicated - Krzysztof, Konrad
- Link to v2: https://lore.kernel.org/r/20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org

v2:

I've gone through each comment and implemented each suggestion since IMO
they were all good/correct comments.

Detail:

- Moves x1e80100 camcc to its own yaml - Krzysztof
- csid_wrapper comes first because it is the most relevant
  register set - configuring all CSID blocks subordinate to it - bod, Krzysztof
- Fixes missing commit log - Krz
- Updates to latest format established @ sc7280 - bod
- Includes CSID lite which I forgot to add @ v1 - Konrad, bod
- Replaces static ICC parameters with defines - Konrad
- Drops newlines between x and x-name - Konrad
- Drops redundant iommu extents - Konrad
- Leaves CAMERA_AHB_CLK as-is - Kronrad, Dmitry
  Link: https://lore.kernel.org/r/3f1a960f-062e-4c29-ae7d-126192f35a8b@oss.qualcomm.com
- Interrupt EDGE_RISING - Vladimir
- Implements suggested regulator names pending refactor to PHY API - Vladimir
- Drop slow_ahb_src clock - Vladimir

Link to v1:
https://lore.kernel.org/r/20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org

Working tree:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/wip/x1e80100-6.13-rc3

v1:

This series adds dt-bindings and dtsi for CAMSS on x1e80100.

The primary difference between x1e80100 and other platforms is a new VFE
and CSID pair at version 680.

Some minor driver churn will be required to support outside of the new VFE
and CSID blocks but nothing too major.

The CAMCC in this silicon requires two, not one power-domain requiring
either this fix I've proposed here or something similar:

https://lore.kernel.org/linux-arm-msm/bad60452-41b3-42fb-acba-5b7226226d2d@linaro.org/T/#t

That doesn't gate adoption of the binding description though.

A working tree in progress can be found here:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.12-rc7+camss?ref_type=heads

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (6):
      dt-bindings: i2c: qcom-cci: Document x1e80100 compatible
      dt-bindings: clock: move qcom,x1e80100-camcc to its own file
      dt-bindings: media: Add qcom,x1e80100-camss
      arm64: dts: qcom: x1e80100: Add CAMCC block definition
      arm64: dts: qcom: x1e80100: Add CCI definitions
      arm64: dts: qcom: x1e80100: Add CAMSS block definition

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   2 -
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |  74 +++++
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,x1e80100-camss.yaml        | 367 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 351 ++++++++++++++++++++
 5 files changed, 794 insertions(+), 2 deletions(-)
---
base-commit: e25c8d66f6786300b680866c0e0139981273feba
change-id: 20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-82a63736d072

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


