Return-Path: <linux-i2c+bounces-11876-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD5EAFE009
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 08:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2157758036C
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 06:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE7C26B946;
	Wed,  9 Jul 2025 06:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan-david-voelkel@web.de header.b="Wc7nGcMO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927A426B747;
	Wed,  9 Jul 2025 06:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043189; cv=none; b=mejsMcnaFQqgzfQXGedV3HbjcQEXIKlqYuR2myTrQRYZb9ddJ1jJYDT5bTlomsofWZkDH5sXR/RJOj0n6mzSBJYFCeM6srKE44Z9OCNZyq72LpCszM9NC2Z6JDCbLUAVOF3J3M1WZu4kInaMhJjErVMn5HaHAJ6AjZElp2ZVPts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043189; c=relaxed/simple;
	bh=ZOBAf6YE3mIRz7Xx6Z3dIEF7AWhG7MSYmvxlD7q8rt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U3Y79AqFDV6N/IA4SQr/HE3vlaBLS0lAo0XNu8yEtz+cTevuiP4cWZDe8gkNwa4ssmfoT2VKazCq1JacPZIrKd8+AA6Rf+nhxGV123o/TVYBBnOD5uiSwh2iRjzjcFrFdOfNMruQAyLd6/DVVsM42jyfUg/6Ae0IuhMuYPqMTh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan-david-voelkel@web.de header.b=Wc7nGcMO; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752043158; x=1752647958;
	i=jan-david-voelkel@web.de;
	bh=zBUzUdqctRS3Kbs4jrLWahG8PDR6KJCN1AYI/hbRo98=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Wc7nGcMOVhuS6lLNr05rBgXge57LMSiMueLr/MVuPZwk3gW28L3pf9NgTyQSiA3B
	 wdhrNBOrKLIYXgzyl57/be7QHyz8yW8RKchekgE1m2LKg2G9+Rsi9Rp7lsjmq+yGj
	 1i3FSwsXHCkvrnX9cGwelJ5tHLk26FHlQeVMkpSBPJa9/Pca8C9YDBDrdifRjZP9a
	 ntg8Ft6MH9tc29/CjiQ/MDb/7IhgksBCf1CuItcqgSknQWOrgdhEAXo0EiMwEMpgD
	 Pt0P/YP2vxkaxVjAtGQF2xQLTl8MOpJKoBzIXIDshCopM/Pz2MfjY8IXrmxhfwGDl
	 ojrox60ufG2QtYT9cg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from MXODN22542.mvad.local ([95.112.233.210]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1N8Vsx-1un7tU42jZ-00xBwN; Wed, 09 Jul 2025 08:39:18 +0200
From: Jan-David Voelkel <jan-david-voelkel@web.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Janitawa <jan-david-voelkel@web.de>
Subject: [PATCH] i2c-imx: fix broken GPIO bus recovery due to missing recover_bus assignment
Date: Wed,  9 Jul 2025 08:39:04 +0200
Message-ID: <20250709063904.22055-1-jan-david-voelkel@web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XMtQhkgR34XjXAIEt/rXiyq2mhaNPCH75KNk+Ughr00A9KFjees
 Ce50fH9fo1DwIP1M6CCfq0B3+iQJUIzjhVP2il73nTIp7WMp2G7kRJQVox4xQApm6jFw4jP
 mH9X7GVe/+t3AbNwkugL4h5JXugu3E1xGSY8kO2c6laqOlDw3P3b6P7PqEtjXwiUjglHNwf
 k5GtLVTFuNBzA5cfiWiWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vX5Dk7135jo=;VO8B/uyMo6AfXgqMmeneJcI8Yll
 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
 shiBiFfkOrRWIYnUKrbZj5g=

From: Janitawa <jan-david-voelkel@web.de>

The transition to generic GPIO recovery support removed the
driver-specific bus recovery logic but failed to assign the
required recover_bus callback. This prevented the core from enabling
recovery, effectively disabling the feature.

This commit restores the assignment to ensure proper recovery
initialization.

Signed-off-by: Janitawa <jan-david-voelkel@web.de>
=2D--
 drivers/i2c/busses/i2c-imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index c5224d43eea4..421f6da61f00 100644
=2D-- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1375,6 +1375,8 @@ static int i2c_imx_init_recovery_info(struct imx_i2c=
_struct *i2c_imx,
 	if (IS_ERR(bri->pinctrl))
 		return PTR_ERR(bri->pinctrl);
=20
+	bri->recover_bus =3D i2c_generic_scl_recovery;
+
 	i2c_imx->adapter.bus_recovery_info =3D bri;
=20
 	return 0;
=2D-=20
2.43.0


