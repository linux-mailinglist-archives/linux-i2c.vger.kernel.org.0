Return-Path: <linux-i2c+bounces-5173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4F6949B72
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 00:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 540FB28700C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 22:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C76C176224;
	Tue,  6 Aug 2024 22:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZ7FsKQt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979C2175D21;
	Tue,  6 Aug 2024 22:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722984162; cv=none; b=MnZ0jlPGsf+dYNirArvpaGZcKL4ahilNM/nsdSoO1t4gRhffVx0qrwLAtE/Ww+PPpYNFNpkziPCHK212obIVhA3h0TOEC+WmIImDfhxa/aSsT0TvMXdLWKHDJIbuMbT3zIz44+kBD+MaUcBPorEf/hyd2PUgW3mKaKNvwtKBs6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722984162; c=relaxed/simple;
	bh=JD65QhhS2GNmy/gsR4vu7OnVWBLxVRvukOmTkM+/qqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKfM0fgNwfOLaVSAYKXnDJp6Bcl3xDTPTAFry3ocgbmaO7c3knpHRKcuZyGg1jZrWOtAqMBpO0NollF9Hc1Lp2I+pga6SlxyiOAQRENscXnJOYr1lJ+2/6RzeHEN0SemFmCanFIt1xQJS7sM2QbpP4c8JS7nJ+VPTX9SYfo/Qf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZ7FsKQt; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6bb96ef0e8eso6226096d6.2;
        Tue, 06 Aug 2024 15:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722984159; x=1723588959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2925GRRJ9m1RDrCiaR9cDRWsy0ctheOrV6RSsHpFzA=;
        b=iZ7FsKQtYrIO2ifEhDEU0fieprpKb/I4Q0B6auQeKSnaMMArErsk7gYKF+A5MqiS3Q
         0hrtRD+KaVPrY8f/pWo+OZK+lvL/Wslxf492AMdsVOzGVQtnG9vKudTcqU+rbCVHWhGH
         dalqY4x4pulk9gchnmufZzHvW0NAi+Cijs/KW6Ml/yzI4ds9lh3aApT/4Ko1+9kgV7K3
         VB/mDU/HFgTz1yoxWiO7ktGWgRpmUnb0XU6ZJmqro/fIAdIKF5Bjv1khCYmUjyZrScBD
         hJjv5e3/pyQ4SC2kMoXBrr5MGBc9kM5Re5Bp18a8Ih2Ux/1bvpSN5cxNoi9SIVCKAGOD
         0/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722984159; x=1723588959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2925GRRJ9m1RDrCiaR9cDRWsy0ctheOrV6RSsHpFzA=;
        b=p09cG54UGmHpPMhH3RdZLv8Wq7KyoJPcpa+9Kd5BGNpZuZUcGvGslU9Yg0IhwZ//1W
         NNJ9H2iY2humgINusPcEYYzktSflkNNN0pCaEkEX1qCoRJJrCdN/7VQbltMQgJzj2a5A
         ssthTC9QhOI0XoYIjTU1boqNkYzmRuAR/8AvSxNytaN0b4QHmauMYJdSavTB9vmSzJ/k
         0y25OxNYS+pvWRl9AmbTCQHPZId1fofyTPJFLXsbNrKD/JkCC7qzN/Tsw/NdEhmfNJko
         UPpNd9wsuJWKC9asHqftj7x0m0WzuNP+rTv/YaUAllyXB7KtXZ/SEv3uw4Jrwprw69iR
         wn3A==
X-Forwarded-Encrypted: i=1; AJvYcCUhuoEvoqXoI2jbNNKGL//G+QUA+tQTSlAEF9pBXbXnGtItLccuWQlrOI99tZNqmiOXVZ8hE4gDFU9k99BnY36H9kIMr7pXja1Kqpb+gGheUWOfMjTCvrRuulonL9lfKJBO3rl1NarF7OyaIKJ2bwTmUsco8huejxMlUD/Jl2Vs3TUmbdWRoASh4NfdEUAgbYHiTuxxOsTBt+qKJuv9yJH7bg==
X-Gm-Message-State: AOJu0YxVkX4lIF/Au6xcs6JSZLR0JgNju7am6HGDZMLYn2fH41PPht3x
	6JnigCW+ESJezkKzz5RSleqonkq8oyiPt2VVX8SRlfP0w9faexV1
X-Google-Smtp-Source: AGHT+IEpzeD5r/lMF2FbbHLtQ44AXWOfvhMCq8UP2+JRGGdrmOcPVCcYQQBYMARmlwWaVxPsfopfKA==
X-Received: by 2002:a05:6214:3117:b0:6b5:e74a:8ad3 with SMTP id 6a1803df08f44-6bb983cfee2mr193478116d6.13.1722984159501;
        Tue, 06 Aug 2024 15:42:39 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c760418sm51064026d6.18.2024.08.06.15.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 15:42:39 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 3/4] media: camss: add support for SDM670 camss
Date: Tue,  6 Aug 2024 18:42:24 -0400
Message-ID: <20240806224219.71623-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806224219.71623-7-mailingradian@gmail.com>
References: <20240806224219.71623-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera subsystem for the Snapdragon 670 is like on SDM845, but with
3 CSIPHY ports instead of 4. Add support for the SDM670 camera
subsystem.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/platform/qcom/camss/camss.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 51b1d3550421..05a47b82c012 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2403,6 +2403,17 @@ static const struct camss_resources sdm660_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources sdm670_resources = {
+	.version = CAMSS_845,
+	.csiphy_res = csiphy_res_845,
+	.csid_res = csid_res_845,
+	.vfe_res = vfe_res_845,
+	.csiphy_num = 3,
+	.csid_num = ARRAY_SIZE(csid_res_845),
+	.vfe_num = ARRAY_SIZE(vfe_res_845),
+	.link_entities = camss_link_entities
+};
+
 static const struct camss_resources sdm845_resources = {
 	.version = CAMSS_845,
 	.csiphy_res = csiphy_res_845,
@@ -2447,6 +2458,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
+	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
-- 
2.46.0


