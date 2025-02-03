Return-Path: <linux-i2c+bounces-9260-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D7EA257DE
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 12:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 765293A8E1C
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 11:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7095D202F93;
	Mon,  3 Feb 2025 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="FeNgWydy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Jb3rjcO4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="dyY+cZif"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fallback23.i.mail.ru (fallback23.i.mail.ru [79.137.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B09202C3E;
	Mon,  3 Feb 2025 11:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738581315; cv=none; b=mcxL9P34lBrJcIEQP/KWkVtdPplktdG2y9sd+UVWfF7cS11GtGzdXXv42uqtFK//d2o896EuhomyUt6onLz4CwXjx4u4aPBU0IqGM2C5tZ34IHrQ98CwMmr9bgLcdoLGM6sbSppJkI7CWXv1QYkDDoL/RqBQh47VFTgMiRjvTNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738581315; c=relaxed/simple;
	bh=LoKsJEG9+LIsuojkILxBONDu8FcFvAIgVRsSK6JEePQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2LvkGlUuc0M5w/avvutr0KyDzTqW4zsELo50FQTJa8I8SNx9PjnPDil/QVtFlkTNX5S8Rwd1SiMYI4yz6lZLcYUyJPaR7BFsPi6/70XmO0hmOH+RFZwgeZ83+rMfSnLqm19UtTsgv4ZhP2WBanHGgTGEx7xhVTtS4gqU3Ybcn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=FeNgWydy; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=Jb3rjcO4; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=dyY+cZif; arc=none smtp.client-ip=79.137.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=R6AUT5DmULiUOTgDDf4rOieqWxA3bPZAG8HGBV8maJ0=;
	t=1738581313;x=1738671313; 
	b=FeNgWydyiKJkeYXdZS8eEYhrtZzzScEFrKch+7uJ+kuXdqHFVsK6TLv+dSnDjYsnlUvPDEcSRPqRO+pFl2lQ3ruWTKbNU0cNNyD9rWtiFnYcV5BuqxX/knb5jFnmrmB1QfEHgPQWWmwLJlpmuerGm1d9lOzS4om3xPkMamK4IJk=;
Received: from [10.113.199.71] (port=47492 helo=send55.i.mail.ru)
	by fallback23.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1teuPx-004lBc-8R; Mon, 03 Feb 2025 14:15:05 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=R6AUT5DmULiUOTgDDf4rOieqWxA3bPZAG8HGBV8maJ0=; t=1738581305; x=1738671305; 
	b=Jb3rjcO4ObH36FDD1E/qCMuuytw3Nhe+hZtNb/csGIi/osDruWOgPUYDiFvywHvRvvZjX2l9n5I
	VKdl3FW4aBO5ys6dIE6Kqip7xtTPuztUm6FMx/PHW1tOeOtuSp0LT0Y0miioTecIHJDraUpmpNuXO
	TVH9jBx7N21KTxIZSWY=;
Received: from [10.113.159.79] (port=48586 helo=send277.i.mail.ru)
	by exim-fallback-5fbdbdcb77-vspdv with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1teuPo-00000000ENG-0T6e; Mon, 03 Feb 2025 14:14:56 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=R6AUT5DmULiUOTgDDf4rOieqWxA3bPZAG8HGBV8maJ0=; t=1738581296; x=1738671296; 
	b=dyY+cZifHxlDybxGXvAVV+j4TbWag48fnw54p9+gfxvy7lAdUXClhdj+h5ir1p6ou6dfCKH+gQF
	YA7IwamI6Nm/D7WbNDqcPHdb1DhUgkrEtMhyXxeivbXa4DirMLiGf2LLw2pieWvs6JF16thiTCgvW
	RU3zl0xHdwJ6wZdkHHw=;
Received: by exim-smtp-6d97ff8cf4-hcpzs with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1teuPZ-00000000A0H-33GF; Mon, 03 Feb 2025 14:14:42 +0300
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
Subject: [PATCH 3/4] dt-bindings: eeprom: at24: Add compatible for Giantec GT24P128E
Date: Mon,  3 Feb 2025 14:14:28 +0300
Message-ID: <20250203111429.22062-4-danila@jiaxyga.com>
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
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9279F651DE5037A5080B62BE5EE696263B6D179FE0FDCC17E1313CFAB8367EF908E2BE116634AD74DA5B7AF724C7419C6C591814E25D11F9FD7287A6664F0E8427FBD03C4286D0A2435AA1534FA60CA86
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE763D33D3AF3325E31EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063748D05F5E01EE6C998638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D813E717E62EC20755EE9DB705B7A98D046F6C59B2A196D871CC7F00164DA146DAFE8445B8C89999728AA50765F7900637A6F6611B2784C7A4389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC82A336C6518635091F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CB5C78E0E843E24DA2D242C3BD2E3F4C64AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3CC06CF5CFB199D65BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7CD707F342D9BDC98731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5B68BD9866E00D91C5002B1117B3ED6963638FE6661D62CCAED71F038FC046993823CB91A9FED034534781492E4B8EEAD5B606B10FC07407CC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF87B5BE431542B8831EE4D6DA1358D33DF141AA76F40DA2BAB23A593BAE79B5FB2D55A8303E10F658D5D9813428A63F6C24799DB0154828DB37F80B1A62BB60B5F4229DBAABF251F4E4FDFA4A036B0C3902C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojODHyJtLJ2Qi0vc0TFBgyNA==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F3916920A183BFB2356704ABB56AC4A0FE648FCC96D7845A447F2D2A5A79AF8E32C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C1CB476F615DCA8D7C049FFFDB7839CE9E5FC588583EA33AA1358759EE64A96C92D07E42C1A60E8D0EE99FE56C3C39141A9B9B0C5A8C7E20F4
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqgmQqKELHYk5f1Wbpd8t+6
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4A84B4964F946E17EB1A91FC540E416C17F4F1A202AC583AF049FFFDB7839CE9E5FC588583EA33AA1D519D8DCAD74EA2A9955108491A19C2EFAB4CE3DD96392D0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSocPAboFA1B25uf5RTkiCWD
X-Mailru-MI: 20000000000000800
X-Mras: Ok

Add the compatible for another 128Kb EEPROM from Giantec.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index e7496ece8ae9..0ac68646c077 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -136,6 +136,7 @@ properties:
           - const: atmel,24c64
       - items:
           - enum:
+              - giantec,gt24p128e
               - giantec,gt24p128f
               - renesas,r1ex24128
               - samsung,s524ad0xd1
-- 
2.48.1


