Return-Path: <linux-i2c+bounces-11954-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CF3B0816A
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Jul 2025 02:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF1E34A82B9
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Jul 2025 00:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD431CD2C;
	Thu, 17 Jul 2025 00:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="LCVuEUuk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sonic312-21.consmr.mail.sg3.yahoo.com (sonic312-21.consmr.mail.sg3.yahoo.com [106.10.244.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC672E3701
	for <linux-i2c@vger.kernel.org>; Thu, 17 Jul 2025 00:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.244.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752712350; cv=none; b=bDZBUgrK6uB0a2TWFILIkGReHA7AeSdDJtipaTqJAkIfxDluvXg3of4qyD34LX2vreIA2pDStuu4Hw/AuWvchFavyh2FOI3mXsMYqZp1ZBg1vQ1s+cSmewPicDkxagmnv/YF3rOpSsNYbb+mulkW54hgsvrZ2EkPU6g6RodeNX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752712350; c=relaxed/simple;
	bh=CS0urUrY3Y9gDj3DWUDYDlVKij5a0JibdpkUY1iaOV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DfBYvvKCR4eNW7O3PHBRGUmgOEf7sFT4BbHUVVyuLEDD0M2KivVEMJAITXYYc3VUgtZAifw5k2TtPEq57hhgitI1xEbtJa7An/X9fMNQV97ogfVEd6+NHpt8DjUAlyOlMEKu9Cc3Mc7X/njq52G903qkYY3aLoGDLMkFnDgJ+1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=LCVuEUuk; arc=none smtp.client-ip=106.10.244.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1752712347; bh=Pm6uvSR6cGTi4JmjTnV4AIy9A7mP6dpEnqMAfr6kl4I=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=LCVuEUukh+Q9PrBGELUEQRJyIAGiLk4Wla9E/DSw6Z1KVrmdu4ofKru4NHxqGI/exP+lXIOVJS26EjfA4a3wfqAc1vve07T9VRZRVdpH6oBdRJ/iVosCQ6G42hugYI/pHv5t2lv2HOFTEh55grDxfpsVTdBKNMB4ZYOGaLBGnzXc5gcCu3agSctQUozbxl9PQDcxN87GnH+iHmQapLcsUqUZPEVHCESjesxw2ZntIc3I5ci5C1kRLl56XA64R+aT4NseaHNyF/tMluDNw6yIyS7TumB8YMNG8sJdC9oKNQI0s/Lj/QtgFffJoNNEkk5S0M1ZarIf6g/YBs/YZspGgA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1752712347; bh=2hb6lPZoA7vRcLSAECHYVy/u5SGAEf9xnrpj6JcwFq2=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=cJExYiBvTLYeyzZsj+nHh9BvZuUfhEd9yOTnpTumF4v6CUI9kVY2GKgthk1VKTNi4Mo9jIvotgJ54PNSIkCquVAfZfiOaHy2dSvNp5x+l8nyDmUDMnxgVxGl6nV3IW7HFiRJuOAc0sgKFgGX37r7F4YqSlynbG+YibzYeqL5yFEZuVUbltGfzlMzgMH5IbJwPGy4274kaCLPKMLgAXoMPZB45qMe6/kluoGVcUsK+KtQBEx8nprtWc8Lc3hS2xFK8KwRbDu31MS1ObfKZ4VhsAueevDCNX2HL3jeCXaxsuQs/Akkp7A1v3wMgyoPwIoweh+Yhi0tM7M07Cq18ysqBg==
X-YMail-OSG: xUS1gOsVM1ndvL45pPpR_mnPZpD.eaCadjZntH_Ch1hfmKwp1hZzwZlx5h.pcYb
 QI_FCOV2PjAnLMVrPOZzTi.xWsQgjSte7oCAApcSq0V.9zqDbIcCUrJ1R7NpJISGnacoBKdJT6k2
 mDsjx.ISkYSQglieWG4BOcNsNEwoGaMxrhbGvwIAjVxNfdcyylb2couierwSNczibJsdNyAcdQHa
 YB5VamsFfNhZiXObUsM_5ztgrYTvZBt5BeND.XdUt_S8YsCd2sksAGvTXWyTTkGWW7368fNIvJAI
 or.dbwDFoVh_ykVFrT5MMdG1IMdlckzLbx6gAqE4hCflIcCzacldQ1ic1c8hdxTvRMr3oBRZL85i
 sMd9d8NkOBXmY2UBvDyearA7WBDPzXqSQpBRQxa8A93pn8KlKqR6JmccDHg456OhNHYJVmsL7rtw
 z5r6BQhdJdC2ZsK5jCfM18ZuLMUuz4Xvttswt.hAlNCewUYxc4q202ECM4OlcDdG4.OXuFaDwTlN
 n4TpazTXM.R7u6lIGq8dezRq6g9j8610Gp4MKED6svTAATKtnY.4EPP5PigRuyyBG3k7Iy2U6B_R
 .ArtR9Ad0BliH8noJBL7t1tYJ5lprxIyYof2CGfGup69GsRb3t9YqYZEORwfCKwfBVZVr_eXs6s5
 psjmrGOm0d9iuUTZV3XqMtLC0DO6rCzOmiGB5hS7jucKHxtuuDDYKUuqgGEo6vbiK6wpLYMGUbcP
 RXvkC14PYk0KGZ4BibLeYRqQQiuLu0rHPq6TEpg3YgZcW.AeXROnahiB5pTrSKu3IMlaRtTc67ew
 mcWvuoZKuMmAUWMfuugUA5mjHzW.oJIyBr90T29ds4hR86.BAz2Xa0rjspeLE_aJ0xVqS0NUkzbE
 UxFRBTmhIYVv_28qP65wUL4brO3aiNBzuZO4_i2RiYhczCBQNIdQxCdp96uHSi.eR6SQd2mXgwwr
 e_ZaTm_45QwJ68QiUiCfEtgSXR7QMPpHv178QsVs7EWXdMSAqed3WCmdcO1Q3agYWpE8FfKy4aAs
 Guaoh_ENBv5gs2teSTgxFr4hnmQGzRewjYx0gRuPeYEYIkzU4aCGPOqRcFt96qWPRb0R8L18NDxM
 VdqcxPKLP6WlEl57k.9ViBwDmFuQNlAhgMflvez0fOmmtuiGLT9_pEShIlRb2virtsENaI7K5iHn
 DT3bQ2P8OgoeqmJXufe5juUzmMrPEVGf0GeaXJNwrIZ7l8r3XFsfvj6AYYnRRM7vjiRSLujtTaQe
 veVFYlsBlNW6zzlfY28.mGHubcrmWpEs8yTJ52Ye1iFolV180IY4cAgKbp2XmgyhlzN5TKR6.7kr
 XBywZNA0UGylJcMdJj22aN3b2rAGAKU5f7PBbGFUNa0IjrNE_Pp0Z9tLj2o5y3CEHETnb_YuC0r0
 TllBUEpmkfA_8J.8mQLjHpDCzfir.PQRIXo2I9u0bblR0S7OugFU8OeTzudmkRdCUjmbYzvnVp9w
 c_KztwmY57p0v9m9DZfgG8h3rJGeIxMCyIcqjSfycsnRlkyuv9O25MHZrs5dZidv9GFbnq1JFlvW
 YwiDa1v5OqXFV4Mxewy6aMq8EbkBbdbUP8.AiIwnqHVz7gHYF7i023j03S5MtUiDbMjSlAYvcE31
 wZy7LaPMV.13PHoQDV1O_QFiBtc_DKlgOhDFqVo7vBlf23PN0uUkBYS.TwQikYarwpETqzhiQkqN
 trucYVIzgQKeVzBVrUvWhpqudfnNBAEXdgNb5YpX4eEws3EmWHFQaAOy4_PvcjZIsezDHCjJzwu9
 bvObbiemp7TsEPcw3WVkHYMU2lGjyml9fagYhOv2hwVx.WbwaUwuHWLlVgpM3acOrPC4w4FyXUh8
 1gnwKVwScoawDPNo2eQ1_q3oFh94mC7vDChnzvvHr.Hd7oriGkXSHxX2vlcC0vmQ7DGnmZtbsTnu
 LqcT6JpQwDIPe.vXxI.1ZqogC1BY6bkV8MMEGLBRFYXt7aDwa5H4LJCpWtLJRlzVJuGNrEwh8wo0
 SJOwET5Kradc9.0SsLH2c9mZgCSFbpdBN5HQ5QAkPjDdDlyqzV7T8dZNnFRdgbj.3Ari_4qa97C0
 54Gcf.HE4a5ELj2sRlSOAC34wX29j9Xt16aD_p9PFtbgXE4j3yPXlmk3zugWUpFxDZTmVslDe3ag
 O0fIbAkWxOy5CQoJ6O13A0akFQWeSddj3pTGkSYLFoebAAr6M08HUjrPd3qwymSqTBu7hAxtHZxa
 G9Iw7dREm1TRD7FE7w.bVUJcNMszj2yZFRdcyDQrYS86QdQtZXAMl6z761Revn0kcEy4BANYQHMg
 9HFoVRtx8FhaErWcEVoBZLClBwwO5EdLvKsOA2A2v5Q--
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: 86ec978a-c595-4df4-bfc7-e6d2468b373f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.sg3.yahoo.com with HTTP; Thu, 17 Jul 2025 00:32:27 +0000
Received: by hermes--production-ne1-9495dc4d7-mqk7g (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID f04af0276389773268c316570c99886b;
          Thu, 17 Jul 2025 00:01:56 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: lkp@intel.com,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	gupt21@gmail.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	stable@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
	Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH V2 6.1] HID: mcp2221: Set driver data before I2C adapter add
Date: Wed, 16 Jul 2025 19:01:50 -0500
Message-ID: <20250717000151.183803-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aHgM7XIAzGo8fgwN@32653d2b52f0>
References: <aHgM7XIAzGo8fgwN@32653d2b52f0>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit f1228f4d4254dfad837f1a1e4c69930417798047 upstream.

The process of adding an I2C adapter can invoke I2C accesses on that new
adapter (see i2c_detect()).

Ensure we have set the adapter's driver data to avoid null pointer
dereferences in the xfer functions during the adapter add.

This has been noted in the past and the same fix proposed but not
completed. See:
https://lore.kernel.org/lkml/ef597e73-ed71-168e-52af-0d19b03734ac@vigem.de/

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sumanth Gavini <sumanth.gavini@yahoo.com>
---
changes in v2:
- No code changes
- Link to v1:https://lore.kernel.org/stable/20250716195316.176786-1-sumanth.gavini@yahoo.com/
- Updated the upstream commit ID in the log
---
 drivers/hid/hid-mcp2221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index de52e9f7bb8c..9973545c1c4b 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -873,12 +873,12 @@ static int mcp2221_probe(struct hid_device *hdev,
 			"MCP2221 usb-i2c bridge on hidraw%d",
 			((struct hidraw *)hdev->hidraw)->minor);
 
+	i2c_set_adapdata(&mcp->adapter, mcp);
 	ret = i2c_add_adapter(&mcp->adapter);
 	if (ret) {
 		hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
 		goto err_i2c;
 	}
-	i2c_set_adapdata(&mcp->adapter, mcp);
 
 	/* Setup GPIO chip */
 	mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
-- 
2.43.0


