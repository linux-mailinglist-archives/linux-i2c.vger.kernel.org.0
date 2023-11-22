Return-Path: <linux-i2c+bounces-377-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 949847F45E9
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 13:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34D1BB20DBB
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 12:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08024D5A7;
	Wed, 22 Nov 2023 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=feathertop.org header.i=@feathertop.org header.b="w50EY/dh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eRQYkEDL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0761A8;
	Wed, 22 Nov 2023 04:23:25 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 0A7193200B0F;
	Wed, 22 Nov 2023 07:23:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 22 Nov 2023 07:23:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=feathertop.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1700655803; x=
	1700742203; bh=EqvpFO7uAp2dtrS7PSLLP170vBC1DS2T9wR02twt9S4=; b=w
	50EY/dh0oz2zSNEc9IgmM+0kBop2AA1twiXR37JbZWYc4gR/2POSSizxcMKwjpe8
	IA4NMw7ZcSwBi8g6x6KI0TSkrbMRDOQeCYTmvLondazOsD68XgfMjUfOrCTf6Z55
	/ynShZxZvWmt3O72sM4FPFyV6/pubs8w01/CFgriCjz3sMaA73lQQ4v/Ac3F6JkG
	oyRpiIgdHkG+HrrZO4chqDBtOYE6KHW0Lg9E2SQvKWTwbhiVfXXBZEEESkpC+T7W
	2zVkEirKqSq29WogMfzGmOfsuPiwJdoo6O1Jo6wdhLhsbTKJShsgSdP65hzxhCTq
	fjB1hYgAflI5jV7g9FoRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1700655803; x=
	1700742203; bh=EqvpFO7uAp2dtrS7PSLLP170vBC1DS2T9wR02twt9S4=; b=e
	RQYkEDLXQgIVH1nZCehJYorDBVfwGZiSpAxk9oyqiHpPNBsLqk3MQiwXAHzuKnKg
	1WUraeGGkeVC1gdCKdzigRqeIRWJvBhPX4g1oqxOJX2ZjSEUttgvQEfpsnE9P71u
	XEto2zlbomrJW85c58ncnAa/gKHF9FZBkm9Qg8465B76LrT8pNuoaiWdSFVRzqNr
	o6UYmUhCVyyD9Ae3jDrGPODGme0ElalRq346E5SW3fzN0TS4iWofFt6A1LuSEQxJ
	wiJgLYUezGrhLaKrpadStj5B9JDQNqDx6ehyfEx1IlxFhoZDO29LUxup7NvHbfJ/
	8WhJoJv+l0imGiIcDQsFA==
X-ME-Sender: <xms:u_JdZbyr3X_IMdPdVaEkpZJfmiT4a3OquYWhc7JlWLuOEBqmaasrlQ>
    <xme:u_JdZTQj8zog1yA2KNiBwv5IDXS1-AHDoXpGvbvk-WuCk3OLipja4Vs_9w-v-0V6H
    p5ImIn0uA>
X-ME-Received: <xmr:u_JdZVUNdw6JXYaCHEDwX6FWAyS-b338NNGSputHEpkU1zZMB6YOiLuKvdK8w81bMPVP-7Fa1WEmMjmKDSG5yOE4Vw7oN5n_ZMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehuddgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhimhcu
    nfhunhhnuceothhimhesfhgvrghthhgvrhhtohhprdhorhhgqeenucggtffrrghtthgvrh
    hnpeefffeuhfetgeeikeejvefgtdefteehgfdvhfetfeeuffeuhffhfeekgfekgeehieen
    ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehtihhmse
    hfvggrthhhvghrthhophdrohhrgh
X-ME-Proxy: <xmx:u_JdZVh36mOMtPiF1lyQqmP1t8QiQOrtsSKOgV-_C-Q7IUM6RYmYIg>
    <xmx:u_JdZdCkccMwx0OUttXzBWtJzfq6mBJXqPpPjTmBS7vyGkbTB9HCqw>
    <xmx:u_JdZeKoHCJWs4OroaXBIvn9K0eRun8zoGjXk9vh-h5RGJPkz8PsNQ>
    <xmx:u_JdZRsebGSgzpcE75tupvOUaJhrVRBlWCWkPl3kq8-qD5ZzjnKliQ>
Feedback-ID: i1f8241ce:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Nov 2023 07:23:18 -0500 (EST)
Received: by feathertop.org (sSMTP sendmail emulation); Wed, 22 Nov 2023 23:23:13 +1100
From: Tim Lunn <tim@feathertop.org>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Tim Lunn <tim@feathertop.org>,
	Jagan Teki <jagan@edgeble.ai>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 3/9] i2c: rk3x: Adjust offset for i2c2 on rv1126
Date: Wed, 22 Nov 2023 23:22:26 +1100
Message-Id: <20231122122232.952696-4-tim@feathertop.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231122122232.952696-1-tim@feathertop.org>
References: <20231122122232.952696-1-tim@feathertop.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rockchip RV1126 has special case mask bits for i2c2.

i2c2 wasnt previously enabled in rv1126.dtsi, adding DT node alone
is not sufficient to enable i2c2. This patch fixes the i2c2 bus.

Signed-off-by: Tim Lunn <tim@feathertop.org>
---

Changes in v2:
- i2c: clarify commit message

 drivers/i2c/busses/i2c-rk3x.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index a044ca0c35a1..151927466d1d 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1288,8 +1288,11 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 
-		/* 27+i: write mask, 11+i: value */
-		value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
+		if (i2c->soc_data == &rv1126_soc_data && bus_nr == 2)
+			value = BIT(20) | BIT(4);
+		else
+			/* 27+i: write mask, 11+i: value */
+			value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
 
 		ret = regmap_write(grf, i2c->soc_data->grf_offset, value);
 		if (ret != 0) {
-- 
2.40.1


