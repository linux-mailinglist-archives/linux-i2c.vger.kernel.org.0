Return-Path: <linux-i2c+bounces-5048-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F888939111
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2024 16:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 905AC1C21435
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2024 14:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C1116DC2D;
	Mon, 22 Jul 2024 14:54:45 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35F9C8C7;
	Mon, 22 Jul 2024 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660085; cv=none; b=ko6HX1o2g21p/WnFOq7ASshlGI3b/ZQlOCHsqLueiF/JX5NnRwT8V8Q7JnlZrNOZrN7T9DEY6H+n0EDRH4VxHgj8yoM1UruE0UJY0Gx2QYDC4ZIRF5M6nker8RWA/uAwJhd9OUmP86O/n9zLdcb8UcESM0b1YWVYxmaCDNkba6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660085; c=relaxed/simple;
	bh=r260F2Xl37oIGQIACcCpiElBJU7s/mlo4ZgNLXp+7Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJBEu+uqyPV66AMJuVpU/R4AvFQ9oXUPqXdvl8v7CQJZLLZs0VvZ8o5NLz6nn/fbO3MbKPnA2Ud4VHxJNtIXqQDDkkB7tJy3tJmoZm3vWP4DVLa/0F9JEy/iNVrzOH75kMmJ0dXP6WsqiGjE8DaUDY6N49b+yJ0adME1NtQBdvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu; spf=none smtp.mailfrom=freedom.csh.rit.edu; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=freedom.csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 1194F40D7C93;
	Mon, 22 Jul 2024 10:54:36 -0400 (EDT)
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id k_4pUcb4fZ1y; Mon, 22 Jul 2024 10:54:35 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 9BA2A45735E9;
	Mon, 22 Jul 2024 10:54:35 -0400 (EDT)
Date: Mon, 22 Jul 2024 10:54:34 -0400
From: Mary Strodl <mstrodl@freedom.csh.rit.edu>
To: Rudolf Marek <r.marek@assembler.cz>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	urezki@gmail.com, linux-mm@kvack.org, lee@kernel.org,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de
Subject: Re: [PATCH 1/3] mm: vmalloc: export __vmalloc_node_range
Message-ID: <Zp5yqoeH752kli8J@freedom.csh.rit.edu>
References: <ZpkOV3mdOU1b8vMn@casper.infradead.org>
 <ZpkPStwq_S3mJYb5@infradead.org>
 <ZpkQQ5GzJ4atvR6a@casper.infradead.org>
 <ZpkWj-iFiA-JHbbf@freedom.csh.rit.edu>
 <20240718143103.82e33c556b2d1b6145ae43e0@linux-foundation.org>
 <ZpmKho9_t0_MeOP7@casper.infradead.org>
 <20240718143924.43e22f68cf639b064a83f118@linux-foundation.org>
 <CAH9NwWf_S-PyY5X_cJGSW-8YDk4-C0VvnPCX8iVuo0FhTqsy2Q@mail.gmail.com>
 <ZppU8FhsFd9cB-Fi@freedom.csh.rit.edu>
 <b3d6d20d-1b14-447f-a6b2-aa7712df1156@assembler.cz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3d6d20d-1b14-447f-a6b2-aa7712df1156@assembler.cz>

On Fri, Jul 19, 2024 at 09:59:37PM +0200, Rudolf Marek wrote:
> I would suggest to simply run the BIOS code of this interface in usermode. Sort of similar to VM86 VESA stuff.
> Last time I looked into this it used STI/CLI/RDMSR/WRMSR and couple of I/O ports and cf8/cfc for PCI.

I took a look at uvesafb (which appears to be what you were talking about) and
it looks like it starts a separate executable and uses some IPC to talk to it.
Is that the best way to do it?

I guess it would look something like:
- driver gets loaded
- driver spawns /sbin/cgeb-helper
- driver uses cn_netlink_send to send the `high_desc` to helper

Then the calls to `board->entry` in the driver get replaced with
`cn_netlink_send` with a `cgeb_fps`.

When the userspace helper gets the message with the `cgeb_fps`, it calls into
the bios code and replies to the driver with send() and passes back cgeb_fps.

From there, a callback registered with cn_add_callback will pick up the message
and call `wake_up_interruptible` to send the message back to the `cgeb_call`
caller.

Is this what you were imagining? Or is there a simpler way to do it?

Where should the code for the userspace helper live? The vesa stuff appeared to
be out of tree.

