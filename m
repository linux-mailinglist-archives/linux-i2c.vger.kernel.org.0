Return-Path: <linux-i2c+bounces-14299-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD77C8CB8D
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 04:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E2F484E31D5
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 03:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6026129D295;
	Thu, 27 Nov 2025 03:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jju3r+ZQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0707324678F
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 03:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764212966; cv=none; b=tC06UTb+kQsI1bEmhcVY7TsYPgXmNztfEFHurPOp28q4ZR1pcRfs+OxmdAI+MMmah8YgId349WPaUJNRd5cs6WiIluWhcU4RXbdINtHeqhrSGsSdpBT66mgoVrwFt//KxAuUmm+j+GrB+9RXlvuaCen2/UGMk0doXpYTQXXLy/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764212966; c=relaxed/simple;
	bh=edAEa9cC0uIFldUnLr+ZobKWOAeLPaKCL2YFr2KoA5k=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=KcT9+5Bpaf4BzuWZ34STzSg0R6btUJN4L5tzDjn58ETk6/fN/mXJBjNEU5oHA31k6djifon9qud5ZEkG/QmBuzhlMwk3X29Is3OX9K1wZTmIXxGdkyRJewoD5/ZyOtAzKDY/U8eaWIjBjXrOKjvYyunlTC2wzwX0seSjkkm0qaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minsoft.com; spf=none smtp.mailfrom=minsoft.com; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jju3r+ZQ; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minsoft.com
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id EF632EC0201
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 22:09:22 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Wed, 26 Nov 2025 22:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1764212962; x=1764299362; bh=8XZg/AcngL7z9ti5+UbxhGNQOzVK92u97KF
	oSQJBOjc=; b=Jju3r+ZQtP+JptgQac08xXPWhAJVZTuRhZaxzXc+stq0iqnOneE
	omjxLpO17baugbp0dPY8qJsxrp9Jq9QIusrW2WktmKznZ3DHKU/U97CfoKRKoZuo
	UYFhFzLiy2ZzDjjPx1qJ6t/XqjGGIZlb5isvkJLcxeJnBF8xba7vq5DSUvbOdk04
	957pIj6vZDE8pbJ1RyJxfPpaA/r4Bq11Aw/9o3vuwGbbfOkEeNiD/Al7kMYUCOQG
	P7s+/ZQw1U4fLLz1eXH5Jd3PHmw2RFi4QxvjtPMjhK6GTAkn6tzeGkPerM1IgeVS
	b6qLn9Jbi9uPI6jyc0WVnyX/tiL7rQ+R18Q==
X-ME-Sender: <xms:4sAnaTmMdQ5VF57ELjXLmno9_Jzu5XcG13VWrBWRD73b0BCrFc4oVA>
    <xme:4sAnadz-Mx0N36ZJ9agF_bvmOoY4Gu63UXKz9m42NQZK7tBZppmiDLsAZNiL-T-KT
    7z2pjL-p5iP_UBTm4CY4-6Qw1KxANxzsAXmEpjhy1YigNv0q-PYeAkD>
X-ME-Received: <xmr:4sAnafSWD10qzl95PA1u1K4mr1TGqeuX2VGzt__xr8dTMQFVvrsZhGu8KKiKfIQ->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeeiudduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfvhffutgfgsehtkeertddtvd
    ejnecuhfhrohhmpefurghnfhhorhguucftohgtkhhofihithiiuceorhhotghkohifihht
    iiesmhhinhhsohhfthdrtghomheqnecuggftrfgrthhtvghrnhepvefggefhveeltdekff
    eiuefhjedvkefgkeegudelgeefffekgfekffdtheffvdehnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhotghkohifihhtiiesmhhinhhsoh
    hfthdrtghomhdpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:4sAnaQv_p8o6xeCTjzUrJ3eR5nIgNCWPETCsw3e9x0h2ijxSyJ3Qlw>
    <xmx:4sAnaRtv9IErfYS3z2_AC2MjPe2jQBYQwZbYFpQWO6vgNwTgi2cVug>
    <xmx:4sAnaWx9dImchVkAzKAOgFvreVRgZVhFfmYdiOX7OswSpBX72WA5Zw>
    <xmx:4sAnaXh414VUJAt6Kde7HyxrFfXXoZYUD7-kAPWMxIoajn69swj6ww>
    <xmx:4sAnaRm-QKWDWjwk3SOYmkk91ouARlcSvgYhjNU65ywOFXfKkO7__tNn>
Feedback-ID: i954946e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 22:09:22 -0500 (EST)
Message-ID: <fcf287d4-fb67-4333-9eb1-64d28e6d3d9f@minsoft.com>
Date: Wed, 26 Nov 2025 22:09:22 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-i2c@vger.kernel.org
From: Sanford Rockowitz <rockowitz@minsoft.com>
Subject: bus speed patches
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Recently there was a set of patches to set bus speed for a different 
devices on a I2C bus, in the context of multiplexers/switches.  I'm the 
developer of ddcutil, and this caught my attention. There are displays 
with problematic DDC communication that operate correctly when the bus 
runs slower than normal, e.g. at 50 kbit. There was once some "proof of 
concept" code for IIRC i915 that slowed the speed for DDC communication, 
and experiments with a hacked video driver have shown this indeed can 
resolve the DDC communication failures.

Which leads to the question of whether the recent bus speed patches 
could be the basis for setting a slower than standard I2C bus speed, and 
this capability surfaced to user space, perhaps using module i2c-dev?  
Is this possible, or am I way off base?

