Return-Path: <linux-i2c+bounces-10641-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 216B4A9E2B6
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 13:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AD5617192D
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 11:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94212472BC;
	Sun, 27 Apr 2025 11:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="cHiGN+ZH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EjsUXopk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31862C9D;
	Sun, 27 Apr 2025 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745753385; cv=none; b=YKoHQJUh4V9EQSPT8zdhR0euDhiGI2tKHdyB0OjvE4ECOzLfXRBif4yjWH7ARvuM+wkhtq97SgRFLyu2EarVTbbNCpuoF4jxbg9OVBKHUtwycXwiiVMuPAc20BOZTtCEBu/dDAWKUp4L+HkzA7eMqmxURMvVxW7w3ZKclGlPHXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745753385; c=relaxed/simple;
	bh=45/89ZHPY/WSXFJKW2Hcp01OMCm5pf9oonEl37HLkvo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=smrdaQbSEgLBvCwh7w9EivrRIqNvctyVxEeTl4bMjxnW0wCAgJ3fI3k8NKbtu+t1VTf08hOoDynxKx/0KoCA3zOwxIBBSP8MY6RRdtrLnR09Zr8eSHI58uuH4yxzUeumWhDXagI9it9MsP6KKc/WMYXKJe5GTd/mT/MyooqUZ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=cHiGN+ZH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EjsUXopk; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4F1702540219;
	Sun, 27 Apr 2025 07:29:41 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-04.internal (MEProxy); Sun, 27 Apr 2025 07:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1745753381; x=1745839781; bh=5AVnMYrfQqCKvIYMObZqGv0ycuhL3WyZ
	hFo4zuHwRSU=; b=cHiGN+ZHVQvwAmWDVqx50p8JoFWULaccQJvoTA0aQQhbWoFj
	6J7CETqWlKWiUxtKkRoO5VBEsJc6Am067bGJBPDJwas4PXB2FBqDdwB4cW40fhmj
	wW7+AXxGlx5lVtBORqbrSngOYGPpMo0CvUWAa45O4OOu7+7wunwDjjoonqC7g/zW
	Wdnh+EFjZyvK1jID1HhANCjNFi9iIEdoQ0r7P92cG721VszlAtd/czvo6+R8Hnxd
	ucQR93PRE5ZxsRismq+JU6fyHS6HATK+azAFOjjrYuhZcxpk1Z0JCOm6aexDIxt9
	fT5+7FT2550zPfT/Cm8SqfCMPnSLrPEoNfBqnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745753381; x=
	1745839781; bh=5AVnMYrfQqCKvIYMObZqGv0ycuhL3WyZhFo4zuHwRSU=; b=E
	jsUXopkgxavIZ1xItTb/bHcd5C9+Mg0mtnK92mV2vksvqWHpIuKCP+LQ9bu5hBCc
	TZ2zPdMVV72GaMriRYLOEZTZN2BUlRteq/ZRE2Kz93PfwQOjIWE0wawVSOd54nKk
	seKri/NZ/obQ3FAeZXO8dbcnPWXrcLAfqCvty8lppFSb5WdiwkR/0yTZYCUgLtRG
	veElxm/j9xyyoVLMrHwkYYF7cSjcxkS79ZjK941CezfydKUJSLjMV4vODtI/wrcn
	343CLszdcrK/IUnuzPChqz6yiHhvgSImt7VzQWkWukoosIkOqVrsgctzZcDflKy3
	DsI3xeOBJqtDICJKGf9QA==
X-ME-Sender: <xms:IxUOaJOdB7skIWg1gp5gI_f5bSLHlrtJ5DizHoMVXln4GRcU_grfCA>
    <xme:IxUOaL9FSn8d4Om1QrpZrSgSwOPFF8UE367CRXKJQIUYLtao_KGS2rQ5caiW6IfgV
    zZK3DICYOyduSjMrYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheejleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhish
    htohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehmphgvsegv
    lhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepjhes
    jhgrnhhnrghurdhnvghtpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehnrghvvggvnheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepmhgrugguhieslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:IxUOaISkvdKNkauBTau3Yk86BBkDs_xaQlGa8g1PKqItwEO6sr7_Aw>
    <xmx:IxUOaFsQIYPEGVcnbw5bn1-nmmufSyYvjad865GJP9x0WREMbgpV5g>
    <xmx:IxUOaBd97cPa0WAqm8KOVrSh9n-zwiAuFqZ3Oln3jFSUdNAWa0GCEQ>
    <xmx:IxUOaB2Jm45REZl8uOecpL_ceCAb7Zm9Jwx7F71mScOODKnIaRvMpQ>
    <xmx:JRUOaB2nIin_JYaVvDIelqSp6Cg24ftqlZtTrULSUZnnWHPvRJfd7SeL>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3F050BA0070; Sun, 27 Apr 2025 07:29:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T5434dab6164679dd
Date: Sun, 27 Apr 2025 13:29:17 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Andi Shyti" <andi.shyti@kernel.org>
Cc: "Janne Grunau" <j@jannau.net>, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>, "Neal Gompa" <neal@gompa.dev>,
 "Hector Martin" <marcan@marcan.st>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <c6590a37-97b0-4497-8cc1-c4572897f0dc@app.fastmail.com>
In-Reply-To: 
 <dtjvj34q4ojbci67akkxfiskpiro24xupagr5rl4dn3idd6vxh@2emtiwbvpvra>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-4-c543bf53151a@svenpeter.dev>
 <dtjvj34q4ojbci67akkxfiskpiro24xupagr5rl4dn3idd6vxh@2emtiwbvpvra>
Subject: Re: [PATCH v2 4/6] i2c: pasemi: Improve error recovery
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,


On Thu, Apr 17, 2025, at 15:07, Andi Shyti wrote:
> Hi Sven, Hector,
>
> ...
>
>> +/*
>> + * The hardware (supposedly) has a 25ms timeout for clock stretching, thus
>> + * use 100ms here which should be plenty.
>> + */
>> +#define TRANSFER_TIMEOUT_MS	100
>
> Please use the PASEMI prefix here. TRANSFER_TIMEOUT_MS it's not a
> naming belonging to this driver.
>
> 100ms looks a bit too much to me, but if you say it works, then
> it works.
>

The problem here is that we only have very outdated documentation for this
hardware and no real idea what changed since Apple bought PASemi and continued
using their i2c controller.
We know that 10ms (which used to be the original timeout iirc) is not nearly
enough and we also know that we need at least 25ms for clock strechting
(assuming nothing changed in the past 10+ years).
We just bumped it to 100ms to be safe after we very rarely got error
reports which we tracked down to timeouts and haven't gotten any reports
since.


I've addressed all your other comments for v3 which I'll send out in a few minutes.


Best,


Sven

