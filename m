Return-Path: <linux-i2c+bounces-9263-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2A8A258A4
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 12:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 933AE1887DAE
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 11:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAA220371E;
	Mon,  3 Feb 2025 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="sQbtKdep";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="acLk+Y5J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="O6KBE2Qj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fallback19.i.mail.ru (fallback19.i.mail.ru [79.137.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D96E2036F0;
	Mon,  3 Feb 2025 11:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583708; cv=none; b=eQvVsN6Gl+AghQXKd64LMedBkMNwwwNrMfwoSWASYS74s07Jw39fkRa0tNXJEdssbTjkkNyz6CKm/R8S1hR9HUpeebk4bYDTGV3/l8RcTQMNZ3rM/22s8uuiUG4fvu8Wwvm6I8Wmlcs/YcZPiRhyPOUn0zIUZ70uEDXaH2+PzbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583708; c=relaxed/simple;
	bh=08M3p9oGMzidDgKck+CoH1GdYkANxKqXHb1MUIHtTwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eNlC2cw77Ld4uwKc/t45xxcVZKlVPQF6hTR+CrpbJAnHcES6ugrO1/2JLCEF0W84ioQtDLZZ3YjvQCwFOVau90WgJFoQjCqp9ifpj3r+rKw2IlvNFCP2BNKVzXkq+UG3BeaksFauqi5eb9aMe9yxM2qbNjCk/P58BeNh10ALmEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=sQbtKdep; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=acLk+Y5J; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=O6KBE2Qj; arc=none smtp.client-ip=79.137.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=RvJ+Uu+o3CLYL49CuJSBzX+iZF2ycLEFbwANuuq0X4c=;
	t=1738583704;x=1738673704; 
	b=sQbtKdep1gnFRKc712yaxASwKZU8HO7MOvloKY58mEIOHQuDIsrCiaAZtwy7JqqxYPVfYvf7ujo3AjPOjYLR2vxlk9fWknkdO+a8SlX7Ot9iSjsZYjawQfWxFZSYbV4XmxQU92ZuKQVVbNXSFGoISiyUugag49FbgZNrvY5d9Ic=;
Received: from [10.113.249.120] (port=36674 helo=send147.i.mail.ru)
	by fallback19.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1teuPt-008esJ-Ii; Mon, 03 Feb 2025 14:15:01 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=RvJ+Uu+o3CLYL49CuJSBzX+iZF2ycLEFbwANuuq0X4c=; t=1738581301; x=1738671301; 
	b=acLk+Y5JVuE9Y6K+oGzvesYgjQz8tePI9gKPNkmisc45msVWdJ73effPc54wySCNZ0vQQYtmYTB
	h6mo390MbPZkzJ69mInG6r4JfdZVPLYqnPcWtpSvyhUrGdcxVgDnH7BwVxwcfbjKrjfw/lYRuKvME
	4AKGLRIx7TBGG/9IFtA=;
Received: from [10.113.228.105] (port=33732 helo=send126.i.mail.ru)
	by exim-fallback-5fbdbdcb77-8zhhh with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1teuPk-00000000IpY-2SYj; Mon, 03 Feb 2025 14:14:52 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=RvJ+Uu+o3CLYL49CuJSBzX+iZF2ycLEFbwANuuq0X4c=; t=1738581292; x=1738671292; 
	b=O6KBE2QjQcojRftB/yQ72SdQY9zAPqanV8PyCUteGsgb0rSF64+D2/OLy/MCQodb7MaR3daXTKY
	ifwXzIWJCq5xLhKEhmqszzKEv1L3MbADZHoOiNT8r9Zl2l+i1Yb/qawiQv8QfNtWo3TqoHSvya5k/
	iU3NWQ9Sw+mC9hvb7xk=;
Received: by exim-smtp-6d97ff8cf4-hcpzs with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1teuPT-00000000A0H-1tNK; Mon, 03 Feb 2025 14:14:36 +0300
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
Subject: [PATCH 0/4] sm7325-nothing-spacewar: Preparing for the cameras
Date: Mon,  3 Feb 2025 14:14:25 +0300
Message-ID: <20250203111429.22062-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD985D89FF3B425BBEF64F830AAED58760BC4D045B50C24E742CD62213F67905E7A2AC4D49D072AC54EBC5D9AA61015533C2A6F8CC78338C5D54B7100E68FD373F2C5C7FD16981B76AE
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74D62681FFDF80F84EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379BF04B24BEB7B2D58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D805C50B9BDACD356DEE9DB705B7A98D04FBA8683A809B405DCC7F00164DA146DAFE8445B8C89999728AA50765F7900637E603D20A273AEC4F389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC80CABCCA60F52D7EBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C2D01283D1ACF37BABA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B6B0E9FD5D4288160E3AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735F3CCD8A865B74A75C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5DF821E4F645B6DB85002B1117B3ED69691FF9B2459FBC3D1AD0703CEB2EF9A27823CB91A9FED034534781492E4B8EEADEF0AF71940E62277C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFFFB4007EAC77398A43614324D7071F2D82408137FF06C7368DAE059F5ED1109014625291CC5E48B9D5D9813428A63F6CDCF5566733BBEC8E37F80B1A62BB60B559968CC7693375D1E4FDFA4A036B0C3902C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXgS6CEGaw2xI90KW7iM6K0A
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F3916920A183BFB234756507F36A35F4B1DCB45136720F479B4B1E5B0E63599662C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C1CB476F615DCA8D7C049FFFDB7839CE9E5FC588583EA33AA18E9E85C91E8EEDEF3E541CD7046B48C47CD676F1951F6640EFADE2AA2806D7A2
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqgmQqKELHYkwyxHfUpwjuv
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C17F4F1A202AC583AF049FFFDB7839CE9E5FC588583EA33AA12513C89A6A2555DE41AFFA8E49FEFF59D5E304D1DC8154CC
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSocPAboFA1B23vnsmttD4RG
X-Mailru-MI: 20000000000000800
X-Mras: Ok

Nothing Phone (1) - sm7325-nothing-spacewar has three camera sensors:
- Wide sony,imx766
- Ultra wide samsung,s5kjn1
- Front sony,imx471
We tested the UW and Front cameras by hacking the IMX412 in our fork and
they work as expected. Wide is a C-PHY sensor, so unfortunately we haven't
tested it fully yet.

However, some of our work can already be upstreamed, so that's what we're
doing in this series.

To: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux@mainlining.org
Cc: ~postmarketos/upstreaming@lists.sr.ht
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Danila Tikhonov (4):
  arm64: dts: qcom: sm7325-nothing-spacewar: Add CAM fixed-regulators
  dt-bindings: eeprom: at24: Add compatible for Puya P24C64F
  dt-bindings: eeprom: at24: Add compatible for Giantec GT24P128E
  arm64: dts: qcom: sm7325-nothing-spacewar: Enable camera EEPROMs

 .../devicetree/bindings/eeprom/at24.yaml      |   5 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 157 +++++++++++++++++-
 2 files changed, 158 insertions(+), 4 deletions(-)

-- 
2.48.1


