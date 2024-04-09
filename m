Return-Path: <linux-i2c+bounces-2841-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B349389D71B
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Apr 2024 12:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CF65286492
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Apr 2024 10:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4E680BFC;
	Tue,  9 Apr 2024 10:38:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B7855E55;
	Tue,  9 Apr 2024 10:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712659099; cv=none; b=tPuO4BQHk0hbrh6YyVyGsp5yxLSLZVgoP6gkzp0zvoyBFUTcwlgog5cvyBgbYNFF+PRg30pl8h6WPSlqOWz1MLU7u5iGuRNXpc0OhcoOCmeQKJMcLuUPgW5KlRTkPDCuIFr/Lt8s2cnXkCAVJZ9Vil+BzIS7+nKkZn9GMjztkHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712659099; c=relaxed/simple;
	bh=eubZmHmwoUSkTmhPCXYJou0AiLJ/nfzFiHg2vPPxelc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=AqWBuSFRBZj9/Ud0ItT2LAIgDahOAq7i+NyoxWgDiG++RvJpn3PBopHPHNCJsbGo9YMZC0Lse6pcq0pB660PCQCb2iX/vuno80KByNyRPFcZeBKq8zLxZ7bVX6QsWxpekiVJOFRAipqh1hLA3Fss6nyajXj6z9Rhn1eGxLjasSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3D854000D;
	Tue,  9 Apr 2024 10:38:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peter@korsgaard.com>)
	id 1ru8rj-00EZ2E-0H;
	Tue, 09 Apr 2024 12:38:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,  Andrew Lunn <andrew@lunn.ch>,  Arnd
 Bergmann <arnd@arndb.de>,  Geert Uytterhoeven <geert@linux-m68k.org>,
  Wolfram Sang <wsa+renesas@sang-engineering.com>,  Jarkko Nikula
 <jarkko.nikula@linux.intel.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Niklas Schnelle <schnelle@linux.ibm.com>,
  Samuel Holland <samuel.holland@sifive.com>,  Gregor Herburger
 <gregor.herburger@tq-group.com>,  linux-i2c@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: convert to ioport_map() for IORESOURCE_IO
References: <20240408092923.2816928-1-arnd@kernel.org>
Date: Tue, 09 Apr 2024 12:38:11 +0200
In-Reply-To: <20240408092923.2816928-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Mon, 8 Apr 2024 11:28:36 +0200")
Message-ID: <87zfu2om7g.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: peter@korsgaard.com

>>>>> "Arnd" == Arnd Bergmann <arnd@kernel.org> writes:

 > From: Arnd Bergmann <arnd@arndb.de>
 > There is at least one machine that uses this driver but does not
 > have support for inb()/outb() instructions.

 > Convert this to using ioport_map() so it can build on architectures
 > that don't provide these but work correctly on machines that require
 > using port I/O.

 > Fixes: 53f44c1005ba ("i2c: add HAS_IOPORT dependencies")
 > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
 > Link:
 > https://lore.kernel.org/lkml/CAMuHMdVUQ2WgtpYPYfO2T=itMmZ7w=geREqDtsP8Q3ODh9rxdw@mail.gmail.com/
 > Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard

