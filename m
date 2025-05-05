Return-Path: <linux-i2c+bounces-10790-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B80AA9FDC
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 00:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A0A13B4B3F
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 22:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E1F28B503;
	Mon,  5 May 2025 22:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlvPSki3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC6F28B4FC;
	Mon,  5 May 2025 22:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483365; cv=none; b=GJg59Dn5ZdMRDURUsCf+Cau2lacCM5pY1G9pOgOlOqdvMOSPMRCIckwBISSIJIF/jQmgJVIylU1cTWF3DQ4+DYgoQ01JV9qkB8WRfNhO4gbgTA13WgnMViIXM4GbaYSdNpY7DPmlN2v/MBDcRzT29bdZCTEWBBuYyonaxT+QnGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483365; c=relaxed/simple;
	bh=5M2lDVFb7Up8UtPERYPxLxw9AJrl5F42PAcwwkSUPLU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Od+U17yeYFkHmtweXJGZDdG8DG26Ja30GZJ2OOt4uJ8sapEyl0WlAi+IEk8pGyCsopZFYaelBAbjom8+/jo8nyfc1QorxKxPcqgZYhhmxVuDz7c0FGJPY1GdDWNB6dVn3D+CgSGpz1bNK8d/n+M7VBrMMjRXzGy1aYX4Q24Z7D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlvPSki3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD563C4CEEF;
	Mon,  5 May 2025 22:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483364;
	bh=5M2lDVFb7Up8UtPERYPxLxw9AJrl5F42PAcwwkSUPLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tlvPSki3xj7u2R9hFHH97C2CkWgIUS4jF+vW2mHRO9LFOgkBnJQuImAG/Fj+TaQ8h
	 bl/dwu+d+bdIHtrCGwVK6wzclY5PcmJSEQE9HrKMqPq4gEC0FSlM995kf/zi6NicML
	 KEYHzi3q0/c+9EMEJOxxVPA5Q20oUD//oQa7VrCHmnb4vPcwg6zd56eVasuqem4YW9
	 rrMa2VpbPbm5RLJ9QasXfT1Rgw1UOjJOcN8pdjrXaxVUB4FHcvaeyzw+H1CAS9uisj
	 tH7gmmsT68GdA5Ohl2SImhcpjmrSiDmvRkPgCjF+Pq5QIJ1STcQpJQDMaIvgcuHveP
	 ahB7ouXCS3F6Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	quic_vdadhani@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 056/642] i2c: qcom-geni: Update i2c frequency table to match hardware guidance
Date: Mon,  5 May 2025 18:04:32 -0400
Message-Id: <20250505221419.2672473-56-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>

[ Upstream commit a815975cbaeb4ab29f45312ef23be2871b2e8b82 ]

With the current settings, the I2C buses are achieving around 370KHz
instead of the expected 400KHz. For 100KHz and 1MHz, the settings are
now more compliant and adhere to the Qualcomm’s internal programming
guide.

Update the I2C frequency table to align with the recommended values
outlined in the I2C hardware programming guide, ensuring proper
communication and performance.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Link: https://lore.kernel.org/r/20250122064634.2864432-1-quic_msavaliy@quicinc.com
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 7bbd478171e02..515a784c951ca 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -148,9 +148,9 @@ struct geni_i2c_clk_fld {
  * source_clock = 19.2 MHz
  */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
-	{KHZ(100), 7, 10, 11, 26},
-	{KHZ(400), 2,  5, 12, 24},
-	{KHZ(1000), 1, 3,  9, 18},
+	{KHZ(100), 7, 10, 12, 26},
+	{KHZ(400), 2,  5, 11, 22},
+	{KHZ(1000), 1, 2,  8, 18},
 	{},
 };
 
-- 
2.39.5


