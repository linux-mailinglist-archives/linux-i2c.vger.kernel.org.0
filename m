Return-Path: <linux-i2c+bounces-2043-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA54B86A6AB
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 03:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 987EBB2327A
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 02:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09C21CD38;
	Wed, 28 Feb 2024 02:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="D4rJYAEG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA511CD1C
	for <linux-i2c@vger.kernel.org>; Wed, 28 Feb 2024 02:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709087986; cv=none; b=YYtV6uUKwf6WyaLg7R+lxUq2vnWWU/7Vb6pgxwh0dkylZm7tLvrhaBSb7sIadHwT9wBOpGcXiAV3+MmhVwYdNQpUwtJElCb0VTQZa32D51EzLnRdK4W3i3pKyu8jN46PCZAoH/yluXYa31TSvPDKquXL09twH32xubz0O4s//1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709087986; c=relaxed/simple;
	bh=jujfUil9yPrfHsRlIsyOE8egkwkRiqJX/YlWqsj5gZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RtSP8c/8lute8RaodRDS+BHS12S4CY0LB6W723qlHOQq9uvvMgwSXrDkbHd6w2DRy7nnIHf7odb584TI+1PolV316HoaTmeYY/51ur/Fx5gLcuzoHwjFFvXOVQpOc5fz6epHXZeu1sBpIP5uQ4Oury+65rzc8z234UBbkhZ1cSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=D4rJYAEG; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 794FF2C0F9D;
	Wed, 28 Feb 2024 15:39:42 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1709087982;
	bh=MxaGsIyB6oxiFULkhUZ5NBDv23rj+nNw0nNv2DBJhH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D4rJYAEGqPFlRwv0RotLloLmZVV2aFsDDzoMOes6reSX7xksEtCM9nHTAkOPezkce
	 hCZ/VDYzYIKgG2BlGwL3J9bo36UhtbJAwm+G0C/Mh05j9RzSE2vwvhkKkismnIH6TU
	 rZSYUD2fMg7Tqhgy6bGn535Z01SKkjPhTRLNCDo3AOMOjAZipccCKL1kxk0n+NF0Rp
	 mUVr/RIXyUAJDwvuDcNlwo80gUM+nfexCw0ra2qp1VGEtP8gyCwO1IBd9POshDLvqg
	 Qf79TufqJP2AviV5zkvoVNqng90STSLIF0kNy2sTKPMMHTY1XW8WAQSzraJmjkX7Bd
	 wgqMCqL2K7SnA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65de9cee0000>; Wed, 28 Feb 2024 15:39:42 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.13])
	by pat.atlnz.lc (Postfix) with ESMTP id 55B6813EDA8;
	Wed, 28 Feb 2024 15:39:42 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
	id 5392A240BBF; Wed, 28 Feb 2024 15:39:42 +1300 (NZDT)
From: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To: mika.westerberg@linux.intel.com,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH 1/1] i2c: acpi: Unbind mux adapters before delete
Date: Wed, 28 Feb 2024 15:39:25 +1300
Message-ID: <20240228023925.2814638-2-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240228023925.2814638-1-hamish.martin@alliedtelesis.co.nz>
References: <20240228023925.2814638-1-hamish.martin@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65de9cee a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=k7vzHIieQBIA:10 a=1pkAkvjETa8gA7K0q2wA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Unbind any i2c_adapters matching an ACPI device being removed. This
ensures that the linkage between the ACPI device and the i2c_adapter is
correctly broken before the ACPI device is destroyed.

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---
 drivers/i2c/i2c-core-acpi.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index d6037a328669..67fa8deccef6 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -445,6 +445,11 @@ static struct i2c_client *i2c_acpi_find_client_by_ad=
ev(struct acpi_device *adev)
 	return i2c_find_device_by_fwnode(acpi_fwnode_handle(adev));
 }
=20
+static struct i2c_adapter *i2c_acpi_find_adapter_by_adev(struct acpi_dev=
ice *adev)
+{
+	return i2c_find_adapter_by_fwnode(acpi_fwnode_handle(adev));
+}
+
 static int i2c_acpi_notify(struct notifier_block *nb, unsigned long valu=
e,
 			   void *arg)
 {
@@ -471,11 +476,17 @@ static int i2c_acpi_notify(struct notifier_block *n=
b, unsigned long value,
 			break;
=20
 		client =3D i2c_acpi_find_client_by_adev(adev);
-		if (!client)
-			break;
+		if (client) {
+			i2c_unregister_device(client);
+			put_device(&client->dev);
+		}
+
+		adapter =3D i2c_acpi_find_adapter_by_adev(adev);
+		if (adapter) {
+			acpi_device_notify_remove(&adapter->dev);
+			put_device(&adapter->dev);
+		}
=20
-		i2c_unregister_device(client);
-		put_device(&client->dev);
 		break;
 	}
=20
--=20
2.43.0


