Return-Path: <linux-i2c+bounces-4451-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BA691B9DB
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 10:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D502B1F23DD1
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 08:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC19214B956;
	Fri, 28 Jun 2024 08:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="oBJVXWre";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cxoXI44s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7015714B963;
	Fri, 28 Jun 2024 08:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563395; cv=none; b=aIpBtGXyEiq/klJ4m3fEZfiqv+Qex8hb4lH5CnmTrFif3DvAFT93Jn0Ho1kYBFzs2JTJ24klUfR6GjfsVcdGEho/ttFE38dfpWEcuAeuu8iDXdJ1sYMM5ndZNXaot4R2XjJXog5ydIqpUOK6BGZW8FjV/0osvitYnH9s79iy3VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563395; c=relaxed/simple;
	bh=9AlkujpUaqioIkPIKYNIMqNrRhWv1b2kJNsrZj1gg44=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=IncJHGdbg//58qE/u7jJEzLpSrssNUnxZjWx40/p1qEfFEscR0ouJ4tdz7Ms+lRa/gXT+leUprGEEwzV5U5hWu7MTCv8hYgLtG2Y+mkEcuv779m+TyrVLpdznzKh01+ggpi+vphsvuLdZAR8vbXWlLfI4EvujQYurO/JodiARkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=oBJVXWre; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cxoXI44s; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6F9461380665;
	Fri, 28 Jun 2024 04:29:52 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 28 Jun 2024 04:29:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1719563392; x=1719649792; bh=cJIDXDBEao
	bog5LZrJWoNd7/OqP4XjwMn7T6pbh9or0=; b=oBJVXWremJeesyBI3c9MlLkDPf
	3GfLEEmo3atJaxjNyeBLEDY9EDmSBqeVGzZDjkr8tKW0NbbssGC5W7jw49bVn2CF
	YBTw84zi6M2dGWoLGcCvrtpUOmAotKXoLVYa7Yjt22Ty44JVx+D5/zjvbmWYT3Nx
	M0nOWXnycbNx/taf8WqJjiUcmg6pU4+oX9Hqm08ZVW6Hcm0ONwG5jEAt6+YiImgZ
	hPU0kzLGhKhAoVE3G7TV8hvl9IKmfzdHimq0AG2L7P8rjf5bovtaJQ0PdkvQBK7Z
	KRP7W0omUsJ41DZ/om5hBkipE9iBSnIBI4ZxmGkma0oozyPX+zkpTbeiwcTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719563392; x=1719649792; bh=cJIDXDBEaobog5LZrJWoNd7/OqP4
	XjwMn7T6pbh9or0=; b=cxoXI44sel16xBKA7ia0okWbqxUJ1dbJCfbu6e5nKZQ7
	YyIz3+ruBZi1Sk4odE/aULrFcj/K+sQ68KkkUNgd6LPyWzew76MOwcFcK38a0aS/
	8SQGaIgjNTl9yFlQjF3zKEaZsrwX5Aml1fchzNKSEBDulx2PcyDeLbbymqZjkUua
	gG1ziB05TGAflHXzHETarXxWjzCQ2fsf5sQ2wy8NBwAQ2QEqNADC1qUqbGuFiZE/
	MYSGlQ+CHU8Xg9wA/sjsh4bcGU/2oOXqegucH5PqBMWHTEtbYziAtzGeIE1zTchm
	aJeC/kODIccAfMxkbcWRbemQg1MSSh3YrpgPoQCcYQ==
X-ME-Sender: <xms:gHR-ZtuZcRAdG9M9eKG_KWZ7rnAwCy_oJ-lwoNuT8x0hOFN1o_sQ0g>
    <xme:gHR-ZmdgcxiJDBsC7p0NNj4GJa6I1oIzs_czPgHveyh_GkPFw4nEbe6nAQO-4agio
    5I25-mLKVpZ6_j4sr4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdeigddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:gHR-ZgzuEDqMrKg11-t6kryEOx7085FgcydWwNYi0kNGZXYgRuTUeA>
    <xmx:gHR-ZkOPBw8Gfa-X2Ny7yZfuhCjWYsxOBUz7jMv90E8dJvaO6JNflA>
    <xmx:gHR-Zt_19ZhPy-4IUU92kpUvYbD_uRxl0Txq3dsNnnJd9HA3AQqeGQ>
    <xmx:gHR-ZkWmGqjDaaf23DaLK5DiK2LtW5uv1umrXarGQ_s39aQDjZZeog>
    <xmx:gHR-ZgXjGLIIHbW7g9K4_YOYZr-tZmrpfySxjMis8TNST1vriDuwPZRu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DD5CAB6008D; Fri, 28 Jun 2024 04:29:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <58ec4d44-3393-4b0b-83c4-3f66b0e2de1e@app.fastmail.com>
In-Reply-To: <20240628080146.49545-1-andrei.simion@microchip.com>
References: <20240628080146.49545-1-andrei.simion@microchip.com>
Date: Fri, 28 Jun 2024 10:29:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrei Simion" <andrei.simion@microchip.com>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Rob Herring" <robh@kernel.org>,
 krzk+dt@kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] Read MAC address through NVMEM for sama7g5ek
Content-Type: text/plain

On Fri, Jun 28, 2024, at 10:01, Andrei Simion wrote:
> This series proposes to add EEPROM support and reading MAC addresses
> through NVMEM (via Devicetree) for sama7g5ek:
> - Add in DT bindings document the EEPROM compatibles :
> "microchip,24aa025e48" and "microchip,24aa025e64"
> - Update to the driver to support "microchip,24aa025e48" and
> "microchip,24aa025e64" and adjusting offset for those 24AA025E{48, 64}.
> - Added the nodes in devicetree for eeproms where are stored EUI-48 MAC,
> and update gmac nodes to read the MAC via devicetree through NVMEM.

Can you add an explanation about what this is good for?

Do you need to work around broken boot loaders that cannot be
updated and that happen to store the MAC address in the EEPROM,
or are you proposing this as a generic solution that board
developers should actually use?

As far as I can tell, even with this logic in place, users
are better off just having the boot loader read the EEPROM
and storing the MAC address in the in-memory dtb as we do
on other platforms.

      Arnd

