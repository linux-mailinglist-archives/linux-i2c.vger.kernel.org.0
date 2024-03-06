Return-Path: <linux-i2c+bounces-2219-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CFD873DC3
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 18:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 870DA1C226D2
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 17:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C552313B7A9;
	Wed,  6 Mar 2024 17:50:40 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 11.mo582.mail-out.ovh.net (11.mo582.mail-out.ovh.net [188.165.38.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE9F5D48F
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 17:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.38.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747440; cv=none; b=tZR1RTV5R6NKSzJ/2dWKfkRb+V/z3aElq6cEnsJPBmi8HIS71DBPEWJ4UoYnTe7Nl3HfVnaEZ6o/RF6vbmimD3/8k/iTW1iZOthBk0/iUD3Jq0gSU7On4h/rjxhWPKHDSjmTeyhhvJyWTKC+Sxillx2K+CGoVNhFwrcvHaP9uyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747440; c=relaxed/simple;
	bh=PlA5ZMnDMC0I/fxBmY9wVIQDdbI6TlS0da/JsCD4Z4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uLhe1dDgJrae6q/ssUCL5pORdBpZcuxmUFazc9jjyjxUTfjDXTKrAYp0l5KUQ4Wdglyv31K2uas6W5HZxGPV7SnN/2QzE9Z6dwnjma09My6VR0mp3e5oWjF8fBDHm4D/+jSnh+s+HdGH5n1NbgJBnsLud1DuDV36+tSEOrf23t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.38.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.25.169])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4TqW8Z5RBBz1G5W
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 11:55:26 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-bj2cn (unknown [10.111.182.153])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1658A1FF06;
	Wed,  6 Mar 2024 11:55:24 +0000 (UTC)
Received: from etezian.org ([37.59.142.102])
	by ghost-submission-6684bf9d7b-bj2cn with ESMTPSA
	id 3+nBK6xZ6GU0lAAApcOaZw
	(envelope-from <andi@etezian.org>); Wed, 06 Mar 2024 11:55:24 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-102R00463a7049f-92c1-4388-a197-efead1bef8cb,
                    62DEF991EB217AB86F953B10C2782167B22AFEEB) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-i2c@vger.kernel.org
In-Reply-To: <6db1e4ad-14b5-4d0e-ac06-46541970ce0e@gmail.com>
References: <6db1e4ad-14b5-4d0e-ac06-46541970ce0e@gmail.com>
Subject: Re: [PATCH v2] i2c: i801: Fix using mux_pdev before it's set
Message-Id: <170972612320.1712532.13474994711820566145.b4-ty@kernel.org>
Date: Wed, 06 Mar 2024 12:55:23 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 6462102518814411369
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth

Hi

On Sun, 03 Mar 2024 11:45:22 +0100, Heiner Kallweit wrote:
> i801_probe_optional_slaves() is called before i801_add_mux().
> This results in mux_pdev being checked before it's set by
> i801_add_mux(). Fix this by changing the order of the calls.
> I consider this safe as I see no dependencies.
> 
> 

Applied to i2c/i2c-host-fixes on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: i801: Fix using mux_pdev before it's set
      commit: b60b86b55400413e5f2f1c076f5a2f535341c9ce


