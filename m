Return-Path: <linux-i2c+bounces-13072-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F9FB8F1C8
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 08:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAF5B189DE36
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 06:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F703257827;
	Mon, 22 Sep 2025 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7E562VQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CA22EDD7C
	for <linux-i2c@vger.kernel.org>; Mon, 22 Sep 2025 06:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758522110; cv=none; b=ZzPvv/mDhODfKFKOilFVFDg7aeaPD5zePJURFFpwa/SaROglvQMUisnEI/ESfPSJyH8H9ujs4kZkuZnxNifvlz6usOAFoNO/jvP1G4sKYMBtF25PmWzdCqZCX9u4tbZuKGD93Tog3vjHXzOgxLcVkceJ/8momRBhxSb35PIbL74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758522110; c=relaxed/simple;
	bh=vT3u8z9JcPm3Zs8qxToNt2XUMMG8ua9os0KJiBxmsh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=reE1thOtfjkYVOn6qerKmOsD5JvtWGJDsRFewZEjbvmnFUSFVF6l3P8la67fW6ONXF7gxcD4YB0GYL8b9RLkuwAHD2v04GPAmUbbiMKDU3vlfvh364yU0//JliZNc6+s9BFvMMC/myK51TjXJKIx89k12ofJq3nhwE9wXf6IYOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7E562VQ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57992ba129eso3681130e87.3
        for <linux-i2c@vger.kernel.org>; Sun, 21 Sep 2025 23:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758522107; x=1759126907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPDy11iZA0Q8NDHlpUzt6W+Urif82gaVsEWWDj6nyqs=;
        b=X7E562VQuQYw7LYIX7LYbuwpJLcXemIR+F2PTaIPh2gB7pM2gz6iCRK0DEgrZPCLdK
         qdATE0v5PqNqgHpPvjU7BLZpy6hAfIFXM4j+1Z6jrE7a4W9M6BvJF1E0vD1qO3K6s3yH
         4xjLLb6Ts3DUcruDHIaqtKh8ayZ3ULfRK+H5TKEtw3EhxyIfZZXKFrzYLFndb0bgF72Z
         FJ19tPlxjyGUx5GdeSP8fh9zHJHXm9Z4ptOWf6k3ntyU2yqk92vgPgf8+VCcRt6XsjSR
         9kMLHJrgoRoraiPdoXc/IUeinPi6TQKO2pLgKFq+RB6IG4OPGjj0wecpug5NP6ZzrUYK
         DqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522107; x=1759126907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPDy11iZA0Q8NDHlpUzt6W+Urif82gaVsEWWDj6nyqs=;
        b=b8GiXZIidVgZs7XxJg44puEr2ESs4dGgf9g1e374ZBvTKbjgjv9/jzdxm3mKlJMtOW
         Sj6bbdi+nFZTV+p84kin+VxgS3LWCYSGdlB17S6FPJHiNbxslMC9wZLMcPNYmmus8oxh
         XUcfjAcVu//YqMhyUMC7WV43QWTLF38mKE2GwHxP26lEPFazqPhfZzLaaOVZA75EYXiu
         MUuJZ9qHN4uSM0JmoZMQOTefW2kZ/zhuK1XWJE/6JI9nFQOEfE+avcEoPKisgnGYgTbq
         P3zEWYVh9g3qqMRdwg3x6CMIfLL+fjUI0zePwS/ew1zUtOYwRO+7VbHJB0YRQuWzI+Tl
         +3Cg==
X-Gm-Message-State: AOJu0YyTAQh98aKhNWJZdYor9zBObHgdkZO3wKQxD0Ur0VNA/FLR95Zj
	EaJLPne/nF5M0IxCylEgcgNG6N9cBMrs0aTnrQzC+flOlaNqLgX7uDHD
X-Gm-Gg: ASbGncsq7WuX93KJDRbqY3XxqJ4y8AyIPONF++jijbK9FjR6TTbNQBljFyZz/UOyeGV
	P9ArthUk4Swj4cfmSRXef+USxnwkBupnlbUSsNKeAz+ZIYmFaOBYMVsr+yzgCJnXaMRKpqSva8I
	TOn7ublNKxXffHOJfTEreAFnLxExhE6Bea98DlrgMX42IpLFhuBIAKLwh2+V3ql+xus+3xDCqBC
	E48rBR9048Uk/plvufM7aV27HmSah3JQCHsKqGrUa7boP/3KaOqZI0Zpvbg0DKuymHhoux2eEdH
	bZr5aM4fwUATnMz0ppbpSX8c8lYly3ZsxJsXE06CdTZ3QG0hOlN91/4yNN12T07rKg/MyqWSDnS
	x6CtgjSfpYVg5F3+GxAtF9HY0f3lEKKiXSyBSQGcowDZ9HNjPhVhoBwtF1KCuaJEAjwQ=
X-Google-Smtp-Source: AGHT+IFS45DD9XX/3MhSRL0Rz2agdiKzl2VuRLu6YIEhM38xGVxDCvEjcoPUZDKKGLI+hWITdR8c4w==
X-Received: by 2002:ac2:4bcb:0:b0:55b:8273:5190 with SMTP id 2adb3069b0e04-579e1d56197mr5217562e87.18.1758522106585;
        Sun, 21 Sep 2025 23:21:46 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99e99e6sm26982661fa.56.2025.09.21.23.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:21:45 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 22 Sep 2025 08:20:59 +0200
Subject: [PATCH RFC 4/7] i2c: mux: ltc4306: set correct idle_state in
 i2c_mux_core
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-i2c-mux-v1-4-28c94a610930@gmail.com>
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
In-Reply-To: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=vT3u8z9JcPm3Zs8qxToNt2XUMMG8ua9os0KJiBxmsh8=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo0Ordh5iitf7lhHDQuSZr1/thsDJsbdWjg0XOg
 w5s41jghYeJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaNDq3QAKCRCIgE5vWV1S
 Mr4lD/9vC0aI7ksGmf/RIn+tZapTkPe+1EzpkMWshsqYVRseYTMjwPNSWhNoadhZpl4uv1XkhRK
 jfx90FCx+DXpNmTq3H7JLiKXnfeND1ZXP6cv95bzahIeY8ROtyD4KeM0nv3Eg4NHuqTum6qa2op
 G1pI0RXDimCosrtTHf9DQfbCNzh+V8UHjwqOuA5Gm2Sp0GomcF81p1g7QVz+NGxrK7xcXzU6GL6
 x6xw0KL7K21jspYgtQQh8G+ux7qNoOTNDXpfcMP31ELwrzGufFJ9+dZ5efLA2Ounoi9FgXZriRH
 UpqS5twxNLEsgDXH6u8of49OpszwtePa+eeyt07v2iSNXcGniBFH2G3gWNVMVKfm5wUxyFAcSxG
 I+0tS/pDv/4Fi7inJjodbf+LhaTNDeE4SgB6Cj2PnsHoe/we0sNDXlAOVATU3dQTR/9qvMFn4Tz
 LWoTwEAhLhk/TU5dFL4Jwq2K7fotTPfk4luf/kdVbM508nUhhNk8Jd5nHYIonroOf8+7KyCKGiu
 puAoOpKJ2I5lp96pzH1oaYo6I4ZjzYFRMrYMy2DBEnhCibitR3H+WNFy0e/aqUTn5HWY2MCneOP
 //RzjrAVI7AfGJ6X5aYGzA2nh2hyAbFoYOXsa880k5YPzvJUjskNlHR9/oVNNS9UfLnpMhKw03V
 ybfzSp8q1qX5Zwg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Inform the core if we intend to disconnect channels during idle.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 50fbc0d06e62b2743dd7f20c9863d56009dcf0e9..4e81002e2e4d6c63f13cf44e16581aff836f7d4f 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -232,6 +232,9 @@ static int ltc4306_probe(struct i2c_client *client)
 	data = i2c_mux_priv(muxc);
 	data->chip = chip;
 
+	if (idle_disc)
+		i2c_mux_set_idle_state(muxc, MUX_IDLE_DISCONNECT);
+
 	i2c_set_clientdata(client, muxc);
 
 	data->regmap = devm_regmap_init_i2c(client, &ltc4306_regmap_config);

-- 
2.50.1


