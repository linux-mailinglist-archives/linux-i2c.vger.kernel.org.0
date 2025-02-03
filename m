Return-Path: <linux-i2c+bounces-9261-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD3A2584B
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 12:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 306A8166530
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 11:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C808202F97;
	Mon,  3 Feb 2025 11:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="GhyLvPdq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="vWqptYS8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="wmKO62n9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fallback18.i.mail.ru (fallback18.i.mail.ru [79.137.243.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775131D618C;
	Mon,  3 Feb 2025 11:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738582745; cv=none; b=KFgSgZLlovyyDeyHOqRUZWiraJnRU2zqWL+TvH5AjYayjFpw65FqH0VSQZJBxUp0jncpgUfxgRlhziZCqMBTIXOvSZ8ydbdZP1np6WhBGimO0FfYoOP/Sf6C4OgyUhTojGEs2Uxh2tmNOnRLfwFUh76AJtmROo5Nv07lKBYjm2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738582745; c=relaxed/simple;
	bh=cFIXdqCAzfqYTvVxJjPM/BClrqmVzRbkp7cmf1Xvi0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=po470Q417GoLBTLPIbnTE5pPq3vxLwedBw7t6PTERibiunlOiwhZvCvJ7TJ2KWk6liva0eR/Yz6A56vhUUkc3glq8L5ZDMjonLqOMnHnSDXl5JpCHgzBzIDHfYpufIiYPjfx6rr/IOGXxaNRJvTsSnUvNT3wUSMd3EshoSRAmsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=GhyLvPdq; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=vWqptYS8; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=wmKO62n9; arc=none smtp.client-ip=79.137.243.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=2TPkGOHH2dCmSc1u8xbyPFHf6VgozFSLf+PWHrqWYjg=;
	t=1738582742;x=1738672742; 
	b=GhyLvPdq1vV84kivqWwbBpD/5YIXaXvTyzVIPnZzQ3i8TqdoYMdxDdmHWYZVLGr6jufJDJ1Ivq32HvkldtPpBG1r54s/dR11/dQkyo038WY00ubfpoIAECH6Niuj0HwSAgUjeiW4yilOV732oSVlBfX7olSsqKn5lxzm9sfstmM=;
Received: from [10.113.18.238] (port=56844 helo=send146.i.mail.ru)
	by fallback18.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1teuPy-00FgrV-DD; Mon, 03 Feb 2025 14:15:06 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=2TPkGOHH2dCmSc1u8xbyPFHf6VgozFSLf+PWHrqWYjg=; t=1738581306; x=1738671306; 
	b=vWqptYS8eo+GbCQQETxuOGrwi5iXNwvdDaP9I6K7n950+L0J0QUcq2n3+PXMpNSEbfVmIeU551a
	u2YNk90GesidU6kxyBxmjAWyWlGjDtroUvkPz3QNeBsASzFsSVPbsEicnIUk3sGVkCKL5YPMs+MKP
	6NA1DuStgXEt/ig6nbc=;
Received: from [10.113.55.27] (port=35452 helo=send219.i.mail.ru)
	by exim-fallback-5fbdbdcb77-q5bpz with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1teuPp-00000000Nzd-2Mxj; Mon, 03 Feb 2025 14:14:57 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=2TPkGOHH2dCmSc1u8xbyPFHf6VgozFSLf+PWHrqWYjg=; t=1738581297; x=1738671297; 
	b=wmKO62n9lCFJaLEvHIecsdCj2Mw1XZgsS6Cm3w+AGu7iAXOpGuoUzfvSNP4XVmihRoycUCninCB
	FDBLqifyi2k+CSIstyZDRtO/4NbMW8Jp2txLgQdQwNo7f4vKp0Gpog/OH9PTkLOb9/p+vOCmAhBf1
	s4wZbMPfaSBo9lYDFzE=;
Received: by exim-smtp-6d97ff8cf4-hcpzs with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1teuPb-00000000A0H-1qVO; Mon, 03 Feb 2025 14:14:43 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Enable camera EEPROMs
Date: Mon,  3 Feb 2025 14:14:29 +0300
Message-ID: <20250203111429.22062-5-danila@jiaxyga.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203111429.22062-1-danila@jiaxyga.com>
References: <20250203111429.22062-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD985D89FF3B425BBEF98DB62D66459834914625F44760CB589CD62213F67905E7A4E7CCAA464028312BC5D9AA61015533C167BD26470AC1E4020DE98A5765A13B408D917D6130B1AFB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7ECD3FEFFF0C7120DC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE79145AB6E9E75F07EEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BC08E230531AC9C901D70DF93126762B2E0EEAC1B7B6212993C62E9A0E66B5D81A471835C12D1D9774AD6D5ED66289B5278DA827A17800CE77A825AB47F0FC8649FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3A12191B5F2BB8629117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF41A8C64E0A55F0E6BA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B60F250D17497FEF6176E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C5B09DCDDD98ABCD243847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5DBA90CD3E1C6DDB85002B1117B3ED6965D43C33756616C13E20DC3F561CE4150823CB91A9FED034534781492E4B8EEAD6804EF05EF4ADF2AF36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D548E8926FB43031F38
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF08EAF55EF79058FEFF0A684EF56C4CCCFC015EC7AA1B2F14868CE7E40FA2AC4B1F5011C79ABBA8E7D5D9813428A63F6C9F17F948BDBF95F937F80B1A62BB60B5B925FFA6CC0C2810E4FDFA4A036B0C3902C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojODHyJtLJ2QjsBkNTHL+FSg==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F3916920A183BFB2397B151A33FA7A9F8E00BC8B0849E6E4A04468141FFBBCC512C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C11582D74B19986F8F049FFFDB7839CE9E5FC588583EA33AA1DEE3642A5B070E3E72F84B0BBC8E02CBFCB3B9E13CE27911827441742EF3F779
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqgmQqKELHYk5zUdJfQ/bjz
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C1BDB3A1FA17F234B6049FFFDB7839CE9E5FC588583EA33AA13031D95DB377D0B753E0704197304C2D04D75D4748136814
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSocPAboFA1B25f1Wbpd8t+6
X-Mailru-MI: 20000000000000800
X-Mras: Ok

Configure the EEPROMs which are found on the different camera sensors on
this device.

The pull-up regulator for these I2C busses is vreg_cam_vio_1p8, the same
supply that powers VCC of all the EEPROMs.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 32 +++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index 4f964e5d34da..0c89f7726865 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -843,7 +843,15 @@ &cci0 {
 };
 
 &cci0_i2c0 {
-	/* sony,imx471 (Front) */
+	/* D-PHY sony,imx471 (Front) @ 0x1a */
+
+	camf_p24c64f: eeprom@52 {
+		compatible = "puya,p24c64f",
+			     "atmel,24c64";
+		reg = <0x52>;
+		vcc-supply = <&vreg_cam_vio_1p8>;
+		read-only;
+	};
 };
 
 &cci1 {
@@ -851,11 +859,29 @@ &cci1 {
 };
 
 &cci1_i2c0 {
-	/* samsung,s5kjn1 (Rear-aux UW) */
+	/* actuator (For Ultra Wide sensor) @ 0xc */
+	/* D-PHY samsung,s5kjn1 (Ultra Wide) @ 0x2d */
+
+	camu_gt24p128e: eeprom@51 {
+		compatible = "giantec,gt24p128e",
+			     "atmel,24c128";
+		reg = <0x51>;
+		vcc-supply = <&vreg_cam_vio_1p8>;
+		read-only;
+	};
 };
 
 &cci1_i2c1 {
-	/* sony,imx766 (Rear Wide) */
+	/* actuator (For Wide sensor) @ 0xc */
+	/* C-PHY sony,imx766 (Wide) @ 0x10 */
+
+	camw_gt24p128e: eeprom@50 {
+		compatible = "giantec,gt24p128e",
+			     "atmel,24c128";
+		reg = <0x50>;
+		vcc-supply = <&vreg_cam_vio_1p8>;
+		read-only;
+	};
 };
 
 &gcc {
-- 
2.48.1


