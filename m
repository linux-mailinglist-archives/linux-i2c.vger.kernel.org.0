Return-Path: <linux-i2c+bounces-9262-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0EAA2586A
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 12:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61BE118848E9
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 11:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCDA203719;
	Mon,  3 Feb 2025 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="VeFvPa/J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="HtjqxV9q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="N7C3Ud/9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937342036F6;
	Mon,  3 Feb 2025 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583063; cv=none; b=L38fSSTrfZYw5Lgn7LPAU8Jgps7OClh+snSeOGbPhi90uDy5lI2WNn5NtIEq7RB+dBqn7F/2NrZ7K84Tcu6wW3z6NBXj19zK0IGiLaRM9wfTYrdYlu2AKRmrVMLPOzYHRQnh/4Whqywtxfi0ZlT+CaJTBL1D3n6SjL+9giLTRtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583063; c=relaxed/simple;
	bh=lRmmcSwQSLlWjTBhSGXKNd4O+5nRrJChEzvEfWDtUYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9+jjVrXFRhEwc5fpHgth1W3y/5/cU2INzromnK4ngg3aa85bZDMgfNBD5vftSwDRNoqClmsgVN8DiZM8V5aqfRS+toeyPtI5fBKjbGppz9sOFCracEkNJgVyNmxgA3xrscgDxZrAhaFPBi/cF/4Q8FsOtMJgUvNhhueXmc6V/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=VeFvPa/J; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=HtjqxV9q; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=N7C3Ud/9; arc=none smtp.client-ip=79.137.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=EnxPxT5vtDruZ/NPrlKxrC9OxvknZLrngn0EhS4XUms=;
	t=1738583061;x=1738673061; 
	b=VeFvPa/JtxQS2i8sHzyk+LD0rBjC+mlKzikqhvapSpKEhoCXYQULvqDLZl/Onmo9a7rkjGagWGKB6ikkdmwJjnqbvtwtX+jSMyZTHb5vN7OzF6Kl7wgRHjKFsea316JOd4rQrFi1Iv4ft39YR/Ak/Cr5m2+7zRpVRw/ysyjQoGU=;
Received: from [10.113.90.174] (port=42962 helo=send239.i.mail.ru)
	by fallback24.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1teuPz-004z85-4c; Mon, 03 Feb 2025 14:15:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=EnxPxT5vtDruZ/NPrlKxrC9OxvknZLrngn0EhS4XUms=; t=1738581307; x=1738671307; 
	b=HtjqxV9qrZd+Mnee6tkAIc/yRt0R6HExWTx+GPyLWq4F/X6ojy1+hpML69BrfvZKpCPPWgml8QW
	TKVWpNkR407ZVG4JfaItF3ygIz4A/OVuQvaln6gbnabH9E0xS6yoqqQLaq/fIicLFdII2dUO8xYGk
	0xCUbcbgCyKxaRGHRjg=;
Received: from [10.113.228.228] (port=37220 helo=send149.i.mail.ru)
	by exim-fallback-5fbdbdcb77-zt58w with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1teuPm-00000000MOX-3YHQ; Mon, 03 Feb 2025 14:14:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=EnxPxT5vtDruZ/NPrlKxrC9OxvknZLrngn0EhS4XUms=; t=1738581294; x=1738671294; 
	b=N7C3Ud/9rcTZ4Nz1LETpNVpBkInEakdJ+72wVT3Bdftu+vNUnyuVP8mpJQ8SlI5ngkeFeIzRfEK
	//iQKn24gnP+xOBoDzLPgDF+EjJWSbtGzZb33yBlA2KOE2UHgIhTzI72CaXsMpXp3xapw/02ejbL0
	N29SSCQddTZE047stS4=;
Received: by exim-smtp-6d97ff8cf4-hcpzs with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1teuPY-00000000A0H-0FXI; Mon, 03 Feb 2025 14:14:40 +0300
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
Subject: [PATCH 2/4] dt-bindings: eeprom: at24: Add compatible for Puya P24C64F
Date: Mon,  3 Feb 2025 14:14:27 +0300
Message-ID: <20250203111429.22062-3-danila@jiaxyga.com>
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
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD985D89FF3B425BBEF60198EBAA7A2E64509B496FF1DBC87B0CD62213F67905E7A3BDC368C6A300B83BC5D9AA61015533C001A85456285550520DE98A5765A13B4DDDE7B70B5F5C79F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7EC0B1A4921CAE631EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371895637A5F0B45FF8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D865E1688E63056053EE9DB705B7A98D04615A749510838473CC7F00164DA146DAFE8445B8C89999728AA50765F7900637CA37C9946A8B9E41389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8CE135D2742255B35F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CB5C78E0E843E24DA2D242C3BD2E3F4C64AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3CC06CF5CFB199D65BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7CD707F342D9BDC98731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A51222D4D9B4DC879E5002B1117B3ED6964C3022313EAB1D66A13BD6A4B0E00B96823CB91A9FED034534781492E4B8EEAD3C056C6FCE5AFF8EC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF9541AB894E9710C914F4E6E73EC71EFBA5348D6463FA7942A41F01F1CBC1758AA5CD7B9A90500322D5D9813428A63F6C850F444C7084155537F80B1A62BB60B5ECEC49429DEBAC77E4FDFA4A036B0C3902C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojODHyJtLJ2QhlY9whZWMOPA==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F3916920A183BFB23ED188C5D0CCD93D443F3301FB1F67CDE2C7F7CBDA59D0CF92C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C1BDB3A1FA17F234B6049FFFDB7839CE9E5FC588583EA33AA19D429A2CD6813808334F49636038C00711D85D0413F53AEB9EE9ED8B18403888
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqgmQqKELHYk7RFuIOw5Q1i
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C12D8BAB617684C85D049FFFDB7839CE9E5FC588583EA33AA1FEDDEFFF60698890A9701EDC308499845A8D9CC8EE20FB4A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSocPAboFA1B25zUdJfQ/bjz
X-Mailru-MI: 20000000000000800
X-Mras: Ok

Add the compatible for another 64Kb EEPROM from Puya.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index c9e4afbdc448..e7496ece8ae9 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -130,7 +130,9 @@ properties:
           - const: giantec,gt24c32a
           - const: atmel,24c32
       - items:
-          - const: onnn,n24s64b
+          - enum:
+              - onnn,n24s64b
+              - puya,p24c64f
           - const: atmel,24c64
       - items:
           - enum:
-- 
2.48.1


