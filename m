Return-Path: <linux-i2c+bounces-11958-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DFBB099F0
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 04:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C05EA3B20F7
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 02:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515ED194A60;
	Fri, 18 Jul 2025 02:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="qDc66MmJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sonic312-21.consmr.mail.sg3.yahoo.com (sonic312-21.consmr.mail.sg3.yahoo.com [106.10.244.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48F3189906
	for <linux-i2c@vger.kernel.org>; Fri, 18 Jul 2025 02:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.244.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752806824; cv=none; b=npEQwQRYmIg04BHVUlt59CkOBl6JTwgLuPAJpayDPWe86UE6BV36LGUPhL7ACLJKHCJmx2glZyJ6P6wti1yV0MUv7zEcEP3OeegCnyB+y9EsF3sZqTOTRzTs8XPftE+LlmwlV+BNBf2JBlLNA61k2pwEfgGLSfXdz0QIERHxwsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752806824; c=relaxed/simple;
	bh=n35W0xE1KRwyXbLo/I23QujB27Prt4ZJPQ458DzJTjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFVw3mNVJoi89TZd9MC4kz9EObkWUv/MgPvU3DFr2OrgneIVJV4DbR0qQYISNmBc6ah2kyDiGEvjcYgvZy1kq3SLjIt3bNf4MpoO9IHFC0T9i0bnPUBQoGPJsGoqdyNV5MgrWDXsKxq0+CULreDTmPAIYUHgreORbSa+U3YM8PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=qDc66MmJ; arc=none smtp.client-ip=106.10.244.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1752806812; bh=KnfypI/4lpZjtaqAfDlUQ6peA6y22hadDc71Xj3e8Rw=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=qDc66MmJZaM7SFkztQRDtvFadZfqj15MhUdLubGCIVWksESCLXctwhR544FdTVRBfPjzg7FOey5YNRj9BbBoF+QK/BGiwXRmLv6yPlnYT59AJo3+Ym1Yx3ZTHJh3ffoGqSO4EhzGaO2apw9GERjsWc917DqpQ3V2hmw71uPErX/OcaNvwMw5QagNoaq1q5Qlp8RwQRJHwkPYd8Jc/g4I7nRXk44eUxHp/hsnQM895XX5PW3LSxuTKiFak3EPNDNNjOMbJx9nuggLlUdoS4Ath3EwhAwarNXZ5+/e5NNF7zXSWunnbPVPp6UYeg8I/aNybyM6AAmQgx0V+LqJuQr+dQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1752806812; bh=yVlrzLbvB/EjF8zP+6nGFIoMUsWLtqa8ISJy8xrI5YL=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=C0kc0cFJS+g/S+SOx2qbUmVSby/CU8vTQJ7yf1YMJnflUlaSh2gsOgN7g1nZFTBdRm/LJYMJAUI4RHUn5+k1E034JPcAa2k0xWY2K8OnQ2tE408z80VrvXeGjOX2BOOAO6+zUeyb1l6ri5fIIS9xE6DIcYlPtCqFKMaZfWJXxeyNFrj1LRE4czx0pjj/Rgs7BsoTurxWzUBCXwYJXKqqo7m8toySsHwfq5qg1kZl2nX8PezN8DRHPE/mWR7GDV4AHuVRrj/AgCl2kUD2uzGdtn43gajJK7EqajSpN7iGPhhBVPqsFeejkKihC2l/GjFW2JDPzA75DvnaZZrSWWMRSg==
X-YMail-OSG: 2DGhbhsVM1lnLzolCVXTUzdG.kL95lj2huabQ0kB4HVBiPj4VS4R_rWrkP.3HTj
 LBL_sx36hwN2jq5lygyH1685LZSqKvnG7hzPraOVkU_ZktsY04frlpK54nWDQDk8ISxTCXliwFak
 vpLWese3_nBwizWCcjrDxhWsKcyxmUFnW0IOcitBdj5EURN6sRtPdc0ihWymTkOPoppOKK4i_vWE
 B5xo5tnYv5NQb7.yVXOYw6kjMrVTAzzifQlUGiNNEyfAALRDugWDr82ppqxgBnUHXRC.aSCKtqoj
 _owERHpdvF7hSXR7RcvBPplxgFobMoePMAnabxdIxhR211.E7ygWTdCSFI29_oATzdLd4gYoMv2J
 LJC64g8EpDDU.ME5KD1woyTMWW_chVqy2sYHlG504f.74zpqSoPvl43p0rR.4oAdD.wwvjI2e4Xd
 2TDWZKSb6b8emwL0kCTJvVgndISdsaFPTb5ga4kEkYxk8j9DNN6NKaC9M9hPDSMZ1IVbKG4x.IFa
 uz6k_R7ZRu0F9leFY7C82U1RY60YIDq9GgOtLHvRul2mbLckCienprIYW9bgwOQ5_iOrBN2sVT1C
 uVH9SdcqubaCw5cHzsHDhcDgBEsplVCDRQBCfrBb9uvPlhUat0kAUfOfpeh4K_oGkHk9b7QRRoox
 L2gnUIRYC2qD.7TaoOywwSp1WEk_mQYavA0sYZHFCU48Hm3U_2xYkQJaWpNhxNqco21FyP2acDyH
 O4NgZIkOdlaeZTddJvFtwaSXtUgR9.Op2fvI99asorbhe58JmmI4vi5xzqAZ6pAghIYzwVSgDEMV
 TgwquREho8TMfid.Ye346zwMmK6DQwqr0TBG3faN6XPFfe5spfwCsgbb5gMjq7xd6xtpmAZfYslj
 pkq3cJHudcwQUrOdVoga2oiNA.ZFL5LCxMAA_Fp91X3.cCgAA1oh7tPlazs_.rkDK7_7TKXYM5nM
 wOs2TH60EV_g5rPVTQy_vA39Dv3KTLm8YDkpv.DqBKhqhKYVDXM83epbxAOHXb7HYqdbcKrjZKph
 e4ZzGnr2SQ0UoJzd0RhAOWfpA1VgkQEsOnVZMNGF5Tj4v5RHgeUdxw6R2.x80EsZF5RZsllnK4wL
 yXYzIkHS1hcyBicSiGir78jqo0OUGhtRnEzYYADenq7co2srrKC.hiYLtelatzexnaTgKLoqryaK
 9KkV0R9_BUdxFHmRvl6ClpF38Rt06yv0Mqe454u7tVrCQXOd6sowJo1J47tQ3aB6ptof.2mkhzHW
 JUJ75xQ9l24zXcr81ZNLz1GLIht9DEBcSXW1qzwAy5T5WgN6W3fOYNDqkBisnDNwSbOjpM.ThSGe
 w7Xp.0ViqJJITfMTwylZLH5VPUXXXmS3QPSCBYI20tKBunCTWUw4FxyqsgeGE94YuZEr2BRBe62T
 Q2jEViez9UerJlqvXli4tuArNwf92b2JiycCUDsrpi7IEHazos_6Dc3wz7CyTPnfEXfCaBSpn8TG
 veoihmxujTIuJaikGYtveoll3LBPVNjSoifl0Xnb3wKUJ3pwgqGx2LzJplTfjXyx.NgOFEJmbduG
 SCScmYnSxTsFWkeUZAak1AQKwHwoXWn6Z02rUA8d6NW6arq_8.cpmFBGO1cart.pke.xf_TZZPfy
 EAvqak6PE7H1ICS2r3N8fMgpyWGNIEfsgeII3_titQsOoaJ6TENbVjcSa87jZY6UP3NiyM6JXHtJ
 lsJujrCogPePQ7hHzKgssS9io55wf4EGG3qZdRKOKsht.a9r4Q_LnNHhtE64zWH0Wc.6oJ2ssqq2
 16bRV87Sfn9CE2ii3dPAoAVM8ce2J6vTG4x2f1vie1_5XjERSoeDQnLoBsiUnUJ_btFdSK7Da5vN
 _ii97yGGR74bGZblXHFdQZufy5qNArQ2pl_2Nf2uPYXrwJm4UVopSgFmOIBP.tb6XWLv86Qq4m4.
 gQ_m4tlvbBbyb.wMhBt8NdQ39noGGPGoeaMj2MkytVcym565j7D4YZEQ_aRSE0pBJ8rKBWgyF.Sb
 J6RENjjyuRP41IaDVx4GxH6aOXft.daYQzKWPKddE0kmOSaCi1Ds19O7iFMfW5KsBe3AtCmXsj0A
 SzhHZM0ipNn7cvVExVJH7j2tBYmoTdLK1ByZMYPYODEH5gGGolstYqdgNshzAlfS13.v0YOBaQZf
 YIyo_Iwin72X2sRw6m6iUwg4rdKGcDvjQPWj8NRJViu9jwODe3DQ0ao6Dvl5ZumnceZmm.gcrUbB
 mQl3r_yF6XkBGkzx_GtS9ndUJr6kuHdUs3LLwrdLEE6Giswi8FBg17P5USTE9sn8KrC85olKJCBb
 mG2N7k3BBjmpyriuFackYk4comaZ9gkoO9yE62Sws
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: 2a6f5cea-ec48-451f-b092-f4c6414def04
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.sg3.yahoo.com with HTTP; Fri, 18 Jul 2025 02:46:52 +0000
Received: by hermes--production-ne1-9495dc4d7-4hxbl (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 658c3deb5093bc2afee7b1ac10fa70e9;
          Fri, 18 Jul 2025 02:36:38 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: lkp@intel.com,
	gupt21@gmail.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	sashal@kernel.org
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	stable@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
	Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH v3 6.1] HID: mcp2221: Set driver data before I2C adapter add
Date: Thu, 17 Jul 2025 21:36:33 -0500
Message-ID: <20250718023634.267341-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1752798271-200317d7@stable.kernel.org>
References: <1752798271-200317d7@stable.kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit f2d4a5834638bbc967371b9168c0b481519f7c5e upstream.

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
changes in v3:
- No code changes
- Corrected the upstream commit ID
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


