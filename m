Return-Path: <linux-i2c+bounces-10069-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02089A75907
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Mar 2025 10:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B10C3A9F69
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Mar 2025 08:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8AA17C210;
	Sun, 30 Mar 2025 08:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="DJnJtTkx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E1rLm3UZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E511581F0;
	Sun, 30 Mar 2025 08:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743324712; cv=none; b=a9saKyMUdfbr+3FrY1SHlHFoIg1/TfWGRJrBo1zJNmet2RVFj6ScKuRNxXZl1vWBuS+dAStPH7KdtMen+QbXu6vIs52IUmOSLUPZG9j+/oqQhX8I89aUuk5pv+37F9MUtl2AP0V/SS075cFsEVXMm/64ZqKg02osSetUK8SnttA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743324712; c=relaxed/simple;
	bh=xPhwWDI3vRjZ0m2k4v3KogrcS24YICsNymfB02MqAIE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=a96c47yCUpd/JelsDBRkUPWuK8a3OMe06g6M3/+SIak1W4Wqj8SxRsaSrVHgkBLmM1Zs5CK5M6DfwJ0w5Fr53TjseVSAQglfqxCK60OWwP03IL9GtZt1EYgzaGrF1/A5Ggm7hsBHjdOhCKUBHHYrERg172vV0KoKLX4uyfkIZDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=DJnJtTkx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E1rLm3UZ; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 42846114011B;
	Sun, 30 Mar 2025 04:51:48 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-12.internal (MEProxy); Sun, 30 Mar 2025 04:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1743324708; x=1743411108; bh=dTqWupLjl7cdoWEq+RC/Hw7jFYiUJzqN
	ImVvEUcMouk=; b=DJnJtTkx4FtwTGs+MCsrm43hFIkfqw4YaAN/iAf6TgpR0LbC
	o+1eLQsYmMCqFU1GY8C+JR/xcq53SyuUQywH6k3f+PP1xqqCMv9G5aU89r5KCy7E
	esU9ANb6BbU6oi4EDQAzKVSib3TPZUA7xmK25k/ZZsKjfKtCF6MoRwSqR4WaoGe8
	O5OzmT+DbH6fhcpx1/IDh8wahLKCbFydU1W83a2yls0+1pkAqVzGrWsoPFPE5XyJ
	Y/XUuouU25KflRa/Z0Ls1fDdWHp1E198ihXjdvNIjSRzMTLSmO6B00nsLqG++heE
	fHBafwieQnBMeyIkmNAQbORXHzaf3WjS83JPyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743324708; x=
	1743411108; bh=dTqWupLjl7cdoWEq+RC/Hw7jFYiUJzqNImVvEUcMouk=; b=E
	1rLm3UZ5lxXQ2IfWIxo+qXUsKga+l/AU8skmGxFy4QX4/GQMa7NMcwYOkgewM8MM
	Ck2QOI5duUsk+T0zZ73+5fRGnrHWUJpLxQfmTBxKHvLxZ37Bzst3f4/D9Aet4zPK
	vOgJMbpaqGbLUZxVKfusy3ZI1dT+e+3LN1NpU4mmUtL35tL+byFt99Z6c/pV4ZSN
	uUeqpQfeoHqKB5nu19xAOrAniDep7IG7sgoWkpNOmIRjPokDdFYgVM+pSzZrLWEv
	GnTOHRPwGChr0agwfrfbJJy/ClTXEAOTmVJpcLQ8GfyQO2s3598YjeYrrFFrG+l/
	rFhIHueaTk3zZB6vnEPsg==
X-ME-Sender: <xms:IQbpZzmp2KoRE1ljRh7hr-SHuOTQ2BaiFqboNbdzG_3Q0dfu64n51w>
    <xme:IQbpZ21fyxznLm7bF4IiUP9f_YTDHzitZJ2fyRbK0EmkF6a6No9IdIhjWcm98H6T1
    A2xYMiPn647jbr-MX4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeeiieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhish
    htohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehmphgvsegv
    lhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopegrnhguhidrshhhvghvtghhvghnkh
    hosehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtgho
    mhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegrnhguihdrsh
    hhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrvhgvvghnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehmrgguugihsehlihhnuhigrdhisghmrdgtohhmpdhrtg
    hpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggv
    rggurdhorhhg
X-ME-Proxy: <xmx:IQbpZ5rnL3CUphbOwpi10Itieqzl_zNrcEz9pXzntZMIsAR_r15lcA>
    <xmx:IQbpZ7lkVSFcsxeK4r1GNWXI3qP-UoeTeih7LDrpKSLezZoXZ4wdPg>
    <xmx:IQbpZx3dqW678wETZPJesy7jhheRYZyXtPWyvLhjpFCIv-K2IQuvLA>
    <xmx:IQbpZ6vPnTiLL8VLuFuGSM6VQQv3--z4cZRdI-xpQHE9Lvz7z9kgOg>
    <xmx:JAbpZ7MTq30YCxSfV2OaJOKEeOCcrUXIfDBhrimcqMIKp5boESOGqfpz>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B0DB1BA006F; Sun, 30 Mar 2025 04:51:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T14a5dff03e1db70d
Date: Sun, 30 Mar 2025 10:50:53 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>,
 "Andi Shyti" <andi.shyti@kernel.org>
Cc: "Janne Grunau" <j@jannau.net>, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Hector Martin" <marcan@marcan.st>
Message-Id: <b647d45f-32e3-4864-8a94-2e0b819fba18@app.fastmail.com>
In-Reply-To: <Z965tVhC5jxy1kqZ@surfacebook.localdomain>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
 <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>
 <rjvak3c2k5a64jw4ef23i5uptg4zzl3u7lqszqbg56l4hqms77@hrkn5eydxwiy>
 <Z965tVhC5jxy1kqZ@surfacebook.localdomain>
Subject: Re: [PATCH 1/4] i2c: pasemi: Add registers bits and switch to BIT()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Mar 22, 2025, at 14:23, Andy Shevchenko wrote:
> Thu, Mar 20, 2025 at 01:23:25AM +0100, Andi Shyti kirjoitti:
>> Hi Sven,
>> 
>> On Sat, Feb 22, 2025 at 01:38:33PM +0000, Sven Peter via B4 Relay wrote:
>> > From: Sven Peter <sven@svenpeter.dev>
>> > 
>> > Add the missing register bits to the defines and also switch
>> > those to use the BIT macro which is much more readable than
>> > using hardcoded masks
>> > 
>> > Co-developed-by: Hector Martin <marcan@marcan.st>
>> > Signed-off-by: Hector Martin <marcan@marcan.st>
>> > Signed-off-by: Sven Peter <sven@svenpeter.dev>
>> 
>> Just this patch merged to i2c/i2c-host.
>
> This needs an update as well. The proper header for BIT() et al. is bits.h.
> bitfield.h is for FIELD_*() et al.

Ugh, good catch. Since this commit is already on the way upstream I'll send a fix
(and another one to sort the headers alphabetically while I'm at it anyway).


Thanks,


Sven

