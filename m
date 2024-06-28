Return-Path: <linux-i2c+bounces-4472-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4165091C0D4
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 16:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC1D51F21B3C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 14:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B781C0043;
	Fri, 28 Jun 2024 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="URwT8LrT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o7RMCC5S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504D41BF32C;
	Fri, 28 Jun 2024 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584768; cv=none; b=Uffyk1XRIJTFQWqU2kaAZjpCwLn9F9LC/AeAWlU5K7dEuNdX+0Z4ZfK8lJUjA6KyEw5WqKiGgs5uZASACu4CtXXji7t6mDCDZezVWXgcG+/hC4ZlBCp0s98JfUxnfzHlpAxWxV49PCb4zGWi1Qd4CyAcDwrpA28+EgthH8bNBo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584768; c=relaxed/simple;
	bh=vRsEDHR4Bs9LPJM9XEv2aUKz+NrgnR9d8h0NsZsT7Eo=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=cmZ0rSbW/cUCNvtQWPCRF01lZs43QhHq7XqO3Z0ZrxpFy6Px9W1pkvH+vdZqikxq88Xq3RTgYjoojsdPg1BVjbfG85nQZ2ndQDexMH2lhwitbAk8CN8mpevh/PyU1GfjN4IK0GSPJLcDZhrbMBw5ZKIXC0ODNmMWpxSTJ27CNYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=URwT8LrT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=o7RMCC5S; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 433211380275;
	Fri, 28 Jun 2024 10:26:02 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 28 Jun 2024 10:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1719584762; x=1719671162; bh=rj4AKH/BAW
	4E3u7lDfoUs+9+o77HTLdNsSE3KnyYUs4=; b=URwT8LrTxIdgcHIf4mFkwX8fNX
	EreTkmLEU2F09s0ZctPVqdiCfIaa1+jCtMumiTjXMRhzolquEKEVTIfHGDollXLv
	N4aDZ64nrSFcUUouzXcZZEsuCUI63PgQPO989im0RbsctkCL4GtGpAtRC/SPP9cg
	IQeXTOl4pTvo95qjUXNa/1odCDnKG8WETJlx6VDrYhNjgbWPqXRqoAh3JxvqdAtT
	mI+f9HyPvcYn+322h9h7Y5JWzQi3qE+nyO1jSKq9orUALktp/4chPATZUnGRBNbR
	nE4p0rYggdnw83nQ5vvmVQ5XFNfdObzshmIppr/Rz8YP2I1z4JUgpR6G8H5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719584762; x=1719671162; bh=rj4AKH/BAW4E3u7lDfoUs+9+o77H
	TLdNsSE3KnyYUs4=; b=o7RMCC5SMUyAlj5gOiyLF1W11Fxt/Oxbsds1xbSCk4UC
	xfdmWDErU5Sw50Mc5zU5eyrxYHAqRSViR3NedyDsVzfP8YZxYcl++8MmdrmMBL2T
	ZUz1PwdANTyBcyaka5FbD2Mc3XI1eellXPKkSsZKUwKx/xWP4wnTGXueWD75KvyC
	ZtciZHDK3GMSEHgPpYEpVJ3pfGYnhznjV7QuB/VeD3tD4c/vPA3tjyW2lSBpIS0y
	yq35IjOkgLdwdMFS5p+cewlqcQtxQOzlHiNKrGOd+5UmQLOmNJPxDczuHHZbU/9l
	G4m0j2u9KbSbILOSpvk/w/zHvannL9v1c/xeH1SgZg==
X-ME-Sender: <xms:-cd-ZqoRISihVDCxp5WYDUhUGOUT7UwkF3v2H5S84Z7IT8tYkt3TEw>
    <xme:-cd-ZopdocjgMrUM8dLaKZffsX_93HIf0cdwAMuDAD3AgLmCX6OOn03MzuFMV6OWt
    fw-GIXPrzi5mBxHUSk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdejgddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:-cd-ZvMnV0WnH4eNwS7VWbiw5A_gzWR2LFy7K8yP3lMXn9tIOko9ew>
    <xmx:-cd-Zp7A56a0diYfpmc9ZBwHHC5aGa8Rr8jD-NqUiGEdGELC0L8BCA>
    <xmx:-cd-Zp67phlGlIEArzSNhRwfXu5AL4Qi7FOhX9-yFio2DNPckL7rfQ>
    <xmx:-cd-ZphyHDMPKI1UAh03mIh3UQosIyzEnc-_YOQMi-ilAs1YAKSglQ>
    <xmx:-sd-Zhx4Jv0VyLfBPqJdEIuaqBVw8-4bAGlaZ_9jQRq055kJ3Aor-Av3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B175EB6008D; Fri, 28 Jun 2024 10:26:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <0aa1f738-c02d-49d7-af11-5bf284677e81@app.fastmail.com>
In-Reply-To: <49a71ee7-b86b-4f44-b7b3-dc0a6433e1c3@microchip.com>
References: <20240628080146.49545-1-andrei.simion@microchip.com>
 <58ec4d44-3393-4b0b-83c4-3f66b0e2de1e@app.fastmail.com>
 <49a71ee7-b86b-4f44-b7b3-dc0a6433e1c3@microchip.com>
Date: Fri, 28 Jun 2024 16:25:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrei Simion" <Andrei.Simion@microchip.com>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Rob Herring" <robh@kernel.org>,
 krzk+dt@kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 "Nicolas Ferre" <Nicolas.Ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] Read MAC address through NVMEM for sama7g5ek
Content-Type: text/plain

On Fri, Jun 28, 2024, at 16:06, Andrei.Simion@microchip.com wrote:
> On 28.06.2024 11:29, Arnd Bergmann wrote:
>> 
>> As far as I can tell, even with this logic in place, users
>> are better off just having the boot loader read the EEPROM
>> and storing the MAC address in the in-memory dtb as we do
>> on other platforms.
>
> Our boot chain is ROM BOOT -> AT91Bootstrap -> U-Boot -> Linux Kernel. 
> U-Boot is the stage where we set up the MAC address.
> We can skip U-Boot and use the following boot chain ROM BOOT -> 
> AT91Boostrap -> Linux Kernel. 

Right, I can see how that is useful. Can you add that description
in the patch?

> This patch set is useful for this scenario and also for redundancy (if 
> something related with NET/EEPROM fails in U-Boot).

Not sure if redundancy is what we want the boot loader level ;-)

    Arnd

