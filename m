Return-Path: <linux-i2c+bounces-589-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6A48023CC
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 13:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79A1B1C208EF
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 12:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387F8D26D;
	Sun,  3 Dec 2023 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=feathertop.org header.i=@feathertop.org header.b="chpjXnis";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oGXui6FB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADA6FA;
	Sun,  3 Dec 2023 04:40:49 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 8C37B5C0076;
	Sun,  3 Dec 2023 07:40:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 03 Dec 2023 07:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=feathertop.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1701607248; x=
	1701693648; bh=+Del4iSvYaB+bdbizoUiixSrtj1TkFKJ0EVqpksXCBU=; b=c
	hpjXniszslvYopdZ3BMmOSZPaiE254+Kqy1Sro/Sc2Lzn2YXnNbFEjo4pTRPmdqO
	vr9dnzMDSIMFW6prsPFiqLKKqYZlLogugjspZZa0hJhj/oer8q2CbaeNTWwQ5gOr
	W9Ch7uY9lmEdOm6omLnkBFNuIU1nv1FRd54hP4KUUmItsv0YTpvyx36wkBMa1CsH
	sTOw955ny+WC2mblthw97dIvUMHoZbkURGpXotcIpTVhC4FuGZmvURUclxBfV4UD
	Z30N0Xbe3Vn8QJ8vmIxaW0xz2LJVCsSd2G1pCWt9eHBCGMfT/c4WTu/N+t2r9CIQ
	oAhKikKFQLoEjB8lEs2VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1701607248; x=
	1701693648; bh=+Del4iSvYaB+bdbizoUiixSrtj1TkFKJ0EVqpksXCBU=; b=o
	GXui6FBNrJhHGXZrgY4bRemzHP4jJKqnKsM4aDR6BpowPfJAf8GJ/Dl6Z9PI/2U0
	feUtzCssE7+DxyM0BCR7hDS/3V0H5UxDpbShCUw1EirLr0fBNhOWrTkUspc0FMA9
	xDgl8urVg1PHq0YZvTjO6bvfCQvjcS+umXLWcJKfDv+52xaX8dDFIDhQ0I7dAzwi
	AlU63eMzsvJgrmVq1iYgcL2lG6u+9joPnvuyNhaW6WVFWyagkvTX4A/BhccjxkGN
	Y5JHXjm4vyIrvoWef956DEtwHo6yu+wjBsfZ9zXbUIuss41D5bMDZNOog9SatfN7
	6qbwbXHMsjRVnxa02FytA==
X-ME-Sender: <xms:UHdsZebd4Buu0lC9_pEjkIHYpDbU0cLuxS-lH4ZdCtdN1_SHqMorNQ>
    <xme:UHdsZRY7GTKP4ixzjxKG-ZKV_qgapYQJIZrvopAdZH8UxH3qwmy98oyJ8rudmLyAv
    4VN8InqCA>
X-ME-Received: <xmr:UHdsZY9EfIMnwo6pKobHO2K-vwz51pE35yKqN71BnoDCTkFB1Nz80ku9x8rn0efYFYOD5NQiostGmqmJ-4jXVJ-sFZeYuUvlt1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejgedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhimhcu
    nfhunhhnuceothhimhesfhgvrghthhgvrhhtohhprdhorhhgqeenucggtffrrghtthgvrh
    hnpeefffeuhfetgeeikeejvefgtdefteehgfdvhfetfeeuffeuhffhfeekgfekgeehieen
    ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehtihhmse
    hfvggrthhhvghrthhophdrohhrgh
X-ME-Proxy: <xmx:UHdsZQoXORzsXFoyOmTGJYI-PsEcfwROBpISHHx2z6S5q7crxTQVrA>
    <xmx:UHdsZZqPfXTdfsiy-6S1nW-sa4JDvjj7vJsIIwEhUtGPNMWMzQpfGQ>
    <xmx:UHdsZeQcWdf4WNSTuW-pqgVVDkcEu3NX8rw_xrbjynGOhkTGn_k7Xw>
    <xmx:UHdsZU0OSupgBe33r76fAk9WMpLYkBiVokKUlIHRWRlygqD4fmtn-w>
Feedback-ID: i1f8241ce:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 Dec 2023 07:40:42 -0500 (EST)
Received: by feathertop.org (sSMTP sendmail emulation); Sun, 03 Dec 2023 23:40:39 +1100
From: Tim Lunn <tim@feathertop.org>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Jagan Teki <jagan@edgeble.ai>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Tim Lunn <tim@feathertop.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v3 3/8] i2c: rk3x: Adjust mask/value offset for i2c2 on rv1126
Date: Sun,  3 Dec 2023 23:39:59 +1100
Message-Id: <20231203124004.2676174-4-tim@feathertop.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231203124004.2676174-1-tim@feathertop.org>
References: <20231203124004.2676174-1-tim@feathertop.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rockchip RV1126 is using old style i2c controller, the i2c2
bus uses a non-sequential offset in the grf register for the
mask/value bits for this bus.

This patch fixes i2c2 bus on rv1126 SoCs.

Signed-off-by: Tim Lunn <tim@feathertop.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>

---

Changes in v3:
- i2c: add code comment and clarify commit message further
- i2c: Collect ack by Heiko

Changes in v2:
- i2c: clarify commit message

 drivers/i2c/busses/i2c-rk3x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index a044ca0c35a1..06fec2344575 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1288,8 +1288,12 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 
-		/* 27+i: write mask, 11+i: value */
-		value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
+		/* rv1126 i2c2 uses non-sequential write mask 20, value 4 */
+		if (i2c->soc_data == &rv1126_soc_data && bus_nr == 2)
+			value = BIT(20) | BIT(4);
+		else
+			/* 27+i: write mask, 11+i: value */
+			value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
 
 		ret = regmap_write(grf, i2c->soc_data->grf_offset, value);
 		if (ret != 0) {
-- 
2.40.1


