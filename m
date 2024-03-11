Return-Path: <linux-i2c+bounces-2331-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A0E878AB7
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 23:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B2E01C2108D
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 22:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB8F58213;
	Mon, 11 Mar 2024 22:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2wwzx3P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA8C58100;
	Mon, 11 Mar 2024 22:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710195974; cv=none; b=uiVxAbyCH5PzhAQu4mJG5tBX+IZmwjYFlUiv5kpPdC/a9Sge9zqavzIcOWeIyV5cv8vz8DIavNRa7suQT0OcagML7J/Stkp006WJdJYdKZTHis4cJjmWhM0vJfyl6pq9ON6dB70NKUQP4Eumy0XH1D0vcTcJaR515C1LNd8Gg0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710195974; c=relaxed/simple;
	bh=qLDDuJAGNKczHxrsPwfQUDoczAOA4iTCPEFqmie3o0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DWPW6I9SzVsmw40gqVAnho/KEgEAmBSklHFVKtZ1SJ5MypECdk+58SsTiIzG14FUp59+ToBRfn7/xxk3VislmFIieC30Uy34lftqNNqG+lchqJ30LyaIutvbtCQSvaBw71eYmRXkZ5aFK72D2U09mXPBC3Mj2AcZfKuYzsFJPzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2wwzx3P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C8AC433C7;
	Mon, 11 Mar 2024 22:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710195973;
	bh=qLDDuJAGNKczHxrsPwfQUDoczAOA4iTCPEFqmie3o0k=;
	h=From:To:Cc:Subject:Date:From;
	b=S2wwzx3PaCXMRfobfBu6CaqJJnhAVOdFIXsLoML09wVgCa2bWls5gPujEAcSRE6An
	 yWFUHquwvXrth+XL4nUj2BMvJrTZODczaUm9QWlQ+5IEQ1X5JVTRGe3pqWJFpAWtM2
	 fVHBAtscCdxDG0yjITn6Q8ldotdWMB42mEt6anR+w2XvYiWretoDGTLQYWHUIiqpYL
	 nyELurqDwRYCIS+FYcF3yrVTGplYLlb5knzWJ73j8BbHJjwe6tf8r5qx7f363XW5tb
	 jjIVZXjpd1mjL/caKT0oHmI43ySmaWnmqC+jLWdHxVX9pX4HYQDq9Kro4S0wPpZ1vw
	 l6/5uz5tVdqqg==
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dt-bindings: qcom,i2c-cci: Fix OV7251 'data-lanes' entries
Date: Mon, 11 Mar 2024 16:26:04 -0600
Message-ID: <20240311222605.1940826-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OV7251 sensor only has a single data lane, so 2 entries is not valid.
Fix this to be 1 entry as the schema specifies.

The schema validation doesn't catch this currently due to some limitations
in handling of arrays vs. matrices, but a fix is being worked on.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Of course, with only 1 lane, I'm not sure why we need data-lanes in the
first place?
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 8386cfe21532..f0eabff86310 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -270,7 +270,7 @@ examples:
 
                 port {
                     ov7251_ep: endpoint {
-                        data-lanes = <0 1>;
+                        data-lanes = <0>;
                         link-frequencies = /bits/ 64 <240000000 319200000>;
                         remote-endpoint = <&csiphy3_ep>;
                     };
-- 
2.43.0


