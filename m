Return-Path: <linux-i2c+bounces-2216-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F48C873B25
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 16:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AE992827A2
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 15:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7B9135403;
	Wed,  6 Mar 2024 15:50:36 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 1.mo582.mail-out.ovh.net (1.mo582.mail-out.ovh.net [46.105.56.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C803134CFA
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 15:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.56.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709740236; cv=none; b=s9VkNm4XPzrGQxPNlqEjt/96fY5CianLGzfoC15qetoz6cFHnC51uKKZ27+uDDX9G/HXWgxMs+r9jCSIitwAnSiDB4sIznQrcLv0CQbOPZt6sDSXb6HA2wFrwHAusR5EXHoBIdli24aTmaDdM8qnLyhpnnW8kVUuU3EAgLUE0gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709740236; c=relaxed/simple;
	bh=MQfE8wsSPKQmhsxKtLSyfgknlqem5+C0uOcMNrIoMfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u0odtbCSYz+sd+lMfog0fFZj61JHjMYnNW+49vFKUEFlpp4DwiqhGMU2If3H5igx4F9Kff7Zdq1NbQL/oPXA+u7lgo9H+rx0egkWrdzi+OjYAXAacelLXCUQQbjjT9dKBd9gCdqFrgKK+WC3d5aQxsTRzWs306vW6poRIwktbCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.56.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.148.126])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4TqcCl604Kz18LK
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 15:43:31 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-5ftjb (unknown [10.111.174.17])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DDCD01FEBF;
	Wed,  6 Mar 2024 15:43:30 +0000 (UTC)
Received: from etezian.org ([37.59.142.109])
	by ghost-submission-6684bf9d7b-5ftjb with ESMTPSA
	id YR/XJSKP6GWyBAAArHCiFA
	(envelope-from <andi@etezian.org>); Wed, 06 Mar 2024 15:43:30 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S00357faae83-dee3-4f70-a94c-fe5b44f90acc,
                    62DEF991EB217AB86F953B10C2782167B22AFEEB) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <bf7b105f7d9728ae5cd9fa99d1cdd278d71e7df2.1704723713.git.geert+renesas@glider.be>
References: <bf7b105f7d9728ae5cd9fa99d1cdd278d71e7df2.1704723713.git.geert+renesas@glider.be>
Subject: Re: [PATCH] i2c: rcar: Prepare for the advent of ARCH_RCAR_GEN4
Message-Id: <170973981000.1763249.1525720901010723550.b4-ty@kernel.org>
Date: Wed, 06 Mar 2024 16:43:30 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 10314087575055108855
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht

Hi

On Mon, 08 Jan 2024 15:24:20 +0100, Geert Uytterhoeven wrote:
> Currently, all Kconfig symbols for R-Car Gen4 SoCs select
> ARCH_RCAR_GEN3, which might confuse the casual reader.  Prepare for the
> advent of ARCH_RCAR_GEN4 by extending the dependency for auto-selecting
> reset controller support.
> 
> 

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: rcar: Prepare for the advent of ARCH_RCAR_GEN4
      commit: 5d85665181beb6d75a0e9e0652f41bd0acb877df


