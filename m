Return-Path: <linux-i2c+bounces-11950-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E76B2B07F14
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Jul 2025 22:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DC9B7A9322
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Jul 2025 20:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8921F2C158F;
	Wed, 16 Jul 2025 20:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="pp23Tfb9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sonic311-21.consmr.mail.sg3.yahoo.com (sonic311-21.consmr.mail.sg3.yahoo.com [106.10.244.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BE3A920
	for <linux-i2c@vger.kernel.org>; Wed, 16 Jul 2025 20:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.244.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752698653; cv=none; b=Yn+qh3FQbxyYhwh9DH6zRGTRB9McBzwJlDwvczAIIiRyfQAqo1GyfgWd4FYq2nSn9rg+JIYJOLC2OkUjIJJuMwz84OQuHz+gtK3Jhu8zE9z5uOAhGMNWkXi+48vZWSFoj/pQonVBI07yCwwwYbc2HgDGvD3WCXrU7o801qrlFLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752698653; c=relaxed/simple;
	bh=Jjf04ylop5U+a10qGcMbcucN7XqJczKEFJI/DCJMJzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=UzZbMlRz1omtfnJOAIXr6Zq5cIyDg7GIZM+OEi6cbaDytPGBUaWM/quYR3YglixxK5kdfs9BUui1D29TF9RE881u+jTdjvLFRE3miUUKJgA/swta/bdv1Q0i1jhUv2CIKUDr/uqOUdoee0g5m9fSnk8IlxkbA8rEFS6d8VkRc20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=pp23Tfb9; arc=none smtp.client-ip=106.10.244.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1752698648; bh=OEFAEz/+4pDWbItrpxD27vn6vT/LAF+wBo7eq5wNL80=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=pp23Tfb9eW1b4s8tDO30dQdGJ65MTJLDK3h1PhR1n7CLMZrRkswYwYRvDrBO2NsPacjLIS769mPD42SuxQg2/jF0tuBUU1e6PJ89Cskye92sc0wkZbCh24YR6YWJe1feNdV13WYgOT8MPEgNtA4nLwPLxKoIvSzHNmXw93ZSuOQ3r/LqgkGeoWa+BTsm6CvalFmjojRJWchEDm/YdSGmpipr5TUA6k3dAgGrT8sI0ivSICbFVyJG1fIX2LURYnhOG1z1ovxkNKNiq8K+cOGmMVHyhAAaPfAST3Ycipg5rRgt1usYfN3hgAOFoBhlwQEw/Dpsc89YpUWyVzANxIs3bw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1752698648; bh=DleXRFoQs3zwl+8TMXvNs/YBEWvIY+h/xkYrLYTNjbh=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=cs1+OPpAjqKEdz1hSVFpSVLCQe1dIhdDjmZDORO97C8oB6zIC7BVFQ/MG3/XIvFBT3219AyWtPQBSFRH36/DbRcXNB/wSO9XlsUg16c7obudrgwqKN/opM3cpQUBJsrYfTRWm6gC5Bp3ED1iBl6D9pqx/N/1yuvRWtSqOG3MXFGhWeyExKHP6KQY0GbXQQQLciQzpxVKtspcAwUOHC5VPoW9Gc/MLHjH1Rcy645NUkrvdyNf83ivB4KoxiMz0B3xE4mOan/aMWAPhcmeNxNJuRj0NLNEQTXx4J8T8MEBzuY0E5lF3jz/DpmQ35TabW4F86PxepLo6Uiia01aHb50Pw==
X-YMail-OSG: 2opWEMUVM1lGbozH9.hAxN5SVx9WbZd2n1tFDDlQ3Jxk_jcHvK5kVqRdVbJ.Ium
 QlRQw0NZzzxMuv_XW666t5DUfzxJdei2vePfUxGSRc3Gpt.YxZgwvsFIXKzDjOhX.XVQmb74.T1e
 Dfvx5np9yDNurpvyIZxKUhzGKz_i0ICYVnEfOlXWq3AvwWP57csK_JJdcqGjmkGp5XSlsH9US6uN
 U90_2WPuBjleeomGhWPTz70Gq8wfbCDLO8NCoPYtZFb0u.n15pXJKc9kbe84cisyT1umZK.x9JfB
 jxzRdwG59BnzQCRoydEG9KQZKzamBPMzsnmPcb2aqoWQ6IU0cBZsizWZemm.cJpCThYswWvfacd0
 3Xi5_6em3tcs6_gDfxeHW7f7yAObEieyFz3.fA4rbCmTxBbOtlD4zJmLUaXFRSfRhLlD7UeikfOv
 U4G5ydPD4HrIksJXtufxT5hWUY.Gr8HraFWq8JjcwK_364LBzMdNpvBEwp_uL9E8R0YdCkIoZHlO
 Q6_y7BTowpMKqX8nPKNFga0GD9sOz90FzZqe8ol8AoFl8fHeDMr2g9MLtkgwXxHFeTYIp1Ah7fIH
 Yc8ATyFs8YkJ.8cHjmA3IYSXmtpzwMosP4nDWsOiHmG7MXLArbzeyh1JGAHsJiTDfqMRVUQrbrzr
 abRGnfqnjGDgPzfXgXhruICTAlxaMjRmbQNAa94tOHFo8dAMoEg1ZfLmPS46hMD3N0Zz54DiLdY.
 aIiGLILc63IstVThBn1NPMvrEy_p4AOAc8PxgeZAC30x5.XNjGzxa1bgkRlT54GPDtTVFGwKZw5K
 q3l8eLyapv1zgw6kkDWjcdRzfRLoSf7TJRIl_Lg.y9e7BVN0qhmlEQDl8tQBVf61NgzW577I0wx4
 ljd_kt0_ldJh5PHUdnsWoXt2838Pn1Pk_FWt74ibelWb3qQMADGQlbA_IqSY0a.q1PB4PyRciY0W
 R.w2e5ahAKoxhyPlOURgDa_UFE5lFjn8yPbgVnqlcbI.wl00noswOlRyhFGYojOy0yj.IMre.kc4
 .86KNKJIYAqZJ.13iVfkbGaiCWpFriGubBgL.D.Q3ziLo66wbV5E6BmGgMRp_JtNzianQVtGa2TH
 vtI.eoEjJkC.ips1jTfvMB3fhk5lRHmjGWrGWSxlsAgI8vfv4HEnjpwylbGZ4p70ELT8IXfS1FC6
 fUlmBmd95WswQzhlbT00BW.sVNlzKrDYGFuChLu7OLqNaPO_8FV5crS.Jqtz45d.OIz68PvcVcyO
 8HD1V6uNL.EW6vQxMc3qSHxDE9wd80FoGk6Xf48pvvEfUbhbjITG0NebDF7.MbFvIMdPqO02wmYZ
 z4F5ZQj.XHa5d8BSzNs3s04jyN7fv51bPJunltF3UHZ.4k4UCG4GylMm3FD.Zxt0p9nSf7Z_Xeh6
 p2_Kheaea1S9FwlyrROLiAG_.ZP2vplU19hPAEIbKTHGv2d5ygikzOMHXDBJq0uSC6DelrSefiH2
 1a9O004SUXCluG2cAs5jFkLYomtyZxALjbP7bYLj2L.lxWMT56NZ0kzDvLfYclfeoxT1XuYNKJcm
 _7K3b.u2UMvpqHFg0Q6TljvbKEZYuCGGQZD7LsQZ6ll9BETaW2G3s8Ompx317v4zjltwFIGF3r_j
 PerJPVThjkYFsBj2ObCCf9K9v4aPpC9qAiBs4CnJJyZA7aZHrrD__R6NB31yf7eD.rotaBQSzYlL
 CjHEFuStT53Z1V7dTKBL0A7V3CBRnbpDNLyr.Y_UimuY9W7bmbneMLD3QB8e.1yxJyqyq.Li1jQo
 _ZPqNH5ZAG.bceg9aUKKuK4uKtBRTXn1Fn1fta0YGm6twnDFemNKOhsOhrix_URoZjZFq0EJOTJl
 hB5VGbLuclrdLBORGznh.4huJu2L5PlqI3cZbOsJJ.jMakNKEKrt4M3_Obxwmx7R0NbTkvB_V5uV
 RWDPMKtYEDM1vM5.YuDiufmaCWgNmicbUjiEmr0sqf2Dma0kbeG0pjN7v5A8zgkdZxvJDb9PhGge
 8uBp9bktKcnhmjrGfL83xc7qDdPCJTkuYB59xb_A2m6HApq.nuuaQ0ww4on7Ihy_qhvOMJN1Qpvy
 gwknbQ7QTmsrMbhHHIWnFd3vLLAFK0o0OzChndJznrHO3T1Jn_sr6fsIZdOMnuWNIEDW7IJB.haG
 e2HQqUxuxfQt8iGW7nMIIYgDsBGEFyI_shWjq22V4ZNxwnngZZR9gqxhVsMayhfMcOApOwRlD_Fz
 69cVFszy3XEJ30.iGJBJATLCa7qN94yebmWztdoBTznR501ST4wDGsH.H5V9jpzlk.E49TZS8iSV
 BNvRqnzoo1tg-
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: 4685dbdc-3e7a-486d-bc86-377fa78c6e34
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.sg3.yahoo.com with HTTP; Wed, 16 Jul 2025 20:44:08 +0000
Received: by hermes--production-ne1-9495dc4d7-dbtfw (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID a8c52d90f4f34e062d1d4f8f556dd2c9;
          Wed, 16 Jul 2025 19:53:22 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	gupt21@gmail.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	stable@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
	Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH 6.1] HID: mcp2221: Set driver data before I2C adapter add
Date: Wed, 16 Jul 2025 14:53:13 -0500
Message-ID: <20250716195316.176786-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250716195316.176786-1-sumanth.gavini.ref@yahoo.com>

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


