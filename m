Return-Path: <linux-i2c+bounces-9587-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AE8A449EB
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 19:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1C7C3BEA33
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 18:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCAD19D886;
	Tue, 25 Feb 2025 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Z+LG7KC9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dDvdqvuk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D161918C035;
	Tue, 25 Feb 2025 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507016; cv=none; b=umqNq6uwpFopyAo3+pZp5s/M3L+FywqzJKku81i/MUuLRWfPbsFjduKAfQVUk2SAKySSDGxV/gD7akxSztOsi34SQvnkeFDODBcorPLlvPGhf6FwVN4RfpErKI5UZdRkfjXZuhJMBFLBYpEk55bA6CkqXGWXsN7QWYrsLxaYXG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507016; c=relaxed/simple;
	bh=pE6mwKaK2JZXowpxUDNk2mqTSwB4ssHc8ViDMMbikb4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pKelKiSD92i0ANsErkfwvwu7zHv9DbI7reywzs/V8x0QdoE6L1cFwbzEy9Hd/vXDZWVK3MlDuV4fbzQPYuq1PAyWT2vUxG6CgAYJwlSGEghFVtK64kgQvR96aX/lo/ZtaCCNsb/IEKLFlwHbxup2TfzKhdHK3naq1cwnW21vl1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Z+LG7KC9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dDvdqvuk; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 992D91381131;
	Tue, 25 Feb 2025 13:10:12 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Tue, 25 Feb 2025 13:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740507012;
	 x=1740593412; bh=EWRP+F9bm2++vDb4CJaW13Ey4HHcxOh+x9OLFaSDzJk=; b=
	Z+LG7KC9RBjRFy/63YM5vCgnvUKAaPe8qzrC6KGVajTgImO5OkjWW2TOVKX4LEUV
	WqFFv8fvQveDkdHZDipThwJ8UYa69k/nZvEN3mtkEqyLV/s1+Oal9bdVodjzwQPQ
	HpemR2ux40et9sgM2ShT+dIV2bxVRCB08dlEEvYFNByAHZtsHIKOjnWnKb5uO7qA
	aGE+nzuk1JHZsKPdOBHe48dCaSFE+CsfqempJQULPVKhBRJo5yHjpGLl5uP2yqNf
	/LiRwOYQXLYXemC/gnaLBDfDKyjNlfX5mQVvPSv6RCgeuSSynaaUEZUZV94J7yrQ
	kCvvrv0IL9636BOp+aULuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740507012; x=
	1740593412; bh=EWRP+F9bm2++vDb4CJaW13Ey4HHcxOh+x9OLFaSDzJk=; b=d
	DvdqvukWQQZNaZC2mwP/5pLhgt/DnHcplDthHnC4CkbGJJUSWFRgd6I/I7xsxe9z
	2kmNBJi/zjPFNiOzTqhS7NLXmefSkV3GBbTy1Uf1waNLu/78cWDyEIft7d44+sfN
	nPTGfBfWnsTrOAd/caLWXCTxaSPJb4tXCQXgvx9p1yacOKj8MSyNBAQP2cPrRcli
	JWnDHDHUYHf66zhPbt9VAsHZCdo1mdSVpnCcKNCKF8x2fU3QGtXrIOUwJeP+o5A5
	/jm8sOz06pyDnmCb+QKnu2ugkczIqDzbr92jQMO/lbkH6UycHAR8naexnaOSB0c7
	J2E3dfKQnlsjnHIiLXCSg==
X-ME-Sender: <xms:gwe-Z73Xs_Yr8gTI1aYL6TmnRFmFfkYxXuqUVGFtqs91jByH5-nsVA>
    <xme:gwe-Z6HFmK6ZsGc5Ed0Jp1ImmvgA0sjIQn8ipy13n6SBH2txUPNFoa3yUgK0SGTol
    ULktWU98ghevonADIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvdefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpd
    hrtghpthhtohepsggrrhhtohhsiidrghholhgrshiivgifshhkiheslhhinhgrrhhordho
    rhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrih
    hnthgvlhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurght
    ihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:gwe-Z74jZ16WpYl-fD9AE2CNACKFGmf79rKl1QHMZTQo8GziJHHVBQ>
    <xmx:gwe-Zw1YEtgNPukA1idlD4Rl0VVrHqzGlceTRVj20HkpF7xae0S-HA>
    <xmx:gwe-Z-HvKimagNdCznDFurZxcMflETDx5pCS6hXdL5-mxwR0vRoz4g>
    <xmx:gwe-Zx_lHt3QsxJ8Mg_gz_QHZ72r4leI9CPqnIWllwuNNwKEkhsRmg>
    <xmx:hAe-Z7PbfFf3KSmpGMWpf2jC9iU8kiBh1TnnFKSY2FJh-c-cy2cb7acP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 709CC2220073; Tue, 25 Feb 2025 13:10:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 19:09:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Message-Id: <2ff27d1a-cda2-4dec-ae9b-23b63f20febb@app.fastmail.com>
In-Reply-To: <Z72gCD7B0_jj-f2s@smile.fi.intel.com>
References: <20250225100838.362125-1-andriy.shevchenko@linux.intel.com>
 <b8a1315a-8d86-4904-92d1-179699f54e03@app.fastmail.com>
 <Z72dfxKzLLORkLl1@smile.fi.intel.com>
 <745ff032-1e71-4569-ac9f-07c44cbcb344@app.fastmail.com>
 <Z72gCD7B0_jj-f2s@smile.fi.intel.com>
Subject: Re: [PATCH v1 1/1] at24: Drop of_match_ptr() and ACPI_PTR() protections
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Feb 25, 2025, at 11:48, Andy Shevchenko wrote:
> On Tue, Feb 25, 2025 at 11:42:48AM +0100, Arnd Bergmann wrote:
>> On Tue, Feb 25, 2025, at 11:37, Andy Shevchenko wrote:
>> > On Tue, Feb 25, 2025 at 11:29:05AM +0100, Arnd Bergmann wrote:
>> >> On Tue, Feb 25, 2025, at 11:08, Andy Shevchenko wrote:
>> >
>> >> Subject: [PATCH] [SUBMITTED 20240403] spi: remove incorrect of_match_ptr
>> >>  annotations
>> >
>> > Was it applied (and the rest you provided here)?
>> 
>> It was part of a longer series. Some were applied, but the ones
>> I provided here are those that for some reason did not make it.
>> They should apply cleanly to today's linux-next.
>
> I can review them and give a tag if you issue a new version.

I've sent a bunch of those to maintainers directly now but
in the end forgot to Cc you. Let's see what gets accepted,
and then I'll send the rest as a series fro the endgame.

         Arnd

