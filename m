Return-Path: <linux-i2c+bounces-14893-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B49CF0916
	for <lists+linux-i2c@lfdr.de>; Sun, 04 Jan 2026 04:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 118F0300AFC5
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Jan 2026 03:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF632BE02B;
	Sun,  4 Jan 2026 03:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b="Bbp5cHPE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net [129.150.39.64])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAB4126F0A;
	Sun,  4 Jan 2026 03:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.150.39.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767495925; cv=none; b=jgbKs2TB/zYIK5oMRmSchGD6o0eQKwfDCNVedSasrQ+5Ny1pVxKtcsHOzmgqC9Vps3+TFYrvKShyv6nh3/bqKM8JZEm1+dPL1aeMFK7vFc2//Iz7dRb1jo9R1KZeDtPp5bFhXKeG9owU0eSvWJPG21dFdDSWsard4e8O7BBbDfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767495925; c=relaxed/simple;
	bh=JJDF+zHh+ooUD3jEo1UqXXYZnRiVa1q6G29Nq7d35Dk=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=liYxLMxayvB8R8H+tbu6XQwZQ4A0cam+u9PzmrrL8T7cBfEKT7RaY2YGeqtPFKYFCVylYlLgcyyRjF2Gqq1prsPpHpLXcH3OnNUeB3FY+yR8U4j4Dj97/p8KVrX/3RUq221Yie87BYsVwsOBbuzyRbDbyPHHTGphWKyzUP2O7dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn; spf=pass smtp.mailfrom=stu.xidian.edu.cn; dkim=fail (0-bit key) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b=Bbp5cHPE reason="key not found in DNS"; arc=none smtp.client-ip=129.150.39.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID;
	bh=e+OI0CfBEe3uCLwHmwN94RJTfLw3OWSjwvKhlrLHzOo=; b=Bbp5cHPE6xCvJ
	SG31WifVGbkBniVcxxGD/m1+8ZL1xDLu1Xjs5IO0EgdLgKDJhGkEVf7wBEh5/ftM
	0W/OfueHHzfT7Kh/oIQE2uU+yUoLe1L7ghSLHy9ssLy45nOC7W6dnWxvvT3ScY9U
	FJ3Br1d8BBYd3at1NIt3/iiY7yPvBA=
Received: from wangzhi_xd$stu.xidian.edu.cn ( [113.200.174.102] ) by
 ajax-webmail-hzbj-edu-front-4.icoremail.net (Coremail) ; Sun, 4 Jan 2026
 11:05:13 +0800 (GMT+08:00)
Date: Sun, 4 Jan 2026 11:05:13 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?546L5b+X?= <wangzhi_xd@stu.xidian.edu.cn>
To: linux-i2c@vger.kernel.org
Cc: "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
	linux-media@vger.kernel.org,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Hans Verkuil" <hverkuil@kernel.org>, syzkaller@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [BUG] I2C: hung task in i2c_transfer via i2c-dev ioctl (bit-banging
 adapter)
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.3-cmXT6 build
 20250410(2f5ccd7f) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-8dfce572-2f24-404d-b59d-0dd2e304114c-icoremail.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <3e4f9b37.9264.19b86f74f9e.Coremail.wangzhi_xd@stu.xidian.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:BrQMCkBWudzp2FlpvsrqAA--.13346W
X-CM-SenderInfo: qstqimqsqqliuu6v33wo0lvxldqovvfxof0/1tbiAgUDCGlZJs0y1
	QAAsw
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

SGVsbG8gSTJDIG1haW50YWluZXJzLAoKSSBhbSByZXBvcnRpbmcgYSBodW5nIHRhc2sgaXNzdWUg
Zm91bmQgYnkgc3l6a2FsbGVyIG9uIExpbnV4IHY2LjE4LgoKVGhlIGlzc3VlIG1hbmlmZXN0cyBh
cyB0YXNrcyBibG9ja2VkIGZvciBtb3JlIHRoYW4gMTQwIHNlY29uZHMgaW4gaTJjX3RyYW5zZmVy
KCksIHRyaWdnZXJlZCB2aWEgL2Rldi9pMmMtKiBpb2N0bCBmcm9tIHN5emthbGxlci4gTXVsdGlw
bGUgc3l6LWV4ZWN1dG9yIHRocmVhZHMgYmVjb21lIHN0dWNrIGluIEQgc3RhdGUsIGhvbGRpbmcg
dGhlIGkyYyBidXMgbG9jay4KCktlcm5lbDoKTGludXggNi4xOC4wIChiYXNlZCBvbiB2Ni4xOCkK
Tm90IHRhaW50ZWQKQ09ORklHX1BSRUVNUFQ9eQpUZXN0ZWQgdW5kZXIgUUVNVSAoaTQ0MEZYKQoK
T2JzZXJ2ZWQgYmVoYXZpb3I6CgoqIEh1bmcgdGFzayB3YXJuaW5ncyBmcm9tIGtodW5ndGFza2QK
KiBUYXNrcyBibG9ja2VkIGluIGkyY190cmFuc2ZlcigpIHdhaXRpbmcgb24gcnRfbXV0ZXgKKiBp
MmMgY29udHJvbGxlciByZXBvcnRzICJVbnN1cHBvcnRlZCB0cmFuc2FjdGlvbiIKKiBUaGUgc3Rh
bGwgaW52b2x2ZXMgdGhlIGJpdC1iYW5naW5nIEkyQyBhbGdvcml0aG0gYW5kIGN4ODggaTJjIGRy
aXZlcgoKRXhhbXBsZSBodW5nIHRhc2sgYmFja3RyYWNlOgoKSU5GTzogdGFzayBzeXouMy4zNTcg
YmxvY2tlZCBmb3IgbW9yZSB0aGFuIDE0MyBzZWNvbmRzLgpDYWxsIFRyYWNlOgpydF9tdXRleF9z
bG93bG9ja19ibG9jawpydF9tdXRleF9sb2NrX25lc3RlZAppMmNfbG9ja19idXMKaTJjX3RyYW5z
ZmVyCmkyY2Rldl9pb2N0bF9yZHdyCmkyY2Rldl9pb2N0bApfX3g2NF9zeXNfaW9jdGwKCkFub3Ro
ZXIgQ1BVIGlzIHNwaW5uaW5nIGluc2lkZSB0aGUgSTJDIGJpdC1iYW5naW5nIGFsZ29yaXRobToK
CmBgYApjeDg4MDBfYml0X2dldHNjbApzY2xoaQppMmNfc3RvcApiaXRfeGZlcgpfX2kyY190cmFu
c2ZlcgpgYGAKClRoaXMgc3VnZ2VzdHMgYSBwb3NzaWJsZSBkZWFkbG9jayBvciB1bmJvdW5kZWQg
d2FpdCBpbiB0aGUgYml0LWJhbmdpbmcgSTJDIHRyYW5zZmVyIHBhdGggd2hlbiBoYW5kbGluZyB1
bnN1cHBvcnRlZCBvciBtYWxmb3JtZWQgdHJhbnNhY3Rpb25zIGZyb20gdXNlciBzcGFjZS4KCkkg
aGF2ZSBhIGZ1bGwga2VybmVsIGxvZyBhdmFpbGFibGUgYW5kIGNhbiBwcm92aWRlIHRoZW0gaWYg
bmVlZGVkLgoKUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSB3b3VsZCBsaWtlIG1lIHRvIHRlc3Qg
YSBwYXRjaCBvciBwcm92aWRlIGFkZGl0aW9uYWwgZGVidWdnaW5nIGluZm9ybWF0aW9uLgoKVGhh
bmsgeW91IGZvciB5b3VyIHRpbWUuCgpCZXN0IHJlZ2FyZHMsIApaaGkgV2FuZwo=

