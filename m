Return-Path: <linux-i2c+bounces-5171-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66045949B6B
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 00:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 976D41C22103
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 22:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24830174EF0;
	Tue,  6 Aug 2024 22:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnyhE4rS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744F517332C;
	Tue,  6 Aug 2024 22:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722984158; cv=none; b=N61cwPA+4vZDG4oH5RWfRIiX74vvJKwsc5OFXJ0x/Zs0pszvzgdMbZFQIIxNk8gJUYb1R1GQlQKdwt+9iww9T6RtBJULB50HPVG2di4vJBs6vV1wxx/sumOJWU676hohlr1BCqOrAcaP9FlcWmzJ+L+iFUqw6WH5XX/k29W9fFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722984158; c=relaxed/simple;
	bh=voxw/5qdH+KKHuYuIwdp4KZaP7ZzV8wvB/yf3hjI1vE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mW4tseKAoMcS09CT284Ukkq+SArCtt69DLfNzLEFL1gEZSMu3PGpME6Sc21eix8QGTPQX5xT9U1folVt8qg+c4EJv6f7rKZHO728+zqj1Ey+RtDNyyllKj6feibPM5NlQHg2NsazWVTGzbKvM5WPRyRoAJGRKgVo5txk02IpcYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnyhE4rS; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4519383592aso7003291cf.3;
        Tue, 06 Aug 2024 15:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722984156; x=1723588956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1plFg7k0OwUeXn7Xr1jXo6ZH5zyecFB+iDakRSlIaA8=;
        b=FnyhE4rSnz42o4FfzZzvGi5BJ8jeCyOc2QvlvZOwiTgtRJoMAUhjPhiA4RU8YHZtAz
         wdrVm8aof7mT0WdC3oqtC52aTAtRMe8mC7/U7u9Xp0+jroIUjooTBYWC8turtd3xwnx3
         GtxUS+EJQx/1DzZskPemnBjlbT+A3KIFPWurebQx7mM4Cz1kI/wbhvCzG5VUkzF5tdR5
         7J3aSpMoFSpwffQkdG5IFjHTDzvGRW58Yl52/KzPnH2pQ3I1bcs+OPLz+1ZIsCOiXBNu
         5ta+NqjWVm7haZZtDXRVY1TZmK95xyxVPlKP314kBMPjiheDWA4MlQvEORZ5NDWm2dNW
         wJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722984156; x=1723588956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1plFg7k0OwUeXn7Xr1jXo6ZH5zyecFB+iDakRSlIaA8=;
        b=Uaw+gM6dLesKP103yvs/5RBbA6V1vvnhiJeZ3dDYuDEnaZH9/HAp7YQyp6bxVIVXxs
         WIBLk8G+mos4Guw7ERKSS3QDlGCWnUOwPU6e16ePF8LSi8TFOyyMjVIhNvBFRctMxD5g
         iI202U3s1UYf4jTUIk7MchuL5yecyPUrPSKN4PgVPOpm9LyatJ3eYz8lUfc7UnB5aGXb
         00W0IkQ6ZycZgsbctsmj+DYvfYGeDyjN014FRsOjQrkfUXtuEj+qFlAjXPVJNVHxiDsC
         SPH5PfYFwzRk8NhjgVRQmVnzT0FTdy3mhsOp9DJRI3ZofaH8Lyl4Q55Ql0qoAHPNpxlj
         /y5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8sXHcr3FneY+9Pq2rWUrFvcjOfxxdZgiuRXYK8H1fVGeBWsxtPi7vRFJ0wd6TFGhPK0jJ4UeQmpw1iiPX+62wOlIeXcgIUKqF3ip4g1F/w6HOWLdhxWR2yvwzuPaNBGYx3L8jVY+0Clg0tUp/PftB5iygt1Vdx+TVVvVqnsejHYHoLeiSN6oIjjoCtJeB+iUfd/QR6uo7dyr4gXwEoYgdPQ==
X-Gm-Message-State: AOJu0Ywb04SVT0vbMIKvK5br7tFZCjTGQ6BO/Os+sih9emOv/GIE9C6d
	4RLqQNY3ZRwqUw1wJsAALGzF5Hz3FuCc2eAXrY9QLx+qYbMLxHI/9B9tIGoD
X-Google-Smtp-Source: AGHT+IEd+GC6M1pKZ0nG+wdIl2mt/DSGsD6Kh2u6Cpd0rQBbgKoovwBJmcmv6F3eUvNKTvTlnN+5KA==
X-Received: by 2002:ac8:5a8c:0:b0:447:e5e9:5928 with SMTP id d75a77b69052e-45189294be1mr211224841cf.48.1722984156183;
        Tue, 06 Aug 2024 15:42:36 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c87ffa80sm261651cf.86.2024.08.06.15.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 15:42:35 -0700 (PDT)
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
Subject: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document SDM670 compatible
Date: Tue,  6 Aug 2024 18:42:22 -0400
Message-ID: <20240806224219.71623-8-mailingradian@gmail.com>
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

The CCI on the Snapdragon 670 is the interface for controlling camera
hardware over I2C. Add the compatible so it can be added to the SDM670
device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index c33ae7b63b84..49fa8304fe4c 100644
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
-- 
2.46.0


