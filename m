Return-Path: <linux-i2c+bounces-7185-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0E998D618
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 15:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E4F11C22341
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 13:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA44229CE7;
	Wed,  2 Oct 2024 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="PTlsNepW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Im/oD3U3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED679376;
	Wed,  2 Oct 2024 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727876188; cv=none; b=fpm5rBaAW+uwznPHUQEl6GuXclgtKaIePTTkO+JzqkMKCTRl6E/9O9T798HLa+QU0bcHKjZpGCDu42/y7Hm736sPtn3yMkJtr8A2uvuhVOBzvpCp27kIDlQ8AKvbSLQUX6DI6A2mGkDsIUNsYoEoK2N+FyVJEsakDorrDvHTXyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727876188; c=relaxed/simple;
	bh=THwtIMcd8JrGsalW1jKm3Oj5uW79AEPpC6we2iaZSNA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hS4zCBZLRf3yuiwTmLoyW6rf318KM3b6qzwo/HsOUJP4FqkTtwRDSTpCZODbWoV3BngxwFQxNnG30iMUk1nqVDGtXyubiaOjc1tn+/V1aZzZW83fY42c3Y6qAhwLsKZXp+bXPiATVFQQRiDY3kUh3lc3Oq00I++Oce5O/m0hZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=PTlsNepW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Im/oD3U3; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1F4421140170;
	Wed,  2 Oct 2024 09:36:26 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 02 Oct 2024 09:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727876186;
	 x=1727962586; bh=ubFC2eTR8KIw4NFn5kW2G/QdiEQyjm89ogkOng+Ssig=; b=
	PTlsNepWlqZMv+QnumKAcaNWTWi09hAkyRMMM8Pr/WBVgmhTxchknOhkzeddjvwr
	g84zjs20ehf3xT2qUNFZq6CnIQ0Y0ObVzKzVtIy+5CKH7/LujmTeeUYGV9MtPTaD
	bpn4GWvxaXKWTKA60MXVNX+oN9hEUbeYNG5ohsUd8X/E9WHxluaaDTRlsKPUsTQQ
	8c0u2lX0ylIcvQ9Sl04PAtzypoVgszKi5HwZ3GSeI+8XoTVXLsrp3XqTcvWLl+A9
	9YPPs8S1yV8/UH+vUXGORu+gq1QwxeWggtqv2vy1a3YJ/p8t88bBiRqCMAVk90R3
	EdWV/tvBJIk6gaAWt/WMOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727876186; x=
	1727962586; bh=ubFC2eTR8KIw4NFn5kW2G/QdiEQyjm89ogkOng+Ssig=; b=I
	m/oD3U3SDM+XLsY9I4ia93GvQ6VzZsaBE4vnmpGiZsbKrYuKk9xoC+2Ljqh4ycEb
	B8yZ3V/U/RbQSXgltKJLRfMA4e+lTfVf2ny+EyS8xVwEE/dVtCNITKwqsixPo4o8
	wDvoLYMqpKdLnraf2g7D8Pwg6nm91t4pel6SYDzRF8gvzsi3B0ayZdm0EiQoz41d
	ScTeUMgjkiMVB9hdMHn/uGhegTsqiW0NxstwQdloKdxvDaTAlTSDAjYxmUcx1WTZ
	0iCI7tcCEKl7KqL0LDVexmmH5IG0Gf/PIjsD4PTrw5MuBfKDMNkQa+7au0/edxoX
	IfpclJksNEwD1Mnae9BjQ==
X-ME-Sender: <xms:WUz9ZgMs4qJ5_4ALBm8w2bHlhRPXrwGy8vxTpjWkqJhm72b0NTvo4g>
    <xme:WUz9Zm-LkQIwvZPjUvH8sOsW_fMe_Q6D8IJT99oF6Doey5v2bky7-vPOK7PY3iy-N
    L61c8TdNvf7t28Ix74>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeek
    keelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepvghitghhvghsthesghhmrghilhdrtghomhdprhgtphhtthhopehfvghsthgv
    vhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghv
    pdhrtghpthhtohepfhhrrghnkhdrlhhisehngihprdgtohhmpdhrtghpthhtohepkhgvrh
    hnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehordhrvghmphgvlhes
    phgvnhhguhhtrhhonhhigidruggv
X-ME-Proxy: <xmx:WUz9ZnRw8p5SlUU3t09jdewO_culAZu6gqbUlNo8O22Fe5ubBI-cNA>
    <xmx:WUz9ZouFFQYospJoJSBkr0igtT7Hei4L3P5wmrjblCriSN70mxhu-g>
    <xmx:WUz9ZoeCjM8zOEo_5eYVKnz6Xid_hwlVyDdaZkS0Y9KbLkkbUxEaOw>
    <xmx:WUz9Zs15c4Ood2xcjtHjjj2zO2FtX2z6nwlsLMSDJb38v2pz-3sdLQ>
    <xmx:Wkz9Zn_3iC_gsrWlr9x9AriGXfM8Mppze5l1ARr10L__rYB1C-YLug0L>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6696C2220071; Wed,  2 Oct 2024 09:36:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 02 Oct 2024 13:36:04 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stefan Eichenberger" <eichest@gmail.com>
Cc: o.rempel@pengutronix.de,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Andi Shyti" <andi.shyti@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>, "Frank Li" <Frank.Li@nxp.com>,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Francesco Dolcini" <francesco.dolcini@toradex.com>,
 "Stefan Eichenberger" <stefan.eichenberger@toradex.com>
Message-Id: <a65ddcab-4ba9-4dfe-93ec-352b31845eb4@app.fastmail.com>
In-Reply-To: <Zv1FuHlpeayZq-Zv@eichest-laptop>
References: <20241002112020.23913-1-eichest@gmail.com>
 <20241002112020.23913-4-eichest@gmail.com>
 <6b070948-cf02-4f13-a220-0f6cfa21c41a@app.fastmail.com>
 <Zv1FuHlpeayZq-Zv@eichest-laptop>
Subject: Re: [PATCH v4 3/4] i2c: imx: use readb_relaxed and writeb_relaxed
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Oct 2, 2024, at 13:08, Stefan Eichenberger wrote:
> On Wed, Oct 02, 2024 at 11:51:22AM +0000, Arnd Bergmann wrote:
>> On Wed, Oct 2, 2024, at 11:19, Stefan Eichenberger wrote:
>> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>> >
>> > Use the relaxed version of readb and writeb to reduce overhead. It is
>> > safe to use the relaxed version because we either do not rely on dma
>> > completion, or we use a dma callback to ensure that the dma transfer is
>> > complete before we continue.
>> 
>> I would still consider this a bug in general, you should
>> never default to the unsafe variants.
>> 
>> If there is a codepath that needs the barrierless version,
>> please add imx_i2c_write_reg_relaxed()/imx_i2c_read_reg_relaxed()
>> helpers that use those only in the places where it makes
>> a measurable difference, with a comment that explains
>> the usage.
>
> I added the patch because of the following dicussion:
> https://lore.kernel.org/linux-i2c/ZpVWXlR6j2i0ZtVQ@lizhi-Precision-Tower-5810/
>
> I can't determine if the relaxed version improves performance. The
> 'normal' version worked well for our use case too. Therefore, dropping
> the change would be acceptable for us. Another potential solution could
> be to use the relaxed version only inside the ISR. Would that be an
> acceptable solution? What is your impression, Frank Li
> <Frank.Li@nxp.com>?

I'm pretty sure that Frank meant to use readb_relaxed()/writeb_relaxed()
inside of the FIFO access loop, not for everything else. This
makes a lot of sense, since the FIFO read in particular is
clearly performance sensitive and already serialized by the
implied control dependency.

If you can read multiple bytes, the best interface to use
would in fact be readsb() or possibly readsl() to read
four bytes with each access.

It appears that you did not implement the suggestion to
read the entire FIFO though, so you can probably just skip
the _relaxed() change entirely.

     Arnd

