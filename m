Return-Path: <linux-i2c+bounces-2792-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF1A89A58B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 22:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46E581C2145D
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 20:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5092174ECA;
	Fri,  5 Apr 2024 20:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="LUA/vy4e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m2h3piVF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECB7171E42;
	Fri,  5 Apr 2024 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712348217; cv=none; b=aZh+vpaBfiwZjK6I0pnQkveVsGFoewHU9oWeFOeS9Zp+HXkNhVqaS6KqGKg4PMybwSpxuj64hCYKVJprsYa7oUn+0Z9dkW2oBKtp3L7m49uBS61pco/wZHWdWlnitMKVxowYLKO9mkMNIIgTGIsDcQa78OuMSmO/r067dXdLKjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712348217; c=relaxed/simple;
	bh=up5LFCC+UqimQbjnXWeVT9wsxfzpVWUu0porL7yDngo=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=SMmot3MwGvcAba7e3uGt5JH1g/r6oEMutewqdyoriBujTCk21gW5iWmSdfsyAguea53Bz1XuNtD4EZveogJjFlrE2kIbK8X8hquVNO0+QvDa+lNCkxGKaevroRPLz9sjaT6k4/OWL8hOghcF9G1ZKrdLJHV7WuNentqCvxYRFX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=LUA/vy4e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m2h3piVF; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id A6DFB18000BD;
	Fri,  5 Apr 2024 16:16:52 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 05 Apr 2024 16:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1712348212; x=1712434612; bh=+dA8jRJDod
	Xbd6NzxqN5UuThJ0zD1dMyCnvyLGXTIFI=; b=LUA/vy4e6vsExiAfAk907EnPX3
	rmSTVLmiSmWVDa9sFWbkjZhzIuqOM0bEunLKrh9CvcZow8PPRm1RjZpyh/Z791s/
	QusY8fc1QGpMM8Zj1fISMdBtwxWaf8GNaqV3mkdOVq8GmrggHBYc7NxirtvjWIMi
	Z4R3d0H8sQbUka38K7NTzsvuuVuAb0E4CR7dyy7K30H3QnfzlrXziNJYn1mWRlcr
	BYjhx0H+OeuXqoppO1uAelyqTq11IyxknamnKo4pzMJ2aVCZbX0oT27GfF59uLuf
	MX04YT+BEH8N7S60iMYRZDTNtnIaN6IGy0Uf4lQ2DZdFRdOtfcOtUMt8ZCwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712348212; x=1712434612; bh=+dA8jRJDodXbd6NzxqN5UuThJ0zD
	1dMyCnvyLGXTIFI=; b=m2h3piVFaODYG6e+Gyk6QE3aK42dls5GaZ2Bpapy7uhy
	c8hAmbpK+oOnhiRO5a0WrRh5gjaptVtpwJVI6cb89RaLhSlNUDa46fQkudgJ7ppX
	7L+Vvg+iKD+zyl5ygUy6a8yT7EUw5mxvbJEg5PLuyq9UN08pMpEAoeHDz+9MgxYs
	wrMBEEw9xdfZBz08osJUVV27t23rusye/IKZdluxvmTSccZhvK3GaRu4+7cOQwbo
	7BwZV6TGr74HTrjM9G8kbMOcp0xxfU7askL5SaT8arfL6s1R04ZJz8vedG3Nmyw7
	jEZuIv6BnrlMzCrvF0J+P8sZ5hTUDW1b9956UQvyFA==
X-ME-Sender: <xms:M1wQZgluBKPDX-NTgyEoD0GCNhqWtlsXUN-o1MnY3tipS3Ohb9Gwug>
    <xme:M1wQZv0LAerK85hecsjAmteX4cLtSgc-drZkpHV2Jjpbz6EOYFA0_oAVd8cbvzv76
    C6TPYufFx61evpZVoo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudegtddgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:M1wQZurA0_1FSlLdRqN3nejTSW0NmsT-cs60eBbw_MeubSFGsbG8EA>
    <xmx:M1wQZsnLFlv_4mNQ_IUjXfDBgzkAprMNOcPH8kJ0z0AZuCVTLE7xQA>
    <xmx:M1wQZu0eW6usyQn8Y-SAz-yA9cZyb0QGwizMLNQL4x5EW5NpJxF9-Q>
    <xmx:M1wQZju191xYZhxPVpeEI68TLb2C0fBanOWDy_sc6s7kumUomKoOQQ>
    <xmx:NFwQZkNxZzMCIgMI3M8IC-Pk3jJb37OE4Sw9xybnaWBxuRG1QsUDQ1dN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2642EB6008D; Fri,  5 Apr 2024 16:16:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <4b38f876-2178-458e-9e47-c436b5cd7eab@app.fastmail.com>
In-Reply-To: <35e0b5cf-f7d8-4329-8dba-1098ed9451dd@gmail.com>
References: <20240405142823.615609-1-arnd@kernel.org>
 <35e0b5cf-f7d8-4329-8dba-1098ed9451dd@gmail.com>
Date: Fri, 05 Apr 2024 22:16:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Heiner Kallweit" <hkallweit1@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: "Jarkko Nikula" <jarkko.nikula@linux.intel.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Jean Delvare" <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: add I2C_MUX dependency
Content-Type: text/plain

On Fri, Apr 5, 2024, at 21:18, Heiner Kallweit wrote:
> On 05.04.2024 16:27, Arnd Bergmann wrote:
>
> Question is whether we really want that I2C_MUX restricts the choice for
> I2C_I801. Alternatively we can skip building the mux part in the 
> problem case.
> The mux part can be used on very few old Asus systems with > 8 memory 
> slots only.
> Proposal I sent:
> https://lore.kernel.org/all/4dhfyaefnw2rtx5q7aaum6pfwha5o3vs65iqcrj2ghps34ubtw@b3bw3gggudjs/T/
>
> Note also the CI bot tags, as the problem was reported by a CI bot before.

That seems fine to me as well, and it avoids having to mess with
the watchdog driver. We may want to change that bit anyway, but
then it can be done independently.

     Arnd

