Return-Path: <linux-i2c+bounces-2803-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A47F89ADA8
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Apr 2024 01:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94038B2172F
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 23:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3C158104;
	Sat,  6 Apr 2024 23:25:05 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 3.mo550.mail-out.ovh.net (3.mo550.mail-out.ovh.net [46.105.60.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3454E1BC
	for <linux-i2c@vger.kernel.org>; Sat,  6 Apr 2024 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.60.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712445905; cv=none; b=Wa4hivGEzEHVtv42jFTtnx2FH9BfWgJgfQfRSNvXjXJxekFv+jMisIYhJCils6yVKB/lfCGdfReTy+khfb97mYk6m0UsWBuwN9NNpeFoXa/VbiVwdWH6slcb4Kq4NSrn7E+uBk0UKF/g9oV3kk98dU6okFDey9ixRsAPz4PRFLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712445905; c=relaxed/simple;
	bh=y7rjYAJFlIDV2+5E+3xKk0Wop34dA9aGa9K7aHF7l64=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Me5xhzwWGsQURZ8uox2SsXa1RQZFHK5h40oujR9927q5aLU91T7iNG200bnGTTlnHA5yuouK09r804bQOH6Yz7Fa3BCvDsnIm4Qtn5ZXPVn+dWab9KsrVEePDqZBdIrJC0vwcQvYn1Rz3+8slFMH/nJJDJMr0N27yOlovNVMkwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.60.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.17.59])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4VBmC25k0Dz1Dn7
	for <linux-i2c@vger.kernel.org>; Sat,  6 Apr 2024 19:49:18 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-wcc7n (unknown [10.111.174.42])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 63BC61FE47;
	Sat,  6 Apr 2024 19:49:14 +0000 (UTC)
Received: from etezian.org ([37.59.142.107])
	by ghost-submission-6684bf9d7b-wcc7n with ESMTPSA
	id qQRmNDqnEWZW6QUA7OFEhA
	(envelope-from <andi@etezian.org>); Sat, 06 Apr 2024 19:49:14 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-107S00125f72fca-bae7-4125-a8c4-596bb9fcfba6,
                    474D68B9A30E89157E7E9069718C3EC714C936DF) smtp.auth=andi@etezian.org
X-OVh-ClientIp:194.230.160.95
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Niklas Schnelle <schnelle@linux.ibm.com>
Cc: linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, 
 Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20240405101009.2807447-1-schnelle@linux.ibm.com>
References: <20240405101009.2807447-1-schnelle@linux.ibm.com>
Subject: Re: [PATCH v2 0/1] i2c: Handle HAS_IOPORT dependencies
Message-Id: <171243294822.75370.15549035576290413403.b4-ty@kernel.org>
Date: Sat, 06 Apr 2024 21:49:08 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 12051069656881302036
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudegvddgudegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudelgedrvdeftddrudeitddrleehpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehhedtpdhmohguvgepshhmthhpohhuth

Hi

On Fri, 05 Apr 2024 12:10:08 +0200, Niklas Schnelle wrote:
> This is a follow up in my ongoing effort of making inb()/outb() and
> similar I/O port accessors compile-time optional. Previously I sent this
> as a treewide series titled "treewide: Remove I/O port accessors for
> HAS_IOPORT=n" with the latest being its 5th version[0]. With a significant
> subset of patches merged I've changed over to per-subsystem series. These
> series are stand alone and should be merged via the relevant tree such
> that with all subsystems complete we can follow this up with the final
> patch that will make the I/O port accessors compile-time optional.
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: add HAS_IOPORT dependencies
      commit: 53f44c1005ba64215ab6c3c5bbbcaef0870ae7d6


